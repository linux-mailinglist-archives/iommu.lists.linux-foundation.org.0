Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D8140175F20
	for <lists.iommu@lfdr.de>; Mon,  2 Mar 2020 17:05:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7277A204AF;
	Mon,  2 Mar 2020 16:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMLzuGrJEk7k; Mon,  2 Mar 2020 16:05:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7AD48204A5;
	Mon,  2 Mar 2020 16:05:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74484C013E;
	Mon,  2 Mar 2020 16:05:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7690CC1AE2
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 666EB204A5
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V50OLK8QXDss for <iommu@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 16:05:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 7A32D204A7
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:05:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC05FFEC;
 Mon,  2 Mar 2020 08:05:17 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F8D23F534;
 Mon,  2 Mar 2020 08:05:13 -0800 (PST)
Subject: Re: provide in-place uncached remapping for dma-direct v2
To: Christoph Hellwig <hch@lst.de>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
References: <20200224194446.690816-1-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4fe14c57-78d4-6590-a4c4-14fbe061238e@arm.com>
Date: Mon, 2 Mar 2020 16:05:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200224194446.690816-1-hch@lst.de>
Content-Language: en-GB
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 openrisc@lists.librecores.org, Will Deacon <will@kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 24/02/2020 7:44 pm, Christoph Hellwig wrote:
> Hi all,
> 
> this series provides support for remapping places uncached in-place in
> the generic dma-direct code, and moves openrisc over from its own
> in-place remapping scheme.  The arm64 folks also had interest in such
> a scheme to avoid problems with speculating into cache aliases.
> 
> Also all architectures that always use small page mappings for the
> kernel and have non-coherent DMA should look into enabling this
> scheme, as it is much more efficient than the vmap remapping.
> 
> Changes since v1:
>   - share the arch hook for inline remap and uncached segment support
> 

For the whole series:

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

I think we might ultimately want to fiddle around a bit more in 
dma_direct_alloc_pages() to give ARCH_HAS_DMA_SET_UNCACHED clear 
precedence over DMA_DIRECT_REMAP if they have to coexist, but let's land 
these patches first as a solid foundation.

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
