Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6DB2586F6
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 06:32:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BAE986FC8;
	Tue,  1 Sep 2020 04:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNdaxMDbThwk; Tue,  1 Sep 2020 04:32:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CF5E86FC4;
	Tue,  1 Sep 2020 04:32:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D355C0051;
	Tue,  1 Sep 2020 04:32:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59F2EC0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 04:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4283686FC2
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 04:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COpbfsMaGmeu for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 04:32:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E6BE186FBD
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 04:32:15 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k20so63711otr.1
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 21:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6R0w32dHRH3+SBeVCMfaRe9dqTNsO2sbD8FOePJ7bRI=;
 b=AQ0Ns747XkOOSF/pd838/AQpkaJww0p9SS2YjA33J96ISeP2BQtVSiqecu5E3fvFe6
 Jb58fivxjJHf+vH0Ytps7p6nor87tlxqOxWKGlUKnALfAkv7/r9qpZe0d9zEbpiL0ijc
 ob1gXiK9CozRDgRc0KTnEulqVZdBVD02F+XjqcWym5X8oKW8qJ/qw1e1TAPL8MJDYub8
 IrAzvOs4a5YlTtlfjLy0thUuI+lnVJXJOe+9cIksq0Qwc0K+z7OoOdd9rHD7fFBPVzAH
 lgg74fkpms7c5PJ5C3myeiIOMFOK1RraZl1knC8Kam1yHGtxatpTePXQlvsC7vw7m6Ci
 XfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6R0w32dHRH3+SBeVCMfaRe9dqTNsO2sbD8FOePJ7bRI=;
 b=FtU6aZOVietwF5IzMtTFHfSM/hNJkDNG4KvD5joaTCWA10giZUqDYn+Gdl3aUuw9N3
 +vy6l3OUAR0y+TjcoSvY2pDFq63h2t3rTUt+CaBz60TC5Ys2GrUQ/neqH1tJ/CBYZmwZ
 9QjHHg/77ent3/9J9hUKBRdYAInc8b1jospLUhPgswFGZT160UfhGLjSmYR7mOVW2fsu
 QtW+WwdioKq9XgE6SVr/X2Quve5iUIW3nxFrWXkY6rSg4Wz9WASafITA5xYlD53AD5CF
 0Yvq1OV4zTycJqL3gWYUfABRu07b6WUu+8K77RXeWdrmQTf0Xvmqj52rsy79aBdojFgf
 kTLg==
X-Gm-Message-State: AOAM53189gvVi25WIbeNn0fGw6al+126admIkk1ygwmBuNpR4w4ckCS6
 sCZYkq9x3TkMUtGzeYTKZMa7CQ==
X-Google-Smtp-Source: ABdhPJwme/u5M3h14OxrBdRlOBTBOLIg+gJr5HMqBioo8/D+h9xfhE4wPOwDoY7s+tBkKE8hH9+LtQ==
X-Received: by 2002:a9d:4695:: with SMTP id z21mr90592ote.91.1598934735028;
 Mon, 31 Aug 2020 21:32:15 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id e7sm2199948otj.28.2020.08.31.21.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 21:32:14 -0700 (PDT)
Date: Mon, 31 Aug 2020 23:32:11 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 06/19] drm/msm/gpu: add dev_to_gpu() helper
Message-ID: <20200901043211.GN3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-7-robdclark@gmail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawn.guo@linaro.org>, Robin Murphy <robin.murphy@arm.com>
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

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> In a later patch, the drvdata will not directly be 'struct msm_gpu *',
> so add a helper to reduce the churn.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 10 ++++------
>  drivers/gpu/drm/msm/msm_gpu.c              |  6 +++---
>  drivers/gpu/drm/msm/msm_gpu.h              |  5 +++++
>  3 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 9eeb46bf2a5d..26664e1b30c0 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -282,7 +282,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>  	int ret;
>  
>  	if (pdev)
> -		gpu = platform_get_drvdata(pdev);
> +		gpu = dev_to_gpu(&pdev->dev);
>  
>  	if (!gpu) {
>  		dev_err_once(dev->dev, "no GPU device was found\n");
> @@ -425,7 +425,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  static void adreno_unbind(struct device *dev, struct device *master,
>  		void *data)
>  {
> -	struct msm_gpu *gpu = dev_get_drvdata(dev);
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  
>  	pm_runtime_force_suspend(dev);
>  	gpu->funcs->destroy(gpu);
> @@ -490,16 +490,14 @@ static const struct of_device_id dt_match[] = {
>  #ifdef CONFIG_PM
>  static int adreno_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_gpu *gpu = platform_get_drvdata(pdev);
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  
>  	return gpu->funcs->pm_resume(gpu);
>  }
>  
>  static int adreno_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_gpu *gpu = platform_get_drvdata(pdev);
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  
>  	return gpu->funcs->pm_suspend(gpu);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index d5645472b25d..6aa9e04e52e7 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -24,7 +24,7 @@
>  static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>  		u32 flags)
>  {
> -	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  	struct dev_pm_opp *opp;
>  
>  	opp = devfreq_recommended_opp(dev, freq, flags);
> @@ -45,7 +45,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>  static int msm_devfreq_get_dev_status(struct device *dev,
>  		struct devfreq_dev_status *status)
>  {
> -	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  	ktime_t time;
>  
>  	if (gpu->funcs->gpu_get_freq)
> @@ -64,7 +64,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
>  
>  static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
>  {
> -	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>  
>  	if (gpu->funcs->gpu_get_freq)
>  		*freq = gpu->funcs->gpu_get_freq(gpu);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0db117a7339b..8bda7beaed4b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -141,6 +141,11 @@ struct msm_gpu {
>  	struct msm_gpu_state *crashstate;
>  };
>  
> +static inline struct msm_gpu *dev_to_gpu(struct device *dev)

That's a fairly generic name for a driver-global helper :)

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +{
> +	return dev_get_drvdata(dev);
> +}
> +
>  /* It turns out that all targets use the same ringbuffer size */
>  #define MSM_GPU_RINGBUFFER_SZ SZ_32K
>  #define MSM_GPU_RINGBUFFER_BLKSIZE 32
> -- 
> 2.26.2
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
