Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBDB3E87F2
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 04:16:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70AC983529;
	Wed, 11 Aug 2021 02:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFx_ZU_uMwns; Wed, 11 Aug 2021 02:16:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7783483506;
	Wed, 11 Aug 2021 02:16:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 520ADC0022;
	Wed, 11 Aug 2021 02:16:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CA4EC000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 02:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35DDD607AD
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 02:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3vd72KvdC3J for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 02:16:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30C3060034
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 02:16:43 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GktdT5F3Nzb0kW;
 Wed, 11 Aug 2021 10:13:01 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 11 Aug 2021 10:16:40 +0800
Received: from [10.174.179.0] (10.174.179.0) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 11 Aug
 2021 10:16:40 +0800
Subject: Re: [PATCH RFC 2/8] iommu/arm-smmu-v3: Add and use static helper
 function arm_smmu_cmdq_issue_cmd_with_sync()
To: Will Deacon <will@kernel.org>
References: <20210626110130.2416-1-thunder.leizhen@huawei.com>
 <20210626110130.2416-3-thunder.leizhen@huawei.com>
 <20210810182454.GB3296@willie-the-truck>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <b9fa05b5-d3ee-5c79-c8b8-b908e533646a@huawei.com>
Date: Wed, 11 Aug 2021 10:16:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210810182454.GB3296@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Cc: Robin Murphy <robin.murphy@arm.com>,
 iommu <iommu@lists.linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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



On 2021/8/11 2:24, Will Deacon wrote:
> On Sat, Jun 26, 2021 at 07:01:24PM +0800, Zhen Lei wrote:
>> The obvious key to the performance optimization of commit 587e6c10a7ce
>> ("iommu/arm-smmu-v3: Reduce contention during command-queue insertion") is
>> to allow multiple cores to insert commands in parallel after a brief mutex
>> contention.
>>
>> Obviously, inserting as many commands at a time as possible can reduce the
>> number of times the mutex contention participates, thereby improving the
>> overall performance. At least it reduces the number of calls to function
>> arm_smmu_cmdq_issue_cmdlist().
>>
>> Therefore, function arm_smmu_cmdq_issue_cmd_with_sync() is added to insert
>> the 'cmd+sync' commands at a time.
>>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 33 +++++++++++++--------
>>  1 file changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> index 2433d3c29b49ff2..a5361153ca1d6a4 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -858,11 +858,25 @@ static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>>  	return arm_smmu_cmdq_issue_cmdlist(smmu, cmd, 1, false);
>>  }
>>  
>> -static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>> +static int __maybe_unused arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>>  {
>>  	return arm_smmu_cmdq_issue_cmdlist(smmu, NULL, 0, true);
>>  }
>>  
>> +static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
>> +					     struct arm_smmu_cmdq_ent *ent)
>> +{
>> +	u64 cmd[CMDQ_ENT_DWORDS];
>> +
>> +	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
>> +		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
>> +			 ent->opcode);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return arm_smmu_cmdq_issue_cmdlist(smmu, cmd, 1, true);
>> +}
> 
> This function is almost identical to arm_smmu_cmdq_issue_cmd(). How about
> moving the guts out into a helper:
> 
> 	static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> 					     struct arm_smmu_cmdq_ent *ent,
> 					     bool sync);
> 
> and then having arm_smmu_cmdq_issue_cmd_with_sync() and
> arm_smmu_cmdq_issue_cmd() wrap that?

OK, I will do it.

How about remove arm_smmu_cmdq_issue_sync()? It's unused now.

> 
> Will
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
