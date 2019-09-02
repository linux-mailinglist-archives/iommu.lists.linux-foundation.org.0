Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C6A56D6
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 15:00:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C888EE3A;
	Mon,  2 Sep 2019 13:00:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AFEEAE27
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 13:00:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 50BBA887
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 13:00:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4399337;
	Mon,  2 Sep 2019 06:00:10 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE5DD3F246;
	Mon,  2 Sep 2019 06:00:08 -0700 (PDT)
Subject: Re: [PATCH 3/7] iommu/arm-smmu: Add tlb_sync implementation hook
To: Krishna Reddy <vdumpa@nvidia.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
	<1567118827-26358-4-git-send-email-vdumpa@nvidia.com>
	<554f8de1-1638-4eb9-59ae-8e1f0d786c44@arm.com>
	<BYAPR12MB2710AF5DDCB687C7E78362E5B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
	<BYAPR12MB271010C629D8DD7AEC0123D4B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3d734164-51c9-3465-cddd-276093389797@arm.com>
Date: Mon, 2 Sep 2019 14:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB271010C629D8DD7AEC0123D4B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Timo Alho <talho@nvidia.com>, Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Pritesh Raithatha <praithatha@nvidia.com>,
	"Thomas Zeng \(SW-TEGRA\)" <thomasz@nvidia.com>,
	Sachin Nikam <Snikam@nvidia.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Yu-Huan Hsu <YHsu@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>,
	Alexander Van Brunt <avanbrunt@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
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

On 30/08/2019 23:49, Krishna Reddy wrote:
>>> +	if (smmu->impl->tlb_sync) {
>>> +		smmu->impl->tlb_sync(smmu, page, sync, status);
> 
>> What I'd hoped is that rather than needing a hook for this, you could just override smmu_domain->tlb_ops from .init_context to wire up the alternate .sync method directly. That would save this extra level of indirection.
> 
> Hi Robin,  overriding tlb_ops->tlb_sync function is not enough here.
> There are direct references to arm_smmu_tlb_sync_context(),  arm_smmu_tlb_sync_global() functions.
> In arm-smmu.c.  we can replace these direct references with tlb_ops->tlb_sync() function except in one function arm_smmu_device_reset().
> When arm_smmu_device_reset() gets called, domains are not initialized and tlb_ops is not available.
> Should we add a new hook for arm_smmu_tlb_sync_global() or make this as a responsibility of impl->reset() hook as it gets
> called at the same place?

Ah, right, I'd forgotten about the TLB maintenance on reset. Looking 
again, though, I think you might need to implement impl->reset anyway 
for the sake of clearing GFSR correctly - since the value read from the 
base instance technically may not match whatever bits might happen to be 
set in the other instances - so I don't see any issue with just calling 
nsmmu_tlb_sync() from there as well.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
