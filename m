Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 403DA2810F0
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 13:07:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB0C3872E3;
	Fri,  2 Oct 2020 11:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPy9yWhtKCNd; Fri,  2 Oct 2020 11:07:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 08DA4872DC;
	Fri,  2 Oct 2020 11:07:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEEBCC0051;
	Fri,  2 Oct 2020 11:07:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D08BC0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 11:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 63EB7273D3
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 11:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzsJewFSZI0t for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 11:07:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 21451273CF
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 11:07:15 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dn5so1210878edb.10
 for <iommu@lists.linux-foundation.org>; Fri, 02 Oct 2020 04:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YQy6FiIzQNjdtyPlCm6RsMz74Z9Qpq3cOcma81PAdFY=;
 b=a0ObWnvwhoKcuqGZAg6m8PWvv6VF1akE81APZVMyl3GdzAtLcKUGWuJIi4iQkYJLgB
 W4iqNu3XCnJN/0YCVxg5baJC8vfbGX1E9PLopLUGVD/otRtGWBkJTyglMYhXFYsMFK+U
 wOgMyXaTRqa2OzevPqkE19LhgkTyC5UYZD2gTKBIsZtzh4SRg8Qik1OKJw1lacDjKlvD
 K4RNIVms41trDueelIzywmDSvZhui5RN2BKF8M0BSmXh/dSn4nxjOZpLtL4pqpG+spWM
 usRxhJPEggKoJpmNDx0BTRy8pQc+Ixtvy3OqdwtQzrTWxgXrjYMSqu1TyO7/7w5ymfNr
 mmOw==
X-Gm-Message-State: AOAM5314fxjYeCjGYu2JAdDASfs2GJ4y2TtIs6pG0nAl/CtGAqw8YVek
 Gzaxoq33+dGwvtW9BX1T79U=
X-Google-Smtp-Source: ABdhPJyZ33O0u4XYmGYq2Z/I18o6f1qpHMSJ5cZb516PFEEciaNIv1xG7LHkDSXCH8zGXdT119dDLA==
X-Received: by 2002:a05:6402:18d:: with SMTP id
 r13mr1616331edv.267.1601636833441; 
 Fri, 02 Oct 2020 04:07:13 -0700 (PDT)
Received: from pi3 ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id h10sm915230ejt.93.2020.10.02.04.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 04:07:12 -0700 (PDT)
Date: Fri, 2 Oct 2020 13:07:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 01/24] dt-bindings: iommu: mediatek: Convert IOMMU to
 DT schema
Message-ID: <20201002110709.GC6888@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-2-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
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

