Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B78A3E4CA9
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 21:06:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9990819ED;
	Mon,  9 Aug 2021 19:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZ41Z5Cpu72r; Mon,  9 Aug 2021 19:06:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DF6758183D;
	Mon,  9 Aug 2021 19:06:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA83DC001F;
	Mon,  9 Aug 2021 19:06:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA211C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 19:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA9E3401F6
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 19:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGBPeeZQfG3X for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 19:06:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BCBD401C4
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 19:06:00 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id j1so29518983pjv.3
 for <iommu@lists.linux-foundation.org>; Mon, 09 Aug 2021 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=caHh4K3GG0Tg0ei0p+fQ0LOeKdeT+FalwTqxBa+LBRE=;
 b=PLtOLsH9SDCeD60uPC/eAHmMv4J9tYqXrL0GGDcdYOWSwDcHfR0RHL0ZqR3uT9U3D9
 86bhjXtEtn0w/6QUL1B/VbOvdxiPp4vbcdm3Z7kIDrvpaPCCgmQr0dmW2oe+0+TVgJJS
 qt5fn98bOcSAAnbSJQJFCpngfP0zR2hTJh5mUk/l0J9W8qYExl2GnHKwcU7Lbfq9Qvs4
 4cb/sEs8k0g960J9eoqGvk4ecDtPaIVT9Ndj+Clld8hLpD8Wl1u/aEd79q3+aOUpAVpv
 S1Fgr0j1JzOItQJ4gnjxEiAL2Jis7FuPj1OP96QZnBVjxa4ETx6m4YCDBjoWpHVqOfV6
 FnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=caHh4K3GG0Tg0ei0p+fQ0LOeKdeT+FalwTqxBa+LBRE=;
 b=joOxvS/yzhk+OYoZdmzqVPElIu5kv08NY09nzxwP6FFdtq1tbsr7uXOb6kz2M3uR3u
 TuVFYQA6XdwIOmu3M37mJwkYAJd3dkQcA8Yms4mLGqgYsPKxYbFjkHPDhcfwWxLB+Bw/
 c6b2DGnefYclDjIeK3TSnh+osj0yG7MsdCdTMYZ0ymLfgDsB+N/jMJTNAf1RoPNqKDbq
 bKsSrJ/bpQyYTA/m7XZy6fvNk9UBeGmoQwrtkuJepBkkCeoQWwgUaJOBRm5fgQrRtnSU
 S0CyXUCaFHKwvT6A+KgjUHlrNZgXxY659+wVn8V3dH2Si/p8SSKA6uhYuBATutBMD3tQ
 YBKQ==
X-Gm-Message-State: AOAM5313C5wv2xe+Pci2pLyJXw+BXFrXvf0ZH+CEmTVVSU21iFw7U0Ea
 rpruj8PLrZt7EKKnFu66k0njlWF2JHSzviXhf8oODw==
X-Google-Smtp-Source: ABdhPJx+Udtd8mj0DtGSlKZTvrmyjG18QmaVRtyeRrpitO2gTq7zjK3NP0/NNGDwGognWiN7/ZARJfaM+lIVAcP5n30=
X-Received: by 2002:a63:4f43:: with SMTP id p3mr290889pgl.435.1628535959700;
 Mon, 09 Aug 2021 12:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628094600.git.robin.murphy@arm.com>
 <3b5284ee394f267ba966839173f874fc9a996bb2.1628094601.git.robin.murphy@arm.com>
In-Reply-To: <3b5284ee394f267ba966839173f874fc9a996bb2.1628094601.git.robin.murphy@arm.com>
Date: Mon, 9 Aug 2021 12:05:23 -0700
Message-ID: <CACK8Z6HSM678q=BZ3FY7spN2S3ZkhdJ3ecnMCbKWrqB5dNWaMA@mail.gmail.com>
Subject: Re: [PATCH v3 24/25] iommu/dma: Factor out flush queue init
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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
From: Rajat Jain via iommu <iommu@lists.linux-foundation.org>
Reply-To: Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Aug 4, 2021 at 10:16 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Factor out flush queue setup from the initial domain init so that we
> can potentially trigger it from sysfs later on in a domain's lifetime.
>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: John Garry <john.garry@huawei.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/dma-iommu.c | 30 ++++++++++++++++++++----------
>  include/linux/dma-iommu.h |  9 ++++++---
>  2 files changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 2e19505dddf9..f51b8dc99ac6 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -310,6 +310,25 @@ static bool dev_is_untrusted(struct device *dev)
>         return dev_is_pci(dev) && to_pci_dev(dev)->untrusted;
>  }
>
> +int iommu_dma_init_fq(struct iommu_domain *domain)
> +{
> +       struct iommu_dma_cookie *cookie = domain->iova_cookie;
> +
> +       if (domain->type != IOMMU_DOMAIN_DMA_FQ)
> +               return -EINVAL;
> +       if (cookie->fq_domain)
> +               return 0;
> +
> +       if (init_iova_flush_queue(&cookie->iovad, iommu_dma_flush_iotlb_all,
> +                                 iommu_dma_entry_dtor)) {
> +               pr_warn("iova flush queue initialization failed\n");
> +               domain->type = IOMMU_DOMAIN_DMA;
> +               return -ENODEV;
> +       }
> +       cookie->fq_domain = domain;
> +       return 0;
> +}
> +
>  /**
>   * iommu_dma_init_domain - Initialise a DMA mapping domain
>   * @domain: IOMMU domain previously prepared by iommu_get_dma_cookie()
> @@ -362,16 +381,7 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>         }
>
>         init_iova_domain(iovad, 1UL << order, base_pfn);
> -
> -       if (domain->type == IOMMU_DOMAIN_DMA_FQ && !cookie->fq_domain) {
> -               if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
> -                                         iommu_dma_entry_dtor)) {
> -                       pr_warn("iova flush queue initialization failed\n");
> -                       domain->type = IOMMU_DOMAIN_DMA;
> -               } else {
> -                       cookie->fq_domain = domain;
> -               }
> -       }
> +       iommu_dma_init_fq(domain);
>
>         return iova_reserve_iommu_regions(dev, domain);
>  }
> diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
> index 758ca4694257..81ab647f1618 100644
> --- a/include/linux/dma-iommu.h
> +++ b/include/linux/dma-iommu.h
> @@ -20,6 +20,7 @@ void iommu_put_dma_cookie(struct iommu_domain *domain);
>
>  /* Setup call for arch DMA mapping code */
>  void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit);
> +int iommu_dma_init_fq(struct iommu_domain *domain);
>
>  /* The DMA API isn't _quite_ the whole story, though... */
>  /*
> @@ -37,9 +38,6 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc,
>
>  void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
>
> -void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
> -               struct iommu_domain *domain);
> -

This looks like an unrelated code cleanup. Should this be a separate patch?

Thanks,

Rajat


>  extern bool iommu_dma_forcedac;
>
>  #else /* CONFIG_IOMMU_DMA */
> @@ -54,6 +52,11 @@ static inline void iommu_setup_dma_ops(struct device *dev, u64 dma_base,
>  {
>  }
>
> +static inline int iommu_dma_init_fq(struct iommu_domain *domain)
> +{
> +       return -EINVAL;
> +}
> +
>  static inline int iommu_get_dma_cookie(struct iommu_domain *domain)
>  {
>         return -ENODEV;
> --
> 2.25.1
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
