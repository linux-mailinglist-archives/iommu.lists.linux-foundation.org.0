Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD121131AD
	for <lists.iommu@lfdr.de>; Wed,  4 Dec 2019 19:02:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC4F787463;
	Wed,  4 Dec 2019 18:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SB1tAryGjrqX; Wed,  4 Dec 2019 18:02:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 621EB8733F;
	Wed,  4 Dec 2019 18:02:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41162C1DDD;
	Wed,  4 Dec 2019 18:02:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0250C077D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 18:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EAA3C1FEED
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 18:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsFEk1wYQpPu for <iommu@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 18:01:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by silver.osuosl.org (Postfix) with ESMTPS id B8C302035B
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 18:01:55 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id cm12so130811edb.11
 for <iommu@lists.linux-foundation.org>; Wed, 04 Dec 2019 10:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvp9L8yGr+7Q73cf5DiMFkH0tKxVcTrdu8kuP8KT/wA=;
 b=AnLIlKDxiENCXMUrbqTM8dDUPRPRHtCYpWJQ8og66XUs0vdaxN8hGdg8m117J2krEJ
 SJ2rAhNZms6onCSAEhb1qbbpGHdAC1mNwB1yBzp4a46YCvh4DYplVBpVi9hnAnUdTk3V
 7u+AMPmaRBp2zv5wG50ryD9qcrQW5TYYYwRmOFGRps5AMuyfZUiqtmkQZCMW1y1LJeOa
 DRVwsjJb7aZBa4lcDk/NWOrtV9UDX2xwfA8hVKNB2z+B1q8U/7/BNl9KF3mOCI0qisZE
 E+Pm16Xc42UW7lkGqqQY1hd/GGQfyoVxJXRWw9ipzYEk34PlwrqXzIRMfYLNeN/9jAsg
 NaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvp9L8yGr+7Q73cf5DiMFkH0tKxVcTrdu8kuP8KT/wA=;
 b=li3BUBvnoEKFz/TJa70hI7f5U8TuKsSwWImIDX6XWvIJ1+g2siAbWTzBZ3PEzpq221
 8v/jMYVmgn4NMTSGkVTQlMPDLEPwlNQnGkdM8FzewUcfs5aQnM+njbkguLT2Jtcw3tIe
 1hao7/rRdMTOevHMNLXEiF2mddDu7iKibb3J99xf6xR8ExDUwZnaR24+SNhQ+5f0gBfL
 B92VFk/1WN/YK83vRaJfzik67dS5alYZB6A4ZoLqR+eI+7rgrPf+dBYtajSYHjySJsxi
 jOYkoy/Yr1v/ywvUmRv/ONUIuLDzigikidQYLQjaRKybolkPgz7JQJk6Z92knWnFG4ZU
 q+VA==
X-Gm-Message-State: APjAAAW2hlNGlcY96p8z6YRCLZzUAveyqdNR8TbML0FWQ5xEpty5mrHv
 cAZYjWtWhy2x40xCQeNQ6yXqXDJYKQGk0QTvEwQ=
X-Google-Smtp-Source: APXvYqyH+H1j/zREsxP/LJQ/Q6PhP0dprWgGzUYK4IWlJ02sNpCzzk2ec/2tRbkR3GG2lr++MiA4m7gV4rTsfvod+5U=
X-Received: by 2002:aa7:d64f:: with SMTP id v15mr5520399edr.71.1575482513957; 
 Wed, 04 Dec 2019 10:01:53 -0800 (PST)
MIME-Version: 1.0
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
 <0101016e95751c0b-33c9379b-6b8c-43b1-8785-e5e1b6f084f1-000000@us-west-2.amazonses.com>
 <3a283a7c-df75-a30a-1bcb-74e631f06a71@arm.com>
In-Reply-To: <3a283a7c-df75-a30a-1bcb-74e631f06a71@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Dec 2019 10:01:42 -0800
Message-ID: <CAF6AEGuxgUQNuSQVECiUzpj4DM0R7UYme0Q9ggF1a=JCxAJsBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm-smmu: Add Adreno GPU variant
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
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

On Wed, Dec 4, 2019 at 7:56 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 22/11/2019 11:31 pm, Jordan Crouse wrote:
> > Add a compatible string to identify SMMUs that are attached
> > to Adreno GPU devices that wish to support split pagetables.
>
> A software policy decision is not, in itself, a good justification for a
> DT property. Is the GPU SMMU fundamentally different in hardware* from
> the other SMMU(s) in any given SoC?

The GPU CP has some sort of mechanism to switch pagetables.. although
I guess under the firmware it is all the same.  Jordan should know
better..

BR,
-R

> (* where "hardware" may encompass hypervisor shenanigans)
>
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 6515dbe..db9f826 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -31,6 +31,12 @@ properties:
> >                 - qcom,sdm845-smmu-v2
> >             - const: qcom,smmu-v2
> >
> > +      - description: Qcom Adreno GPU SMMU iplementing split pagetables
> > +        items:
> > +          - enum:
> > +              - qcom,adreno-smmu-v2
> > +          - const: qcom,smmu-v2
>
> Given that we already have per-SoC compatibles for Qcom SMMUs in
> general, this seems suspiciously vague.
>
> Robin.
>
> > +
> >         - description: Qcom SoCs implementing "arm,mmu-500"
> >           items:
> >             - enum:
> >
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
