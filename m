Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECFD90B19
	for <lists.iommu@lfdr.de>; Sat, 17 Aug 2019 00:40:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 60495C11;
	Fri, 16 Aug 2019 22:40:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C6156BA9
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 22:40:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6AB7A786
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 22:40:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 028F6344;
	Fri, 16 Aug 2019 15:40:46 -0700 (PDT)
Received: from [10.37.12.84] (unknown [10.37.12.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8B533F718;
	Fri, 16 Aug 2019 15:40:44 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH 07/11] swiotlb-xen: provide a single
	page-coherent.h header
To: Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190816130013.31154-1-hch@lst.de>
	<20190816130013.31154-8-hch@lst.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9a3261c6-5d92-cf6b-1ae8-3a8e8b5ef0d4@arm.com>
Date: Fri, 16 Aug 2019 23:40:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816130013.31154-8-hch@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 8/16/19 2:00 PM, Christoph Hellwig wrote:
> Merge the various page-coherent.h files into a single one that either
> provides prototypes or stubs depending on the need for cache
> maintainance.
> 
> For extra benefits alo include <xen/page-coherent.h> in the file
> actually implementing the interfaces provided.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/arm/include/asm/xen/page-coherent.h   |  2 --
>   arch/arm/xen/mm.c                          |  1 +
>   arch/arm64/include/asm/xen/page-coherent.h |  2 --
>   arch/x86/include/asm/xen/page-coherent.h   | 22 ------------------
>   drivers/xen/swiotlb-xen.c                  |  4 +---
>   include/Kbuild                             |  2 +-
>   include/xen/{arm => }/page-coherent.h      | 27 +++++++++++++++++++---

I am not sure I agree with this rename. The implementation of the 
helpers are very Arm specific as this is assuming Dom0 is 1:1 mapped.

This was necessary due to the lack of IOMMU on Arm platforms back then.
But this is now a pain to get rid of it on newer platform...

Cheers,

-- 
Julien Grall
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
