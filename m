Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A5216F00
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 16:40:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AE10624E91;
	Tue,  7 Jul 2020 14:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3F4ElQGLqb-u; Tue,  7 Jul 2020 14:40:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E3D5F24C8E;
	Tue,  7 Jul 2020 14:40:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C798CC016F;
	Tue,  7 Jul 2020 14:40:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFC96C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 14:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DBD1589A36
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 14:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAlKjTm0R5hw for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 14:40:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C04389A35
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 14:40:38 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id dr13so46805511ejc.3
 for <iommu@lists.linux-foundation.org>; Tue, 07 Jul 2020 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imLJnUQOJLoud+X7JV4k0nFtK3qoTW9M9kMrdG4xwTI=;
 b=aHH0P+bkfOnOzmnmods4GdjdWlAjXL7NcHWSCIqPEJ6IWdWVXm1RZ5DAu5od43MBuv
 lNEyRXTr/weOku3SuK8GWB9ayOF6WaJC5XgfdIIx/NtPLcPxnnHIm34UcoVKoJ4JOHSZ
 +wjMmO5QbULEYZ6Of6wfTJ/SWJcNLzbJZtXuzBVUpfN7k9/oRHxHkbmmRKz28aFq1Xbk
 pCQlUyJ/DJLHGMmOEhtJKPHzMX/WXHpOX+8aIUcw7lt21mHYXLazoPlZmnA8jSUPVTFB
 v7djJwHETW0fksU8Rk3rVZT5ZKco2icXkSYSM2sjR4Uu/3eyenhg2RKXKao2ZgzUWMjO
 0seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imLJnUQOJLoud+X7JV4k0nFtK3qoTW9M9kMrdG4xwTI=;
 b=IkxrWV57JeJ+dDpI8Xog63Q3LebnI8l52Kz5X3w8LV0hiCo3S5r+tgIYBeSXw29iVE
 +HIZa5nAApv0V9jMXEohahVfy6GWrrT+EQGyzipeCvTcCjxG0+BFoYfsS56xmzjToMXf
 uYMZ4PXNQz1lC4SL7gtKq1xL7+z5oe7Y310gB+ScVp+vc+GcklODRodwv+cbyFglws21
 7NxMSoSHHxIFjLPdbYL4e08wd8XUupkpcnpssg8fd7LFnfI2LKyrUexyZtyiFBqmNN0y
 8FM2O/ZK57xu0RMNgAmNRnqNkzd8Rr8wUex/PYCQT3hwAMjPS9TvH3j4Y675JgVof+E9
 v4TA==
X-Gm-Message-State: AOAM533LEVuFGab8dC7hOmnMkhT0Cjeeklbgw32Dco4g4vjoTbSfPQsy
 /3y3NnTu6sytFsRzSpjQivq9Ca1WTZpTPa5yQDc=
X-Google-Smtp-Source: ABdhPJzD51acCpJc3O7M5S0uOgbu1Fmh7nqzUxLrTPB/+ZiC2H6qvnvDbadVTKPnPXeuu7l5PQGEaVebbvPOsMW3ja8=
X-Received: by 2002:a17:906:1187:: with SMTP id
 n7mr42036538eja.161.1594132836884; 
 Tue, 07 Jul 2020 07:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-5-jcrouse@codeaurora.org>
 <3feed674-5eb9-ca2f-76a7-f888f431c409@arm.com>
In-Reply-To: <3feed674-5eb9-ca2f-76a7-f888f431c409@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jul 2020 07:41:08 -0700
Message-ID: <CAF6AEGsB7KN-y9QiX1DtNYBeBv3UgUXu6ReSpMY8hMx_8LXwaw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 4/6] drm/msm: Add support to create a local
 pagetable
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>
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

