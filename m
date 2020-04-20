Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0871B15E5
	for <lists.iommu@lfdr.de>; Mon, 20 Apr 2020 21:26:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 315F886D42;
	Mon, 20 Apr 2020 19:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5+iZ+AOLF7F4; Mon, 20 Apr 2020 19:26:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C19186303;
	Mon, 20 Apr 2020 19:26:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C6D9C0177;
	Mon, 20 Apr 2020 19:26:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 506CFC0177
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 19:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4766C86372
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 19:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVIuBlvYVGc7 for <iommu@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 19:26:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 593AC86303
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 19:26:49 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z17so9186808oto.4
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 12:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j9xfL2w8O2+x1JiWhNil24AxtpnMDKkYvhGBulASv3U=;
 b=syBwFA7zo4kVGlwH3NfQn/Jj8jhB9c0dvfeNlOw38Kd10HMJsZHvmXxG0xboNrsYuL
 lE9zHvfk2te4tTLt9smQAvK1bCvsLnMWUVYfPG9D3pN24IkmBIJhsxlMuCjaN3WPmxdt
 0zCxoe6FlSV0oNgJv2DJm6HaHwQgwShEDaPCUcJj+2PyUE72POwCg23sYA5D1vNDGR/M
 lczK08Svkry+s5GWWElqDnBp/VwydzQ1OLX85f9/ReekmAtgVZH1bDMXRAkXex1EcJp/
 XvtjlBMhxjpaVRfd0bMG+2ojZGfN9JOt0Cy5txorC+6kksCNiGAEvjsIbPr35SmoMMzr
 KRFw==
X-Gm-Message-State: AGi0PuaXidpHt99s7VJ+5V6hULUD7AtoYQYjVy2kgtVYS+xy33h11gdf
 nc2XydJ1zzotTUA9s5r3Ag==
X-Google-Smtp-Source: APiQypKKF8dAmw9Exvau0ynCJcXVWhHFVCTRqCVX/bjn7pDb+/jZp7ljKJ6BSODSDuqEdJpMZaP8EQ==
X-Received: by 2002:a05:6830:1444:: with SMTP id
 w4mr11230612otp.139.1587410808451; 
 Mon, 20 Apr 2020 12:26:48 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p5sm83461oih.20.2020.04.20.12.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 12:26:47 -0700 (PDT)
Received: (nullmailer pid 18938 invoked by uid 1000);
 Mon, 20 Apr 2020 19:26:46 -0000
Date: Mon, 20 Apr 2020 14:26:46 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] dt-bndings: iommu: renesas,ipmmu-vmsa: convert to
 json-schema
