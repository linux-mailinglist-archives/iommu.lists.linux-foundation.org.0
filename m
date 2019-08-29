Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA73A29F8
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 00:43:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 82C3559CA;
	Thu, 29 Aug 2019 22:43:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4602B59B7
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:42:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EE831E6
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:42:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6E98322CF5;
	Thu, 29 Aug 2019 22:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567118542;
	bh=jsdNyMNS/9pCKUS4waHlGlAetK7kzg37QE3T5eJP7R4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sZ3f60S6o/hx1D+PzQj9Usp9jWfLr+K8KaWvP5+V3mJz4L40jUh100neirWk+vVmj
	YKlbuibzZMwhUulE4H2bjLpkf4FOc80VYWYDgzKFyGxmUJuS8zlad8T1Z6ieOmqxJE
	qDNi4a4/0L5kh0AgFCnknxJrA67Oa2Q1AxnuqogU=
Date: Thu, 29 Aug 2019 15:42:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/11] xen: remove the exports for
	xen_{create,destroy}_contiguous_region
In-Reply-To: <20190826121944.515-6-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281459000.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de> <20190826121944.515-6-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
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

On Mon, 26 Aug 2019, Christoph Hellwig wrote:
> These routines are only used by swiotlb-xen, which cannot be modular.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  arch/arm/xen/mm.c     | 2 --
>  arch/x86/xen/mmu_pv.c | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index 9b3a6c0ca681..b7d53415532b 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -155,13 +155,11 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
>  	*dma_handle = pstart;
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(xen_create_contiguous_region);
>  
>  void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
>  {
>  	return;
>  }
> -EXPORT_SYMBOL_GPL(xen_destroy_contiguous_region);
>  
>  int __init xen_mm_init(void)
>  {
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 26e8b326966d..c8dbee62ec2a 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2625,7 +2625,6 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
>  	*dma_handle = virt_to_machine(vstart).maddr;
>  	return success ? 0 : -ENOMEM;
>  }
> -EXPORT_SYMBOL_GPL(xen_create_contiguous_region);
>  
>  void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
>  {
> @@ -2660,7 +2659,6 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
>  
>  	spin_unlock_irqrestore(&xen_reservation_lock, flags);
>  }
> -EXPORT_SYMBOL_GPL(xen_destroy_contiguous_region);
>  
>  static noinline void xen_flush_tlb_all(void)
>  {
> -- 
> 2.20.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
