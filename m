Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A801E55C5
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 07:15:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 90EB224FFE;
	Thu, 28 May 2020 05:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJfz-BlgQ-ga; Thu, 28 May 2020 05:15:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 051D220531;
	Thu, 28 May 2020 05:15:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC50BC016F;
	Thu, 28 May 2020 05:15:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99848C016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 05:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 806E087F69
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 05:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqEk7iwlRxCa for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 05:15:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8A50C87EEC
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 05:15:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id j198so3662743wmj.0
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ogbDNvgcnvbjK2u+CfCd7F7vOweOB0DcAaASJSQleM=;
 b=gK1Wa8QlQn0RzLYnPm0DOAuWIsb3ZgQVejc8of4HcZHM9bTmfb7ku5IuobyHBWLV+A
 4pfX2QFACm9JWcZbeVXnuhuEeCC7j9gvmyRWHbderhxw2Wo93egg9/eMdIOKPW2vJ+Hi
 sdBTJqihazq9u6DGx72wef17BzJOJywp3pC7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ogbDNvgcnvbjK2u+CfCd7F7vOweOB0DcAaASJSQleM=;
 b=TbLQIRtex5FY/UGc4WInM5wCWRKuUuVO+XQRPKyh304XlER31N40OK+LE++89k5hHT
 09vR96vRVsiKh7lfD/vM8WQX/dDZWMUfyvyNQ23nfgUuj42qxwOTyrwGH+D8s7ikC/0+
 Mt6XUZOv0oI4oo94Y2SUzr4EJRQhEU00CzU30wqyHMLMDTmJBJidXqfnsSk31G9LlTlJ
 taPs8ngHFqBXKYuoBc18l0SVjlWrrt3pjeXJqpcSudhPs5nCKBOyxYsDz3rydOTpFrIQ
 mrqFEsb0Vhb/oxYLKvGNraKgcCoUFHl/MLyR8NJzqKk6ooAkZGO/BebNWmurdyNzRt+x
 C7cA==
X-Gm-Message-State: AOAM531+GRrg0zJJsvRrCAtSoQw6+P/sXDsFgt9+rC0uzmpTFdAUDBhi
 lht2NvjfVD3CloX7gIqkKTRX36s1nouQFxwpR/dd8Q==
X-Google-Smtp-Source: ABdhPJyMEj45EPh84qpSCpk1vUfDmAAfVx6Q6El+wTjic65DGrkCvumgrm1PCn0JrZdJJegdiRkqrF1LAf1puxUo8xQ=
X-Received: by 2002:a1c:740e:: with SMTP id p14mr1592366wmc.155.1590642926688; 
 Wed, 27 May 2020 22:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <1590595398-4217-1-git-send-email-srinath.mannam@broadcom.com>
 <f9b221cf-1c7f-9f95-133b-dca65197b6c2@arm.com>
In-Reply-To: <f9b221cf-1c7f-9f95-133b-dca65197b6c2@arm.com>
Date: Thu, 28 May 2020 10:45:14 +0530
Message-ID: <CABe79T7WwD2AyWp2e5pAi8TO2r5=-v5gPb2Gjtf8EhHOn3dogQ@mail.gmail.com>
Subject: Re: [RFC PATCH] iommu/arm-smmu: Add module parameter to set msi iova
 address
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
From: Srinath Mannam via iommu <iommu@lists.linux-foundation.org>
Reply-To: Srinath Mannam <srinath.mannam@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, May 27, 2020 at 11:00 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
Thanks Robin for your quick response.
> On 2020-05-27 17:03, Srinath Mannam wrote:
> > This patch gives the provision to change default value of MSI IOVA base
> > to platform's suitable IOVA using module parameter. The present
> > hardcoded MSI IOVA base may not be the accessible IOVA ranges of platform.
>
> That in itself doesn't seem entirely unreasonable; IIRC the current
> address is just an arbitrary choice to fit nicely into Qemu's memory
> map, and there was always the possibility that it wouldn't suit everything.
>
> > Since commit aadad097cd46 ("iommu/dma: Reserve IOVA for PCIe inaccessible
> > DMA address"), inaccessible IOVA address ranges parsed from dma-ranges
> > property are reserved.
>
> That, however, doesn't seem to fit here; iommu-dma maps MSI doorbells
> dynamically, so they aren't affected by reserved regions any more than
> regular DMA pages are. In fact, it explicitly ignores the software MSI
> region, since as the comment says, it *is* the software that manages those.
Yes you are right, we don't see any issues with kernel drivers(PCI EP) because
MSI IOVA allocated dynamically by honouring reserved regions same as DMA pages.
>
> The MSI_IOVA_BASE region exists for VFIO, precisely because in that case
> the kernel *doesn't* control the address space, but still needs some way
> to steal a bit of it for MSIs that the guest doesn't necessarily know
> about, and give userspace a fighting chance of knowing what it's taken.
> I think at the time we discussed the idea of adding something to the
> VFIO uapi such that userspace could move this around if it wanted or
> needed to, but decided we could live without that initially. Perhaps now
> the time has come?
Yes, we see issues only with user-space drivers(DPDK) in which MSI_IOVA_BASE
region is considered to map MSI registers. This patch helps us to fix the issue.

Thanks,
Srinath.
>
> Robin.
>
> > If any platform has the limitaion to access default MSI IOVA, then it can
> > be changed using "arm-smmu.msi_iova_base=0xa0000000" command line argument.
> >
> > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > ---
> >   drivers/iommu/arm-smmu.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index 4f1a350..5e59c9d 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -72,6 +72,9 @@ static bool disable_bypass =
> >   module_param(disable_bypass, bool, S_IRUGO);
> >   MODULE_PARM_DESC(disable_bypass,
> >       "Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
> > +static unsigned long msi_iova_base = MSI_IOVA_BASE;
> > +module_param(msi_iova_base, ulong, S_IRUGO);
> > +MODULE_PARM_DESC(msi_iova_base, "msi iova base address.");
> >
> >   struct arm_smmu_s2cr {
> >       struct iommu_group              *group;
> > @@ -1566,7 +1569,7 @@ static void arm_smmu_get_resv_regions(struct device *dev,
> >       struct iommu_resv_region *region;
> >       int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
> >
> > -     region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
> > +     region = iommu_alloc_resv_region(msi_iova_base, MSI_IOVA_LENGTH,
> >                                        prot, IOMMU_RESV_SW_MSI);
> >       if (!region)
> >               return;
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
