Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B686256CD5E
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E944D4046B;
	Sun, 10 Jul 2022 06:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E944D4046B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WqLQNmwK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRgKHXhltgYY; Sun, 10 Jul 2022 06:37:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C58DF40602;
	Sun, 10 Jul 2022 06:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C58DF40602
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55B5AC007D;
	Sun, 10 Jul 2022 06:37:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D4B7C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 482CD81ABA
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 17:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 482CD81ABA
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WqLQNmwK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OBAEj6QG_KZ5 for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 17:07:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9188184F
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA9188184F
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HovvFFoY7D838hXPBREd1aNwqat8RfYwwK9QiIIVY3U=; b=WqLQNmwKPMLPy2wckZKCKxD3R7
 8CxT62mp7vdl5Gus1MdpnQTGSiKK2U0lJVJmQunwIC+fZp+s7kN7EJm0uPu80sOF5Ysa11jb16Ht9
 sjfuVDGyb8SiE1sntIVqLi4d1VRo7/fy7K62YDyR2n0P1DMp4Pwa1GkDx5FPIW8Tl5USpHnOnwoyI
 ASE+YNxkfaSv63xI4W+POjieNQj3mAUb2/kOXYWEMIPXtStgVujuPj/OvjXRow0adYe4FJ+Vg/Oyc
 JVsPbpc/ze1q8BMiSf3WlCbjuO3EUj4vhdfHeMWZa0pZURzoCznZGa99ogqoljhQX72r2Mr2zitQa
 NDjqWo0Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o9Uxw-00H9AX-54; Thu, 07 Jul 2022 17:07:00 +0000
Date: Thu, 7 Jul 2022 10:07:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH V3] swiotlb: Split up single swiotlb lock
Message-ID: <YscStPk/IXW9PPmh@infradead.org>
References: <20220707082436.447984-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707082436.447984-1-ltykernel@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
 vkuznets@redhat.com, kys@microsoft.com, michael.h.kelley@microsoft.com,
 wei.liu@kernel.org, Andi Kleen <ak@linux.intel.com>, corbet@lwn.net,
 damien.lemoal@opensource.wdc.com, hch@infradead.org, andi.kleen@intel.com,
 bp@suse.de, parri.andrea@gmail.com, pmladek@suse.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, keescook@chromium.org,
 paulmck@kernel.org, kirill.shutemov@intel.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, thomas.lendacky@amd.com,
 robin.murphy@arm.com
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

On Thu, Jul 07, 2022 at 04:24:36AM -0400, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> Traditionally swiotlb was not performance critical because it was only
> used for slow devices. But in some setups, like TDX/SEV confidential
> guests, all IO has to go through swiotlb. Currently swiotlb only has a
> single lock. Under high IO load with multiple CPUs this can lead to
> significat lock contention on the swiotlb lock.
> 
> This patch splits the swiotlb bounce buffer pool into individual areas
> which have their own lock. Each CPU tries to allocate in its own area
> first. Only if that fails does it search other areas. On freeing the
> allocation is freed into the area where the memory was originally
> allocated from.
> 
> Area number can be set via swiotlb kernel parameter and is default
> to be possible cpu number. If possible cpu number is not power of
> 2, area number will be round up to the next power of 2.
> 
> This idea from Andi Kleen patch(https://github.com/intel/tdx/commit/
> 4529b5784c141782c72ec9bd9a92df2b68cb7d45).

Thanks, this looks much better.  I think there is a small problem
with how default_nareas is set - we need to use 0 as the default
so that an explicit command line value of 1 works.  Als have you
checked the interaction with swiotlb_adjust_size in detail?

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 5536d2cd69d30..85b1c29dd0eb8 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -70,7 +70,7 @@ struct io_tlb_mem io_tlb_default_mem;
 phys_addr_t swiotlb_unencrypted_base;
 
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
-static unsigned long default_nareas = 1;
+static unsigned long default_nareas;
 
 /**
  * struct io_tlb_area - IO TLB memory area descriptor
@@ -90,7 +90,10 @@ struct io_tlb_area {
 
 static void swiotlb_adjust_nareas(unsigned int nareas)
 {
-	if (!is_power_of_2(nareas))
+	if (default_nareas)
+		return;
+
+	if (nareas > 1 && !is_power_of_2(nareas))
 		nareas = roundup_pow_of_two(nareas);
 
 	default_nareas = nareas;
@@ -338,8 +341,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	if (default_nareas == 1)
-		swiotlb_adjust_nareas(num_possible_cpus());
+	swiotlb_adjust_nareas(num_possible_cpus());
 
 	mem->areas = memblock_alloc(sizeof(struct io_tlb_area) *
 		default_nareas, SMP_CACHE_BYTES);
@@ -410,8 +412,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 			(PAGE_SIZE << order) >> 20);
 	}
 
-	if (default_nareas == 1)
-		swiotlb_adjust_nareas(num_possible_cpus());
+	swiotlb_adjust_nareas(num_possible_cpus());
 
 	area_order = get_order(array_size(sizeof(*mem->areas),
 		default_nareas));
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
