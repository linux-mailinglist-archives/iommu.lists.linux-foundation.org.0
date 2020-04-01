Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5319AD0F
	for <lists.iommu@lfdr.de>; Wed,  1 Apr 2020 15:46:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4A67886B94;
	Wed,  1 Apr 2020 13:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzkZmYJuDcpC; Wed,  1 Apr 2020 13:46:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9458286B2D;
	Wed,  1 Apr 2020 13:46:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 805ACC1D8D;
	Wed,  1 Apr 2020 13:46:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5080BC089F
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 472E686D03
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aalADeI3OK_1 for <iommu@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:46:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4C79886D01
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:46:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m11so62290wrx.10
 for <iommu@lists.linux-foundation.org>; Wed, 01 Apr 2020 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4cNryWwLgfk02MQJubNgjaSZbCDMoiiIMtKoOX7YXDI=;
 b=VteHLmzKgoEfzpQT1w/jhX76LESCf+gm4mvr2xXIqiwhTv2TpXWBbt4Y4ZcRFrHXM5
 ZH8rUAOdHTvMKVc5NIBAxe5OIiGKoWZlamak03YGSPe1b2LkoLoEDDMyza5RZ+63zO7H
 MGuKbHbEs5BDD2VJYEB67W0WZgbY4ktCqGKHt70vKyVRIsvcoOefEpLENOV4IQI784b7
 h01SahB8bQKpM8MCXHS0DVklDLvM98lHC+3svnbLpIUBQf9ktvVmCfuQx5Le8RNFrWlB
 1WZNbK4SIJGcUVYehFgqpdLV3myf8yVjxpuqWFtD6OFnmj0TJKliqsoo4rFebvSMz6dg
 umEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4cNryWwLgfk02MQJubNgjaSZbCDMoiiIMtKoOX7YXDI=;
 b=W2teKY/Tz8sL0KuG5KeaSMy+rvIdw5Sr//DFCI4ulvM2oTA/pJldOAWf4lO/rssw7y
 t8G/PL+SCdP2YSGRnNtikCabwzsjDlki3VHt7TWR1DXA5q0SaaD9p3KmH7X3cGu2eCoy
 0V93q1I/Iue8rMq18aoyaPwTyloNA8m1WU5S2bio4RxoO2r1x7Yx/eNmZ+IUR5tpR29m
 B/yRCuqHdW/sUQOpvRb/uA1PL6zvY4BgPOrppQf+138mXr5Ln1NpQKutRXtjdJQCaV+0
 gKe+Im/GVPfEvEWlqxUS1EQGEpFs2NyayxgMZrJEU6XpFzh35lTptHdb67Xhp409XEvh
 H8uw==
X-Gm-Message-State: ANhLgQ1mZ64bXLys+VJQbB3y0DmV/SaoE10DsHbgq6k1m/9lRVQAbvhs
 pdGp+B4Jv12IdQ6FA3i5fBylQQ==
X-Google-Smtp-Source: ADFU+vvhdDZCD6jV8ng3HnZclBV2DQ0pInm0Lq5Hk0o80mIiqRvOGy1tJbuXvkh/iSOegt0kXOB/Dg==
X-Received: by 2002:adf:e44a:: with SMTP id t10mr25806844wrm.322.1585748761807; 
 Wed, 01 Apr 2020 06:46:01 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:6097:1406:6470:33b5])
 by smtp.gmail.com with ESMTPSA id z1sm3172281wrp.90.2020.04.01.06.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 06:46:01 -0700 (PDT)
Date: Wed, 1 Apr 2020 15:45:52 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 01/10] iommu/ioasid: Introduce system-wide capacity
Message-ID: <20200401134552.GD882512@myrica>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-2-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585158931-1825-2-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

On Wed, Mar 25, 2020 at 10:55:22AM -0700, Jacob Pan wrote:
> IOASID is a limited system-wide resource that can be allocated at
> runtime. This limitation can be enumerated during boot. For example, on
> x86 platforms, PCI Process Address Space ID (PASID) allocation uses
> IOASID service. The number of supported PASID bits are enumerated by
> extended capability register as defined in the VT-d spec.
> 
> This patch adds a helper to set the system capacity, it expected to be
> set during boot prior to any allocation request.

This one-time setting is a bit awkward. Since multiple IOMMU drivers may
be loaded, this can't be a module_init() thing. And we generally have
multiple SMMU instances in the system. So we'd need to call
install_capacity() only for the first SMMU loaded with an arbitrary 1<<20,
even though each SMMU can support different numbers of PASID bits.
Furthermore, modules such as iommu-sva will want to initialize their
IOASID set at module_init(), which will happen before the SMMU can set up
the capacity, so ioasid_alloc_set() will return an error.

How about hardcoding ioasid_capacity to 20 bits for now?  It's the PCIe
limit and probably won't have to increase for a while.

Thanks,
Jean

> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  drivers/iommu/ioasid.c | 15 +++++++++++++++
>  include/linux/ioasid.h |  5 ++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
> index 0f8dd377aada..4026e52855b9 100644
> --- a/drivers/iommu/ioasid.c
> +++ b/drivers/iommu/ioasid.c
> @@ -17,6 +17,21 @@ struct ioasid_data {
>  	struct rcu_head rcu;
>  };
>  
> +static ioasid_t ioasid_capacity;
> +static ioasid_t ioasid_capacity_avail;
> +
> +/* System capacity can only be set once */
> +void ioasid_install_capacity(ioasid_t total)
> +{
> +	if (ioasid_capacity) {
> +		pr_warn("IOASID capacity already set at %d\n", ioasid_capacity);
> +		return;
> +	}
> +
> +	ioasid_capacity = ioasid_capacity_avail = total;
> +}
> +EXPORT_SYMBOL_GPL(ioasid_install_capacity);
> +
>  /*
>   * struct ioasid_allocator_data - Internal data structure to hold information
>   * about an allocator. There are two types of allocators:
> diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
> index 6f000d7a0ddc..9711fa0dc357 100644
> --- a/include/linux/ioasid.h
> +++ b/include/linux/ioasid.h
> @@ -40,7 +40,7 @@ void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
>  int ioasid_register_allocator(struct ioasid_allocator_ops *allocator);
>  void ioasid_unregister_allocator(struct ioasid_allocator_ops *allocator);
>  int ioasid_set_data(ioasid_t ioasid, void *data);
> -
> +void ioasid_install_capacity(ioasid_t total);
>  #else /* !CONFIG_IOASID */
>  static inline ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min,
>  				    ioasid_t max, void *private)
> @@ -72,5 +72,8 @@ static inline int ioasid_set_data(ioasid_t ioasid, void *data)
>  	return -ENOTSUPP;
>  }
>  
> +static inline void ioasid_install_capacity(ioasid_t total)
> +{
> +}
>  #endif /* CONFIG_IOASID */
>  #endif /* __LINUX_IOASID_H */
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
