Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E774F3F079A
	for <lists.iommu@lfdr.de>; Wed, 18 Aug 2021 17:13:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CAA2404E2;
	Wed, 18 Aug 2021 15:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ok9GNX7BRT_s; Wed, 18 Aug 2021 15:13:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 27060404D0;
	Wed, 18 Aug 2021 15:13:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 052FBC0022;
	Wed, 18 Aug 2021 15:13:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4689C000E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 15:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56596605E9
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 15:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JI22MgQzI5yE for <iommu@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 15:13:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40872605C1
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 15:13:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3362E101E;
 Wed, 18 Aug 2021 08:13:34 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 518DD3F40C;
 Wed, 18 Aug 2021 08:13:31 -0700 (PDT)
Subject: Re: [PATCH v4 00/24] iommu: Refactor DMA domain strictness
To: Joerg Roedel <joro@8bytes.org>, Sven Peter <sven@svenpeter.dev>
References: <cover.1628682048.git.robin.murphy@arm.com>
 <YRzvGxTW8m+NUcSi@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <914d7243-7f9d-425e-1ff7-6be218e04913@arm.com>
Date: Wed, 18 Aug 2021 16:13:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YRzvGxTW8m+NUcSi@8bytes.org>
Content-Language: en-GB
Cc: Maxime Ripard <mripard@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, Chunyan Zhang <chunyan.zhang@unisoc.com>,
 dianders@chromium.org, iommu@lists.linux-foundation.org, rajatja@google.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2021-08-18 12:29, Joerg Roedel wrote:
> On Wed, Aug 11, 2021 at 01:21:14PM +0100, Robin Murphy wrote:
>> Robin Murphy (24):
>>    iommu: Pull IOVA cookie management into the core
>>    iommu/amd: Drop IOVA cookie management
>>    iommu/arm-smmu: Drop IOVA cookie management
>>    iommu/vt-d: Drop IOVA cookie management
>>    iommu/exynos: Drop IOVA cookie management
>>    iommu/ipmmu-vmsa: Drop IOVA cookie management
>>    iommu/mtk: Drop IOVA cookie management
>>    iommu/rockchip: Drop IOVA cookie management
>>    iommu/sprd: Drop IOVA cookie management
>>    iommu/sun50i: Drop IOVA cookie management
>>    iommu/virtio: Drop IOVA cookie management
>>    iommu/dma: Unexport IOVA cookie management
>>    iommu/dma: Remove redundant "!dev" checks
>>    iommu: Indicate queued flushes via gather data
>>    iommu/io-pgtable: Remove non-strict quirk
>>    iommu: Introduce explicit type for non-strict DMA domains
>>    iommu/amd: Prepare for multiple DMA domain types
>>    iommu/arm-smmu: Prepare for multiple DMA domain types
>>    iommu/vt-d: Prepare for multiple DMA domain types
>>    iommu: Express DMA strictness via the domain type
>>    iommu: Expose DMA domain strictness via sysfs
>>    iommu: Only log strictness for DMA domains
>>    iommu: Merge strictness and domain type configs
>>    iommu: Allow enabling non-strict mode dynamically
> 
> Applied all except patch 12. Please re-submit patch 12 together with the
> APPLE DART fixups after v5.15-rc1 is out.

Brilliant, thanks for fixing that up!

Sven - I've prepared the follow-up patches already[1], so consider 
yourself off the hook (I see no point in trying to fix the nominal DART 
cookie bugs between now and then) :)

Cheers,
Robin.

[1] https://gitlab.arm.com/linux-arm/linux-rm/-/commits/iommu/fq-fixes
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
