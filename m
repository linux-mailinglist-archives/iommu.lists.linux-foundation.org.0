Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B715DD61
	for <lists.iommu@lfdr.de>; Fri, 14 Feb 2020 16:58:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DBA7587647;
	Fri, 14 Feb 2020 15:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSNKkcdjDKMw; Fri, 14 Feb 2020 15:58:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2143287653;
	Fri, 14 Feb 2020 15:58:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00B74C0177;
	Fri, 14 Feb 2020 15:58:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00882C0177
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 15:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F09EA2153B
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 15:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DySHfiMOQnWn for <iommu@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 15:58:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 2FDEF2049B
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 15:58:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FA7322314;
 Fri, 14 Feb 2020 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695922;
 bh=ILgyTcz077uZMWMQHPxY3KrmzTeX1bVIUegOs0036+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jPmQh/fuMsla9i71zx0f+iPJ9cIMgrZfFBZVFG18RMqFJ46xsuuQjeN8ZcbVoLcMu
 d2ME94uKJeEr1gSMWrrnHfRYBMjel2Jk8TuKQ0qtjGqvxiYTR7hW6VdE7vvsx3MYH9
 VV8VVVclZmztfbdALaqT8jlOvnCTSpyLLJFw54Tw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 459/542] iommu/vt-d: Remove unnecessary
 WARN_ON_ONCE()
Date: Fri, 14 Feb 2020 10:47:31 -0500
Message-Id: <20200214154854.6746-459-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Frank <fgndev@posteo.de>, Joerg Roedel <jroedel@suse.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Lu Baolu <baolu.lu@linux.intel.com>

[ Upstream commit 857f081426e5aa38313426c13373730f1345fe95 ]

Address field in device TLB invalidation descriptor is qualified
by the S field. If S field is zero, a single page at page address
specified by address [63:12] is requested to be invalidated. If S
field is set, the least significant bit in the address field with
value 0b (say bit N) indicates the invalidation address range. The
spec doesn't require the address [N - 1, 0] to be cleared, hence
remove the unnecessary WARN_ON_ONCE().

Otherwise, the caller might set "mask = MAX_AGAW_PFN_WIDTH" in order
to invalidating all the cached mappings on an endpoint, and below
overflow error will be triggered.

[...]
UBSAN: Undefined behaviour in drivers/iommu/dmar.c:1354:3
shift exponent 64 is too large for 64-bit type 'long long unsigned int'
[...]

Reported-and-tested-by: Frank <fgndev@posteo.de>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/dmar.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
index 3acfa6a25fa29..fb66f717127d2 100644
--- a/drivers/iommu/dmar.c
+++ b/drivers/iommu/dmar.c
@@ -1354,7 +1354,6 @@ void qi_flush_dev_iotlb(struct intel_iommu *iommu, u16 sid, u16 pfsid,
 	struct qi_desc desc;
 
 	if (mask) {
-		WARN_ON_ONCE(addr & ((1ULL << (VTD_PAGE_SHIFT + mask)) - 1));
 		addr |= (1ULL << (VTD_PAGE_SHIFT + mask - 1)) - 1;
 		desc.qw1 = QI_DEV_IOTLB_ADDR(addr) | QI_DEV_IOTLB_SIZE;
 	} else
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
