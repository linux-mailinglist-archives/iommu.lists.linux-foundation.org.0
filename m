Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDA2B993D
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 18:25:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 09CA6273E3;
	Thu, 19 Nov 2020 17:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klkooAJX6IuB; Thu, 19 Nov 2020 17:25:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 63DD4273CF;
	Thu, 19 Nov 2020 17:25:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43018C0891;
	Thu, 19 Nov 2020 17:25:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEC48C0891
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BD2548744B
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6DuFVu-ClbC for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 17:25:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1C87586E1D
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:25:30 +0000 (UTC)
Received: from gaia (unknown [2.26.170.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCF362468B;
 Thu, 19 Nov 2020 17:25:26 +0000 (UTC)
Date: Thu, 19 Nov 2020 17:25:24 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v6 1/7] arm64: mm: Move reserve_crashkernel() into
 mem_init()
Message-ID: <20201119172523.GG4376@gaia>
References: <20201103173159.27570-1-nsaenzjulienne@suse.de>
 <20201103173159.27570-2-nsaenzjulienne@suse.de>
 <e60d643e-4879-3fc3-737d-2c145332a6d7@arm.com>
 <88c69ac0c9d7e144c80cebc7e9f82b000828e7f5.camel@suse.de>
 <X6rZRvWyigCJxAVW@trantor>
 <b5336064145a30aadcfdb8920226a8c63f692695.camel@suse.de>
 <20201113112901.GA3212@gaia>
 <ba343af12fc60bce36837cc090a39c9e42457788.camel@suse.de>
 <20201119171048.GD4376@gaia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119171048.GD4376@gaia>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Chen Zhou <chenzhou10@huawei.com>,
 will@kernel.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 hch@lst.de, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 James Morse <james.morse@arm.com>, linux-rpi-kernel@lists.infradead.org,
 guohanjun@huawei.com, robin.murphy@arm.com, ardb@kernel.org,
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

On Thu, Nov 19, 2020 at 05:10:49PM +0000, Catalin Marinas wrote:
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ed71b1c305d7..acdec0c67d3b 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -469,6 +469,21 @@ void __init mark_linear_text_alias_ro(void)
>  			    PAGE_KERNEL_RO);
>  }
>  
> +static bool crash_mem_map __initdata;
> +
> +static int __init enable_crash_mem_map(char *arg)
> +{
> +	/*
> +	 * Proper parameter parsing is done by reserve_crashkernel(). We only
> +	 * need to know if the linear map has to avoid block mappings so that
> +	 * the crashkernel reservations can be unmapped later.
> +	 */
> +	crash_mem_map = false;

It should be set to true.

-- 
Catalin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
