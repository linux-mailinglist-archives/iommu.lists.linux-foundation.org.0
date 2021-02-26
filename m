Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E190C326055
	for <lists.iommu@lfdr.de>; Fri, 26 Feb 2021 10:43:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BCA243312;
	Fri, 26 Feb 2021 09:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sq1CHsiG3X21; Fri, 26 Feb 2021 09:43:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A233043310;
	Fri, 26 Feb 2021 09:43:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54E29C0001;
	Fri, 26 Feb 2021 09:43:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDC22C0001
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 09:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B15B64EF90
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 09:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1KOzFVJbJP-O for <iommu@lists.linux-foundation.org>;
 Fri, 26 Feb 2021 09:43:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01D054EF53
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 09:43:42 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dn4S81Wj2z16D0R;
 Fri, 26 Feb 2021 17:42:00 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.87) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Feb 2021
 17:43:27 +0800
Subject: Re: [PATCH v12 10/10] iommu/arm-smmu-v3: Add stall support for
 platform devices
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210127154322.3959196-1-jean-philippe@linaro.org>
 <20210127154322.3959196-11-jean-philippe@linaro.org>
 <8adc79cc-7afb-dfe8-4f7b-07fa6dc5b905@hisilicon.com>
 <YBfij71tyYvh8LhB@myrica>
From: Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <fabffd28-7497-2758-c2bf-9d31aa562085@hisilicon.com>
Date: Fri, 26 Feb 2021 17:43:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <YBfij71tyYvh8LhB@myrica>
X-Originating-IP: [10.40.188.87]
X-CFilter-Loop: Reflected
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com,
 linux-acpi@vger.kernel.org, robin.murphy@arm.com, sudeep.holla@arm.com,
 rjw@rjwysocki.net, vivek.gautam@arm.com, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-accelerators@lists.ozlabs.org, guohanjun@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 lenb@kernel.org
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

On 2021/2/1 19:14, Jean-Philippe Brucker wrote:
> Hi Zhou,
> 
> On Mon, Feb 01, 2021 at 09:18:42AM +0800, Zhou Wang wrote:
>>> @@ -1033,8 +1076,7 @@ int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain, int ssid,
>>>  			FIELD_PREP(CTXDESC_CD_0_ASID, cd->asid) |
>>>  			CTXDESC_CD_0_V;
>>>  
>>> -		/* STALL_MODEL==0b10 && CD.S==0 is ILLEGAL */
>>> -		if (smmu->features & ARM_SMMU_FEAT_STALL_FORCE)
>>> +		if (smmu_domain->stall_enabled)
>>
>> Could we add ssid checking here? like: if (smmu_domain->stall_enabled && ssid).
>> The reason is if not CD.S will also be set when ssid is 0, which is not needed.
> 
> Some drivers may want to get stall events on SSID 0:
> https://lore.kernel.org/kvm/20210125090402.1429-1-lushenming@huawei.com/#t
> 
> Are you seeing an issue with stall events on ssid 0?  Normally there
> shouldn't be any fault on this context, but if they happen and no handler
> is registered, the SMMU driver will just abort them and report them like a
> non-stall event.

Hi Jean,

I notice that there is problem. In my case, I expect that CD0 is for kernel
and other CDs are for user space. Normally there shouldn't be any fault in
kernel, however, we have RAS case which is for some reason there may has
invalid address access from hardware device.

So at least there are two different address access failures: 1. hardware RAS problem;
2. software fault fail(e.g. kill process when doing DMA). Handlings for these
two are different: for 1, we should reset hardware device; for 2, stop related
DMA is enough.

Currently if SMMU returns the same signal(by SMMU resume abort), master device
driver can not tell these two kinds of cases.

From the basic concept, if a CD is used for kernel, its S bit should not be set.
How about we add iommu domain check here too, if DMA domain we do not set S bit for
CD0, if unmanaged domain we set S bit for all CDs?

Thanks,
Zhou

> 
> Thanks,
> Jean
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
