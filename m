Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE874131AE6
	for <lists.iommu@lfdr.de>; Mon,  6 Jan 2020 22:59:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66A4B88268;
	Mon,  6 Jan 2020 21:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWIrk-xBONjL; Mon,  6 Jan 2020 21:59:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F7DD88265;
	Mon,  6 Jan 2020 21:59:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 255B9C1D89;
	Mon,  6 Jan 2020 21:59:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 341D7C0881
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 19BA3204E4
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 21:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZHiNtKJu0Q3 for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 21:59:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by silver.osuosl.org (Postfix) with ESMTPS id E8B2F1FEE0
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 21:59:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578347970; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=HsoYzjx0yR+InjrIWJUImkkZr0gTiuqGAFHtBnKjCBo=;
 b=VY8NNoaQtt/QI6vm/wAgfNnZGwj1UmWb3GKuRJsm5zoMHydQBG5+IIBuwSHM1kyIk6woQO6z
 mAxGf2T9vQ6S9S96iL5yycm2kNkXlVOu1A9l+bne/Hc/7vIOKPdhUTP2j0SdRjSc7uBrm+5X
 G4JX5yxJPZoaiK/jayj6wlPdvyw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e13adbf.7fc37c177260-smtp-out-n02;
 Mon, 06 Jan 2020 21:59:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 41627C447A1; Mon,  6 Jan 2020 21:59:27 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5048AC433CB;
 Mon,  6 Jan 2020 21:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5048AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 6 Jan 2020 14:59:19 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: Re: [Freedreno] [PATCH v3 4/5] drm/msm: Refactor address space
 initialization
Message-ID: <20200106215919.GB4341@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: iommu@lists.linux-foundation.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, will@kernel.org,
 Wen Yang <wen.yang99@zte.com.cn>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-arm-kernel@lists.infradead.org,
 Brian Masney <masneyb@onstation.org>,
 freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>,
 linux-arm-msm@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 zhengbin <zhengbin13@huawei.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>, robin.murphy@arm.com,
 Georgi Djakov <georgi.djakov@linaro.org>
References: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
 <1576514271-15687-5-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576514271-15687-5-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, will@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Wen Yang <wen.yang99@zte.com.cn>, Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-arm-kernel@lists.infradead.org, Brian Masney <masneyb@onstation.org>,
 Fritz Koenig <frkoenig@google.com>, linux-arm-msm@vger.kernel.org,
 robin.murphy@arm.com, Alexios Zavras <alexios.zavras@intel.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Georgi Djakov <georgi.djakov@linaro.org>
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

