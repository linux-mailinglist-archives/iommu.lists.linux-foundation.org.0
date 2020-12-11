Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE982D6E7E
	for <lists.iommu@lfdr.de>; Fri, 11 Dec 2020 04:26:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C2CCB86CDE;
	Fri, 11 Dec 2020 03:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KbrSL2goLCO; Fri, 11 Dec 2020 03:26:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A227C86C08;
	Fri, 11 Dec 2020 03:26:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B22CC1D9F;
	Fri, 11 Dec 2020 03:26:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD487C013B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Dec 2020 03:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C338C22CB0
 for <iommu@lists.linux-foundation.org>; Fri, 11 Dec 2020 03:26:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdWijR3p15d7 for <iommu@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 03:26:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by silver.osuosl.org (Postfix) with ESMTPS id CBC7E22BCC
 for <iommu@lists.linux-foundation.org>; Fri, 11 Dec 2020 03:26:51 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id k2so8311131oic.13
 for <iommu@lists.linux-foundation.org>; Thu, 10 Dec 2020 19:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4pSkh7E1xr7wTWhVvXeOpIs5QlUy2hJdM1nCPWkeLMQ=;
 b=WlJYKErSmFxokVxPZda61gMvhhpS5WY2t5B55TjTFszYUs6Xb77+u2l4C1E12gdeva
 olPy7pFlhe3pCrm8U8YhfvjFqv4Va872Vx2goYbC9t5dDkFunLhrbZANTKOHbAjlJSkw
 woncwBNE4FTT75Y8W4VsOGRo1fIGz6hp4RHv8RmPzxbj3RujIrg2UEN8jLYtf7R26ZgG
 +TOQe2kESp5VEklVhyx+KXw7ED4ZzG1J+EZtdThuKThOnyn0BkJXQRBjY4LZ6FId8hHM
 OC3KVa0IWZYFFYY2ft4Sg8DE3Ft0xEekjxGDZWEaAkh0nZTtWgMjJ0Sjf6v7yhJhw7BL
 5K5g==
X-Gm-Message-State: AOAM530lFuyTSpHPaoUmcRCwt5DBhe5te2ZlciGYcttfaqeeF+Qzh0Rs
 IdQFcnRRuet3jsXDJ9oabw==
X-Google-Smtp-Source: ABdhPJx5205LO26MqKp6Ub/kuVoybUxxhoy/4Vq3DLkmE1Wtdx0C35k3JVlobELwVo+TakeaqYmHyg==
X-Received: by 2002:aca:5204:: with SMTP id g4mr7858444oib.91.1607657211132;
 Thu, 10 Dec 2020 19:26:51 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q18sm1473097ood.35.2020.12.10.19.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:26:50 -0800 (PST)
Received: (nullmailer pid 3575040 invoked by uid 1000);
 Fri, 11 Dec 2020 03:26:48 -0000
Date: Thu, 10 Dec 2020 21:26:48 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 05/27] dt-bindings: memory: mediatek: Rename header
 guard for SMI header file
Message-ID: <20201211032648.GA3575010@robh.at.kernel.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-6-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 iommu@lists.linux-foundation.org, Tomasz Figa <tfiga@google.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Evan Green <evgreen@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
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

On Wed, 09 Dec 2020 16:00:40 +0800, Yong Wu wrote:
> Only rename the header guard for all the SoC larb port header file.
> No funtional change.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  include/dt-bindings/memory/mt2701-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt2712-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt6779-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt8167-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt8173-larb-port.h | 4 ++--
>  include/dt-bindings/memory/mt8183-larb-port.h | 4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
