Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3236A1DE885
	for <lists.iommu@lfdr.de>; Fri, 22 May 2020 16:08:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D556F88BA4;
	Fri, 22 May 2020 14:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuyr+qkV5mrt; Fri, 22 May 2020 14:08:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2CFEC88644;
	Fri, 22 May 2020 14:08:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17F2EC0890;
	Fri, 22 May 2020 14:08:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01DD1C0176
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 14:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DAC6020499
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 14:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XV978YPhjD6K for <iommu@lists.linux-foundation.org>;
 Fri, 22 May 2020 14:08:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 103D9204E3
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 14:08:49 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0A162220E
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590156528;
 bh=9ttEKhP9nDiAvnPqT2NbUpZ5A85BLKTda+04YGkS/Jc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T2Xyqu7RlLiGBaCDD17OBLgGFUconLgjUep1CkxaxuB56HWep4NJb4MnEUKbTJIQ/
 BPsiP4uyGXiJCNa4XV3/qJeym+K49EOY/CQRq66xChHwJq+W43g+ybH/t+8d2XG6f7
 7IYLQaIq15BXntiJmBfIChnqjuJ6478npY1kpw0A=
Received: by mail-oi1-f180.google.com with SMTP id i22so9372970oik.10
 for <iommu@lists.linux-foundation.org>; Fri, 22 May 2020 07:08:48 -0700 (PDT)
X-Gm-Message-State: AOAM533a2jkW03GXhXI0/pzFm0uzg/yKZy+XY8NGZmsGWb60hX+B3W5P
 E2bTkvnlv6hByZIdkIuEWHd5HJixcFjWF8SQUg==
X-Google-Smtp-Source: ABdhPJxbEp1ZalT7LjeGB8CX9V1N0S0pLASvdZoVw8NWjkZUBBbTq4XnQYOc4bY4bi78FkEmC75vv9c1Cjc7aIFvTrE=
X-Received: by 2002:aca:f084:: with SMTP id o126mr2821207oih.106.1590156527984; 
 Fri, 22 May 2020 07:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
 <20200521130008.8266-10-lorenzo.pieralisi@arm.com>
 <CAL_Jsq+h18gH2D3B-OZku6ACCgonPUJcUnrN8a5=jApsXHdB5Q@mail.gmail.com>
 <abca6ecb-5d93-832f-ff7c-de53bb6203f3@arm.com>
 <ee7a5c04-814e-215f-ec74-52c2f3b881d0@oss.nxp.com>
In-Reply-To: <ee7a5c04-814e-215f-ec74-52c2f3b881d0@oss.nxp.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 22 May 2020 08:08:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKf+cq9Nhs+M8ihC-Ls24YH-WEofW8H4kkFPWMhZw=unA@mail.gmail.com>
Message-ID: <CAL_JsqKf+cq9Nhs+M8ihC-Ls24YH-WEofW8H4kkFPWMhZw=unA@mail.gmail.com>
Subject: Re: [PATCH 09/12] dt-bindings: arm: fsl: Add msi-map device-tree
 binding for fsl-mc bus
To: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>,
 Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
 PCI <linux-pci@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, linux-acpi@vger.kernel.org,
 Makarand Pawagi <makarand.pawagi@nxp.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
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

