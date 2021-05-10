Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E4377E5E
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 10:41:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE7940592;
	Mon, 10 May 2021 08:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZ3LwyO_4-KR; Mon, 10 May 2021 08:41:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5F15405BC;
	Mon, 10 May 2021 08:41:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0227C0001;
	Mon, 10 May 2021 08:41:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DDB2C0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 08:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EBEA83B7C
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 08:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLC4b_-Wl4y9 for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 08:41:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EB1B83AE8
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 08:41:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4D61467373; Mon, 10 May 2021 10:40:57 +0200 (CEST)
Date: Mon, 10 May 2021 10:40:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Julien Grall <julien@xen.org>
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re:
 [linux-linus test] 161829: regressions - FAIL)
Message-ID: <20210510084057.GA933@lst.de>
References: <osstest-161829-mainreport@xen.org>
 <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: f.fainelli@gmail.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, hch@lst.de
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

On Sat, May 08, 2021 at 12:32:37AM +0100, Julien Grall wrote:
> The pointer dereferenced seems to suggest that the swiotlb hasn't been 
> allocated. From what I can tell, this may be because swiotlb_force is set 
> to SWIOTLB_NO_FORCE, we will still enable the swiotlb when running on top 
> of Xen.
>
> I am not entirely sure what would be the correct fix. Any opinions?

Can you try something like the patch below (not even compile tested, but
the intent should be obvious?


diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 16a2b2b1c54d..7671bc153fb1 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -44,6 +44,8 @@
 #include <asm/tlb.h>
 #include <asm/alternative.h>
 
+#include <xen/arm/swiotlb-xen.h>
+
 /*
  * We need to be able to catch inadvertent references to memstart_addr
  * that occur (potentially in generic code) before arm64_memblock_init()
@@ -482,7 +484,7 @@ void __init mem_init(void)
 	if (swiotlb_force == SWIOTLB_FORCE ||
 	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
 		swiotlb_init(1);
-	else
+	else if (!IS_ENABLED(CONFIG_XEN) || !xen_swiotlb_detect())
 		swiotlb_force = SWIOTLB_NO_FORCE;
 
 	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
