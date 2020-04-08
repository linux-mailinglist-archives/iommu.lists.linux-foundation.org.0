Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B25081A247F
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 17:00:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD52A2047D;
	Wed,  8 Apr 2020 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8J-8k09PppZ; Wed,  8 Apr 2020 15:00:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DDBB20456;
	Wed,  8 Apr 2020 15:00:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35659C1D7E;
	Wed,  8 Apr 2020 15:00:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC4C1C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 86ABB20458
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CcWdyX-aSdQr for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 15:00:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id C6A3B20456
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=81odF68XeQyz5jBMv8t8odv+sDTY8EdfdldOmQeF490=; b=IhSlLhSPOtjqYY/bC2Q6xlyDfP
 m1ceIdJcBETNE/Y33JdbhHsvpge+6CjtfJsWHx1BpQcWBXjftAaee8FByw6Cdxa0CsNGXWIuvcf83
 xnAtPrci8XC2DIFadIhS9JksFEX+yOAYM6aA1RFRL6uHNYV8EhnP/i2kX1hHci3Wv94VOVJTuJKSP
 G1tx9zEYlSIqequjnivlIGE/e+mOWwqxQFda+FI/sDZ08X9Anunbas5cXcur96QRuBucxZDZKZj6/
 J/9uJ+MVyF/WYC9jyY/8CZGaLRWsaMjKhbw+xXWv6F24KTz6Kd/zJ2fXrs8MbDJ0sIgVGl3Y7dzYl
 5PngBiLQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCC9-0006TO-7r; Wed, 08 Apr 2020 15:00:49 +0000
Subject: Re: [PATCH 09/28] mm: rename CONFIG_PGTABLE_MAPPING to
 CONFIG_ZSMALLOC_PGTABLE_MAPPING
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Minchan Kim
 <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-10-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b0c35646-208e-d49f-72d9-06fb2b7b8869@infradead.org>
Date: Wed, 8 Apr 2020 08:00:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408115926.1467567-10-hch@lst.de>
Content-Language: en-US
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
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

On 4/8/20 4:59 AM, Christoph Hellwig wrote:
> Rename the Kconfig variable to clarify the scope.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/configs/omap2plus_defconfig | 2 +-
>  include/linux/zsmalloc.h             | 2 +-
>  mm/Kconfig                           | 2 +-
>  mm/zsmalloc.c                        | 8 ++++----
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 

Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
