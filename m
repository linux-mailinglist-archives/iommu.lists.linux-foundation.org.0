Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1981F3AA069
	for <lists.iommu@lfdr.de>; Wed, 16 Jun 2021 17:51:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF7783A15;
	Wed, 16 Jun 2021 15:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sConEMJSEyq9; Wed, 16 Jun 2021 15:51:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CC02C836CE;
	Wed, 16 Jun 2021 15:51:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AEF2C0024;
	Wed, 16 Jun 2021 15:51:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CA1DC000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 15:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53C8E836CE
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 15:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siR4DH_WO6rM for <iommu@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 15:51:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 953A283506
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623858660;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlBpjk0p11BKeTclm4FcvP2+RtXdSrKcaNlna0enzx0=;
 b=N5WO38BkCTYH2oz/swS/n/d73TExAGUVZ9zYku+iVC9Gz9y9plki9DX/HZrE1D1yDvty8r
 5/UPrOL+WQkjR9b26kPSGLMm2isU3OpovYG56jKL7liKEfvLW/xJX5QWsRfKhYjUMJbzOu
 C/Q0rfnOkKf+fA+LsX5pJcuWPI/tnSg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279--RYR_PwwN4Cm_1ZOD2wg3g-1; Wed, 16 Jun 2021 11:50:54 -0400
X-MC-Unique: -RYR_PwwN4Cm_1ZOD2wg3g-1
Received: by mail-wr1-f72.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso1464300wrf.4
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 08:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=xlBpjk0p11BKeTclm4FcvP2+RtXdSrKcaNlna0enzx0=;
 b=a1+/xXIzkZkOSR+aTqdViaf6C8Et125QIAmGeCIKuAk52BDhAIH8/cNY3qOULet9IU
 rfvYGSWQCUFj98O54v/8yjumPO3oWZ/IU3z2jGPGpElP6Jr+MYQolm+H4eD/60/U/nPL
 h+CPVD9BQz8s843l8sz1jk4SgOatC8Zj+EwMmU/dZXQruKRcoq4E+2PT2aTts6PgUcui
 vvAtNIm5HVb+cKnQW8aCn1WeImKtDB7d+qEXaqCTOQEofWGuhG+mTLF4OvmVA+CoJHs0
 SsYjMp5IIs0QwOKmXi1hxnRasTtwOIbZ/yz0357YfrAwAhNNI06JsYTa9GxX3Vd8w5us
 di/w==
X-Gm-Message-State: AOAM5305/YOJTtQ4bmg4zioGfASig0m5f/FmH2p92RyAyULNd8cd6bnb
 PwOXL1t2F93Pk+gow/hEHd4oVLQMlLHWy5Bw7AQSIV0tKDOsH09xqvbTCetvRgkAR1UOr95yScI
 WcOVHkCaA49gcP0o3YmoGqnscbBCHEw==
X-Received: by 2002:a1c:193:: with SMTP id 141mr12231132wmb.106.1623858653149; 
 Wed, 16 Jun 2021 08:50:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9OI2IVADygttdOre09Sy1S+JFXZdlBRd88z8bREst0fh3MJQ4Chz/ONg8Ap86S3zsy0+c3w==
X-Received: by 2002:a1c:193:: with SMTP id 141mr12231096wmb.106.1623858652836; 
 Wed, 16 Jun 2021 08:50:52 -0700 (PDT)
Received: from [192.168.43.95] ([37.172.247.238])
 by smtp.gmail.com with ESMTPSA id g17sm3403307wrh.72.2021.06.16.08.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 08:50:52 -0700 (PDT)
Subject: Re: [PATCH v4 5/6] iommu/dma: Simplify calls to iommu_setup_dma_ops()
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, rjw@rjwysocki.net,
 lenb@kernel.org, joro@8bytes.org, mst@redhat.com
References: <20210610075130.67517-1-jean-philippe@linaro.org>
 <20210610075130.67517-6-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <210dbd62-cd04-209c-eec9-f0a4e706264d@redhat.com>
Date: Wed, 16 Jun 2021 17:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610075130.67517-6-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kevin.tian@intel.com, catalin.marinas@arm.com, sudeep.holla@arm.com,
 robin.murphy@arm.com, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, guohanjun@huawei.com, will@kernel.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
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
Reply-To: eric.auger@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jean,

On 6/10/21 9:51 AM, Jean-Philippe Brucker wrote:
> dma-iommu uses the address bounds described in domain->geometry during
> IOVA allocation. The address size parameters of iommu_setup_dma_ops()
> are useful for describing additional limits set by the platform
> firmware, but aren't needed for drivers that call this function from
> probe_finalize(). The base parameter can be zero because dma-iommu
> already removes the first IOVA page, and the limit parameter can be
> U64_MAX because it's only checked against the domain geometry. Simplify
> calls to iommu_setup_dma_ops().
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  drivers/iommu/amd/iommu.c   |  9 +--------
>  drivers/iommu/dma-iommu.c   |  4 +++-
>  drivers/iommu/intel/iommu.c | 10 +---------
>  3 files changed, 5 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index 94b96d81fcfd..d3123bc05c08 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -1708,14 +1708,7 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
>  
>  static void amd_iommu_probe_finalize(struct device *dev)
>  {
> -	struct iommu_domain *domain;
> -
> -	/* Domains are initialized for this device - have a look what we ended up with */
> -	domain = iommu_get_domain_for_dev(dev);
> -	if (domain->type == IOMMU_DOMAIN_DMA)
> -		iommu_setup_dma_ops(dev, IOVA_START_PFN << PAGE_SHIFT, U64_MAX);
> -	else
> -		set_dma_ops(dev, NULL);
> +	iommu_setup_dma_ops(dev, 0, U64_MAX);
>  }
>  
>  static void amd_iommu_release_device(struct device *dev)
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index c62e19bed302..175f8eaeb5b3 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1322,7 +1322,9 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit)
>  	if (domain->type == IOMMU_DOMAIN_DMA) {
>  		if (iommu_dma_init_domain(domain, dma_base, dma_limit, dev))
>  			goto out_err;
> -		dev->dma_ops = &iommu_dma_ops;
> +		set_dma_ops(dev, &iommu_dma_ops);
> +	} else {
> +		set_dma_ops(dev, NULL);
>  	}
>  
>  	return;
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 85f18342603c..8d866940692a 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5165,15 +5165,7 @@ static void intel_iommu_release_device(struct device *dev)
>  
>  static void intel_iommu_probe_finalize(struct device *dev)
>  {
> -	dma_addr_t base = IOVA_START_PFN << VTD_PAGE_SHIFT;
> -	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> -	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
> -
> -	if (domain && domain->type == IOMMU_DOMAIN_DMA)
> -		iommu_setup_dma_ops(dev, base,
> -				    __DOMAIN_MAX_ADDR(dmar_domain->gaw));
> -	else
> -		set_dma_ops(dev, NULL);
> +	iommu_setup_dma_ops(dev, 0, U64_MAX);
>  }
>  
>  static void intel_iommu_get_resv_regions(struct device *device,

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