On Fri, May 22, 2020 at 3:57 AM Diana Craciun OSS
<diana.craciun@oss.nxp.com> wrote:
>
> On 5/22/2020 12:42 PM, Robin Murphy wrote:
> > On 2020-05-22 00:10, Rob Herring wrote:
> >> On Thu, May 21, 2020 at 7:00 AM Lorenzo Pieralisi
> >> <lorenzo.pieralisi@arm.com> wrote:
> >>>
> >>> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> >>>
> >>> The existing bindings cannot be used to specify the relationship
> >>> between fsl-mc devices and GIC ITSes.
> >>>
> >>> Add a generic binding for mapping fsl-mc devices to GIC ITSes, using
> >>> msi-map property.
> >>>
> >>> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> >>> Cc: Rob Herring <robh+dt@kernel.org>
> >>> ---
> >>>   .../devicetree/bindings/misc/fsl,qoriq-mc.txt | 30
> >>> +++++++++++++++++--
> >>>   1 file changed, 27 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> >>> b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> >>> index 9134e9bcca56..b0813b2d0493 100644
> >>> --- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> >>> +++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> >>> @@ -18,9 +18,9 @@ same hardware "isolation context" and a 10-bit
> >>> value called an ICID
> >>>   the requester.
> >>>
> >>>   The generic 'iommus' property is insufficient to describe the
> >>> relationship
> >>> -between ICIDs and IOMMUs, so an iommu-map property is used to define
> >>> -the set of possible ICIDs under a root DPRC and how they map to
> >>> -an IOMMU.
> >>> +between ICIDs and IOMMUs, so the iommu-map and msi-map properties
> >>> are used
> >>> +to define the set of possible ICIDs under a root DPRC and how they
> >>> map to
> >>> +an IOMMU and a GIC ITS respectively.
> >>>
> >>>   For generic IOMMU bindings, see
> >>>   Documentation/devicetree/bindings/iommu/iommu.txt.
> >>> @@ -28,6 +28,9 @@ Documentation/devicetree/bindings/iommu/iommu.txt.
> >>>   For arm-smmu binding, see:
> >>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml.
> >>>
> >>> +For GICv3 and GIC ITS bindings, see:
> >>> +Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml.
> >>>
> >>> +
> >>>   Required properties:
> >>>
> >>>       - compatible
> >>> @@ -119,6 +122,15 @@ Optional properties:
> >>>     associated with the listed IOMMU, with the iommu-specifier
> >>>     (i - icid-base + iommu-base).
> >>>
> >>> +- msi-map: Maps an ICID to a GIC ITS and associated iommu-specifier
> >>> +  data.
> >>> +
> >>> +  The property is an arbitrary number of tuples of
> >>> +  (icid-base,iommu,iommu-base,length).
> >>
> >> I'm confused because the example has GIC ITS phandle, not an IOMMU.
> >>
> >> What is an iommu-base?
> >
> > Right, I was already halfway through writing a reply to say that all
> > the copy-pasted "iommu" references here should be using the
> > terminology from the pci-msi.txt binding instead.
>
> Right, will change it.
>
> >
> >>> +
> >>> +  Any ICID in the interval [icid-base, icid-base + length) is
> >>> +  associated with the listed GIC ITS, with the iommu-specifier
> >>> +  (i - icid-base + iommu-base).
> >>>   Example:
> >>>
> >>>           smmu: iommu@5000000 {
> >>> @@ -128,6 +140,16 @@ Example:
> >>>                  ...
> >>>           };
> >>>
> >>> +       gic: interrupt-controller@6000000 {
> >>> +               compatible = "arm,gic-v3";
> >>> +               ...
> >>> +               its: gic-its@6020000 {
> >>> +                       compatible = "arm,gic-v3-its";
> >>> +                       msi-controller;
> >>> +                       ...
> >>> +               };
> >>> +       };
> >>> +
> >>>           fsl_mc: fsl-mc@80c000000 {
> >>>                   compatible = "fsl,qoriq-mc";
> >>>                   reg = <0x00000008 0x0c000000 0 0x40>,    /* MC
> >>> portal base */
> >>> @@ -135,6 +157,8 @@ Example:
> >>>                   msi-parent = <&its>;
> >
> > Side note: is it right to keep msi-parent here? It rather implies that
> > the MC itself has a 'native' Device ID rather than an ICID, which I
> > believe is not strictly true. Plus it's extra-confusing that it
> > doesn't specify an ID either way, since that makes it look like the
> > legacy PCI case that gets treated implicitly as an identity msi-map,
> > which makes no sense at all to combine with an actual msi-map.
>
> Before adding msi-map, the fsl-mc code assumed that ICID and streamID
> are equal and used msi-parent just to get the reference to the ITS node.
> Removing msi-parent will break the backward compatibility of the already
> existing systems. Maybe we should mention that this is legacy and not to
> be used for newer device trees.

If ids are 1:1, then the DT should use msi-parent. If there is
remapping, then use msi-map. A given system should use one or the
other. I suppose if some ids are 1:1 and the msi-map was added to add
additional support for ids not 1:1, then you could end up with both.
That's fine in dts files, but examples should reflect the 'right' way.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
