Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9BF41A787
	for <lists.iommu@lfdr.de>; Tue, 28 Sep 2021 07:56:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D0D180F39;
	Tue, 28 Sep 2021 05:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzzyDr3zaCtW; Tue, 28 Sep 2021 05:56:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 76FCD80F21;
	Tue, 28 Sep 2021 05:56:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DE98C0022;
	Tue, 28 Sep 2021 05:56:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7609FC000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 05:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50BA2401C9
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 05:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVapb64uxdRy for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 05:56:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FAAC4019B
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 05:56:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD9F46124B;
 Tue, 28 Sep 2021 05:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632808591;
 bh=yF8soBrMZR/O7Es8zvvSXK1ACmyYAeIPeI9GI8SIN4E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BR9Mz7tNJIpOMx5qLmLL20V6J+CCbJqnzz19y6p25N+bWH6doUl3rEufMzt3szdUr
 MMpPdsax7GWcFfEBdnMBV4XDW877gtglxayrFvk3zQ0Znp0y7jjIMIbg1zqCrb3iPG
 JTI0rh8X7/Ape0kSmKx0fT6brfXHpwiQ/hx8wHHcMa+yC4aabMKJLJRtWZ8fkwtE2X
 spJM3WqZzgsGzNF1F2W5g2pR6rMj0pPPhnsolXYKtitgWQaSyEfnfgP9BkdEGM5UGl
 l65tTf6tnqeBbJau43qA+ewWkEEv5+uXGFfuTrQxqipWlRFuDfkmQ8V7LxgIFUq9e8
 jLfUbw/orNoEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 29/40] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
Date: Tue, 28 Sep 2021 01:55:13 -0400
Message-Id: <20210928055524.172051-29-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928055524.172051-1-sashal@kernel.org>
References: <20210928055524.172051-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, iommu@lists.linux-foundation.org,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
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

From: Jan Beulich <jbeulich@suse.com>

[ Upstream commit 9074c79b62b6e0d91d7f716c6e4e9968eaf9e043 ]

While the hypervisor hasn't been enforcing this, we would still better
avoid issuing requests with GFNs not aligned to the requested order.
Instead of altering the value also in the call to panic(), drop it
there for being static and hence easy to determine without being part
of the panic message.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Link: https://lore.kernel.org/r/7b3998e3-1233-4e5a-89ec-d740e77eb166@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/swiotlb-xen.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index dbb18dc956f3..de4f55154d49 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -232,10 +232,11 @@ void __init xen_swiotlb_init_early(void)
 	/*
 	 * Get IO TLB memory from any location.
 	 */
-	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
+	start = memblock_alloc(PAGE_ALIGN(bytes),
+			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	if (!start)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
+		panic("%s: Failed to allocate %lu bytes\n",
+		      __func__, PAGE_ALIGN(bytes));
 
 	/*
 	 * And replace that memory with pages under 4GB.
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
