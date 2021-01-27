Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C867B30649E
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 21:00:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 88392228E7;
	Wed, 27 Jan 2021 20:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16pVFzkzXyQd; Wed, 27 Jan 2021 20:00:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E6BC622E94;
	Wed, 27 Jan 2021 20:00:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2805C013A;
	Wed, 27 Jan 2021 20:00:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A79FC013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 412E286277
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qRCt429yrsYZ for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 20:00:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 075FE861D7
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:00:50 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id n7so3482190oic.11
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 12:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rvRcBguN/96Hnzr6bI5Ag8OoiWzcrVtrxH3mL5ZfZ1o=;
 b=CcsHOrmXc/iJ+AHPlOUer0i77wq2zz8HqSHHS4q2NIgzFZ1BbIBFY7vTfOT28qjt+s
 iyBRfb2kJKQ+cEeeDtAafTMaK+/9AtZ4Z/1ud/K6wXWW/r5aMiGJpjwxq9Hv5fI945D/
 vWXmmEwl/smu6P+Ec7LgB+mh//FFYvoJCYdZs/y/9ya+Zd5lW69WcUg5/To9gB7Kvm6r
 oYg2BGPXdO+o2XaLEYvNxalk/Fw3WI8G3IAd0SAjSLqKCiAasNLuNNTrPJTV+wiCPdLM
 NLHssuAXaIPvPPJHcoliMDXSlcntqyGeQoTUFh2xYXV76NDT6B7H8fqv3xvz1AeD2iaL
 SOVw==
X-Gm-Message-State: AOAM530/wiMA7b0Msoj88FRyuq/iwUTc3yWzV4qnZ6yDETGYhQqnL1fI
 LWy6HSffWJuxqA3Jkfxs6A==
X-Google-Smtp-Source: ABdhPJwMBL6J6h0Mdgp/mb0/qiCzzg22X3N+4Non2UUG6xKNUgZwnVj+ExesrC+lIcTiArkT8riPBA==
X-Received: by 2002:aca:fcc5:: with SMTP id a188mr4342745oii.169.1611777649178; 
 Wed, 27 Jan 2021 12:00:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z4sm625941ooz.5.2021.01.27.12.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 12:00:47 -0800 (PST)
Received: (nullmailer pid 2143114 invoked by uid 1000);
 Wed, 27 Jan 2021 20:00:46 -0000
Date: Wed, 27 Jan 2021 14:00:46 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2] of/device: Update dma_range_map only when dev has
 valid dma-ranges
Message-ID: <20210127200046.GA2142347@robh.at.kernel.org>
References: <20210119105203.15530-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119105203.15530-1-yong.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
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

On Tue, 19 Jan 2021 18:52:03 +0800, Yong Wu wrote:
> The commit e0d072782c73 ("dma-mapping: introduce DMA range map,
> supplanting dma_pfn_offset") always update dma_range_map even though it was
> already set, like in the sunxi_mbus driver. the issue is reported at [1].
> This patch avoid this(Updating it only when dev has valid dma-ranges).
> 
> Meanwhile, dma_range_map contains the devices' dma_ranges information,
> This patch moves dma_range_map before of_iommu_configure. The iommu
> driver may need to know the dma_address requirements of its iommu
> consumer devices.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/5c7946f3-b56e-da00-a750-be097c7ceb32@arm.com/
> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Frank Rowand <frowand.list@gmail.com>
> Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset"),
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/device.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Applied, thanks!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
