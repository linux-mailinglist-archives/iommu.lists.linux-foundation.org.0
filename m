Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF63E46CE
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 15:40:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C15FD6063B;
	Mon,  9 Aug 2021 13:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVkMe3OBexap; Mon,  9 Aug 2021 13:40:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DE9DA6064D;
	Mon,  9 Aug 2021 13:40:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C23DCC001F;
	Mon,  9 Aug 2021 13:40:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1E01C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 13:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9036A4025D
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 13:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tx8OOu2oDf3M for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 13:40:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4204B4022D
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 13:40:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 751486D;
 Mon,  9 Aug 2021 06:40:13 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D5783F718;
 Mon,  9 Aug 2021 06:40:12 -0700 (PDT)
Subject: Re: [PATCH v3 25/25] iommu: Allow enabling non-strict mode dynamically
To: Will Deacon <will@kernel.org>
References: <cover.1628094600.git.robin.murphy@arm.com>
 <22b044263f69e2bfe404c4379a435005ea58b3e2.1628094601.git.robin.murphy@arm.com>
 <20210809124931.GA1097@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <283ba58e-0257-8785-d0e6-eb96ab169e35@arm.com>
Date: Mon, 9 Aug 2021 14:40:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809124931.GA1097@willie-the-truck>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, rajatja@google.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org
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

On 2021-08-09 13:49, Will Deacon wrote:
> On Wed, Aug 04, 2021 at 06:15:53PM +0100, Robin Murphy wrote:
>> Allocating and enabling a flush queue is in fact something we can
>> reasonably do while a DMA domain is active, without having to rebuild it
>> from scratch. Thus we can allow a strict -> non-strict transition from
>> sysfs without requiring to unbind the device's driver, which is of
>> particular interest to users who want to make selective relaxations to
>> critical devices like the one serving their root filesystem.
>>
>> Disabling and draining a queue also seems technically possible to
>> achieve without rebuilding the whole domain, but would certainly be more
>> involved. Furthermore there's not such a clear use-case for tightening
>> up security *after* the device may already have done whatever it is that
>> you don't trust it not to do, so we only consider the relaxation case.
>>
>> CC: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>
>> ---
>>
>> v3: Actually think about concurrency, rework most of the fq data
>>      accesses to be (hopefully) safe and comment it all
>> ---
>>   drivers/iommu/dma-iommu.c | 25 ++++++++++++++++++-------
>>   drivers/iommu/iommu.c     | 16 ++++++++++++----
>>   drivers/iommu/iova.c      |  9 ++++++---
>>   3 files changed, 36 insertions(+), 14 deletions(-)
> 
> I failed to break this, so hopefully you've caught everything now.
> 
> Only thing I wasn't sure of is why we still need the smp_wmb() in
> init_iova_flush_queue(). Can we remove it now that we have one before
> assigning into the cookie?

Mostly because I failed to spot it, I think :)

Indeed now that we don't have any callers other than iommu_dma_init_fq() 
to worry about, I don't think that one matters any more. It would if 
were testing cookie->iovad->fq directly as our indicator instead of 
cookie->fq_domain, but then we'd still need the new barrier to ensure 
iommu_dma_flush_iotlb_all() properly observes the latter, so we may as 
well rely on that everywhere and let it fully replace the old one.

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
