Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 592ED56CD6C
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B3704087D;
	Sun, 10 Jul 2022 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B3704087D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kQj86bjG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuZCOpOFSwdE; Sun, 10 Jul 2022 06:37:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 279ED40023;
	Sun, 10 Jul 2022 06:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279ED40023
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 006E4C0081;
	Sun, 10 Jul 2022 06:37:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 676ECC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26AB884570
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26AB884570
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=kQj86bjG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWjlNI_7SQTd for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 13:18:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41F2084622
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41F2084622
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:18:46 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a39so25892859ljq.11
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jul 2022 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Yam3y0DcCFqvtPSG9KOweCqxMOCqoZ/tVs5qs0X19I=;
 b=kQj86bjG5zvMHEWhoxQWhFXTOUb15TA7YqDTqLA361xfX3dMGb3sA66mMwl6cGu1Cp
 6Q867H9s0YhApBd6xEXsnrThqvBSoz4fZBP7GLTRSaQ2QnK2HHIHWLF7Bkz+/ibQrGx9
 WmOhWen94YFgjXDgtkMpIKy7LhOV3xpqHo7pF7uXoOeJux9kYLux8b8Da6NFvugnft3J
 7IDixkpvl3CYYIAi1v+2agBHTgmcIGWQ7LyOylWYDH605GAIKDf+ueY84GGCLvQA03zg
 h7ZrE3ctcGYV6khkrm9AlNVaQcIRWiW0Aabx9L/vnPGrhtaV+DOamJDJZOY0RVy/mPqT
 Q1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Yam3y0DcCFqvtPSG9KOweCqxMOCqoZ/tVs5qs0X19I=;
 b=eO7Z7deLl6+6MwNc/rpPH20N4Kcpan1VzOTNo8w38R8ufEf6vel+pJ2Vmv+BbTUBFi
 aJ+/uLV10axBD52YtsuI6plGaqD2uiY/O+6TEvz98zuF6inZos04osDBs+Wuh8Zk9pwG
 3NF0PMSLAN3RTVoHKxOQ2GzH1tppdjKWCwTKPaU0EMPitpYElp9r8lPbZ3RGjVbvYHwX
 YC2N8c5a0obOIALcgRqAaNqhxYM3r7BI0ztAeBfNx25znyFCGdfYzuxKprJCRJUUSPf+
 R4Fh/x6XiB+Kz2h4kVz+1caYWM85sEiqO7ZFpNNXoEqmv53h/ybExNy7uCn6sWpWtTGF
 6djw==
X-Gm-Message-State: AJIora++TX3gtZxsGaZg5WiJvI3ojxSYJlu4wCoDH7FP6EAFxYqu91t5
 e5BL+2wBy6weD+yzAdjxuXs7o8LGuoBJSgVdDW1VGg==
X-Google-Smtp-Source: AGRyM1uIshwbshScAbeRQz3UVgzvkjmr6Hms69W47MrzRQoRsZF9RKD+toMCTMaHHbdrVf4EyhuKSDLC3CiVAnM6wtg=
X-Received: by 2002:a2e:a413:0:b0:25d:4844:9d65 with SMTP id
 p19-20020a2ea413000000b0025d48449d65mr1997343ljn.169.1657286324182; Fri, 08
 Jul 2022 06:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
 <20220702213724.3949-2-semen.protsenko@linaro.org>
 <9afb1e98-706f-ed61-892c-e3cc321364b4@linaro.org>
In-Reply-To: <9afb1e98-706f-ed61-892c-e3cc321364b4@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 8 Jul 2022 16:18:32 +0300
Message-ID: <CAPLW+4kfrHOb8utzynhB=2KLDQu-NC08UYpAVjpg__NQSeSQyg@mail.gmail.com>
Subject: Re: [PATCH 1/4] iommu/exynos: Set correct dma mask for SysMMU v5+
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

On Sun, 3 Jul 2022 at 21:50, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/07/2022 23:37, Sam Protsenko wrote:
> > SysMMU v5+ supports 36 bit physical address space. Set corresponding DMA
> > mask to avoid falling back to SWTLBIO usage in dma_map_single() because
> > of failed dma_capable() check.
> >
> > The original code for this fix was suggested by Marek.
> >
> > Originally-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> This is some tip specific tag, I don't think checkpatch allows it.
> Either use suggesgted-by or co-developed-by + SoB.
>

Yes, checkpatch is swearing at that line, though I encountered that
tag mentioning somewhere in Documentation. Will rework it in v2.

> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/iommu/exynos-iommu.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> > index 71f2018e23fe..28f8c8d93aa3 100644
> > --- a/drivers/iommu/exynos-iommu.c
> > +++ b/drivers/iommu/exynos-iommu.c
> > @@ -647,6 +647,14 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > +     if (MMU_MAJ_VER(data->version) >= 5) {
> > +             ret = dma_set_mask(dev, DMA_BIT_MASK(36));
> > +             if (ret) {
> > +                     dev_err(dev, "Unable to set DMA mask: %d\n", ret);
>
> Missing cleanup: iommu_device_unregister
> and probably also: iommu_device_sysfs_remove
>

Right. Also the correct cleanup should be added for failing
iommu_device_register() case, above of the quoted code. Will do that
in v2, thanks.

Another thing is that "remove" method is missing. But guess I'll get
to it later, when adding modularization support for this driver.

> > +                     return ret;
> > +             }
> > +     }
> > +
> >       /*
> >        * use the first registered sysmmu device for performing
> >        * dma mapping operations on iommu page tables (cpu cache flush)
>
>
> Best regards,
> Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
