Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 388621DDA7C
	for <lists.iommu@lfdr.de>; Fri, 22 May 2020 00:47:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E4F08893ED;
	Thu, 21 May 2020 22:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oa+XVK7BJpsY; Thu, 21 May 2020 22:47:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 235C7893FA;
	Thu, 21 May 2020 22:47:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14F0DC0176;
	Thu, 21 May 2020 22:47:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB913C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 22:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A966B893FA
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 22:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIHEK+QaJpZv for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 22:47:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCF32893ED
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 22:47:31 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78790207D8
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 22:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590101251;
 bh=pJDrBrHsn0aoHb+92XvQ+JRb285FS90rYU9wwQF6w1E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=neYhPbGrZrQAZ3u5z01iEsEXxnDlPfrZZl9nuDK34BIMd7ft50/f4VfkaqlEzPDpK
 2Idg115oRhA0+sxbfZ5pTxP51PHoeE+Poecsy+XrpQohjVun8uhCJe7o6qvO3Gigtp
 2Db3aCCY14NyVyZlbOkX2+7A59YWWNG6NC3igBww=
Received: by mail-ot1-f41.google.com with SMTP id 69so6865920otv.2
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 15:47:31 -0700 (PDT)
X-Gm-Message-State: AOAM530QWdIeTwbw+yw+AfA33nR9JqV34USVYh0Jjez81aLjvpOWhGiZ
 GygrY5Tar0Q787CnUnJcwGlkVHOG/R2O0PJNzA==
X-Google-Smtp-Source: ABdhPJwSEzqj/VK1u9Gw13Fm46tFV4U9CHwMaWoNmbRr1ndGt9yuz27+8oVBtPgb4KdDh4RCFHDwUkfRxTOBwL2IZM0=
X-Received: by 2002:a9d:51ca:: with SMTP id d10mr2977821oth.129.1590101250769; 
 Thu, 21 May 2020 15:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
 <20200521130008.8266-7-lorenzo.pieralisi@arm.com>
In-Reply-To: <20200521130008.8266-7-lorenzo.pieralisi@arm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 21 May 2020 16:47:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK5aiEMAZpqgTmrOq=HPRSFEoQWJrpR2YA0hziEtLMwrg@mail.gmail.com>
Message-ID: <CAL_JsqK5aiEMAZpqgTmrOq=HPRSFEoQWJrpR2YA0hziEtLMwrg@mail.gmail.com>
Subject: Re: [PATCH 06/12] of/iommu: Make of_map_rid() PCI agnostic
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Marc Zyngier <maz@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Makarand Pawagi <makarand.pawagi@nxp.com>, linux-acpi@vger.kernel.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Thu, May 21, 2020 at 7:00 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> There is nothing PCI specific (other than the RID - requester ID)
> in the of_map_rid() implementation, so the same function can be
> reused for input/output IDs mapping for other busses just as well.
>
> Rename the RID instances/names to a generic "id" tag and provide
> an of_map_rid() wrapper function so that we can leave the existing
> (and legitimate) callers unchanged.

It's not all that clear to a casual observer that RID is a PCI thing,
so I don't know that keeping it buys much. And there's only 3 callers.

