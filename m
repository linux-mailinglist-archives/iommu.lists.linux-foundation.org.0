Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 915694A833C
	for <lists.iommu@lfdr.de>; Thu,  3 Feb 2022 12:34:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33AB240116;
	Thu,  3 Feb 2022 11:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MP8Du5T1UWoO; Thu,  3 Feb 2022 11:34:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BDDD340A3B;
	Thu,  3 Feb 2022 11:34:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFF62C0079;
	Thu,  3 Feb 2022 11:34:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 654E6C000B
 for <iommu@lists.linux-foundation.org>; Thu,  3 Feb 2022 11:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 486ED40A1C
 for <iommu@lists.linux-foundation.org>; Thu,  3 Feb 2022 11:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBk5x651SegJ for <iommu@lists.linux-foundation.org>;
 Thu,  3 Feb 2022 11:34:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17D2D40A14
 for <iommu@lists.linux-foundation.org>; Thu,  3 Feb 2022 11:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643888047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2xHr8BXJ2h1L73+rEuwklySK1fG7K3gDVig/Nq7SuG0=;
 b=Pr0DZocGrQgaTVrrbYWedhhBw/ja/P9f8763kTWZx5k+dtYxh1Ztm5PhZGITbPXzW8dXxD
 +3ICJ6utlYYziXAFtEbStEx8UXfpugZPywYzzzdN6+FIWRX7bjH7ZeWzeTcwlW5FwdS9RS
 8a6Z73dbAHaZCri8jelPeHiLFyMYbdc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-AuyQWHPXPW6zcXLeENPbeQ-1; Thu, 03 Feb 2022 06:34:05 -0500
X-MC-Unique: AuyQWHPXPW6zcXLeENPbeQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg23-20020a05600c3c9700b0034bb19dfdc0so651906wmb.1
 for <iommu@lists.linux-foundation.org>; Thu, 03 Feb 2022 03:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2xHr8BXJ2h1L73+rEuwklySK1fG7K3gDVig/Nq7SuG0=;
 b=uEhBIoF8art2YHnE7k8wQj9mBNfqsdUD/Qrw9kLF/VAwiChWvF61oHvI3zyd2uLg/r
 5ekx3AWEbSeCL3FMf8Z06hZspZ9E/O7EyscWyoWlTF0jIiB2/I9nGDyM8lRYczej0X+I
 VtZVRDinvS8VdJhr67eTciqaGVmgoqs7QaO70xsnXU4Pff2TXkRezRfpdfnFK+hKxz9R
 8bHcM+WXkrQzzUD8PNWOr9heemrjibYtWWspmb6LTfNu2IaFQStnfhn7DKyKGRmGEyb+
 ccZAZsxTYUM2QWIoHGApWVm/FmreMrpgBnXDq48i3Fmh8tKO09EBWJ7Vbn6bCcn5JElk
 U1cw==
X-Gm-Message-State: AOAM532gKnUaskOFUiQYzWdPZicPPX+Oqh8naAnELZYJmO2DX/WQQUek
 tGlzVHljVHjBNlhr6BONKUt1ceSeISNToUkraAKRLNLtXVg1ittDWf+xzch8fvrZZZpQ9JF2Qzv
 uVvdM14Uqq2FUSpfbjN9mYAQ3YsRo6A==
X-Received: by 2002:a5d:4888:: with SMTP id g8mr29470670wrq.555.1643888044615; 
 Thu, 03 Feb 2022 03:34:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywwHL8wmdHsGASRjpGYsDnOhOIX4qI1tACtpWgpcVjUcJaJlzC/QRXNq6PvAB5R5rub8rOMA==
X-Received: by 2002:a5d:4888:: with SMTP id g8mr29470648wrq.555.1643888044393; 
 Thu, 03 Feb 2022 03:34:04 -0800 (PST)
Received: from redhat.com ([2.52.9.182])
 by smtp.gmail.com with ESMTPSA id t5sm20689201wrw.92.2022.02.03.03.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 03:34:03 -0800 (PST)
