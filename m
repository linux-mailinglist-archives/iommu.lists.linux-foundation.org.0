Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AED48234C8B
	for <lists.iommu@lfdr.de>; Fri, 31 Jul 2020 22:58:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 51AAA86C56;
	Fri, 31 Jul 2020 20:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hb7wBt-mfhZq; Fri, 31 Jul 2020 20:58:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9CF586B31;
	Fri, 31 Jul 2020 20:58:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D87CDC004D;
	Fri, 31 Jul 2020 20:58:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3282C004D
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 20:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B9FDA88802
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 20:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0AK4ci+y-wP for <iommu@lists.linux-foundation.org>;
 Fri, 31 Jul 2020 20:58:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D30D6887EB
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 20:58:07 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id z3so16226902ilh.3
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 13:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rcyOW7qIuRoMGsE2+TVNMGv+PyvtkKSZN/cGvDKDZM8=;
 b=VkTVaAXJUrGRdCgVEhwXHs5lHY14/C/QMMTS6XL59s9nd3IfYAVxtZhFr7vEuxu0yR
 eUNYqW1pSISmwcBc1Y5kBtI5WvAVdaAwoBj+ar3ffIQbw3t0jY7kDsA7g7as5gFeU3CL
 OQNq2Du+u/LW4nAE3Yv8QrylIoZYFe4UbV5F9FgkC7qZ/vJnv9d6nOcOSitZjUTNuuz0
 /SVTFdAerdLfgvfg8B7FUYt5M4JfCoeoKbPRzjpas70q4HHaPhO2QCHUuFZZCUct1LfK
 AsubdOLMbFlh78QqptlYqCOFGlHUd/9DL/RSr7/nzuDl7NL9A3qqRu9pvQrkWZs7hAz1
 j10A==
X-Gm-Message-State: AOAM5323tvUZeKAm7j6r1aUAF5a8fp+kpvgGlPhrowX4KpkCEpeF50KY
 nViVDiHWfQEEvZfI1mGMlA==
X-Google-Smtp-Source: ABdhPJxmGDIK2n0F7LcntLADTKoB+yOnyNpREExJ0pYlohQMXlRlUSjxE4KX9ssiGMxjIpXnztV4ag==
X-Received: by 2002:a92:c5c1:: with SMTP id s1mr5514077ilt.144.1596229087153; 
 Fri, 31 Jul 2020 13:58:07 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id v5sm5213848ilg.88.2020.07.31.13.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 13:58:05 -0700 (PDT)
Received: (nullmailer pid 774077 invoked by uid 1000);
 Fri, 31 Jul 2020 20:58:04 -0000
Date: Fri, 31 Jul 2020 14:58:04 -0600
From: Rob Herring <robh@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [RFC v2 4/5] dt-bindings: of: Add plumbing for restricted DMA pool
Message-ID: <20200731205804.GB756942@bogus>
References: <20200728050140.996974-1-tientzu@chromium.org>
 <20200728050140.996974-5-tientzu@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728050140.996974-5-tientzu@chromium.org>
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 saravanak@google.com, frowand.list@gmail.com, suzuki.poulose@arm.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, iommu@lists.linux-foundation.org,
 drinkcat@chromium.org, dan.j.williams@intel.com, treding@nvidia.com,
 robin.murphy@arm.com, hch@lst.de
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

On Tue, Jul 28, 2020 at 01:01:39PM +0800, Claire Chang wrote:
> Introduce the new compatible string, device-swiotlb-pool, for restricted
> DMA. One can specify the address and length of the device swiotlb memory
> region by device-swiotlb-pool in the device tree.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  .../reserved-memory/reserved-memory.txt       | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index 4dd20de6977f..78850896e1d0 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -51,6 +51,24 @@ compatible (optional) - standard definition
>            used as a shared pool of DMA buffers for a set of devices. It can
>            be used by an operating system to instantiate the necessary pool
>            management subsystem if necessary.
> +        - device-swiotlb-pool: This indicates a region of memory meant to be

swiotlb is a Linux thing. The binding should be independent.

> +          used as a pool of device swiotlb buffers for a given device. When
> +          using this, the no-map and reusable properties must not be set, so the
> +          operating system can create a virtual mapping that will be used for
> +          synchronization. Also, there must be a restricted-dma property in the
> +          device node to specify the indexes of reserved-memory nodes. One can
> +          specify two reserved-memory nodes in the device tree. One with
> +          shared-dma-pool to handle the coherent DMA buffer allocation, and
> +          another one with device-swiotlb-pool for regular DMA to/from system
> +          memory, which would be subject to bouncing. The main purpose for
> +          restricted DMA is to mitigate the lack of DMA access control on
> +          systems without an IOMMU, which could result in the DMA accessing the
> +          system memory at unexpected times and/or unexpected addresses,
> +          possibly leading to data leakage or corruption. The feature on its own
> +          provides a basic level of protection against the DMA overwriting buffer
> +          contents at unexpected times. However, to protect against general data
> +          leakage and system memory corruption, the system needs to provide a
> +          way to restrict the DMA to a predefined memory region.

I'm pretty sure we already support per device carveouts and I don't 
understand how this is different.

What is the last sentence supposed to imply? You need an IOMMU?

>          - vendor specific string in the form <vendor>,[<device>-]<usage>
>  no-map (optional) - empty property
>      - Indicates the operating system must not create a virtual mapping
> @@ -117,6 +135,16 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  			compatible = "acme,multimedia-memory";
>  			reg = <0x77000000 0x4000000>;
>  		};
> +
> +		wifi_coherent_mem_region: wifi_coherent_mem_region {
> +			compatible = "shared-dma-pool";
> +			reg = <0x50000000 0x400000>;
> +		};
> +
> +		wifi_device_swiotlb_region: wifi_device_swiotlb_region {
> +			compatible = "device-swiotlb-pool";
> +			reg = <0x50400000 0x4000000>;
> +		};
>  	};
>  
>  	/* ... */
> @@ -135,4 +163,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  		memory-region = <&multimedia_reserved>;
>  		/* ... */
>  	};
> +
> +	pcie_wifi: pcie_wifi@0,0 {
> +		memory-region = <&wifi_coherent_mem_region>,
> +			 <&wifi_device_swiotlb_region>;
> +		restricted-dma = <0>, <1>;
> +		/* ... */
> +	};
>  };
> -- 
> 2.28.0.rc0.142.g3c755180ce-goog
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