Message-ID: <20200420192646.GA9603@bogus>
References: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On Mon, Apr 13, 2020 at 07:25:33PM +0900, Yoshihiro Shimoda wrote:
> Convert Renesas VMSA-Compatible IOMMU bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../bindings/iommu/renesas,ipmmu-vmsa.txt          | 73 ------------------
>  .../bindings/iommu/renesas,ipmmu-vmsa.yaml         | 90 ++++++++++++++++++++++
>  2 files changed, 90 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> deleted file mode 100644
> index 020d6f2..00000000
> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -* Renesas VMSA-Compatible IOMMU
> -
> -The IPMMU is an IOMMU implementation compatible with the ARM VMSA page tables.
> -It provides address translation for bus masters outside of the CPU, each
> -connected to the IPMMU through a port called micro-TLB.
> -
> -
> -Required Properties:
> -
> -  - compatible: Must contain SoC-specific and generic entry below in case
> -    the device is compatible with the R-Car Gen2 VMSA-compatible IPMMU.
> -
> -    - "renesas,ipmmu-r8a73a4" for the R8A73A4 (R-Mobile APE6) IPMMU.
> -    - "renesas,ipmmu-r8a7743" for the R8A7743 (RZ/G1M) IPMMU.
> -    - "renesas,ipmmu-r8a7744" for the R8A7744 (RZ/G1N) IPMMU.
> -    - "renesas,ipmmu-r8a7745" for the R8A7745 (RZ/G1E) IPMMU.
> -    - "renesas,ipmmu-r8a774a1" for the R8A774A1 (RZ/G2M) IPMMU.
> -    - "renesas,ipmmu-r8a774b1" for the R8A774B1 (RZ/G2N) IPMMU.
> -    - "renesas,ipmmu-r8a774c0" for the R8A774C0 (RZ/G2E) IPMMU.
> -    - "renesas,ipmmu-r8a7790" for the R8A7790 (R-Car H2) IPMMU.
> -    - "renesas,ipmmu-r8a7791" for the R8A7791 (R-Car M2-W) IPMMU.
> -    - "renesas,ipmmu-r8a7793" for the R8A7793 (R-Car M2-N) IPMMU.
> -    - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
> -    - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
> -    - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
> -    - "renesas,ipmmu-r8a77965" for the R8A77965 (R-Car M3-N) IPMMU.
> -    - "renesas,ipmmu-r8a77970" for the R8A77970 (R-Car V3M) IPMMU.
> -    - "renesas,ipmmu-r8a77980" for the R8A77980 (R-Car V3H) IPMMU.
> -    - "renesas,ipmmu-r8a77990" for the R8A77990 (R-Car E3) IPMMU.
> -    - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
> -    - "renesas,ipmmu-vmsa" for generic R-Car Gen2 or RZ/G1 VMSA-compatible
> -			   IPMMU.
> -
> -  - reg: Base address and size of the IPMMU registers.
> -  - interrupts: Specifiers for the MMU fault interrupts. For instances that
> -    support secure mode two interrupts must be specified, for non-secure and
> -    secure mode, in that order. For instances that don't support secure mode a
> -    single interrupt must be specified. Not required for cache IPMMUs.
> -
> -  - #iommu-cells: Must be 1.
> -
> -Optional properties:
> -
> -  - renesas,ipmmu-main: reference to the main IPMMU instance in two cells.
> -    The first cell is a phandle to the main IPMMU and the second cell is
> -    the interrupt bit number associated with the particular cache IPMMU device.
> -    The interrupt bit number needs to match the main IPMMU IMSSTR register.
> -    Only used by cache IPMMU instances.
> -
> -
> -Each bus master connected to an IPMMU must reference the IPMMU in its device
> -node with the following property:
> -
> -  - iommus: A reference to the IPMMU in two cells. The first cell is a phandle
> -    to the IPMMU and the second cell the number of the micro-TLB that the
> -    device is connected to.
> -
> -
> -Example: R8A7791 IPMMU-MX and VSP1-D0 bus master
> -
> -	ipmmu_mx: mmu@fe951000 {
> -		compatible = "renasas,ipmmu-r8a7791", "renasas,ipmmu-vmsa";
> -		reg = <0 0xfe951000 0 0x1000>;
> -		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 221 IRQ_TYPE_LEVEL_HIGH>;
> -		#iommu-cells = <1>;
> -	};
> -
> -	vsp@fe928000 {
> -		...
> -		iommus = <&ipmmu_mx 13>;
> -		...
> -	};
> diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> new file mode 100644
> index 00000000..3820b10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/renesas,ipmmu-vmsa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas VMSA-Compatible IOMMU
> +
> +maintainers:
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +description:
> +  The IPMMU is an IOMMU implementation compatible with the ARM VMSA page tables.
> +  It provides address translation for bus masters outside of the CPU, each
> +  connected to the IPMMU through a port called micro-TLB.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,ipmmu-r8a7743  # RZ/G1M
> +              - renesas,ipmmu-r8a7744  # RZ/G1N
> +              - renesas,ipmmu-r8a7745  # RZ/G1E
> +              - renesas,ipmmu-r8a7790  # R-Car H2
> +              - renesas,ipmmu-r8a7791  # R-Car M2-W
> +              - renesas,ipmmu-r8a7793  # R-Car M2-N
> +              - renesas,ipmmu-r8a7794  # R-Car E2
> +              - renesas,ipmmu-r8a7795  # R-Car H3
> +          - const: renesas,ipmmu-vmsa  # R-Car Gen2 or RZ/G1
> +      - items:
> +          - enum:
> +              - renesas,ipmmu-r8a73a4  # R-Mobile APE6
> +              - renesas,ipmmu-r8a774a1 # RZ/G2M
> +              - renesas,ipmmu-r8a774b1 # RZ/G2N
> +              - renesas,ipmmu-r8a774c0 # RZ/G2E
> +              - renesas,ipmmu-r8a7796  # R-Car M3-W
> +              - renesas,ipmmu-r8a77965 # R-Car M3-N
> +              - renesas,ipmmu-r8a77970 # R-Car V3M
> +              - renesas,ipmmu-r8a77980 # R-Car V3H
> +              - renesas,ipmmu-r8a77990 # R-Car E3
> +              - renesas,ipmmu-r8a77995 # R-Car D3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Specifiers for the MMU fault interrupts. For instances that support
> +      secure mode two interrupts must be specified, for non-secure and secure
> +      mode, in that order. For instances that don't support secure mode a
> +      single interrupt must be specified. Not required for cache IPMMUs.
> +
> +  '#iommu-cells':
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  renesas,ipmmu-main:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Reference to the main IPMMU instance in two cells. The first cell is
> +      a phandle to the main IPMMU and the second cell is the interrupt bit

The cell counting is wrong here. We don't count the phandle as a cell. 
It's a 'phandle plus 1 cell'.

Same goes for 'iommus'.

> +      number associated with the particular cache IPMMU device. The interrupt
> +      bit number needs to match the main IPMMU IMSSTR register. Only used by
> +      cache IPMMU instances.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#iommu-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7791-sysc.h>
> +
> +    ipmmu_mx: mmu@fe951000 {

iommu@...

> +        compatible = "renasas,ipmmu-r8a7791", "renasas,ipmmu-vmsa";
> +        reg = <0xfe951000 0x1000>;
> +        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
> +        #iommu-cells = <1>;
> +    };
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