On Mon, Dec 16, 2019 at 09:37:50AM -0700, Jordan Crouse wrote:
> Refactor how address space initialization works. Instead of having the
> address space function create the MMU object (and thus require separate but
> equal functions for gpummu and iommu) use a single function and pass the
> MMU struct. Make the generic code cleaner by using target specific
> functions to create the address space so a2xx can do its own thing in its
> own space.  For all the other targets use a generic helper to initialize
> IOMMU but leave the door open for newer targets to use customization
> if they need it.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 16 ++++++++++
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 23 ++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  8 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 +++---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 14 +++++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++++--
>  drivers/gpu/drm/msm/msm_drv.h            |  8 ++---
>  drivers/gpu/drm/msm/msm_gem_vma.c        | 52 +++++---------------------------
>  drivers/gpu/drm/msm/msm_gpu.c            | 40 ++----------------------
>  drivers/gpu/drm/msm/msm_gpu.h            |  4 +--
>  drivers/gpu/drm/msm/msm_iommu.c          |  3 ++
>  16 files changed, 83 insertions(+), 114 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index 1f83bc1..60f6472 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -401,6 +401,21 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
>  	return state;
>  }
>  
> +static struct msm_gem_address_space *
> +a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
> +{
> +	struct msm_mmu *mmu = msm_gpummu_new(&pdev->dev, gpu);
> +	struct msm_gem_address_space *aspace;
> +
> +	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> +		SZ_16M + 0xfff * SZ_64K);
> +
> +	if (IS_ERR(aspace) && !IS_ERR(mmu))
> +		mmu->funcs->destroy(mmu);
> +
> +	return aspace;
> +}
> +
>  /* Register offset defines for A2XX - copy of A3XX */
>  static const unsigned int a2xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
>  	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_AXXX_CP_RB_BASE),
> @@ -429,6 +444,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #endif
>  		.gpu_state_get = a2xx_gpu_state_get,
>  		.gpu_state_put = adreno_gpu_state_put,
> +		.create_address_space = a2xx_create_address_space,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 7ad1493..41e51e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -441,6 +441,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #endif
>  		.gpu_state_get = a3xx_gpu_state_get,
>  		.gpu_state_put = adreno_gpu_state_put,
> +		.create_address_space = adreno_iommu_create_address_space,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index b01388a..3655440 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -532,6 +532,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #endif
>  		.gpu_state_get = a4xx_gpu_state_get,
>  		.gpu_state_put = adreno_gpu_state_put,
> +		.create_address_space = adreno_iommu_create_address_space,
>  	},
>  	.get_timestamp = a4xx_get_timestamp,
>  };
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index b02e204..0f5db72 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1432,6 +1432,7 @@ static const struct adreno_gpu_funcs funcs = {
>  		.gpu_busy = a5xx_gpu_busy,
>  		.gpu_state_get = a5xx_gpu_state_get,
>  		.gpu_state_put = a5xx_gpu_state_put,
> +		.create_address_space = adreno_iommu_create_address_space,
>  	},
>  	.get_timestamp = a5xx_get_timestamp,
>  };
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index dc8ec2c..5dc0b2c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -832,6 +832,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>  		.gpu_state_get = a6xx_gpu_state_get,
>  		.gpu_state_put = a6xx_gpu_state_put,
> +		.create_address_space = adreno_iommu_create_address_space,
>  #endif
>  	},
>  	.get_timestamp = a6xx_get_timestamp,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0783e4b..09c57891 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -157,6 +157,23 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>  
> +struct msm_gem_address_space *
> +adreno_iommu_create_address_space(struct msm_gpu *gpu,
> +		struct platform_device *pdev)
> +{
> +	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> +	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> +	struct msm_gem_address_space *aspace;
> +
> +	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> +		0xfffffff);
> +
> +	if (IS_ERR(aspace) && !IS_ERR(mmu))
> +		mmu->funcs->destroy(mmu);
> +
> +	return aspace;
> +}
> +
>  int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -949,12 +966,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
>  
> -	adreno_gpu_config.va_start = SZ_16M;
> -	adreno_gpu_config.va_end = 0xffffffff;
> -	/* maximum range of a2xx mmu */
> -	if (adreno_is_a2xx(adreno_gpu))
> -		adreno_gpu_config.va_end = SZ_16M + 0xfff * SZ_64K;
> -
>  	adreno_gpu_config.nr_rings = nr_rings;
>  
>  	adreno_get_pwrlevels(&pdev->dev, gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e71a757..5c1aa12 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -263,6 +263,14 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
>  int adreno_gpu_state_put(struct msm_gpu_state *state);
>  
>  /*
> + * Common helper function to initialize the default address space for arm-smmu
> + * attached targets
> + */
> +struct msm_gem_address_space *
> +adreno_iommu_create_address_space(struct msm_gpu *gpu,
> +		struct platform_device *pdev);
> +
> +/*
>   * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
>   * out of secure mode
>   */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index b082b23..4e6ebbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -704,18 +704,18 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>  {
>  	struct iommu_domain *domain;
>  	struct msm_gem_address_space *aspace;
> +	struct msm_mmu *mmu;
>  
>  	domain = iommu_domain_alloc(&platform_bus_type);
>  	if (!domain)
>  		return 0;
>  
> -	domain->geometry.aperture_start = 0x1000;
> -	domain->geometry.aperture_end = 0xffffffff;
> +	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
> +	aspace = msm_gem_address_space_create(mmu, "dpu1",
> +		0x1000, 0xfffffff);
>  
> -	aspace = msm_gem_address_space_create(dpu_kms->dev->dev,
> -			domain, "dpu1");
>  	if (IS_ERR(aspace)) {
> -		iommu_domain_free(domain);
> +		mmu->funcs->destroy(mmu);
>  		return PTR_ERR(aspace);
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 9dba37c..0889718 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -510,9 +510,15 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>  	mdelay(16);
>  
>  	if (config->iommu) {
> -		aspace = msm_gem_address_space_create(&pdev->dev,
> -				config->iommu, "mdp4");
> +		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev,
> +			config->iommu);
> +
> +		aspace  = msm_gem_address_space_create(mmu,
> +			"mdp4", 0x1000, 0xffffffff);
> +
>  		if (IS_ERR(aspace)) {
> +			if (!IS_ERR(mmu))
> +				mmu->funcs->destroy(mmu);
>  			ret = PTR_ERR(aspace);
>  			goto fail;
>  		}
> @@ -565,10 +571,6 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
>  	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
>  	config.max_clk = 266667000;
>  	config.iommu = iommu_domain_alloc(&platform_bus_type);
> -	if (config.iommu) {
> -		config.iommu->geometry.aperture_start = 0x1000;
> -		config.iommu->geometry.aperture_end = 0xffffffff;
> -	}
>  
>  	return &config;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 1f48f64..ebd651a 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -941,10 +941,6 @@ static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
>  	static struct mdp5_cfg_platform config = {};
>  
>  	config.iommu = iommu_domain_alloc(&platform_bus_type);
> -	if (config.iommu) {
> -		config.iommu->geometry.aperture_start = 0x1000;
> -		config.iommu->geometry.aperture_end = 0xffffffff;
> -	}
>  
>  	return &config;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 653dab2..20bdff9 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -724,13 +724,20 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>  	mdelay(16);
>  
>  	if (config->platform.iommu) {
> +		struct msm_mmu *mmu;
> +
>  		iommu_dev = &pdev->dev;
>  		if (!iommu_dev->iommu_fwspec)
>  			iommu_dev = iommu_dev->parent;
>  
> -		aspace = msm_gem_address_space_create(iommu_dev,
> -				config->platform.iommu, "mdp5");
> +		mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
> +
> +		aspace = msm_gem_address_space_create(mmu, "mdp5",
> +			0x1000, 0xffffffff);
> +
>  		if (IS_ERR(aspace)) {
> +			if (!IS_ERR(mmu))
> +				mmu->funcs->destroy(mmu);
>  			ret = PTR_ERR(aspace);
>  			goto fail;
>  		}
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 71547e7..2203729 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -247,12 +247,8 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>  void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
>  
>  struct msm_gem_address_space *
> -msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
> -		const char *name);
> -
> -struct msm_gem_address_space *
> -msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
> -		const char *name, uint64_t va_start, uint64_t va_end);
> +msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
> +		u64 va_start, u64 va_end);
>  
>  int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
>  void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 91d993a..075ce52 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -125,63 +125,25 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>  	return 0;
>  }
>  
> -
>  struct msm_gem_address_space *
> -msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
> -		const char *name)
> -{
> -	struct msm_gem_address_space *aspace;
> -	u64 start = domain->geometry.aperture_start;
> -	u64 size = domain->geometry.aperture_end - start;
> -
> -	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
> -	if (!aspace)
> -		return ERR_PTR(-ENOMEM);
> -
> -	spin_lock_init(&aspace->lock);
> -	aspace->name = name;
> -	aspace->mmu = msm_iommu_new(dev, domain);
> -	if (IS_ERR(aspace->mmu)) {
> -		int ret = PTR_ERR(aspace->mmu);
> -
> -		kfree(aspace);
> -		return ERR_PTR(ret);
> -	}
> -
> -	/*
> -	 * Attaching the IOMMU device changes the aperture values so use the
> -	 * cached values instead
> -	 */
> -	drm_mm_init(&aspace->mm, start >> PAGE_SHIFT, size >> PAGE_SHIFT);
> -
> -	kref_init(&aspace->kref);
> -
> -	return aspace;
> -}
> -
> -struct msm_gem_address_space *
> -msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
> -		const char *name, uint64_t va_start, uint64_t va_end)
> +msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
> +		u64 va_start, u64 va_end)

The last parameter should be size.

>  {
>  	struct msm_gem_address_space *aspace;
>  	u64 size = va_end - va_start;

And this line should go poof.

>  
> +	if (IS_ERR(mmu))
> +		return ERR_CAST(mmu);
> +
>  	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
>  	if (!aspace)
>  		return ERR_PTR(-ENOMEM);
>  
>  	spin_lock_init(&aspace->lock);
>  	aspace->name = name;
> -	aspace->mmu = msm_gpummu_new(dev, gpu);
> -	if (IS_ERR(aspace->mmu)) {
> -		int ret = PTR_ERR(aspace->mmu);
> -
> -		kfree(aspace);
> -		return ERR_PTR(ret);
> -	}
> +	aspace->mmu = mmu;
>  
> -	drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT),
> -		size >> PAGE_SHIFT);
> +	drm_mm_init(&aspace->mm, va_start >> PAGE_SHIFT, size >> PAGE_SHIFT);
>  
>  	kref_init(&aspace->kref);

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
