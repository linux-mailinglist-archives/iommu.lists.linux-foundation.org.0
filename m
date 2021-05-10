Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29D3789AB
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 13:52:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A99AF40438;
	Mon, 10 May 2021 11:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVwamkEbfdln; Mon, 10 May 2021 11:52:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D47403CE;
	Mon, 10 May 2021 11:52:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B05BC0001;
	Mon, 10 May 2021 11:52:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 710BAC0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 11:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51D4A403CE
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 11:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zoPQrxBgl_FR for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 11:52:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FF94402FA
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 11:52:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u21so23987578ejo.13
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 04:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=khNILwywEolSvADH0D4Wss73whUEuYpevRUgBKvL8oQ=;
 b=nPRs8xOUwQimZRrrEjnT/vzs5lVDyKaHwRgPv/ybrU+KqoXbo0U/JxaiqMskTU1ZWS
 hdBm+XrSViDanQqCCtzwZIaNbxb22r6GwmWUSPNmg1yyK7UXKc03/3Th76E3EgBFzkjc
 X39mdVt8C1Urb+Ebkmxi5hxAWN/jGkpWkyEKyp9fSYb2bg49dRqm/y9NB/FRriTfphNq
 DWsqv0BmYtBHQa5AJcomsKEnjVRC5V6NHUtE8HBRhXCOMSZqB+Z/lFaeIgZNftseMdCO
 pDaXKJfx6Ge8bxvbP7JRxp4fDmgVyquNGAtPkAJzWRDbejiOyRAQvxN64g11hOsN0wQ7
 m1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=khNILwywEolSvADH0D4Wss73whUEuYpevRUgBKvL8oQ=;
 b=YhzqMyYK3z0DCJuIB/12pPou5nhQ8icadhAt9JQ5V+cwJ4HTqfz99FCMHpy00T/y3X
 ry/uy0z7rNIbvFHjE83kDpfuVs99vFuYQTMtNbNobmySrJPvULNpCR8+cQ00pU0hBxGT
 H99TryPaUuSLYuoivg5UPYom8vLblo1DZt9Ds4+D8sE7kTEKhGo2u6UMThdfiye8Anh7
 awcdfz/jr8bZHoRIVgQXQzwTJsu1zeJC/3H9L5o95kE9h6nbHOPf/U3p61v+1nJV54YW
 iFFSWUuRj3BKrIMKhEkFd+c9TxoHM/DYMWJ/SBhZvEQxke1sM0XRzosqbMw4vTivNA1J
 Vc2g==
X-Gm-Message-State: AOAM531OwqNQktPTZ/e2IwQ7LCGfJZaHvC92RusNwAagcXwOBRfVL2i1
 W22KfdGPiUlXb0/3YEMePYDAW5N0aoPCP1/j1lQl8A==
X-Google-Smtp-Source: ABdhPJxxuOMsSpzQ62KWv6A4p2zbnlRdch+S4llFoAWFFetnZk1oCC2Dg8fOQxIUh/wkdkmaXjArCWbtvZNeneKtySE=
X-Received: by 2002:a17:906:edaf:: with SMTP id
 sa15mr25468018ejb.68.1620647537265; 
 Mon, 10 May 2021 04:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210420082751.1829-1-shameerali.kolothum.thodi@huawei.com>
 <20210420082751.1829-10-shameerali.kolothum.thodi@huawei.com>
 <501cd986-7f9c-9aa7-b4e9-f2ef98fb7a95@arm.com>
 <df2b37e8fb6a4704a2eb8b5241a45231@huawei.com>
In-Reply-To: <df2b37e8fb6a4704a2eb8b5241a45231@huawei.com>
From: Jon Nettleton <jon@solid-run.com>
Date: Mon, 10 May 2021 13:51:39 +0200
Message-ID: <CABdtJHvMCR7mb9_kC_YqV0ZLDW0-xno4VNePOKFSgaXm7csa_g@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] iommu/arm-smmu: Get associated RMR info and
 install bypass SMR
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Linuxarm <linuxarm@huawei.com>, Steven Price <steven.price@arm.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 wanghuiqiang <wanghuiqiang@huawei.com>,
 "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 "Sami.Mujawar@arm.com" <Sami.Mujawar@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Mon, May 10, 2021 at 10:40 AM Shameerali Kolothum Thodi