On Tue, Jul 7, 2020 at 4:36 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-06-26 21:04, Jordan Crouse wrote:
> > Add support to create a io-pgtable for use by targets that support
> > per-instance pagetables.  In order to support per-instance pagetables the
> > GPU SMMU device needs to have the qcom,adreno-smmu compatible string and
> > split pagetables and auxiliary domains need to be supported and enabled.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >   drivers/gpu/drm/msm/msm_gpummu.c |   2 +-
> >   drivers/gpu/drm/msm/msm_iommu.c  | 180 ++++++++++++++++++++++++++++++-
> >   drivers/gpu/drm/msm/msm_mmu.h    |  16 ++-
> >   3 files changed, 195 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> > index 310a31b05faa..aab121f4beb7 100644
> > --- a/drivers/gpu/drm/msm/msm_gpummu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> > @@ -102,7 +102,7 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
> >       }
> >
> >       gpummu->gpu = gpu;
> > -     msm_mmu_init(&gpummu->base, dev, &funcs);
> > +     msm_mmu_init(&gpummu->base, dev, &funcs, MSM_MMU_GPUMMU);
> >
> >       return &gpummu->base;
> >   }
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 1b6635504069..f455c597f76d 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -4,15 +4,192 @@
> >    * Author: Rob Clark <robdclark@gmail.com>
> >    */
> >
> > +#include <linux/io-pgtable.h>
> >   #include "msm_drv.h"
> >   #include "msm_mmu.h"
> >
> >   struct msm_iommu {
> >       struct msm_mmu base;
> >       struct iommu_domain *domain;
> > +     struct iommu_domain *aux_domain;
> >   };
> > +
> >   #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
> >
> > +struct msm_iommu_pagetable {
> > +     struct msm_mmu base;
> > +     struct msm_mmu *parent;
> > +     struct io_pgtable_ops *pgtbl_ops;
> > +     phys_addr_t ttbr;
> > +     u32 asid;
> > +};
> > +
> > +static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
> > +{
> > +     return container_of(mmu, struct msm_iommu_pagetable, base);
> > +}
> > +
> > +static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
> > +             size_t size)
> > +{
> > +     struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> > +     struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> > +     size_t unmapped = 0;
> > +
> > +     /* Unmap the block one page at a time */
> > +     while (size) {
> > +             unmapped += ops->unmap(ops, iova, 4096, NULL);
> > +             iova += 4096;
> > +             size -= 4096;
> > +     }
> > +
> > +     iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> > +
> > +     return (unmapped == size) ? 0 : -EINVAL;
> > +}
>
> Remember in patch #1 when you said "Then 'domain' can be used like any
> other iommu domain to map and unmap iova addresses in the pagetable."?
>
> This appears to be very much not that :/
>

I guess that comment is a bit stale.. the original plan was to create
an iommu_domain per set of pgtables, but at some point we realized
that by using the io-pgtable helpers directly, we would inflict a lot
less GPU-crazy on the iommu drivers

BR,
-R

