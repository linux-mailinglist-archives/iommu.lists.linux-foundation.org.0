Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2F3105C0
	for <lists.iommu@lfdr.de>; Fri,  5 Feb 2021 08:21:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17D8D86AAB;
	Fri,  5 Feb 2021 07:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqfZi6IScFse; Fri,  5 Feb 2021 07:21:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E774086AAA;
	Fri,  5 Feb 2021 07:21:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA0BCC0174;
	Fri,  5 Feb 2021 07:21:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92DA5C0174
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 07:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 815FD87048
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 07:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNfYphF8Xs5G for <iommu@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 07:21:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 02BA38707A
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 07:21:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id a1so6463706wrq.6
 for <iommu@lists.linux-foundation.org>; Thu, 04 Feb 2021 23:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H79UJ7A3jnJge1ZByZIpyGYG+WvOyCM/gIg+Y6s4uQ4=;
 b=Q9975I2OIZkWV6liCLdq+fabMpQvp7wQjWmkmFkyQo2iY+bTPIAoItGUKhxh8kkOHv
 tJkLF4pQBdoF2WcclZMmqhBJnshRD9lU2pk5J5aP8G7L54eWktwnruEnoVfPCsn+x/Dh
 6wa24315QeM9D4NpT+4Lzr2LUI85Han1LMn9NgHWrIGQfHCxaXSMPJW+bt0Wd+hucPcy
 282SAhHkzLNg9GnS2nWcxEx22ZQ4oqhJQ8GbVRvPsFuNAM0KMozQqm9JJUNqYIVU+681
 GiIJ58OeiXyVwneG3qoIC41E3qkqCX0NuqvyB+KsPUyGLGb2dD+FpFhtWplPbb8H6Xi1
 mFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H79UJ7A3jnJge1ZByZIpyGYG+WvOyCM/gIg+Y6s4uQ4=;
 b=cowdjvB3qrlFp8YZJEkya0KMFtOLGM8M3kT2OAB3IxiPSWXo60/qnUJqJxVQUG/S1R
 ppcXknfKpuh0yzWkbrOs1FUOFjiUuQQuOOjqG46KCp5Nbsdm8aQa+mx9jJc1H87yR4yL
 ++EIf0Y9o47Hnj+jiieUwT2I02RyDfadeCuC/W8hpErYOc3vhjNUbX+dnhisvzQ5osxx
 0oKeJIfxysBf3Or+ySVXOj4Wgu1ggBTRoq3bj6Ay7G9lPumNixzsFu87O91YYnMR8Qb8
 6J3HMaBgwCyhQUe15VpjXeoFK0p7oNKwJigiub8P/9Y3SE2H48UkmHSF0SUxiVMrw5Vk
 vjrg==
X-Gm-Message-State: AOAM530Yawonr5l5IAJ78Gn3mHhR6Ih3jQgJAjwptuUXNvcgUBH88RIx
 Pdb+b4qzjtZR0yxTJrdeFcJpqbLxYLIq4NVVBIc=
X-Google-Smtp-Source: ABdhPJyUetrlzzDb6KZ/NqRvakx0Th2g3QKyT9xRnTrDgAVuaFUTDddwQrDk5IaxSwqRhyztO7THbE54Guc2su8E8CA=
X-Received: by 2002:a5d:5549:: with SMTP id g9mr3597662wrw.244.1612509695538; 
 Thu, 04 Feb 2021 23:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20210203090727.789939-1-zhang.lyra@gmail.com>
 <20210203090727.789939-2-zhang.lyra@gmail.com>
 <20210204232549.GA1305874@robh.at.kernel.org>
In-Reply-To: <20210204232549.GA1305874@robh.at.kernel.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 5 Feb 2021 15:20:57 +0800
Message-ID: <CAAfSe-tQ+7GuO1PgYa=9wqrpVf3N4br=bn8gJcaEJmnYpc1sxA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: iommu: add bindings for sprd iommu
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, Sheng Xu <sheng.xu@unisoc.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
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

Hi Rob,

