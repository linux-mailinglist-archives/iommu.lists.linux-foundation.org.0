Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 453AC3704B3
	for <lists.iommu@lfdr.de>; Sat,  1 May 2021 03:34:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B74C6FA62;
	Sat,  1 May 2021 01:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWk2kqcvm5qU; Sat,  1 May 2021 01:34:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E456F986;
	Sat,  1 May 2021 01:34:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43630C0001;
	Sat,  1 May 2021 01:34:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED234C0001
 for <iommu@lists.linux-foundation.org>; Sat,  1 May 2021 01:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0E2440186
 for <iommu@lists.linux-foundation.org>; Sat,  1 May 2021 01:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3F8zPpNEeg3 for <iommu@lists.linux-foundation.org>;
 Sat,  1 May 2021 01:34:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBED04014E
 for <iommu@lists.linux-foundation.org>; Sat,  1 May 2021 01:34:52 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 p6-20020a4adc060000b02901f9a8fc324fso37091oov.10
 for <iommu@lists.linux-foundation.org>; Fri, 30 Apr 2021 18:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zUXpAoI/KzwgrARmWw+voeZ0INm/PtgvJecf6NLxWtI=;
 b=Vct5Mim7bPCp5RqBaWBh9AHdRxh/daO8AP18g7OHiKLuQ8dA0F3REbpSp7C5XlqIfT
 08wz5+cjaTD1BswSN3lgkrdIj1YneMA4MLnh8iMNLIc3EED4g1LFiPtik3pw+3tNARY6
 fOCRfRjjFRg8jh3Sm5HeE59e3QuRD4H0IbHTFdRDR3C/mVUDRWwlDBQKj3Gz4ThssTq1
 zqLrTg6ibbSl0sgf98Nx05irW3UDH3pI0Unp2l28dL4k1rniATeassPR7tZclFHSid+4
 CswhmgppsiRK4cdFe6f+naKdild12j2cF1CrP8qEkcmcIFCdpHGB2yb80nCi4f6iMnh7
 3v5g==
X-Gm-Message-State: AOAM533dthxn9z8zlSMxm3efUWHhq6LL/crzetJ0uRkL0Xk2OO6PYsGF
 BSrL79vSH6WmAWgvDLLkpg==
X-Google-Smtp-Source: ABdhPJxUbLnwv8w2KIA2KErjdTKoBtPoNxqe9/Doqh2tks/IILgB7WLqP++X9JxZZnzRy/SkywjjVw==
X-Received: by 2002:a4a:d781:: with SMTP id c1mr6861569oou.44.1619832891658;
 Fri, 30 Apr 2021 18:34:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a23sm56732otf.47.2021.04.30.18.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 18:34:50 -0700 (PDT)
Received: (nullmailer pid 121538 invoked by uid 1000);
 Sat, 01 May 2021 01:34:48 -0000
Date: Fri, 30 Apr 2021 20:34:48 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: iommu: rockchip: Add compatible for v2
Message-ID: <20210501013448.GA4001859@robh.at.kernel.org>
References: <20210422141602.350746-1-benjamin.gaignard@collabora.com>
 <20210422141602.350746-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422141602.350746-3-benjamin.gaignard@collabora.com>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 kernel@collabora.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Thu, Apr 22, 2021 at 04:16:00PM +0200, Benjamin Gaignard wrote:
> Add compatible for the second version of IOMMU hardware block.
> RK356x IOMMU can also be link to a power domain.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 2:
>  - Add power-domains property
> 
>  .../devicetree/bindings/iommu/rockchip,iommu.yaml          | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> index 0db208cf724a..e54353ccd1ec 100644
> --- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> @@ -19,7 +19,9 @@ description: |+
>  
>  properties:
>    compatible:
> -    const: rockchip,iommu
> +    enum:
> +      - rockchip,iommu
> +      - rockchip,iommu-v2

This should be SoC specific.

>  
>    reg:
>      minItems: 1
> @@ -46,6 +48,9 @@ properties:
>    "#iommu-cells":
>      const: 0
>  
> +  power-domains:
> +    maxItems: 1
> +
>    rockchip,disable-mmu-reset:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description: |
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
