Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C31433AC928
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 12:50:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 543F660805;
	Fri, 18 Jun 2021 10:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9gkeO9-C2irc; Fri, 18 Jun 2021 10:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C89506071B;
	Fri, 18 Jun 2021 10:50:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A23EC000D;
	Fri, 18 Jun 2021 10:50:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E33E1C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 10:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAB5C404AE
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 10:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-3w35IS1vCO for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 10:50:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02FFC4049C
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 10:50:37 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id d7so8124495edx.0
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gqS2coF+gzzhxK8JdJrBsn/rp6+MnCzkmwD0939wTww=;
 b=v3Z/or0+7TlFehwd12i21NCIgEp+gh++voW/VIymTVtCQXMzQPvX/oBn0X2zo1xPR3
 KYQgE7FqiiWtiTUV6UUy5IulrfCwlajDLxWmG0ZJiFENdHhgrCjrnuuzIxc+V8YXIvnY
 pCtstbRSLOP/Q8jiqnCqY5PpkaPFLIt1BUODWANOsfuZnhXS7OPVGux5kJgw1mQkUoDi
 QIXJFcMJInFoRgQ3rF0aQ6bRrB1o+zhbn4WWPITxYMutZ4hAYOn0OgEiuYyuYMsawbdT
 VSpigMs9jVQPRW+PksLyNwzH8mNxk1lDYzlF5KJAd51X/ZOLJZaP9AEh7l6Hj7hzCPDa
 umBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gqS2coF+gzzhxK8JdJrBsn/rp6+MnCzkmwD0939wTww=;
 b=hKCUw85nPcY2/0SDVYi+tqC9z7dxpNoGp7DOyz+GU83ON7ZoMQ4wGF+VkdmIc60n2X
 n37GR/5xnvkRghUlDXT8la/QJ4QeI37l6J1VbeAeXxpIikiRNVtETQQEUCl7I3RdFaAd
 qhEHe5GLecNYMqYjQIVT/uh9NtLr4U19GwMs+Y76IVc9BQUO3xCYJ1/3ZNqSZ0la4Sx9
 hVt+Nm+l4Wd3SXbYKnL7GDmIVLBaVf1zUY5+fsdYeoWorPGWv2rdzNu1aJnrraaKNvds
 mglStD8L3pLhHL27cavf6JBfW/mNNN24qxTMNDsCg7kBMi5IuzsIyCrvUjUSkjIZmORX
 8pew==
X-Gm-Message-State: AOAM531FiENMxU6KrI3KLNUE0pxBLfuriZXQbcKCrDOyQlqj8OTqz48L
 43Z8Zru7Vz955SwmF8MSUsIiRA==
X-Google-Smtp-Source: ABdhPJwkwm0gLmvdkXKWZF4fjbq4g0GvgTenhMIDaNXRpOJoIOA8Ok+A/PIFx3v90WjMUVBRLplXvg==
X-Received: by 2002:a05:6402:42cb:: with SMTP id
 i11mr4009322edc.242.1624013436164; 
 Fri, 18 Jun 2021 03:50:36 -0700 (PDT)
Received: from myrica (adsl-84-226-111-173.adslplus.ch. [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id m17sm863059ejg.96.2021.06.18.03.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 03:50:35 -0700 (PDT)
Date: Fri, 18 Jun 2021 12:50:15 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 5/6] iommu/dma: Simplify calls to iommu_setup_dma_ops()
Message-ID: <YMx6Z8aWBOrFiEcV@myrica>
References: <20210610075130.67517-1-jean-philippe@linaro.org>
 <20210610075130.67517-6-jean-philippe@linaro.org>
 <6ce5fecb-fc81-5bf1-3577-6a09437b243e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ce5fecb-fc81-5bf1-3577-6a09437b243e@arm.com>
Cc: kevin.tian@intel.com, mst@redhat.com, catalin.marinas@arm.com,
 sudeep.holla@arm.com, rjw@rjwysocki.net,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 guohanjun@huawei.com, will@kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Wed, Jun 16, 2021 at 06:02:39PM +0100, Robin Murphy wrote:
> > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > index c62e19bed302..175f8eaeb5b3 100644
> > --- a/drivers/iommu/dma-iommu.c
> > +++ b/drivers/iommu/dma-iommu.c
> > @@ -1322,7 +1322,9 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit)
> >   	if (domain->type == IOMMU_DOMAIN_DMA) {
> >   		if (iommu_dma_init_domain(domain, dma_base, dma_limit, dev))
> >   			goto out_err;
> > -		dev->dma_ops = &iommu_dma_ops;
> > +		set_dma_ops(dev, &iommu_dma_ops);
> > +	} else {
> > +		set_dma_ops(dev, NULL);
> 
> I'm not keen on moving this here, since iommu-dma only knows that its own
> ops are right for devices it *is* managing; it can't assume any particular
> ops are appropriate for devices it isn't. The idea here is that
> arch_setup_dma_ops() may have already set the appropriate ops for the
> non-IOMMU case, so if the default domain type is passthrough then we leave
> those in place.
> 
> For example, I do still plan to revisit my conversion of arch/arm someday,
> at which point I'd have to undo this for that reason.

Makes sense, I'll remove this bit.

> Simplifying the base and size arguments is of course fine, but TBH I'd say
> rip the whole bloody lot out of the arch_setup_dma_ops() flow now. It's a
> considerable faff passing them around for nothing but a tenuous sanity check
> in iommu_dma_init_domain(), and now that dev->dma_range_map is a common
> thing we should expect that to give us any relevant limitations if we even
> still care.

So I started working on this but it gets too bulky for a preparatory
patch. Dropping the parameters from arch_setup_dma_ops() seems especially
complicated because arm32 does need the size parameter for IOMMU mappings
and that value falls back to the bus DMA mask or U32_MAX in the absence of
dma-ranges. I could try to dig into this for a separate series.

Even only dropping the parameters from iommu_setup_dma_ops() isn't
completely trivial (8 files changed, 55 insertions(+), 36 deletions(-)
because we still need the lower IOVA limit from dma_range_map), so I'd
rather send it separately and have it sit in -next for a while.

Thanks,
Jean

> 
> That said, those are all things which can be fixed up later if the series is
> otherwise ready to go and there's still a chance of landing it for 5.14. If
> you do have any other reason to respin, then I think the x86 probe_finalize
> functions simply want an unconditional set_dma_ops(dev, NULL) before the
> iommu_setup_dma_ops() call.
> 
> Cheers,
> Robin.
> 
> >   	}
> >   	return;
> > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > index 85f18342603c..8d866940692a 100644
> > --- a/drivers/iommu/intel/iommu.c
> > +++ b/drivers/iommu/intel/iommu.c
> > @@ -5165,15 +5165,7 @@ static void intel_iommu_release_device(struct device *dev)
> >   static void intel_iommu_probe_finalize(struct device *dev)
> >   {
> > -	dma_addr_t base = IOVA_START_PFN << VTD_PAGE_SHIFT;
> > -	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> > -	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
> > -
> > -	if (domain && domain->type == IOMMU_DOMAIN_DMA)
> > -		iommu_setup_dma_ops(dev, base,
> > -				    __DOMAIN_MAX_ADDR(dmar_domain->gaw));
> > -	else
> > -		set_dma_ops(dev, NULL);
> > +	iommu_setup_dma_ops(dev, 0, U64_MAX);
> >   }
> >   static void intel_iommu_get_resv_regions(struct device *device,
> > 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
