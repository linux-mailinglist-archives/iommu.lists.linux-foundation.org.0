Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B740B2AC92E
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 00:15:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B52F863F1;
	Mon,  9 Nov 2020 23:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vupJ6YtDHaPL; Mon,  9 Nov 2020 23:15:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7BB6A85DBB;
	Mon,  9 Nov 2020 23:15:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61F4BC016F;
	Mon,  9 Nov 2020 23:15:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EBF1C016F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 23:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0445822011
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 23:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egnl-cSW-hli for <iommu@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 23:15:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 6534020457
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 23:15:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w1so10666293wrm.4
 for <iommu@lists.linux-foundation.org>; Mon, 09 Nov 2020 15:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUkkMN1k1Nmarfzi7mdyLkenP8Z0h5fFEFf0HHFDPZ4=;
 b=ERHXmS2szbTgYa05ljx7O5X0mTDvdDks2MuN/zp3YSM8pX1qXceo7SGtE86Ka9CNL2
 HfweYJHgB/qUs1UUfwR9JbWIUeho+oCiaBfxMxPuXi3qqrSY44STV3yzq1FV3kGUNvV+
 27i4junuhfNr84Ic884l4UCstwWM7QVOv5e3yIzfo6gvT4VlasPUS+hAQxd53BfR2UKp
 zIx/rwaokOFMDe8xyOZAq69YrHVo/yjy4dIKp0vTalaWFSsSulesn0AF3PCrMY6Yzk4B
 Ghgu4xGBWfPM16E7gZC6uXv3xQPwcqXBkuRgR8wWkkEB39hXAzE+nRoqL8O3d0mQaLBV
 5tKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUkkMN1k1Nmarfzi7mdyLkenP8Z0h5fFEFf0HHFDPZ4=;
 b=aF5gPDuI0u+wJrsW8WIW0nWHSHNNpRSCeO9bCnJbIo5nzxRzdvvgvHEMhv8Pa/J2oC
 0aBUWnNXcXwj1gUUsn1N18K4Ow3wdOeP+XhxkKA7aEMbJyL7nmgrJ5neJHJDoB+C9/NF
 YBj0ZZ9NVM7vOC5NjPXCpNf5ZBDZ1WNSJhf0J5++lo3QxWte+Tg2wpVYKO7Rzb1L2AWh
 srKm22IPTMB3+ZLY4JPgjXw8Wnipe28K3Hf9pE4X390VJVxOvxIufMr93JleMwE9Egrm
 m2sB7IZ7iknOJ9diZRlIPgCsEWRGsBZT053O2amYFf52fE19FwW13J2kr97V5ca9nA6W
 yhpg==
X-Gm-Message-State: AOAM533v4zP1y0U2CB0ouy1EJcNe13eo4u3z2DDAe2Fq8Z7Z2KFDqI22
 3PX++RzwwqIvt/wnbYm0gOL0RRqfrC1qp/jUkwM=
X-Google-Smtp-Source: ABdhPJwY/yfydI5jTWgl7hfVjHqfW7lZxoPtyf6NY7E9mEhooa8PH5OQTyqJO0WobeHFQ3ppbO770JerF5rHoCRrB98=
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr20949037wrx.83.1604963730827; 
 Mon, 09 Nov 2020 15:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20201109222319.2630557-1-jcrouse@codeaurora.org>
 <20201109222319.2630557-4-jcrouse@codeaurora.org>
In-Reply-To: <20201109222319.2630557-4-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Nov 2020 15:15:19 -0800
Message-ID: <CAF6AEGvUpjO5W=jYO3KjA-1RpzQTqUxvyABmF13CPEa-8_zTfg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/3] drm/msm: Improve the a6xx page fault handler
To: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Eric Anholt <eric@anholt.net>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
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

