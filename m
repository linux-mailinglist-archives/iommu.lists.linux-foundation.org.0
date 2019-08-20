Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F3960C4
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 15:43:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 86C66DC2;
	Tue, 20 Aug 2019 13:43:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE2C5DA7
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 13:43:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 70D468A0
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 13:43:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 88F982332A;
	Tue, 20 Aug 2019 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566308598;
	bh=VFt+3yrRV/54bT3zwv9JShdoQYuWiOlyC5hzlGGNJcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gDzH5UxV4i0Z6RysAQdFTshjoJnGWsa4WoENk4gVZDXQdizxIFtgVWW0ZQPNqUFDm
	Ahb4BLKghrHAAX73buRfGG/ju3891mZuznVq15G6Fuho5OB+K2WtOk1/o0j2tqw05s
	b+6wg5eIaewOtR2FJlyWYKmSvIuFAVZb9wVsMiNY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 2/7] iommu/dma: Handle SG length overflow better
Date: Tue, 20 Aug 2019 09:43:10 -0400
Message-Id: <20190820134315.11720-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134315.11720-1-sashal@kernel.org>
References: <20190820134315.11720-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Sasha Levin <sashal@kernel.org>,
	iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
	Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit ab2cbeb0ed301a9f0460078e91b09f39958212ef ]

Since scatterlist dimensions are all unsigned ints, in the relatively
rare cases where a device's max_segment_size is set to UINT_MAX, then
the "cur_len + s_length <= max_len" check in __finalise_sg() will always
return true. As a result, the corner case of such a device mapping an
excessively large scatterlist which is mergeable to or beyond a total
length of 4GB can lead to overflow and a bogus truncated dma_length in
the resulting segment.

As we already assume that any single segment must be no longer than
max_len to begin with, this can easily be addressed by reshuffling the
comparison.

Fixes: 809eac54cdd6 ("iommu/dma: Implement scatterlist segment merging")
Reported-by: Nicolin Chen <nicoleotsuka@gmail.com>
Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1520e7f02c2f1..89d191b6a0e0f 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -493,7 +493,7 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
 		 * - and wouldn't make the resulting output segment too long
 		 */
 		if (cur_len && !s_iova_off && (dma_addr & seg_mask) &&
-		    (cur_len + s_length <= max_len)) {
+		    (max_len - cur_len >= s_length)) {
 			/* ...then concatenate it with the previous one */
 			cur_len += s_length;
 		} else {
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
