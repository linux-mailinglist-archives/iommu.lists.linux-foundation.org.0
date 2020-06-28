Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F220C974
	for <lists.iommu@lfdr.de>; Sun, 28 Jun 2020 20:16:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0859087C10;
	Sun, 28 Jun 2020 18:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKWvH2VCpbrY; Sun, 28 Jun 2020 18:16:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 687D887A6B;
	Sun, 28 Jun 2020 18:16:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 587C6C016E;
	Sun, 28 Jun 2020 18:16:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6821C016E
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 18:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A292687AFE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 18:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehIRjvxP6Yqf for <iommu@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 18:16:41 +0000 (UTC)
X-Greylist: delayed 00:07:52 by SQLgrey-1.7.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7B9D287A33
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 18:16:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EEE34B74;
 Sun, 28 Jun 2020 14:08:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 28 Jun 2020 14:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=aheclahDk///5
 GhRrTGqTdZ5+2m4zl5MerfwfprpZmU=; b=n6mDJeF0uSkHbsARTbsLiKs7n0AaN
 J6JjhOVdZeFAZitxC1DvAcC+x/jjChjkOyTVPYZuCFFVJEe/zQPsRLeOjB48RYsR
 wyxW+s3Sa2MBRIDSSIQrioEpRjmbIGFzblQnIM43EUkKgi3CrU+EO3yGz/sNH2KZ
 MDPgH2kRh0TLN1dRpwQTZeDaRNUmTP5X8msgYWGXRWHog7k8mXYoB+df4N5iO645
 5H9hERZJHU8ZUt6EWGZ8V51mb5XvkOruZ7x5Obch4LzRh7Gc6xGy/bRHVweKgUHL
 9vPyyYxthF2OzpDPjw51bVG8/5spGxUiWIeAtGnPxsWiLgjh3hZDj2txQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=aheclahDk///5GhRrTGqTdZ5+2m4zl5MerfwfprpZmU=; b=S6HNM78s
 DaJ3zOUWR+Lrwj8MPazuwzXi/6t4e6pFXGElt033xRWrY0yIdpNcl/ruE0w1Axlo
 L7/u9ucx3Wt/tcqHHpixfsMXA4jxRRECZoL7Ko0/Ivw2mMXvASdBlmg2QwhdxO+/
 BCCG0x0DHj8bturT6X2P/u9onWgk4lxrEwK39jQDSDO+P0LGTa0qhqMIRfJcKhCy
 OJe2LpKTsHFm7hgNRqDURSEWkhRw4bEpxWHECW6RUIqn9t0uPZqwBkw0+hK3T+qh
 KIM++z6VwtRlJXGpFD4fwGq9i8z3gqh0qkRG5ajz1ygXUwtzxXhWbUwC9DNWFd47
 9WdQRS0Ctx8CKg==
X-ME-Sender: <xms:sdz4XjxRXue-ZJX1Baxs57qajMe7XHWZsyqqn5Z2bpjDiQm8qBArQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeliedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sdz4XrSaanNdy-aeYI0yv5h23-PEfUdSrFHgTaHwDw2O6amqSAQqDg>
 <xmx:sdz4XtXusZhS96nzPQQxCDOBeQ-t2uBnqOPC7crQMF2XUr8E0Fi-tg>
 <xmx:sdz4Xth6lQfkVqz6byOsQ9PDJeXy-gC-K0k4yAd0Rt7VYJni6-3XtQ>
 <xmx:sdz4XoMp9g-SAzYysI7vdTEVdc7u2ZH41NwcrghTb9sgVTE2hX6T2g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1FB0F3280059;
 Sun, 28 Jun 2020 14:08:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] iommu/sun50i: Remove unused variable
Date: Sun, 28 Jun 2020 20:08:44 +0200
Message-Id: <20200628180844.79205-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628180844.79205-1-maxime@cerno.tech>
References: <20200628180844.79205-1-maxime@cerno.tech>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, kernel test robot <lkp@intel.com>,
 linux-arm-kernel@lists.infradead.org
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

The pte_dma variable in the unmap callback is set but never used. Remove
it.

Fixes: 4100b8c229b3 ("iommu: Add Allwinner H6 IOMMU driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/iommu/sun50i-iommu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index a1563b54c743..3b1bf2fb94f5 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -556,7 +556,6 @@ static size_t sun50i_iommu_unmap(struct iommu_domain *domain, unsigned long iova
 {
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	phys_addr_t pt_phys;
-	dma_addr_t pte_dma;
 	u32 *pte_addr;
 	u32 dte;
 
@@ -566,7 +565,6 @@ static size_t sun50i_iommu_unmap(struct iommu_domain *domain, unsigned long iova
 
 	pt_phys = sun50i_dte_get_pt_address(dte);
 	pte_addr = (u32 *)phys_to_virt(pt_phys) + sun50i_iova_get_pte_index(iova);
-	pte_dma = pt_phys + sun50i_iova_get_pte_index(iova) * PT_ENTRY_SIZE;
 
 	if (!sun50i_pte_is_page_valid(*pte_addr))
 		return 0;
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