On Mon, Nov 9, 2020 at 2:23 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Use the new adreno-smmu-priv fault info function to get more SMMU
> debug registers and print the current TTBR0 to debug per-instance
> pagetables and figure out which GPU block generated the request.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 76 +++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_iommu.c       | 11 +++-
>  drivers/gpu/drm/msm/msm_mmu.h         |  4 +-
>  4 files changed, 87 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index d6804a802355..ed4cb81af874 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -933,7 +933,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>         return true;
>  }
>
> -static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>  {
>         struct msm_gpu *gpu = arg;
>         pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
> @@ -943,7 +943,7 @@ static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
>                         gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
>                         gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
>
> -       return -EFAULT;
> +       return 0;
>  }
>
>  static void a5xx_cp_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 948f3656c20c..ac6e8cd5cf1a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -905,18 +905,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
>         msm_gpu_hw_init(gpu);
>  }
>
> -static int a6xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
> +{
> +       static const char *uche_clients[7] = {
> +               "VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ",
> +       };
> +       u32 val;
> +
> +       if (mid < 1 || mid > 3)
> +               return "UNKNOWN";
> +
> +       /*
> +        * The source of the data depends on the mid ID read from FSYNR1.
> +        * and the client ID read from the UCHE block
> +        */
> +       val = gpu_read(gpu, REG_A6XX_UCHE_CLIENT_PF);
> +
> +       /* mid = 3 is most precise and refers to only one block per client */
> +       if (mid == 3)
> +               return uche_clients[val & 7];
> +
> +       /* For mid=2 the source is TP or VFD except when the client id is 0 */
> +       if (mid == 2)
> +               return ((val & 7) == 0) ? "TP" : "TP|VFD";
> +
> +       /* For mid=1 just return "UCHE" as a catchall for everything else */
> +       return "UCHE";
> +}
> +
> +static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
> +{
> +       if (id == 0)
> +               return "CP";
> +       else if (id == 4)
> +               return "CCU";
> +       else if (id == 6)
> +               return "CDP Prefetch";
> +
> +       return a6xx_uche_fault_block(gpu, id);
> +}
> +
> +#define ARM_SMMU_FSR_TF                 BIT(1)
> +#define ARM_SMMU_FSR_PF                        BIT(3)
> +#define ARM_SMMU_FSR_EF                        BIT(4)
> +
> +static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>  {
>         struct msm_gpu *gpu = arg;
> +       struct adreno_smmu_fault_info *info = data;
> +       const char *type = "UNKNOWN";
>
> -       pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
> +       /*
> +        * Print a default message if we couldn't get the data from the
> +        * adreno-smmu-priv
> +        */
> +       if (!info) {
> +               pr_warn_ratelimited("*** gpu fault: iova=%.16lx flags=%d (%u,%u,%u,%u)\n",
>                         iova, flags,
>                         gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
>                         gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
>                         gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
>                         gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
>
> -       return -EFAULT;
> +               return 0;
> +       }
> +
> +       if (info->fsr & ARM_SMMU_FSR_TF)
> +               type = "TRANSLATION";
> +       else if (info->fsr & ARM_SMMU_FSR_PF)
> +               type = "PERMISSION";
> +       else if (info->fsr & ARM_SMMU_FSR_EF)
> +               type = "EXTERNAL";
> +
> +       pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
> +                       info->ttbr0, iova,
> +                       flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
> +                       a6xx_fault_block(gpu, info->fsynr1 & 0xff),
> +                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
> +                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
> +                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
> +                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
> +
> +       return 0;
>  }
>
>  static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 22ac7c692a81..dc04575fc323 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -212,8 +212,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>                 unsigned long iova, int flags, void *arg)
>  {
>         struct msm_iommu *iommu = arg;
> +       struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
> +       struct adreno_smmu_fault_info info, *ptr = NULL;
> +
> +       if (adreno_smmu->cookie) {

I suppose, to better deal with whichever order drm vs iommu stuff is merged:

   if (adreno_smmu->get_fault_info) {
    ...
  }

I don't think there is a reason to have ->get_fault_info set but ->cookie unset

BR,
-R

> +               adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
> +               ptr = &info;
> +       }
> +
>         if (iommu->base.handler)
> -               return iommu->base.handler(iommu->base.arg, iova, flags);
> +               return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
> +
>         pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 61ade89d9e48..a88f44c3268d 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -26,7 +26,7 @@ enum msm_mmu_type {
>  struct msm_mmu {
>         const struct msm_mmu_funcs *funcs;
>         struct device *dev;
> -       int (*handler)(void *arg, unsigned long iova, int flags);
> +       int (*handler)(void *arg, unsigned long iova, int flags, void *data);
>         void *arg;
>         enum msm_mmu_type type;
>  };
> @@ -43,7 +43,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
>  struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
>
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> -               int (*handler)(void *arg, unsigned long iova, int flags))
> +               int (*handler)(void *arg, unsigned long iova, int flags, void *data))
>  {
>         mmu->arg = arg;
>         mmu->handler = handler;
> --
> 2.25.1
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