> Robin.
>
> > +
> > +static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> > +             struct sg_table *sgt, size_t len, int prot)
> > +{
> > +     struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> > +     struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> > +     struct scatterlist *sg;
> > +     size_t mapped = 0;
> > +     u64 addr = iova;
> > +     unsigned int i;
> > +
> > +     for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> > +             size_t size = sg->length;
> > +             phys_addr_t phys = sg_phys(sg);
> > +
> > +             /* Map the block one page at a time */
> > +             while (size) {
> > +                     if (ops->map(ops, addr, phys, 4096, prot)) {
> > +                             msm_iommu_pagetable_unmap(mmu, iova, mapped);
> > +                             return -EINVAL;
> > +                     }
> > +
> > +                     phys += 4096;
> > +                     addr += 4096;
> > +                     size -= 4096;
> > +                     mapped += 4096;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
> > +{
> > +     struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> > +
> > +     free_io_pgtable_ops(pagetable->pgtbl_ops);
> > +     kfree(pagetable);
> > +}
> > +
> > +/*
> > + * Given a parent device, create and return an aux domain. This will enable the
> > + * TTBR0 region
> > + */
> > +static struct iommu_domain *msm_iommu_get_aux_domain(struct msm_mmu *parent)
> > +{
> > +     struct msm_iommu *iommu = to_msm_iommu(parent);
> > +     struct iommu_domain *domain;
> > +     int ret;
> > +
> > +     if (iommu->aux_domain)
> > +             return iommu->aux_domain;
> > +
> > +     if (!iommu_dev_has_feature(parent->dev, IOMMU_DEV_FEAT_AUX))
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     domain = iommu_domain_alloc(&platform_bus_type);
> > +     if (!domain)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     ret = iommu_aux_attach_device(domain, parent->dev);
> > +     if (ret) {
> > +             iommu_domain_free(domain);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     iommu->aux_domain = domain;
> > +     return domain;
> > +}
> > +
> > +int msm_iommu_pagetable_params(struct msm_mmu *mmu,
> > +             phys_addr_t *ttbr, int *asid)
> > +{
> > +     struct msm_iommu_pagetable *pagetable;
> > +
> > +     if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
> > +             return -EINVAL;
> > +
> > +     pagetable = to_pagetable(mmu);
> > +
> > +     if (ttbr)
> > +             *ttbr = pagetable->ttbr;
> > +
> > +     if (asid)
> > +             *asid = pagetable->asid;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct msm_mmu_funcs pagetable_funcs = {
> > +             .map = msm_iommu_pagetable_map,
> > +             .unmap = msm_iommu_pagetable_unmap,
> > +             .destroy = msm_iommu_pagetable_destroy,
> > +};
> > +
> > +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
> > +{
> > +     static int next_asid = 16;
> > +     struct msm_iommu_pagetable *pagetable;
> > +     struct iommu_domain *aux_domain;
> > +     struct io_pgtable_cfg cfg;
> > +     int ret;
> > +
> > +     /* Make sure that the parent has a aux domain attached */
> > +     aux_domain = msm_iommu_get_aux_domain(parent);
> > +     if (IS_ERR(aux_domain))
> > +             return ERR_CAST(aux_domain);
> > +
> > +     /* Get the pagetable configuration from the aux domain */
> > +     ret = iommu_domain_get_attr(aux_domain, DOMAIN_ATTR_PGTABLE_CFG, &cfg);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
> > +     if (!pagetable)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
> > +             MSM_MMU_IOMMU_PAGETABLE);
> > +
> > +     cfg.tlb = NULL;
> > +
> > +     pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
> > +             &cfg, aux_domain);
> > +
> > +     if (!pagetable->pgtbl_ops) {
> > +             kfree(pagetable);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +
> > +     /* Needed later for TLB flush */
> > +     pagetable->parent = parent;
> > +     pagetable->ttbr = cfg.arm_lpae_s1_cfg.ttbr;
> > +
> > +     pagetable->asid = next_asid;
> > +     next_asid = (next_asid + 1)  % 255;
> > +     if (next_asid < 16)
> > +             next_asid = 16;
> > +
> > +     return &pagetable->base;
> > +}
> > +
> >   static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> >               unsigned long iova, int flags, void *arg)
> >   {
> > @@ -40,6 +217,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
> >       if (iova & BIT_ULL(48))
> >               iova |= GENMASK_ULL(63, 49);
> >
> > +
> >       ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
> >       WARN_ON(!ret);
> >
> > @@ -85,7 +263,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
> >               return ERR_PTR(-ENOMEM);
> >
> >       iommu->domain = domain;
> > -     msm_mmu_init(&iommu->base, dev, &funcs);
> > +     msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
> >       iommu_set_fault_handler(domain, msm_fault_handler, iommu);
> >
> >       ret = iommu_attach_device(iommu->domain, dev);
> > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> > index 3a534ee59bf6..61ade89d9e48 100644
> > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > @@ -17,18 +17,26 @@ struct msm_mmu_funcs {
> >       void (*destroy)(struct msm_mmu *mmu);
> >   };
> >
> > +enum msm_mmu_type {
> > +     MSM_MMU_GPUMMU,
> > +     MSM_MMU_IOMMU,
> > +     MSM_MMU_IOMMU_PAGETABLE,
> > +};
> > +
> >   struct msm_mmu {
> >       const struct msm_mmu_funcs *funcs;
> >       struct device *dev;
> >       int (*handler)(void *arg, unsigned long iova, int flags);
> >       void *arg;
> > +     enum msm_mmu_type type;
> >   };
> >
> >   static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
> > -             const struct msm_mmu_funcs *funcs)
> > +             const struct msm_mmu_funcs *funcs, enum msm_mmu_type type)
> >   {
> >       mmu->dev = dev;
> >       mmu->funcs = funcs;
> > +     mmu->type = type;
> >   }
> >
> >   struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
> > @@ -41,7 +49,13 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> >       mmu->handler = handler;
> >   }
> >
> > +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> > +
> >   void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
> >               dma_addr_t *tran_error);
> >
> > +
> > +int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> > +             int *asid);
> > +
> >   #endif /* __MSM_MMU_H__ */
> >
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
