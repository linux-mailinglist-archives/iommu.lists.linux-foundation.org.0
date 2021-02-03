Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3F230E153
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 18:44:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 151AC871A5;
	Wed,  3 Feb 2021 17:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JoiVbzpiLbuT; Wed,  3 Feb 2021 17:44:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC916871A2;
	Wed,  3 Feb 2021 17:44:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1272C013A;
	Wed,  3 Feb 2021 17:44:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD27EC013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 17:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A82E4861CE
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 17:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoBzeSR0nCCK for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 17:44:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CFB0485FFD
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=9KPYi1ZkyDHL7NUtRviqQ04hmYB82hAl0iGOYO+e6lE=; b=n2V4w7nv98vN71CUuyoViod1A8
 VZsyXrEwuYNtnxrBrW71oyF0c+dby6fBxgSSKt8o398+DZFnniydLWvY8vPctZubrpEWm7xrVeBrP
 Gr2bFKiZdVQY4N+x6pt4vgVBNMnBeGCf+RcbZNB7BfESglpqbiHXFXoDmwJC5WnUsohcHgCoRZ+nq
 FY1+CyDAsx+O+CxA5c8fx5AJEIau7MEq3d7g+O/5pJS7D7crdGe8LJsephVEA2o8it+p7y9n+QqOG
 /9yyAXCAPnwGaui1UGWIA9zyJXE9v0WTNteA16Df3Q1nT9feVz3Wv3xbBv2O3CmHHTUcOmDWuqaHS
 3DH+fk0w==;
Received: from [2601:1c0:6280:3f0::aec2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7MCh-0001xN-Gk; Wed, 03 Feb 2021 17:44:35 +0000
Subject: Re: [PATCH v3 2/2] iommu: add Unisoc iommu basic driver
To: Chunyan Zhang <zhang.lyra@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Joerg Roedel <joro@8bytes.org>
References: <20210203090727.789939-1-zhang.lyra@gmail.com>
 <20210203090727.789939-3-zhang.lyra@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eb55a1de-2816-9029-b642-b3067e311417@infradead.org>
Date: Wed, 3 Feb 2021 09:44:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210203090727.789939-3-zhang.lyra@gmail.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, Sheng Xu <sheng.xu@unisoc.com>,
 iommu@lists.linux-foundation.org, Baolin Wang <baolin.wang7@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>
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

On 2/3/21 1:07 AM, Chunyan Zhang wrote:
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 192ef8f61310..99e7712f3903 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -408,4 +408,16 @@ config VIRTIO_IOMMU
>  
>  	  Say Y here if you intend to run this kernel as a guest.
>  
> +config SPRD_IOMMU
> +	tristate "Unisoc IOMMU Support"
> +	depends on ARCH_SPRD || COMPILE_TEST
> +	select IOMMU_API
> +	help
> +	  Support for IOMMU on Unisoc's SoCs, this iommu can be used by

	s/iommu/IOMMU/ please

> +	  Unisoc's multimedia devices, such as display, Image codec(jpeg)
> +	  and a few signal processors, including VSP(video), GSP(graphic),
> +	  ISP(image), and CPP(camera pixel processor), etc.
> +
> +	  Say Y here if you want to use the multimedia devices listed above.


-- 
~Randy
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
