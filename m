Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE94622E1
	for <lists.iommu@lfdr.de>; Mon, 29 Nov 2021 22:03:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F0D640366;
	Mon, 29 Nov 2021 21:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VdWvWtYLYBu; Mon, 29 Nov 2021 21:03:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 687A3402E5;
	Mon, 29 Nov 2021 21:03:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45705C000A;
	Mon, 29 Nov 2021 21:03:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EEC1C000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 21:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F334401F7
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 21:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qt1fOdeFqnak for <iommu@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 21:03:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC677401BD
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 21:03:49 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 7so36953651oip.12
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 13:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/C6cXQ6I+DvazsHvLzn5HCwkUIY2LS9zWKJ6486tyI4=;
 b=svru/FCsh1XyC0djGWg2v3aeGna+7/t05lwCZDHnpI7sCK2CN6r4KajNcMhtVPD3st
 bPEqau+U8yuK/8uBpRuMzoxAWzhR9lmIbwIaksLYSlMmxVFt7jg40Xf8Tt146j8YJ0by
 ZdQ3QmG31SvSHNqzkg7QA1F/tSnLkmrJ5N4WyQGu3jLTiQJG40PqbUmBDRj5yz0PId2B
 1+8ZWQaj+rRYV4GBZbyM+mXVpY0+7hmHUwpMxjbodnT4FTyOjA/1C3XATZWkZWW1/cOZ
 8mf+c78YuyS/IMlPp4QDKeX3t2TN7ezyItPO9Iy+difB1SapbdbRXfexGsB7G6fJvHtz
 RvCg==
X-Gm-Message-State: AOAM530yMMDnp9CEm5EsRLyhrN5pEdeRWV9EscTTADqprt7MBrEkOBfa
 3vClDn+PEnE9Wgter4IU7g==
X-Google-Smtp-Source: ABdhPJxW4VjLyk3MQTRUim1PMjrobF39u9tydkFlN1RwWqwCmVAO2R23KjnNVaBi2zD3XKJaTZj55g==
X-Received: by 2002:a05:6808:170e:: with SMTP id
 bc14mr467373oib.86.1638219828812; 
 Mon, 29 Nov 2021 13:03:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o26sm2829465otj.14.2021.11.29.13.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 13:03:47 -0800 (PST)
Received: (nullmailer pid 605655 invoked by uid 1000);
 Mon, 29 Nov 2021 21:03:46 -0000
Date: Mon, 29 Nov 2021 15:03:46 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
Message-ID: <YaVAMiWvGotJSjn2@robh.at.kernel.org>
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
 <20211112131231.3683098-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112131231.3683098-3-thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Fri, 12 Nov 2021 14:12:29 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra234 SoC comes with one single-instance ARM SMMU used by
> isochronous memory clients and two dual-instance ARM SMMUs used by non-
> isochronous memory clients.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