> No functionality change intended.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/iommu/of_iommu.c |  2 +-
>  drivers/of/base.c        | 42 ++++++++++++++++++++--------------------
>  include/linux/of.h       | 17 +++++++++++++++-
>  3 files changed, 38 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 20738aacac89..ad96b87137d6 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -145,7 +145,7 @@ static int of_fsl_mc_iommu_init(struct fsl_mc_device *mc_dev,
>         struct of_phandle_args iommu_spec = { .args_count = 1 };
>         int err;
>
> -       err = of_map_rid(master_np, mc_dev->icid, "iommu-map",
> +       err = of_map_id(master_np, mc_dev->icid, "iommu-map",

I'm not sure this is an improvement because I'd refactor this function
and of_pci_iommu_init() into a single function:

of_bus_iommu_init(struct device *dev, struct device_node *np, u32 id)

Then of_pci_iommu_init() becomes:

of_pci_iommu_init()
{
  return of_bus_iommu_init(info->dev, info->np, alias);
}

And replace of_fsl_mc_iommu_init call with:
err = of_bus_iommu_init(dev, master_np, to_fsl_mc_device(dev)->icid);

>                          "iommu-map-mask", &iommu_spec.np,
>                          iommu_spec.args);
>         if (err)
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ae03b1218b06..e000e17bd602 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2201,15 +2201,15 @@ int of_find_last_cache_level(unsigned int cpu)
>  }
>
>  /**
> - * of_map_rid - Translate a requester ID through a downstream mapping.
> + * of_map_id - Translate a requester ID through a downstream mapping.

Still a requester ID?

>   * @np: root complex device node.
> - * @rid: device requester ID to map.
> + * @id: device ID to map.
>   * @map_name: property name of the map to use.
>   * @map_mask_name: optional property name of the mask to use.
>   * @target: optional pointer to a target device node.
>   * @id_out: optional pointer to receive the translated ID.
>   *
> - * Given a device requester ID, look up the appropriate implementation-defined
> + * Given a device ID, look up the appropriate implementation-defined
>   * platform ID and/or the target device which receives transactions on that
>   * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
>   * @id_out may be NULL if only the other is required. If @target points to
> @@ -2219,11 +2219,11 @@ int of_find_last_cache_level(unsigned int cpu)
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
> -int of_map_rid(struct device_node *np, u32 rid,
> +int of_map_id(struct device_node *np, u32 id,
>                const char *map_name, const char *map_mask_name,
>                struct device_node **target, u32 *id_out)
>  {
> -       u32 map_mask, masked_rid;
> +       u32 map_mask, masked_id;
>         int map_len;
>         const __be32 *map = NULL;
>
> @@ -2235,7 +2235,7 @@ int of_map_rid(struct device_node *np, u32 rid,
>                 if (target)
>                         return -ENODEV;
>                 /* Otherwise, no map implies no translation */
> -               *id_out = rid;
> +               *id_out = id;
>                 return 0;
>         }
>
> @@ -2255,22 +2255,22 @@ int of_map_rid(struct device_node *np, u32 rid,
>         if (map_mask_name)
>                 of_property_read_u32(np, map_mask_name, &map_mask);
>
> -       masked_rid = map_mask & rid;
> +       masked_id = map_mask & id;
>         for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
>                 struct device_node *phandle_node;
> -               u32 rid_base = be32_to_cpup(map + 0);
> +               u32 id_base = be32_to_cpup(map + 0);
>                 u32 phandle = be32_to_cpup(map + 1);
>                 u32 out_base = be32_to_cpup(map + 2);
> -               u32 rid_len = be32_to_cpup(map + 3);
> +               u32 id_len = be32_to_cpup(map + 3);
>
> -               if (rid_base & ~map_mask) {
> -                       pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores rid-base (0x%x)\n",
> +               if (id_base & ~map_mask) {
> +                       pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
>                                 np, map_name, map_name,
> -                               map_mask, rid_base);
> +                               map_mask, id_base);
>                         return -EFAULT;
>                 }
>
> -               if (masked_rid < rid_base || masked_rid >= rid_base + rid_len)
> +               if (masked_id < id_base || masked_id >= id_base + id_len)
>                         continue;
>
>                 phandle_node = of_find_node_by_phandle(phandle);
> @@ -2288,20 +2288,20 @@ int of_map_rid(struct device_node *np, u32 rid,
>                 }
>
>                 if (id_out)
> -                       *id_out = masked_rid - rid_base + out_base;
> +                       *id_out = masked_id - id_base + out_base;
>
> -               pr_debug("%pOF: %s, using mask %08x, rid-base: %08x, out-base: %08x, length: %08x, rid: %08x -> %08x\n",
> -                       np, map_name, map_mask, rid_base, out_base,
> -                       rid_len, rid, masked_rid - rid_base + out_base);
> +               pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> +                       np, map_name, map_mask, id_base, out_base,
> +                       id_len, id, masked_id - id_base + out_base);
>                 return 0;
>         }
>
> -       pr_info("%pOF: no %s translation for rid 0x%x on %pOF\n", np, map_name,
> -               rid, target && *target ? *target : NULL);
> +       pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
> +               id, target && *target ? *target : NULL);
>
>         /* Bypasses translation */
>         if (id_out)
> -               *id_out = rid;
> +               *id_out = id;
>         return 0;
>  }
> -EXPORT_SYMBOL_GPL(of_map_rid);
> +EXPORT_SYMBOL_GPL(of_map_id);
> diff --git a/include/linux/of.h b/include/linux/of.h
> index c669c0a4732f..b7934566a1aa 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -554,10 +554,18 @@ bool of_console_check(struct device_node *dn, char *name, int index);
>
>  extern int of_cpu_node_to_id(struct device_node *np);
>
> -int of_map_rid(struct device_node *np, u32 rid,
> +int of_map_id(struct device_node *np, u32 id,
>                const char *map_name, const char *map_mask_name,
>                struct device_node **target, u32 *id_out);
>
> +static inline int of_map_rid(struct device_node *np, u32 rid,
> +                            const char *map_name,
> +                            const char *map_mask_name,
> +                            struct device_node **target, u32 *id_out)
> +{
> +       return of_map_id(np, rid, map_name, map_mask_name, target, id_out);
> +}
> +
>  #else /* CONFIG_OF */
>
>  static inline void of_core_init(void)
> @@ -978,6 +986,13 @@ static inline int of_cpu_node_to_id(struct device_node *np)
>         return -ENODEV;
>  }
>
> +static inline int of_map_id(struct device_node *np, u32 id,
> +                            const char *map_name, const char *map_mask_name,
> +                            struct device_node **target, u32 *id_out)
> +{
> +       return -EINVAL;
> +}
> +
>  static inline int of_map_rid(struct device_node *np, u32 rid,
>                              const char *map_name, const char *map_mask_name,
>                              struct device_node **target, u32 *id_out)
> --
> 2.26.1
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