On Fri, 5 Feb 2021 at 07:25, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Feb 03, 2021 at 05:07:26PM +0800, Chunyan Zhang wrote:
> > From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> >
> > This iommu module can be used by Unisoc's multimedia devices, such as
> > display, Image codec(jpeg) and a few signal processors, including
> > VSP(video), GSP(graphic), ISP(image), and CPP(camera pixel processor), etc.
> >
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > ---
> >  .../devicetree/bindings/iommu/sprd,iommu.yaml | 72 +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iommu/sprd,iommu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/sprd,iommu.yaml b/Documentation/devicetree/bindings/iommu/sprd,iommu.yaml
> > new file mode 100644
> > index 000000000000..4fc99e81fa66
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iommu/sprd,iommu.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2020 Unisoc Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iommu/sprd,iommu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc IOMMU and Multi-media MMU
> > +
> > +maintainers:
> > +  - Chunyan Zhang <zhang.lyra@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sprd,iommu-v1
> > +
> > +  "#iommu-cells":
> > +    const: 0
> > +    description:
> > +      Unisoc IOMMUs are all single-master IOMMU devices, therefore no
> > +      additional information needs to associate with its master device.
> > +      Please refer to the generic bindings document for more details,
> > +      Documentation/devicetree/bindings/iommu/iommu.txt
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Not required if 'sprd,iommu-regs' is defined.
> > +
> > +  clocks:
> > +    description:
> > +      Reference to a gate clock phandle, since access to some of IOMMUs are
> > +      controlled by gate clock, but this is not required.
> > +
> > +  sprd,iommu-regs:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      Reference to a syscon phandle plus 1 cell, the syscon defines the
> > +      register range used by the iommu and the media device, the cell
> > +      defines the offset for iommu registers. Since iommu module shares
> > +      the same register range with the media device which uses it.
> > +
> > +required:
> > +  - compatible
> > +  - "#iommu-cells"
> > +
> > +oneOf:
> > +  - required:
> > +      - reg
> > +  - required:
> > +      - sprd,iommu-regs
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    iommu_disp: iommu-disp {
> > +      compatible = "sprd,iommu-v1";
> > +      sprd,iommu-regs = <&dpu_regs 0x800>;
>
> If the IOMMU is contained within another device, then it should just be
> a child node of that device.

Yes, actually IOMMU can be seen as a child of multimedia devices, I
considered moving IOMMU under into multimedia device node, but
multimedia devices need IOMMU when probe[1], so I dropped that idea.

And they share the same register base, e.g.

+               mm {
+                       compatible = "simple-bus";
+                       #address-cells = <2>;
+                       #size-cells = <2>;
+                       ranges;
+
+                       dpu_regs: syscon@63000000 {
+                               compatible = "sprd,sc9863a-dpuregs", "syscon";
+                               reg = <0 0x63000000 0 0x1000>;
+                       };
+
+                       dpu: dpu@63000000 {
+                               compatible = "sprd,sharkl3-dpu";
+                               sprd,disp-regs = <&dpu_regs>;
+                               iommus = <&iommu_dispc>;
+                       };
+
+                       iommu_dispc: iommu@63000000 {
+                               compatible = "sprd,iommu-v1";
+                               sprd,iommu-regs = <&dpu_regs 0x800>;
+                               #iommu-cells = <0>;
+                        };

DPU use the registers from 0, IOMMU from 0x800, the purpose of using
syscon node was to avoid remapping register physical address.

> Or just make 'dpu_regs' an IOMMU provider
> (i.e. just add #iommu-cells to it).

xxx_regs(syscon node) defines the register range for IOMMU and a
multimedia device (such as dpu, image codec, etc.)

Hope I've explained the relationship of xxx_regs, multimedia device,
and iommu clearly :)

Any suggestion for this kind of cases?

Thanks,
Chunyan

[1] https://elixir.bootlin.com/linux/v5.11-rc6/source/drivers/iommu/of_iommu.c#L145
>
> > +      #iommu-cells = <0>;
> > +    };
> > +
> > +  - |
> > +    iommu_jpg: iommu-jpg {
> > +      compatible = "sprd,iommu-v1";
> > +      sprd,iommu-regs = <&jpg_regs 0x300>;
> > +      #iommu-cells = <0>;
> > +      clocks = <&mm_gate 1>;
> > +    };
> > +
> > +...
> > --
> > 2.25.1
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