<shameerali.kolothum.thodi@huawei.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Steven Price [mailto:steven.price@arm.com]
> > Sent: 06 May 2021 16:17
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> > linux-arm-kernel@lists.infradead.org; linux-acpi@vger.kernel.org;
> > iommu@lists.linux-foundation.org
> > Cc: Linuxarm <linuxarm@huawei.com>; lorenzo.pieralisi@arm.com;
> > joro@8bytes.org; robin.murphy@arm.com; wanghuiqiang
> > <wanghuiqiang@huawei.com>; Guohanjun (Hanjun Guo)
> > <guohanjun@huawei.com>; Sami.Mujawar@arm.com; jon@solid-run.com;
> > eric.auger@redhat.com
> > Subject: Re: [PATCH v3 09/10] iommu/arm-smmu: Get associated RMR info
> > and install bypass SMR
> >
> > On 20/04/2021 09:27, Shameer Kolothum wrote:
> > > From: Jon Nettleton <jon@solid-run.com>
> > >
> > > Check if there is any RMR info associated with the devices behind
> > > the SMMU and if any, install bypass SMRs for them. This is to
> > > keep any ongoing traffic associated with these devices alive
> > > when we enable/reset SMMU during probe().
> > >
> > > Signed-off-by: Jon Nettleton <jon@solid-run.com>
> > > Signed-off-by: Shameer Kolothum
> > <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 42
> > +++++++++++++++++++++++++++
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> > >   2 files changed, 44 insertions(+)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index d8c6bfde6a61..4d2f91626d87 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -2102,6 +2102,43 @@ err_reset_platform_ops: __maybe_unused;
> > >     return err;
> > >   }
> > >
> > > +static void arm_smmu_rmr_install_bypass_smr(struct arm_smmu_device
> > *smmu)
> > > +{
> > > +   struct iommu_rmr *e;
> > > +   int i, cnt = 0;
> > > +   u32 smr;
> > > +
> > > +   for (i = 0; i < smmu->num_mapping_groups; i++) {
> > > +           smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> > > +           if (!FIELD_GET(ARM_SMMU_SMR_VALID, smr))
> > > +                   continue;
> > > +
> > > +           list_for_each_entry(e, &smmu->rmr_list, list) {
> > > +                   if (FIELD_GET(ARM_SMMU_SMR_ID, smr) != e->sid)
> > > +                           continue;
> > > +
> > > +                   smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> > > +                   smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK,
> > smr);
> > > +                   smmu->smrs[i].valid = true;
> > > +
> > > +                   smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
> > > +                   smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
> > > +                   smmu->s2crs[i].cbndx = 0xff;
> > > +
> > > +                   cnt++;
> > > +           }
> > > +   }
> >
> > If I understand this correctly - this is looking at the current
> > (hardware) configuration of the SMMU and attempting to preserve any
> > bypass SMRs. However from what I can tell it suffers from the following
> > two problems:
> >
> >   (a) Only the ID of the SMR is being checked, not the MASK. So if the
> > firmware has setup an SMR matching a number of streams this will break.
> >
> >   (b) The SMMU might not be enabled at all (CLIENTPD==1) or bypass
> > enabled for unmatched streams (USFCFG==0).
> >
> > Certainly in my test setup case (b) applies and so this doesn't work.
> > Perhaps something like the below would work better? (It works in the
> > case of the SMMU not enabled - I've not tested case (a)).
>
> Thanks Steve for taking a look and testing this on SMMUv2. My knowledge
> on SMMUv2 is limited an don't have a setup to verify this. After reading
> the code, agree that the current implementation addresses the hardware
> configuration only and breaks all the scenarios explained above.
>
> I will include the below snippet in next respin if that works.
>
> Hi Jon,
>
> Could you please take a look and see the below changes works for
> you too?

My original code was derived from a solution that was proposed for
device-tree booted systems.  I will review and test the changes and
then report back.

-Jon


>
> Thanks,
> Shameer
>
> > ----8<----
> > static void arm_smmu_rmr_install_bypass_smr(struct arm_smmu_device
> > *smmu)
> > {
> >       struct iommu_rmr *e;
> >       int i, cnt = 0;
> >       u32 smr;
> >       u32 reg;
> >
> >       reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
> >
> >       if ((reg & ARM_SMMU_sCR0_USFCFG) && !(reg &
> > ARM_SMMU_sCR0_CLIENTPD)) {
> >               /*
> >                * SMMU is already enabled and disallowing bypass, so preserve
> >                * the existing SMRs
> >                */
> >               for (i = 0; i < smmu->num_mapping_groups; i++) {
> >                       smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> >                       if (!FIELD_GET(ARM_SMMU_SMR_VALID, smr))
> >                               continue;
> >                       smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> >                       smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK,
> > smr);
> >                       smmu->smrs[i].valid = true;
> >               }
> >       }
> >
> >       list_for_each_entry(e, &smmu->rmr_list, list) {
> >               u32 sid = e->sid;
> >
> >               i = arm_smmu_find_sme(smmu, sid, ~0);
> >               if (i < 0)
> >                       continue;
> >               if (smmu->s2crs[i].count == 0) {
> >                       smmu->smrs[i].id = sid;
> >                       smmu->smrs[i].mask = ~0;
> >                       smmu->smrs[i].valid = true;
> >               }
> >               smmu->s2crs[i].count++;
> >               smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
> >               smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
> >               smmu->s2crs[i].cbndx = 0xff;
> >
> >               cnt++;
> >       }
> >
> >       if ((reg & ARM_SMMU_sCR0_USFCFG) && !(reg &
> > ARM_SMMU_sCR0_CLIENTPD)) {
> >               /* Remove the valid bit for unused SMRs */
> >               for (i = 0; i < smmu->num_mapping_groups; i++) {
> >                       if (smmu->s2crs[i].count == 0)
> >                               smmu->smrs[i].valid = false;
> >               }
> >       }
> >
> >       dev_notice(smmu->dev, "\tpreserved %d boot mapping%s\n", cnt,
> >                  cnt == 1 ? "" : "s");
> > }
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