On Wed, Sep 30, 2020 at 03:06:24PM +0800, Yong Wu wrote:
> Convert MediaTek IOMMU to DT schema.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.txt         | 103 ------------
>  .../bindings/iommu/mediatek,iommu.yaml        | 154 ++++++++++++++++++
>  2 files changed, 154 insertions(+), 103 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> deleted file mode 100644
> index c1ccd8582eb2..000000000000
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -* Mediatek IOMMU Architecture Implementation
> -
> -  Some Mediatek SOCs contain a Multimedia Memory Management Unit (M4U), and
> -this M4U have two generations of HW architecture. Generation one uses flat
> -pagetable, and only supports 4K size page mapping. Generation two uses the
> -ARM Short-Descriptor translation table format for address translation.
> -
> -  About the M4U Hardware Block Diagram, please check below:
> -
> -              EMI (External Memory Interface)
> -               |
> -              m4u (Multimedia Memory Management Unit)
> -               |
> -          +--------+
> -          |        |
> -      gals0-rx   gals1-rx    (Global Async Local Sync rx)
> -          |        |
> -          |        |
> -      gals0-tx   gals1-tx    (Global Async Local Sync tx)
> -          |        |          Some SoCs may have GALS.
> -          +--------+
> -               |
> -           SMI Common(Smart Multimedia Interface Common)
> -               |
> -       +----------------+-------
> -       |                |
> -       |             gals-rx        There may be GALS in some larbs.
> -       |                |
> -       |                |
> -       |             gals-tx
> -       |                |
> -   SMI larb0        SMI larb1   ... SoCs have several SMI local arbiter(larb).
> -   (display)         (vdec)
> -       |                |
> -       |                |
> - +-----+-----+     +----+----+
> - |     |     |     |    |    |
> - |     |     |...  |    |    |  ... There are different ports in each larb.
> - |     |     |     |    |    |
> -OVL0 RDMA0 WDMA0  MC   PP   VLD
> -
> -  As above, The Multimedia HW will go through SMI and M4U while it
> -access EMI. SMI is a bridge between m4u and the Multimedia HW. It contain
> -smi local arbiter and smi common. It will control whether the Multimedia
> -HW should go though the m4u for translation or bypass it and talk
> -directly with EMI. And also SMI help control the power domain and clocks for
> -each local arbiter.
> -  Normally we specify a local arbiter(larb) for each multimedia HW
> -like display, video decode, and camera. And there are different ports
> -in each larb. Take a example, There are many ports like MC, PP, VLD in the
> -video decode local arbiter, all these ports are according to the video HW.
> -  In some SoCs, there may be a GALS(Global Async Local Sync) module between
> -smi-common and m4u, and additional GALS module between smi-larb and
> -smi-common. GALS can been seen as a "asynchronous fifo" which could help
> -synchronize for the modules in different clock frequency.
> -
> -Required properties:
> -- compatible : must be one of the following string:
> -	"mediatek,mt2701-m4u" for mt2701 which uses generation one m4u HW.
> -	"mediatek,mt2712-m4u" for mt2712 which uses generation two m4u HW.
> -	"mediatek,mt6779-m4u" for mt6779 which uses generation two m4u HW.
> -	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
> -						     generation one m4u HW.
> -	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
> -	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
> -- reg : m4u register base and size.
> -- interrupts : the interrupt of m4u.
> -- clocks : must contain one entry for each clock-names.
> -- clock-names : Only 1 optional clock:
> -  - "bclk": the block clock of m4u.
> -  Here is the list which require this "bclk":
> -  - mt2701, mt2712, mt7623 and mt8173.
> -  Note that m4u use the EMI clock which always has been enabled before kernel
> -  if there is no this "bclk".
> -- mediatek,larbs : List of phandle to the local arbiters in the current Socs.
> -	Refer to bindings/memory-controllers/mediatek,smi-larb.txt. It must sort
> -	according to the local arbiter index, like larb0, larb1, larb2...
> -- iommu-cells : must be 1. This is the mtk_m4u_id according to the HW.
> -	Specifies the mtk_m4u_id as defined in
> -	dt-binding/memory/mt2701-larb-port.h for mt2701, mt7623
> -	dt-binding/memory/mt2712-larb-port.h for mt2712,
> -	dt-binding/memory/mt6779-larb-port.h for mt6779,
> -	dt-binding/memory/mt8173-larb-port.h for mt8173, and
> -	dt-binding/memory/mt8183-larb-port.h for mt8183.
> -
> -Example:
> -	iommu: iommu@10205000 {
> -		compatible = "mediatek,mt8173-m4u";
> -		reg = <0 0x10205000 0 0x1000>;
> -		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
> -		clocks = <&infracfg CLK_INFRA_M4U>;
> -		clock-names = "bclk";
> -		mediatek,larbs = <&larb0 &larb1 &larb2 &larb3 &larb4 &larb5>;
> -		#iommu-cells = <1>;
> -	};
> -
> -Example for a client device:
> -	display {
> -		compatible = "mediatek,mt8173-disp";
> -		iommus = <&iommu M4U_PORT_DISP_OVL0>,
> -			 <&iommu M4U_PORT_DISP_RDMA0>;
> -		...
> -	};
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> new file mode 100644
> index 000000000000..eae773ad53a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek IOMMU Architecture Implementation
> +
> +maintainers:
> +  - Yong Wu <yong.wu@mediatek.com>
> +
> +description: |+
> +  Some MediaTek SOCs contain a Multimedia Memory Management Unit (M4U), and
> +  this M4U have two generations of HW architecture. Generation one uses flat
> +  pagetable, and only supports 4K size page mapping. Generation two uses the
> +  ARM Short-Descriptor translation table format for address translation.
> +
> +  About the M4U Hardware Block Diagram, please check below:
> +
> +                EMI (External Memory Interface)
> +                 |
> +                m4u (Multimedia Memory Management Unit)
> +                 |
> +            +--------+
> +            |        |
> +        gals0-rx   gals1-rx    (Global Async Local Sync rx)
> +            |        |
> +            |        |
> +        gals0-tx   gals1-tx    (Global Async Local Sync tx)
> +            |        |          Some SoCs may have GALS.
> +            +--------+
> +                 |
> +             SMI Common(Smart Multimedia Interface Common)
> +                 |
> +         +----------------+-------
> +         |                |
> +         |             gals-rx        There may be GALS in some larbs.
> +         |                |
> +         |                |
> +         |             gals-tx
> +         |                |
> +     SMI larb0        SMI larb1   ... SoCs have several SMI local arbiter(larb).
> +     (display)         (vdec)
> +         |                |
> +         |                |
> +   +-----+-----+     +----+----+
> +   |     |     |     |    |    |
> +   |     |     |...  |    |    |  ... There are different ports in each larb.
> +   |     |     |     |    |    |
> +  OVL0 RDMA0 WDMA0  MC   PP   VLD
> +
> +  As above, The Multimedia HW will go through SMI and M4U while it
> +  access EMI. SMI is a bridge between m4u and the Multimedia HW. It contain
> +  smi local arbiter and smi common. It will control whether the Multimedia
> +  HW should go though the m4u for translation or bypass it and talk
> +  directly with EMI. And also SMI help control the power domain and clocks for
> +  each local arbiter.
> +
> +  Normally we specify a local arbiter(larb) for each multimedia HW
> +  like display, video decode, and camera. And there are different ports
> +  in each larb. Take a example, There are many ports like MC, PP, VLD in the
> +  video decode local arbiter, all these ports are according to the video HW.
> +
> +  In some SoCs, there may be a GALS(Global Async Local Sync) module between
> +  smi-common and m4u, and additional GALS module between smi-larb and
> +  smi-common. GALS can been seen as a "asynchronous fifo" which could help
> +  synchronize for the modules in different clock frequency.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-m4u # mt2701 generation one HW
> +          - mediatek,mt2712-m4u # mt2712 generation two HW
> +          - mediatek,mt6779-m4u # mt6779 generation two HW
> +          - mediatek,mt8173-m4u # mt8173 generation two HW
> +          - mediatek,mt8183-m4u # mt8183 generation two HW
> +
> +      - description: mt7623 generation one HW
> +        items:
> +          - const: mediatek,mt7623-m4u
> +          - const: mediatek,mt2701-m4u
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      bclk is optional. here is the list which require this bclk:
> +      mt2701, mt2712, mt7623 and mt8173.

Similarly to my comment in other patch, this should be part of schema
within 'if-then'.

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
