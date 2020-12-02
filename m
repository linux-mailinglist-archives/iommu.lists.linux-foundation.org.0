Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4E62CBD9A
	for <lists.iommu@lfdr.de>; Wed,  2 Dec 2020 14:00:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B25786DDD;
	Wed,  2 Dec 2020 13:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h5HFi6zFocjL; Wed,  2 Dec 2020 13:00:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B7CB87078;
	Wed,  2 Dec 2020 13:00:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01B50C0052;
	Wed,  2 Dec 2020 13:00:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C16CCC0052
 for <iommu@lists.linux-foundation.org>; Wed,  2 Dec 2020 13:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B59EC877DB
 for <iommu@lists.linux-foundation.org>; Wed,  2 Dec 2020 13:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1OcLYhFk-9Aw for <iommu@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 13:00:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 041DC876E2
 for <iommu@lists.linux-foundation.org>; Wed,  2 Dec 2020 13:00:19 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CmJw55c63zhlpC;
 Wed,  2 Dec 2020 20:59:49 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Wed, 2 Dec 2020 21:00:01 +0800
To: Auger Eric <eric.auger@redhat.com>
References: <20201118112151.25412-8-eric.auger@redhat.com>
 <1606829590-25924-1-git-send-email-wangxingang5@huawei.com>
 <2e69adf5-8207-64f7-fa8e-9f2bd3a3c4e3@redhat.com>
From: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [PATCH v13 07/15] iommu/smmuv3: Allow stage 1 invalidation with
 unmanaged ASIDs
Message-ID: <8cf8fa21-41e3-f3f9-81e4-90f0bfc26fc0@huawei.com>
Date: Wed, 2 Dec 2020 20:59:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2e69adf5-8207-64f7-fa8e-9f2bd3a3c4e3@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Cc: xieyingtai@huawei.com, jean-philippe@linaro.org, kvm@vger.kernel.org,
 maz@kernel.org, will@kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, vivek.gautam@arm.com, alex.williamson@redhat.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, kvmarm@lists.cs.columbia.edu,
 eric.auger.pro@gmail.com
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

Thanks for your reply. We are testing vSVA, and will let you know if
other problems are found.

On 2020/12/1 21:58, Auger Eric wrote:
> Hi Xingang,
> 
> On 12/1/20 2:33 PM, Xingang Wang wrote:
>> Hi Eric
>>
>> On  Wed, 18 Nov 2020 12:21:43, Eric Auger wrote:
>>> @@ -1710,7 +1710,11 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>>> 	 * insertion to guarantee those are observed before the TLBI. Do be
>>> 	 * careful, 007.
>>> 	 */
>>> -	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
>>> +	if (ext_asid >= 0) { /* guest stage 1 invalidation */
>>> +		cmd.opcode	= CMDQ_OP_TLBI_NH_ASID;
>>> +		cmd.tlbi.asid	= ext_asid;
>>> +		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
>>> +	} else if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
>>
>> Found a problem here, the cmd for guest stage 1 invalidation is built,
>> but it is not delivered to smmu.
>>
> 
> Thank you for the report. I will fix that soon. With that fixed, have
> you been able to run vSVA on top of the series. Do you need other stuff
> to be fixed at SMMU level? As I am going to respin soon, please let me
> know what is the best branch to rebase to alleviate your integration.
> 
> Best Regards
> 
> Eric
> 
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
