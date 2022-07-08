Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC556CD7A
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 958E041895;
	Sun, 10 Jul 2022 06:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 958E041895
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PyBdwpT1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yG_Q_JuGCen2; Sun, 10 Jul 2022 06:37:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E403340510;
	Sun, 10 Jul 2022 06:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E403340510
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E50BC0098;
	Sun, 10 Jul 2022 06:37:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10C83C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 18:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEA1B60ABB
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 18:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA1B60ABB
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=PyBdwpT1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZLyEYjjurzV for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 18:13:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FDA360ADE
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FDA360ADE
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 18:13:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id y18so15958632ljj.6
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jul 2022 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxakuRjObUCkye3AQ22V76C+V/wXWgeyU417sI5Erhk=;
 b=PyBdwpT1kw0OeeUw6KnFZnNBkmCt38SG1b76RSoRpK1WOdDZj894b0A0jFL7O5PKx+
 pUHfiV99aQJAcxfxTWtJLs5RXrnjz/xPTcGUsVVpqmdleDtM/GZOu0hn35XCT2PY3ipq
 SaE+FYpbHu24g1jgO23mGYgMKYAD2EBwkoaC1zx4VlSQ2YC+fT7rEGvvkuueN10p/b4g
 U3lPgzcYW7/HcxfRrz/6DAR1DKMU8Ki7pHUaUWqvexJ5WzcrKNGX3EcigmIZNLEDcLX/
 1WbECeQ03q2bCSJdvufKe2C+923wmsFO+0xpjv0d49bF3ePzdeZkKoVCb8jAa+7+Sxgp
 L7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxakuRjObUCkye3AQ22V76C+V/wXWgeyU417sI5Erhk=;
 b=ZY9OJYiJJ+oKg91VIgO6ABcGpksM8ryKcFAktYDrXHhGldLBekQ5EkDh9D/zamnZAi
 E0Na3bQgfRB6tf+eEGjnUU4NgUXEPyoPWvdp4mVriByjwVkRat+KyqiRF4pXKkAo0q2G
 fUvxS0XrSpMNx8tPTXrquEx9rSR8IBfdbgq9cDy31Mn9PhwdcTVErFZtZ1gxMS7yyZFF
 Ff1dSRb4fsTP3Ob5sEmKBx353zEZGgRpl+93XslpRCWDsXdk/1L3wtYuo9lIKoSJPsmq
 H2u/qIFwDbzdVfAxRSBW/CRQVaR9vmYcCHEbKHA5chxrH0KX37rql5BwXi4viEIwklZb
 lz/Q==
X-Gm-Message-State: AJIora9B3qHVla/H1qn6CmzDmgrFp8cdxhATUPB1H5Dz11l7HL10srWb
 mgK6joPJEa8jPjRwWuYuqwRRdqewgUAL+we7xTGGkw==
X-Google-Smtp-Source: AGRyM1s4khtAdDPD9uAtpQbZOOwGGF2BRshqhouC45A+O1rPRIXlXk8YUZSNdivuO908GgYbfwpcIOkx4P2VtlZmLr8=
X-Received: by 2002:a2e:bd11:0:b0:25d:4f94:ac79 with SMTP id
 n17-20020a2ebd11000000b0025d4f94ac79mr2689388ljq.4.1657303997519; Fri, 08 Jul
 2022 11:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
 <20220702213724.3949-4-semen.protsenko@linaro.org>
 <925751c3-83e8-02b8-6a8b-549290522a9e@linaro.org>
In-Reply-To: <925751c3-83e8-02b8-6a8b-549290522a9e@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 8 Jul 2022 21:13:06 +0300
Message-ID: <CAPLW+4kc86aOVspBz52vt+uhs8GXDNfekd-7jKhyNjUpi8XwLQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] iommu/exynos: Use lookup based approach to access v7
 registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Janghyuck Kim <janghyuck.kim@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Will Deacon <will@kernel.org>,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Cho KyongHo <pullip.cho@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Sun, 3 Jul 2022 at 22:29, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/07/2022 23:37, Sam Protsenko wrote:
> > SysMMU v7 might have different register layouts (VM capable or non-VM
> > capable). Check which layout is implemented in current SysMMU module and
> > prepare the corresponding register table for futher usage. This way is
> > faster and more elegant than checking corresponding condition (if it's
> > VM or non-VM SysMMU) each time before accessing v7 registers. For now
> > the register table contains only most basic registers needed to add the
> > SysMMU v7 support.
> >
> > This patch is based on downstream work of next authors:
> >   - Janghyuck Kim <janghyuck.kim@samsung.com>
> >   - Daniel Mentz <danielmentz@google.com>
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/iommu/exynos-iommu.c | 46 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> > index df6ddbebbe2b..47017e8945c5 100644
> > --- a/drivers/iommu/exynos-iommu.c
> > +++ b/drivers/iommu/exynos-iommu.c
> > @@ -180,6 +180,47 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
> >
> >  #define has_sysmmu(dev)              (dev_iommu_priv_get(dev) != NULL)
> >
> > +#define MMU_REG(data, idx)           \
> > +     ((data)->sfrbase + (data)->regs[idx].off)
>
> I would expect to see users of this - convert all existing regs.
>

