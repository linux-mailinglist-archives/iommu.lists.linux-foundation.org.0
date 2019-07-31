Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 056DD7CA36
	for <lists.iommu@lfdr.de>; Wed, 31 Jul 2019 19:20:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B08A4062;
	Wed, 31 Jul 2019 17:20:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B17914049
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 17:07:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5B668A8
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 17:07:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2AF6337;
	Wed, 31 Jul 2019 10:07:46 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
	72C133F71F; Wed, 31 Jul 2019 10:07:44 -0700 (PDT)
Date: Wed, 31 Jul 2019 18:07:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 5/8] arm64: use ZONE_DMA on DMA addressing limited devices
Message-ID: <20190731170742.GC17773@arrakis.emea.arm.com>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
	<20190731154752.16557-6-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731154752.16557-6-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, f.fainelli@gmail.com,
	frowand.list@gmail.com, eric@anholt.net, marc.zyngier@arm.com,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, wahrenst@gmx.net, mbrugger@suse.com,
	akpm@linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	hch@lst.de, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, Jul 31, 2019 at 05:47:48PM +0200, Nicolas Saenz Julienne wrote:
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 1c4ffabbe1cb..f5279ef85756 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -50,6 +50,13 @@
>  s64 memstart_addr __ro_after_init = -1;
>  EXPORT_SYMBOL(memstart_addr);
>  
> +/*
> + * We might create both a ZONE_DMA and ZONE_DMA32. ZONE_DMA is needed if there
> + * are periferals unable to address the first naturally aligned 4GB of ram.
> + * ZONE_DMA32 will be expanded to cover the rest of that memory. If such
> + * limitations doesn't exist only ZONE_DMA32 is created.
> + */

Shouldn't we instead only create ZONE_DMA to cover the whole 32-bit
range and leave ZONE_DMA32 empty? Can__GFP_DMA allocations fall back
onto ZONE_DMA32?

-- 
Catalin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
