Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB324DA2E
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 18:19:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A18B86BCC;
	Fri, 21 Aug 2020 16:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DRuzgmUNO6v; Fri, 21 Aug 2020 16:19:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE36986BA9;
	Fri, 21 Aug 2020 16:19:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CA91C0051;
	Fri, 21 Aug 2020 16:19:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 531FCC0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 16:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 40D5C8639E
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 16:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-ZHrcpjMGa6 for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 16:19:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AD91584F75
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 16:19:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3C2222E00;
 Fri, 21 Aug 2020 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026749;
 bh=tE9xsYHjcyP1RgE3aKIgru7GwEiC8ipKwroxXBMxFY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yxuswvCo0tT/K6+9tJEDvMBVZsgaAiKw1JZ7uhi2UscvK5iwB3b9DTZw9CHxnb0Fu
 pgDyZ6J8U+MlnXcfbTmtKOPj/AmKexB86C0hZTtek+OX81LRU1lQRTesKmSWRjbSK7
 DN58wIkp3hT6hBDt2cb0QoFip7oWtZrDG+oAdkpY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 09/30] iommu/iova: Don't BUG on invalid PFNs
Date: Fri, 21 Aug 2020 12:18:36 -0400
Message-Id: <20200821161857.348955-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161857.348955-1-sashal@kernel.org>
References: <20200821161857.348955-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 Prakash Gupta <guptap@codeaurora.org>
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

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit d3e3d2be688b4b5864538de61e750721a311e4fc ]

Unlike the other instances which represent a complete loss of
consistency within the rcache mechanism itself, or a fundamental
and obvious misconfiguration by an IOMMU driver, the BUG_ON() in
iova_magazine_free_pfns() can be provoked at more or less any time
in a "spooky action-at-a-distance" manner by any old device driver
passing nonsense to dma_unmap_*() which then propagates through to
queue_iova().

Not only is this well outside the IOVA layer's control, it's also
nowhere near fatal enough to justify panicking anyway - all that
really achieves is to make debugging the offending driver more
difficult. Let's simply WARN and otherwise ignore bogus PFNs.

Reported-by: Prakash Gupta <guptap@codeaurora.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Prakash Gupta <guptap@codeaurora.org>
Link: https://lore.kernel.org/r/acbd2d092b42738a03a21b417ce64e27f8c91c86.1591103298.git.robin.murphy@arm.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/iova.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 4edf65dbbcab5..2c97d2552c5bd 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -845,7 +845,9 @@ iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
 	for (i = 0 ; i < mag->size; ++i) {
 		struct iova *iova = private_find_iova(iovad, mag->pfns[i]);
 
-		BUG_ON(!iova);
+		if (WARN_ON(!iova))
+			continue;
+
 		private_free_iova(iovad, iova);
 	}
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