I was thinking about doing that as a consequent patch (adding SysMMU
v1/v5 register sets). But ok, will add in v2. And will probably split
it per 2 patches:
  1. Rework existing driver to use register sets (lookup table). To
keep it as "no functional change" patch.
  2. Add SysMMU v7 support.

Also, I will probably replace MMU_REG() with more standard approach,
i.e. will add sysmmu_read() / sysmmu_write() functions instead. It
should make the code tidier.

> > +#define MMU_VM_REG(data, idx, vmid)  \
> > +     (MMU_REG(data, idx) + (vmid) * (data)->regs[idx].mult)
> > +
> > +enum {
> > +     REG_SET_NON_VM,
> > +     REG_SET_VM,
> > +     MAX_REG_SET
> > +};
> > +
> > +enum {
> > +     IDX_CTRL_VM,
> > +     IDX_CFG_VM,
> > +     IDX_FLPT_BASE,
>
> Isn't this called REG_MMU_FLUSH? If yes, it's a bit confusing to see
> different name used.
>

I used v7 registers naming, as I only added support for v7 register
set in this patch series. As I said above, I'll add SysMMU v1/v5
register sets in v2, and rename those indexes to have old register
names. Despite the differences between register names in SysMMU v1/v5
and v7, their purpose is the same.

> > +     IDX_ALL_INV,
>
> Isn't this called REG_MMU_FLUSH_ENTRY?
>
> > +     MAX_REG_IDX
> > +};
> > +
> > +struct sysmmu_vm_reg {
> > +     unsigned int off;       /* register offset */
> > +     unsigned int mult;      /* VM index offset multiplier */
> > +};
> > +
> > +static const struct sysmmu_vm_reg sysmmu_regs[MAX_REG_SET][MAX_REG_IDX] = {
> > +     /* Default register set (non-VM) */
> > +     {
> > +             /*
> > +              * SysMMUs without VM support do not have CTRL_VM and CFG_VM
> > +              * registers. Setting the offsets to 1 will trigger an unaligned
> > +              * access exception.
>
> So why are you setting offset 1? To trigger unaligned access?
>

Yes, as comment suggests, 0x1 offset is set intentionally to cause the
exception. That might be useful for debugging (if driver is trying to
access some non-existing register on some particular SysMMU version).
I'll improve the comment in v2.

> > +              */
> > +             {0x1}, {0x1}, {0x000c}, {0x0010},
> > +     },
> > +     /* VM capable register set */
> > +     {
> > +             {0x8000, 0x1000}, {0x8004, 0x1000}, {0x800c, 0x1000},
> > +             {0x8010, 0x1000},
> > +     },
> You add here quite a bit of dead code and some hard-coded numbers.
>

Ok, will remove those multiplier bits for now. It can be added later,
when implementing domains support (to use VM registers other than n=0
instance).

> > +};
> > +
> >  static struct device *dma_dev;
> >  static struct kmem_cache *lv2table_kmem_cache;
> >  static sysmmu_pte_t *zero_lv2_table;
> > @@ -284,6 +325,7 @@ struct sysmmu_drvdata {
> >
> >       /* v7 fields */
> >       bool has_vcr;                   /* virtual machine control register */
> > +     const struct sysmmu_vm_reg *regs; /* register set */
> >  };
> >
> >  static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
> > @@ -407,6 +449,10 @@ static void sysmmu_get_hw_info(struct sysmmu_drvdata *data)
> >       __sysmmu_get_version(data);
> >       if (MMU_MAJ_VER(data->version) >= 7 && __sysmmu_has_capa1(data))
> >               __sysmmu_get_vcr(data);
> > +     if (data->has_vcr)
> > +             data->regs = sysmmu_regs[REG_SET_VM];
> > +     else
> > +             data->regs = sysmmu_regs[REG_SET_NON_VM];
>
> This is set and not read.
>

It's used in patch 4/4. But as discussed above, I will convert
existing code (SysMMU v1/v3/v5) to benefit from register set as well.
Will send in v2.

Thanks for the review!

> >
> >       __sysmmu_disable_clocks(data);
> >  }
>
>
> Best regards,
> Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
