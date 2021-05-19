Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A274388B41
	for <lists.iommu@lfdr.de>; Wed, 19 May 2021 12:01:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E63874015C;
	Wed, 19 May 2021 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VhYamC13aZw; Wed, 19 May 2021 10:01:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1325F4023E;
	Wed, 19 May 2021 10:01:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7332C001C;
	Wed, 19 May 2021 10:01:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52B18C0001
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 10:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4191083F7B
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 10:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxFsH1OCBGb3 for <iommu@lists.linux-foundation.org>;
 Wed, 19 May 2021 10:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8200383D59
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 10:01:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B74F3101E;
 Wed, 19 May 2021 03:01:39 -0700 (PDT)
Received: from [10.57.66.179] (unknown [10.57.66.179])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E03A3F719;
 Wed, 19 May 2021 03:01:38 -0700 (PDT)
Subject: Re: [RFC PATCH v1 0/2] iommu/arm-smmu-v3: Add some parameter check in
 __arm_smmu_tlb_inv_range()
To: Kunkun Jiang <jiangkunkun@huawei.com>, Will Deacon <will@kernel.org>,
 Eric Auger <eric.auger@redhat.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210519094307.3275-1-jiangkunkun@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c577a7cc-8db3-5802-53cb-985f0c7216b3@arm.com>
Date: Wed, 19 May 2021 11:01:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519094307.3275-1-jiangkunkun@huawei.com>
Content-Language: en-GB
Cc: wanghaibin.wang@huawei.com
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

On 2021-05-19 10:43, Kunkun Jiang wrote:
> Hi all,
> 
> This set of patches solves some errors when I tested the SMMU nested mode.
> 
> Test scenario description:
> guest kernel: 4KB translation granule
> host kernel: 16KB translation granule
> 
> errors:
> 1. encountered an endless loop in __arm_smmu_tlb_inv_range because
> num_pages is 0
> 2. encountered CERROR_ILL because the fields of TLB invalidation
> command are as follow: TG = 2, NUM = 0, SCALE = 0, TTL = 0. The
> combination is exactly the kind of reserved combination pointed
> out in the SMMUv3 spec(page 143-144, version D.a)
> 
> In my opinion, it is more appropriate to add parameter check in
> __arm_smmu_tlb_inv_range(), although these problems only appeared
> when I tested the SMMU nested mode. What do you think?

FWIW I think it would be better to fix the caller to not issue broken 
commands in the first place. The kernel shouldn't do so for itself (and 
definitely needs fixing if it ever does), so it sounds like the nesting 
implementation needs to do a bit more validation of what it's passing 
through.

Robin.

> This series include patches as below:
> Patch 1:
> - align the invalid range with leaf page size upwards when smmu
> supports RIL
> 
> Patch 2:
> - add a check to standardize granule size when smmu supports RIL
> 
> Kunkun Jiang (2):
>    iommu/arm-smmu-v3: Align invalid range with leaf page size upwards
>      when support RIL
>    iommu/arm-smmu-v3: Standardize granule size when support RIL
> 
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
