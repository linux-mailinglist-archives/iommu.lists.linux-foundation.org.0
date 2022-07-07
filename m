Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4EC56A53D
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 16:20:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E630861232;
	Thu,  7 Jul 2022 14:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E630861232
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V4iiItN/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KZwVhtGIP39; Thu,  7 Jul 2022 14:20:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ECE4761223;
	Thu,  7 Jul 2022 14:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE4761223
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7B4FC007E;
	Thu,  7 Jul 2022 14:20:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E6F0C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 14:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2403640FE2
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 14:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2403640FE2
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V4iiItN/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrswySTUzMcA for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 14:20:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A5DE404B0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A5DE404B0
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 14:20:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m16so7859214edb.11
 for <iommu@lists.linux-foundation.org>; Thu, 07 Jul 2022 07:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R3YvgoVOcvENsgz6mM2PhgZ4r8jumaGbydF495sktxQ=;
 b=V4iiItN/P7QOqwrv8hB5ZeqMGjjSsmKGmpL8MNiwT17QzCtpF919syW5BM/LN8l2JI
 V0NPBda6S9YXHWL7349PlufZ2XVsGcND4XV9xkIfftSQN+RCPM9GNdXzaLp3CwTgypvG
 +i+9FsDKbnOHHCKW6nILHf6SXFi5hqdrkDVTwi3GIYUfuZoWgms84RyBXsTROnGeXvWn
 7CNIHUlyHJMSja8xHZqyGJZ8ciYTMiS7wBj/ilHUuMn8rMwdRxGlDi6BAC2GEwNzHTcR
 1NDSE5KGnBj03qUgxWIEK2K1gAdYRVG7kaPcJ0Kxy1fWo4UbkVNdZp4N5t6W02qMwATV
 hj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R3YvgoVOcvENsgz6mM2PhgZ4r8jumaGbydF495sktxQ=;
 b=3+8tHBhKz/kJiztjziRJ+SbZER5HwRRDBTnnep94GC6R5F9O6XaOTKB4AmUCAKPbF8
 cMwab07uJTzGxqtMyEtVAi/Vs+NhCrd8FyhrcztdK3apXgHrwfn/0eKkSrHFr7q7fUww
 NE6HS7S/p7M7Y7bYMenHs9aL+2GLZnbQ1iOk6yCmv2qRH73+r6Hy2lgzhOoStb+oaulC
 fZawdn5zRS5Vsd9dwS2qQBRDWfvtyIDVThyWaRsfnUSUjR1GCzZszi9xdKnm/7f6Jayk
 uJlVum9on28KLF6CDwRS2pJBeadcAfHvc08uCPWnTWjZRTI4IzN1asRAU/tBitAtEDv8
 RznA==
X-Gm-Message-State: AJIora+K9zDhb1nDKV9C0ktaeBdcc6rO7NSntynCHMsUL4pmMyhveLcc
 JxbEdKXjAw/qraAzkx3p4Jw=
X-Google-Smtp-Source: AGRyM1sTkE4DDQ5Gd2nGohP4Wwi9Svf0DI7dgdf1GN+6OhqHEurLuKocx8rXzO9t3Nu60K9Ip58LyQ==
X-Received: by 2002:a05:6402:4144:b0:431:6ef0:bef7 with SMTP id
 x4-20020a056402414400b004316ef0bef7mr60613152eda.151.1657203630423; 
 Thu, 07 Jul 2022 07:20:30 -0700 (PDT)
Received: from anparri (host-79-49-199-193.retail.telecomitalia.it.
 [79.49.199.193]) by smtp.gmail.com with ESMTPSA id
 b4-20020a1709065e4400b00706287ba061sm18931212eju.180.2022.07.07.07.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 07:20:30 -0700 (PDT)
Date: Thu, 7 Jul 2022 16:20:24 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH 2/2] dma-direct: Fix dma_direct_{alloc,free}() for
 Hyperv-V IVMs
Message-ID: <20220707142024.GA14362@anparri>
References: <20220706195027.76026-1-parri.andrea@gmail.com>
 <20220706195027.76026-3-parri.andrea@gmail.com>
 <20220707055840.GA13401@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707055840.GA13401@lst.de>
Cc: Wei Liu <wei.liu@kernel.org>, x86@kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, linux-hyperv@vger.kernel.org,
 iommu@lists.linux.dev, Haiyang Zhang <haiyangz@microsoft.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Anvin <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, KY Srinivasan <kys@microsoft.com>,
 Robin Murphy <robin.murphy@arm.com>
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

> > @@ -305,6 +306,21 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >  		ret = page_address(page);
> >  		if (dma_set_decrypted(dev, ret, size))
> >  			goto out_free_pages;
> > +#ifdef CONFIG_HAS_IOMEM
> > +		/*
> > +		 * Remap the pages in the unencrypted physical address space
> > +		 * when dma_unencrypted_base is set (e.g., for Hyper-V AMD
> > +		 * SEV-SNP isolated guests).
> > +		 */
> > +		if (dma_unencrypted_base) {
> > +			phys_addr_t ret_pa = virt_to_phys(ret);
> > +
> > +			ret_pa += dma_unencrypted_base;
> > +			ret = memremap(ret_pa, size, MEMREMAP_WB);
> > +			if (!ret)
> > +				goto out_encrypt_pages;
> > +		}
> > +#endif
> 
> 
> So:
> 
> this needs to move into dma_set_decrypted, otherwise we don't handle
> the dma_alloc_pages case (never mind that this is pretty unreadable).
> 
> Which then again largely duplicates the code in swiotlb.  So I think
> what we need here is a low-level helper that does the
> set_memory_decrypted and memremap.  I'm not quite sure where it
> should go, but maybe some of the people involved with memory
> encryption might have good ideas.  unencrypted_base should go with
> it and then both swiotlb and dma-direct can call it.

Agreed, will look into this more  (other people's ideas welcome).


> > +	/*
> > +	 * If dma_unencrypted_base is set, the virtual address returned by
> > +	 * dma_direct_alloc() is in the vmalloc address range.
> > +	 */
> > +	if (!dma_unencrypted_base && is_vmalloc_addr(cpu_addr)) {
> >  		vunmap(cpu_addr);
> >  	} else {
> >  		if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
> >  			arch_dma_clear_uncached(cpu_addr, size);
> > +#ifdef CONFIG_HAS_IOMEM
> > +		if (dma_unencrypted_base) {
> > +			memunmap(cpu_addr);
> > +			/* re-encrypt the pages using the original address */
> > +			cpu_addr = page_address(pfn_to_page(PHYS_PFN(
> > +					dma_to_phys(dev, dma_addr))));
> > +		}
> > +#endif
> >  		if (dma_set_encrypted(dev, cpu_addr, size))
> 
> Same on the unmap side.  It might also be worth looking into reordering
> the checks in some form instead o that raw dma_unencrypted_base check
> before the unmap.

Got it.

Thanks,
  Andrea
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
