Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22141D0F5
	for <lists.iommu@lfdr.de>; Thu, 30 Sep 2021 03:30:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC5E24076B;
	Thu, 30 Sep 2021 01:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HyRnTkY7Ji2; Thu, 30 Sep 2021 01:30:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE1BF40768;
	Thu, 30 Sep 2021 01:30:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A254BC0022;
	Thu, 30 Sep 2021 01:30:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7EDCC000D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 01:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D583B606D6
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 01:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTquw4nvz-To for <iommu@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 01:30:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38ADC6138F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 01:30:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2260F615A4;
 Thu, 30 Sep 2021 01:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632965449;
 bh=wbV6F8K1YktqcMeI72zuNPMPZDIFwa82A8AaD7ODLuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fXjfarfg3fUv2muoaPe42X68dGkHzYxP7+Rx+dfcEIwPVEEXYb3YujSrGkuwYaEyR
 RBviPEQVigL46cTnV30o1q9UuVwTnlEwM80bxFwI0dOYDPqd5h7OeNGds+KwCdHbth
 aNRhbH1JLXBtYJx+1W0V35Y7MM53cDmE0dhYqLU+DoKzLo9As2V6bZ62L1VPBx0oeB
 TpDkkGOxFvmsRoFajPHO+DBJGWr3puqmzrHfMTxvzzZXwnPUNwr3MxrXFqkgyrJk4J
 4Lxnxb5c3SAbWRdBXITuXM7EnTl92PVstb9AIKyQn9fbKOLR2V3j1XNg6flwXR2eTU
 t0TgXntvfJYTw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dma-mapping: remove bogus test for pfn_valid from
 dma_map_resource
Date: Thu, 30 Sep 2021 04:30:38 +0300
Message-Id: <20210930013039.11260-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210930013039.11260-1-rppt@kernel.org>
References: <20210930013039.11260-1-rppt@kernel.org>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Alex Bee <knaerzche@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
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

From: Mike Rapoport <rppt@linux.ibm.com>

dma_map_resource() uses pfn_valid() to ensure the range is not RAM.
However, pfn_valid() only checks for availability of the memory map for a
PFN but it does not ensure that the PFN is actually backed by RAM.

As dma_map_resource() is the only method in DMA mapping APIs that has this
check, simply drop the pfn_valid() test from dma_map_resource().

Link: https://lore.kernel.org/all/20210824173741.GC623@arm.com/
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 kernel/dma/mapping.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 06fec5547e7c..dda8d8b84a55 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -296,10 +296,6 @@ dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
 	if (WARN_ON_ONCE(!dev->dma_mask))
 		return DMA_MAPPING_ERROR;
 
-	/* Don't allow RAM to be mapped */
-	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
-		return DMA_MAPPING_ERROR;
-
 	if (dma_map_direct(dev, ops))
 		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
 	else if (ops->map_resource)
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
