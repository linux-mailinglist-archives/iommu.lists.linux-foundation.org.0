Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B4461B20
	for <lists.iommu@lfdr.de>; Mon, 29 Nov 2021 16:37:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7DE4050F;
	Mon, 29 Nov 2021 15:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EX02UwsHm6Ed; Mon, 29 Nov 2021 15:37:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 62CE540561;
	Mon, 29 Nov 2021 15:37:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41DC7C000A;
	Mon, 29 Nov 2021 15:37:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22011C000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 15:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B99C40136
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 15:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Gx2HPOG0A-6 for <iommu@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 15:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19E664010C
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 15:37:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l16so37714878wrp.11
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 07:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QNaHQe0sEt+Xz04cYV/MIlXb8cf/E2M9X4MAcvVxnPY=;
 b=jZT480wxvUl1wAeMTBT1goDqfM/CUNl3b3WLq0yuxBBxM9hmwt7jYsKrDnHVlAYgCq
 9taCx7GjoIFFKh6wPGbIm7V6djMjeHgD+ecYpG/ghbLjNU5D+scLE0lFxAjlTKRqTWe+
 RCBO6c7funI7wNn1LyWz/P5Cj+g3wRH3XFK+Zzy409Xl7LRxsPJEENGMHXTnWqEXEvlk
 dBiBniZ55PYJM/8ytfSKwaxWLJovM+yp5gCjdQPDKhX4nLegcXfTBGqOTUcoA8thRiww
 Ep9ARVrZ46+60YzrFq6BrXMX9/RUADTqo46rN3ll4ga7YP6/39VZKl+NcnZd3MT8GbJk
 xSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QNaHQe0sEt+Xz04cYV/MIlXb8cf/E2M9X4MAcvVxnPY=;
 b=ip+dJbHgQ0Wgqys7hMrfOkXmOxvTbXN7Hjs9724JVXxHUxH1hhuiYW2MHESmV445f4
 reGYUmQJACFRR99n9fbDvuR5W4yOnFzH/wXYKIGfpzcz3HHOxebAc2HiUTMA1X6RoVkg
 8X66QcHfbsiQim6hL8Nc2PN2B/DmCV9Nv0dcrixK2GFfZph5atMqNIqzSq5f6TeywUmI
 huWtKxZa9AnH8zdivG625JuY7Gztj6u+sCMuvESAIsWZUC0i7PbM9LAD2P00OEiUz8hJ
 ZthbOpdmnxI/RPdlSa43a+U4BSdcMSLg2g4FHL8vT1eyw+Yo3p6aYsp4eJ76fSFkLDAe
 mw7Q==
X-Gm-Message-State: AOAM533JWTvvkEGK+/vDFVlfHx8MRqyHYXHCXs+Gq7nkeYbrZxiVwciD
 0jZ9cwOMW4iHECTQFciWR3DRag==
X-Google-Smtp-Source: ABdhPJydH8DkXqyeN9Ia758m64cpVXoMOUT0emD3QhRO3MqqbhLn7G/GysWuevCbIseRjFknYEcsbg==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr35495829wrw.138.1638200230316; 
 Mon, 29 Nov 2021 07:37:10 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id z5sm25105381wmp.26.2021.11.29.07.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 07:37:09 -0800 (PST)
Date: Mon, 29 Nov 2021 15:36:47 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/5] iommu/virtio: Support bypass domains
Message-ID: <YaTzj6x0nIYoL1WD@myrica>
References: <20211123155301.1047943-1-jean-philippe@linaro.org>
 <20211123155301.1047943-3-jean-philippe@linaro.org>
 <fd03ac99-9bd4-197b-26c8-dcc5de1b3057@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd03ac99-9bd4-197b-26c8-dcc5de1b3057@redhat.com>
Cc: kevin.tian@intel.com, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com, will@kernel.org,
 jasowang@redhat.com
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

On Sat, Nov 27, 2021 at 05:18:28PM +0100, Eric Auger wrote:
> Hi Jean,
> 
> On 11/23/21 4:52 PM, Jean-Philippe Brucker wrote:
> > The VIRTIO_IOMMU_F_BYPASS_CONFIG feature adds a new flag to the ATTACH
> > request, that creates a bypass domain. Use it to enable identity
> > domains.
> >
> > When VIRTIO_IOMMU_F_BYPASS_CONFIG is not supported by the device, we
> > currently fail attaching to an identity domain. Future patches will
> > instead create identity mappings in this case.
> >
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  drivers/iommu/virtio-iommu.c | 20 +++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> > index 80930ce04a16..ee8a7afd667b 100644
> > --- a/drivers/iommu/virtio-iommu.c
> > +++ b/drivers/iommu/virtio-iommu.c
> > @@ -71,6 +71,7 @@ struct viommu_domain {
> >  	struct rb_root_cached		mappings;
> >  
> >  	unsigned long			nr_endpoints;
> > +	bool				bypass;
> >  };
> >  
> >  struct viommu_endpoint {
> > @@ -587,7 +588,9 @@ static struct iommu_domain *viommu_domain_alloc(unsigned type)
> >  {
> >  	struct viommu_domain *vdomain;
> >  
> > -	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
> > +	if (type != IOMMU_DOMAIN_UNMANAGED &&
> > +	    type != IOMMU_DOMAIN_DMA &&
> > +	    type != IOMMU_DOMAIN_IDENTITY)
> >  		return NULL;
> >  
> >  	vdomain = kzalloc(sizeof(*vdomain), GFP_KERNEL);
> > @@ -630,6 +633,17 @@ static int viommu_domain_finalise(struct viommu_endpoint *vdev,
> >  	vdomain->map_flags	= viommu->map_flags;
> >  	vdomain->viommu		= viommu;
> >  
> > +	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> > +		if (!virtio_has_feature(viommu->vdev,
> nit: couldn't the check be done before the ida_alloc_range(),
> simplifying the failure cleanup?

It could, but patch 5 falls back to identity mappings, which is better
left at the end of the function to keep the error path simple. I put this
at the end already here, so patch 5 doesn't need to move things around.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