Date: Thu, 3 Feb 2022 06:34:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2] iommu/iova: Separate out rcache init
Message-ID: <20220203063345-mutt-send-email-mst@kernel.org>
References: <1643882360-241739-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1643882360-241739-1-git-send-email-john.garry@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: will@kernel.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, jasowang@redhat.com
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

On Thu, Feb 03, 2022 at 05:59:20PM +0800, John Garry wrote:
> Currently the rcache structures are allocated for all IOVA domains, even if
> they do not use "fast" alloc+free interface. This is wasteful of memory.
> 
> In addition, fails in init_iova_rcaches() are not handled safely, which is
> less than ideal.
> 
> Make "fast" users call a separate rcache init explicitly, which includes
> error checking.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>

virtio things:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> Differences to v1:
> - Drop stubs for iova_domain_init_rcaches() and iova_domain_free_rcaches()
> - Use put_iova_domain() in vdpa code
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index d85d54f2b549..b22034975301 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -525,6 +525,7 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
>  	unsigned long order, base_pfn;
>  	struct iova_domain *iovad;
> +	int ret;
>  
>  	if (!cookie || cookie->type != IOMMU_DMA_IOVA_COOKIE)
>  		return -EINVAL;
> @@ -559,6 +560,9 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>  	}
>  
>  	init_iova_domain(iovad, 1UL << order, base_pfn);
> +	ret = iova_domain_init_rcaches(iovad);
> +	if (ret)
> +		return ret;
>  
>  	/* If the FQ fails we can simply fall back to strict mode */
>  	if (domain->type == IOMMU_DOMAIN_DMA_FQ && iommu_dma_init_fq(domain))
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index b28c9435b898..7e9c3a97c040 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -15,13 +15,14 @@
>  /* The anchor node sits above the top of the usable address space */
>  #define IOVA_ANCHOR	~0UL
>  
> +#define IOVA_RANGE_CACHE_MAX_SIZE 6	/* log of max cached IOVA range size (in pages) */
> +
>  static bool iova_rcache_insert(struct iova_domain *iovad,
>  			       unsigned long pfn,
>  			       unsigned long size);
>  static unsigned long iova_rcache_get(struct iova_domain *iovad,
>  				     unsigned long size,
>  				     unsigned long limit_pfn);
> -static void init_iova_rcaches(struct iova_domain *iovad);
>  static void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad);
>  static void free_iova_rcaches(struct iova_domain *iovad);
>  
> @@ -64,8 +65,6 @@ init_iova_domain(struct iova_domain *iovad, unsigned long granule,
>  	iovad->anchor.pfn_lo = iovad->anchor.pfn_hi = IOVA_ANCHOR;
>  	rb_link_node(&iovad->anchor.node, NULL, &iovad->rbroot.rb_node);
>  	rb_insert_color(&iovad->anchor.node, &iovad->rbroot);
> -	cpuhp_state_add_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD, &iovad->cpuhp_dead);
> -	init_iova_rcaches(iovad);
>  }
>  EXPORT_SYMBOL_GPL(init_iova_domain);
>  
> @@ -488,6 +487,13 @@ free_iova_fast(struct iova_domain *iovad, unsigned long pfn, unsigned long size)
>  }
>  EXPORT_SYMBOL_GPL(free_iova_fast);
>  
> +static void iova_domain_free_rcaches(struct iova_domain *iovad)
> +{
> +	cpuhp_state_remove_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD,
> +					    &iovad->cpuhp_dead);
> +	free_iova_rcaches(iovad);
> +}
> +
>  /**
>   * put_iova_domain - destroys the iova domain
>   * @iovad: - iova domain in question.
> @@ -497,9 +503,9 @@ void put_iova_domain(struct iova_domain *iovad)
>  {
>  	struct iova *iova, *tmp;
>  
> -	cpuhp_state_remove_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD,
> -					    &iovad->cpuhp_dead);
> -	free_iova_rcaches(iovad);
> +	if (iovad->rcaches)
> +		iova_domain_free_rcaches(iovad);
> +
>  	rbtree_postorder_for_each_entry_safe(iova, tmp, &iovad->rbroot, node)
>  		free_iova_mem(iova);
>  }
> @@ -608,6 +614,7 @@ EXPORT_SYMBOL_GPL(reserve_iova);
>   */
>  
>  #define IOVA_MAG_SIZE 128
> +#define MAX_GLOBAL_MAGS 32	/* magazines per bin */
>  
>  struct iova_magazine {
>  	unsigned long size;
> @@ -620,6 +627,13 @@ struct iova_cpu_rcache {
>  	struct iova_magazine *prev;
>  };
>  
> +struct iova_rcache {
> +	spinlock_t lock;
> +	unsigned long depot_size;
> +	struct iova_magazine *depot[MAX_GLOBAL_MAGS];
> +	struct iova_cpu_rcache __percpu *cpu_rcaches;
> +};
> +
>  static struct iova_magazine *iova_magazine_alloc(gfp_t flags)
>  {
>  	return kzalloc(sizeof(struct iova_magazine), flags);
> @@ -693,28 +707,54 @@ static void iova_magazine_push(struct iova_magazine *mag, unsigned long pfn)
>  	mag->pfns[mag->size++] = pfn;
>  }
>  
> -static void init_iova_rcaches(struct iova_domain *iovad)
> +int iova_domain_init_rcaches(struct iova_domain *iovad)
>  {
> -	struct iova_cpu_rcache *cpu_rcache;
> -	struct iova_rcache *rcache;
>  	unsigned int cpu;
> -	int i;
> +	int i, ret;
> +
> +	iovad->rcaches = kcalloc(IOVA_RANGE_CACHE_MAX_SIZE,
> +				 sizeof(struct iova_rcache),
> +				 GFP_KERNEL);
> +	if (!iovad->rcaches)
> +		return -ENOMEM;
>  
>  	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
> +		struct iova_cpu_rcache *cpu_rcache;
> +		struct iova_rcache *rcache;
> +
>  		rcache = &iovad->rcaches[i];
>  		spin_lock_init(&rcache->lock);
>  		rcache->depot_size = 0;
> -		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache), cache_line_size());
> -		if (WARN_ON(!rcache->cpu_rcaches))
> -			continue;
> +		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache),
> +						     cache_line_size());
> +		if (!rcache->cpu_rcaches) {
> +			ret = -ENOMEM;
> +			goto out_err;
> +		}
>  		for_each_possible_cpu(cpu) {
>  			cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
> +
>  			spin_lock_init(&cpu_rcache->lock);
>  			cpu_rcache->loaded = iova_magazine_alloc(GFP_KERNEL);
>  			cpu_rcache->prev = iova_magazine_alloc(GFP_KERNEL);
> +			if (!cpu_rcache->loaded || !cpu_rcache->prev) {
> +				ret = -ENOMEM;
> +				goto out_err;
> +			}
>  		}
>  	}
> +
> +	ret = cpuhp_state_add_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD,
> +					       &iovad->cpuhp_dead);
> +	if (ret)
> +		goto out_err;
> +	return 0;
> +
> +out_err:
> +	free_iova_rcaches(iovad);
> +	return ret;
>  }
> +EXPORT_SYMBOL_GPL(iova_domain_init_rcaches);
>  
>  /*
>   * Try inserting IOVA range starting with 'iova_pfn' into 'rcache', and
> @@ -831,7 +871,7 @@ static unsigned long iova_rcache_get(struct iova_domain *iovad,
>  {
>  	unsigned int log_size = order_base_2(size);
>  
> -	if (log_size >= IOVA_RANGE_CACHE_MAX_SIZE)
> +	if (log_size >= IOVA_RANGE_CACHE_MAX_SIZE || !iovad->rcaches)
>  		return 0;
>  
>  	return __iova_rcache_get(&iovad->rcaches[log_size], limit_pfn - size);
> @@ -849,6 +889,8 @@ static void free_iova_rcaches(struct iova_domain *iovad)
>  
>  	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
>  		rcache = &iovad->rcaches[i];
> +		if (!rcache->cpu_rcaches)
> +			break;
>  		for_each_possible_cpu(cpu) {
>  			cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
>  			iova_magazine_free(cpu_rcache->loaded);
> @@ -858,6 +900,9 @@ static void free_iova_rcaches(struct iova_domain *iovad)
>  		for (j = 0; j < rcache->depot_size; ++j)
>  			iova_magazine_free(rcache->depot[j]);
>  	}
> +
> +	kfree(iovad->rcaches);
> +	iovad->rcaches = NULL;
>  }
>  
>  /*
> diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
> index 2b1143f11d8f..22f7d43f8a68 100644
> --- a/drivers/vdpa/vdpa_user/iova_domain.c
> +++ b/drivers/vdpa/vdpa_user/iova_domain.c
> @@ -480,6 +480,7 @@ vduse_domain_create(unsigned long iova_limit, size_t bounce_size)
>  	struct file *file;
>  	struct vduse_bounce_map *map;
>  	unsigned long pfn, bounce_pfns;
> +	int ret;
>  
>  	bounce_pfns = PAGE_ALIGN(bounce_size) >> PAGE_SHIFT;
>  	if (iova_limit <= bounce_size)
> @@ -513,10 +514,20 @@ vduse_domain_create(unsigned long iova_limit, size_t bounce_size)
>  	spin_lock_init(&domain->iotlb_lock);
>  	init_iova_domain(&domain->stream_iovad,
>  			PAGE_SIZE, IOVA_START_PFN);
> +	ret = iova_domain_init_rcaches(&domain->stream_iovad);
> +	if (ret)
> +		goto err_iovad_stream;
>  	init_iova_domain(&domain->consistent_iovad,
>  			PAGE_SIZE, bounce_pfns);
> +	ret = iova_domain_init_rcaches(&domain->consistent_iovad);
> +	if (ret)
> +		goto err_iovad_consistent;
>  
>  	return domain;
> +err_iovad_consistent:
> +	put_iova_domain(&domain->stream_iovad);
> +err_iovad_stream:
> +	fput(file);
>  err_file:
>  	vfree(domain->bounce_maps);
>  err_map:
> diff --git a/include/linux/iova.h b/include/linux/iova.h
> index cea79cb9f26c..320a70e40233 100644
> --- a/include/linux/iova.h
> +++ b/include/linux/iova.h
> @@ -21,18 +21,8 @@ struct iova {
>  	unsigned long	pfn_lo; /* Lowest allocated pfn */
>  };
>  
> -struct iova_magazine;
> -struct iova_cpu_rcache;
>  
> -#define IOVA_RANGE_CACHE_MAX_SIZE 6	/* log of max cached IOVA range size (in pages) */
> -#define MAX_GLOBAL_MAGS 32	/* magazines per bin */
> -
> -struct iova_rcache {
> -	spinlock_t lock;
> -	unsigned long depot_size;
> -	struct iova_magazine *depot[MAX_GLOBAL_MAGS];
> -	struct iova_cpu_rcache __percpu *cpu_rcaches;
> -};
> +struct iova_rcache;
>  
>  /* holds all the iova translations for a domain */
>  struct iova_domain {
> @@ -46,7 +36,7 @@ struct iova_domain {
>  	unsigned long	max32_alloc_size; /* Size of last failed allocation */
>  	struct iova	anchor;		/* rbtree lookup anchor */
>  
> -	struct iova_rcache rcaches[IOVA_RANGE_CACHE_MAX_SIZE];	/* IOVA range caches */
> +	struct iova_rcache	*rcaches;
>  	struct hlist_node	cpuhp_dead;
>  };
>  
> @@ -102,6 +92,7 @@ struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
>  	unsigned long pfn_hi);
>  void init_iova_domain(struct iova_domain *iovad, unsigned long granule,
>  	unsigned long start_pfn);
> +int iova_domain_init_rcaches(struct iova_domain *iovad);
>  struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn);
>  void put_iova_domain(struct iova_domain *iovad);
>  #else
> -- 
> 2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
