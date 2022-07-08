Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992956CD6D
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D90C3813CB;
	Sun, 10 Jul 2022 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D90C3813CB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jGg0DF6X
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVoUm-SJzprq; Sun, 10 Jul 2022 06:37:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7F2D781420;
	Sun, 10 Jul 2022 06:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2D781420
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36BBDC0098;
	Sun, 10 Jul 2022 06:37:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0134BC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C17544014C
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C17544014C
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=jGg0DF6X
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2xn8Hw2OQWY for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 13:35:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8020400EC
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8020400EC
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:35:08 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z25so18810066lfr.2
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jul 2022 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PIWMjj4b5YbA95iQKtLRWWzbbV2WS/utZy9nG1S7rpA=;
 b=jGg0DF6XDZu/DPxb4/js0k+9Dbdm6f6hrv6vVO5pdHWA74MuuN8N3Xe4B+oAIJUAv7
 inAZnIcz9sFe0BtDSjlkO/wp4Zyd4yileMZxGEhL4Hugx3fR8Ae6VekUgdLLDSmbtE7R
 T25L2oU8lTfflMIFl7gyWYVwg7u7qiFnadrOyzMyUfZlpJkZ6lyXPbfohAHMDwO3Raqj
 gJrMC8He4ayv5iQ1PPbWE1UD7mN2xrYmvN+8tsjIA+6srCeE7SmzcuX9DEEhfksPsoDq
 X5qm8XOQSlOnLY3g1T2/XjZzuiPBH6fLttzYtrILVeE06q0p4ZTocoOj3aGwQQrWXEVi
 /tDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIWMjj4b5YbA95iQKtLRWWzbbV2WS/utZy9nG1S7rpA=;
 b=hxu1E/XLzRX8yK1eWX7FB5PWVNI1bZMfrQHuCKgev9YG7HMOrJ6vc/8ydPIEjzD58F
 kI91/lV9FZx46j0aRy6Uu2MgoTEb6Az3tNrhbdcqWdI/6Rz0Thx0gVI8/b3bJokMrA21
 UBaHENCX9I3kunlW+dRfI6ALZ6nmezRlalQZLD7qpUMZ71YrZGM7HNRs92Ot3yOJh48w
 aB6rNe7sfeJgqv2BdnLigZjGqwC+Ex2c9T3aCfutfIIVHEksTd4lqGG1UWHum8H5zNkS
 UgZ308fDYA7Mqy/vIISsWbOlt57WjnHVisJsHymAygLPHNeNLLT7WQktB7i8x5AEfYXC
 FERA==
X-Gm-Message-State: AJIora/qD5NO83a+xlLqt+LSzwZXF/enAtVl571dXi5Upzj3xGeB1n3Z
 rZGrVCHIA9NpRX1SnjqWwsqEJMFEcbm0os5m2vOAVA==
X-Google-Smtp-Source: AGRyM1u09XqLCsj6MLE9uVUKKS4KmeeYTF4xX23pX9GlNeyPuUvFR/e6v3VNYde0cfT+8psgj2xPVAU3viKgkjLwL4Q=
X-Received: by 2002:ac2:47f6:0:b0:488:b649:9f77 with SMTP id
 b22-20020ac247f6000000b00488b6499f77mr2556167lfp.559.1657287306626; Fri, 08
 Jul 2022 06:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
 <20220702213724.3949-3-semen.protsenko@linaro.org>
 <23357d34-4570-1309-6b6e-46055bdb8160@linaro.org>
In-Reply-To: <23357d34-4570-1309-6b6e-46055bdb8160@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 8 Jul 2022 16:34:55 +0300
Message-ID: <CAPLW+4=A7wTwH8a40hzDxn=4yT+jeMn2DX2WRyzxaX59hgbDnw@mail.gmail.com>
Subject: Re: [PATCH 2/4] iommu/exynos: Check if SysMMU v7 has VM registers
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

On Sun, 3 Jul 2022 at 22:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/07/2022 23:37, Sam Protsenko wrote:
> > SysMMU v7 can have Virtual Machine registers, which implement multiple
> > translation domains. The driver should know if it's true or not, as VM
> > registers shouldn't be accessed if not present. Read corresponding
> > capabilities register to obtain that info, and store it in driver data.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/iommu/exynos-iommu.c | 42 ++++++++++++++++++++++++++++++------
> >  1 file changed, 36 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> > index 28f8c8d93aa3..df6ddbebbe2b 100644
> > --- a/drivers/iommu/exynos-iommu.c
> > +++ b/drivers/iommu/exynos-iommu.c
> > @@ -135,6 +135,9 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
> >  #define CFG_SYSSEL   (1 << 22) /* System MMU 3.2 only */
> >  #define CFG_FLPDCACHE        (1 << 20) /* System MMU 3.2+ only */
> >
> > +#define CAPA0_CAPA1_EXIST            BIT(11)
> > +#define CAPA1_VCR_ENABLED            BIT(14)
> > +
> >  /* common registers */
> >  #define REG_MMU_CTRL         0x000
> >  #define REG_MMU_CFG          0x004
> > @@ -171,6 +174,10 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
> >  #define REG_V5_FAULT_AR_VA   0x070
> >  #define REG_V5_FAULT_AW_VA   0x080
> >
> > +/* v7.x registers */
> > +#define REG_V7_CAPA0         0x870
> > +#define REG_V7_CAPA1         0x874
> > +
> >  #define has_sysmmu(dev)              (dev_iommu_priv_get(dev) != NULL)
> >
> >  static struct device *dma_dev;
> > @@ -274,6 +281,9 @@ struct sysmmu_drvdata {
> >       unsigned int version;           /* our version */
> >
> >       struct iommu_device iommu;      /* IOMMU core handle */
> > +
> > +     /* v7 fields */
> > +     bool has_vcr;                   /* virtual machine control register */
> >  };
> >
> >  static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
> > @@ -364,11 +374,7 @@ static void __sysmmu_disable_clocks(struct sysmmu_drvdata *data)
> >
> >  static void __sysmmu_get_version(struct sysmmu_drvdata *data)
> >  {
> > -     u32 ver;
> > -
> > -     __sysmmu_enable_clocks(data);
> > -
> > -     ver = readl(data->sfrbase + REG_MMU_VERSION);
> > +     const u32 ver = readl(data->sfrbase + REG_MMU_VERSION);
>
>
> No need for const for local, non-pointer variables. There is no benefit
> in preventing the modification and it is not a constant.
>

I'd say it's more a matter of taste, having "const" kinda disciplines
one. But I don't mind removing those bits, will do in v2.

> >
> >       /* controllers on some SoCs don't report proper version */
> >       if (ver == 0x80000001u)
> > @@ -378,6 +384,29 @@ static void __sysmmu_get_version(struct sysmmu_drvdata *data)
> >
> >       dev_dbg(data->sysmmu, "hardware version: %d.%d\n",
> >               MMU_MAJ_VER(data->version), MMU_MIN_VER(data->version));
> > +}
> > +
> > +static bool __sysmmu_has_capa1(struct sysmmu_drvdata *data)
> > +{
> > +     const u32 capa0 = readl(data->sfrbase + REG_V7_CAPA0);
>
> Same here and further.
>
>
> Best regards,
> Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
