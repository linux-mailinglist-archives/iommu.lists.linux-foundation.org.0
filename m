Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07718D442
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 17:21:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9CDB0883A7;
	Fri, 20 Mar 2020 16:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sNiqlFwTsZG; Fri, 20 Mar 2020 16:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A64B08832D;
	Fri, 20 Mar 2020 16:21:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0CBFC1D89;
	Fri, 20 Mar 2020 16:21:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6D1EC07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A3EB8875E0
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcuD0H0Tz-4A for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 16:21:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6C7B5863E1
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:21:16 +0000 (UTC)
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 1D4524398F6267688CFD;
 Fri, 20 Mar 2020 16:21:12 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml703-cah.china.huawei.com (10.201.108.44) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 20 Mar 2020 16:21:11 +0000
Received: from [127.0.0.1] (10.210.167.248) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Fri, 20 Mar
 2020 16:21:11 +0000
Subject: Re: arm-smmu-v3 high cpu usage for NVMe
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20190821151749.23743-1-will@kernel.org>
 <b2a6e26d-6d0d-7f0d-f222-589812f701d2@huawei.com>
 <20200318205313.GB8094@willie-the-truck>
 <c6ab8020-dc06-0c7d-7a41-e792d90f97ba@huawei.com>
 <20200319184349.GA1697676@myrica>
 <c9ebe17d-66b8-1b8c-cc2c-5be0bd1501a7@huawei.com>
 <20200320111842.GD1702630@myrica>
From: John Garry <john.garry@huawei.com>
Message-ID: <b412fc9c-6266-e320-0769-f214d7752675@huawei.com>
Date: Fri, 20 Mar 2020 16:20:53 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200320111842.GD1702630@myrica>
Content-Language: en-US
X-Originating-IP: [10.210.167.248]
X-ClientProxiedBy: lhreml704-chm.china.huawei.com (10.201.108.53) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: Will Deacon <will@kernel.org>, Ming Lei <ming.lei@redhat.com>,
 iommu@lists.linux-foundation.org, Marc Zyngier <maz@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>
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


>>
>>>
>>> I've run a bunch of netperf instances on multiple cores and collecting
>>> SMMU usage (on TaiShan 2280). I'm getting the following ratio pretty
>>> consistently.
>>>
>>> - 6.07% arm_smmu_iotlb_sync
>>>      - 5.74% arm_smmu_tlb_inv_range
>>>           5.09% arm_smmu_cmdq_issue_cmdlist
>>>           0.28% __pi_memset
>>>           0.08% __pi_memcpy
>>>           0.08% arm_smmu_atc_inv_domain.constprop.37
>>>           0.07% arm_smmu_cmdq_build_cmd
>>>           0.01% arm_smmu_cmdq_batch_add
>>>        0.31% __pi_memset
>>>
>>> So arm_smmu_atc_inv_domain() takes about 1.4% of arm_smmu_iotlb_sync(),
>>> when ATS is not used. According to the annotations, the load from the
>>> atomic_read(), that checks whether the domain uses ATS, is 77% of the
>>> samples in arm_smmu_atc_inv_domain() (265 of 345 samples), so I'm not sure
>>> there is much room for optimization there.
>>
>> Well I did originally suggest using RCU protection to scan the list of
>> devices, instead of reading an atomic and checking for non-zero value. But
>> that would be an optimsation for ATS also, and there was no ATS devices at
>> the time (to verify performance).
> 
> Heh, I have yet to get my hands on one. Currently I can't evaluate ATS
> performance, but I agree that using RCU to scan the list should get better
> results when using ATS.
> 
> When ATS isn't in use however, I suspect reading nr_ats_masters should be
> more efficient than taking the RCU lock + reading an "ats_devices" list
> (since the smmu_domain->devices list also serves context descriptor
> invalidation, even when ATS isn't in use). I'll run some tests however, to
> see if I can micro-optimize this case, but I don't expect noticeable
> improvements.

ok, cheers. I, too, would not expect a significant improvement there.

JFYI, I've been playing for "perf annotate" today and it's giving 
strange results for my NVMe testing. So "report" looks somewhat sane, if 
not a worryingly high % for arm_smmu_cmdq_issue_cmdlist():


     55.39%  irq/342-nvme0q1  [kernel.kallsyms]  [k] 
arm_smmu_cmdq_issue_cmdlist
      9.74%  irq/342-nvme0q1  [kernel.kallsyms]  [k] 
_raw_spin_unlock_irqrestore
      2.02%  irq/342-nvme0q1  [kernel.kallsyms]  [k] nvme_irq
      1.86%  irq/342-nvme0q1  [kernel.kallsyms]  [k] fput_many
      1.73%  irq/342-nvme0q1  [kernel.kallsyms]  [k] 
arm_smmu_atc_inv_domain.constprop.42
      1.67%  irq/342-nvme0q1  [kernel.kallsyms]  [k] __arm_lpae_unmap
      1.49%  irq/342-nvme0q1  [kernel.kallsyms]  [k] aio_complete_rw

But "annotate" consistently tells me that a specific instruction 
consumes ~99% of the load for the enqueue function:

          :                      /* 5. If we are inserting a CMD_SYNC, 
we must wait for it to complete */
          :                      if (sync) {
     0.00 :   ffff80001071c948:       ldr     w0, [x29, #108]
          :                      int ret = 0;
     0.00 :   ffff80001071c94c:       mov     w24, #0x0 
      // #0
          :                      if (sync) {
     0.00 :   ffff80001071c950:       cbnz    w0, ffff80001071c990 
<arm_smmu_cmdq_issue_cmdlist+0x420>
          :                      arch_local_irq_restore():
     0.00 :   ffff80001071c954:       msr     daif, x21
          :                      arm_smmu_cmdq_issue_cmdlist():
          :                      }
          :                      }
          :
          :                      local_irq_restore(flags);
          :                      return ret;
          :                      }
    99.51 :   ffff80001071c958:       adrp    x0, ffff800011909000 
<page_wait_table+0x14c0>
     0.00 :   ffff80001071c95c:       add     x21, x0, #0x908
     0.02 :   ffff80001071c960:       ldr     x2, [x29, #488]
     0.14 :   ffff80001071c964:       ldr     x1, [x21]
     0.00 :   ffff80001071c968:       eor     x1, x2, x1
     0.00 :   ffff80001071c96c:       mov     w0, w24


But there may be a hint that we're getting consuming a lot of time in 
polling the CMD_SYNC consumption.

The files are available here:

https://raw.githubusercontent.com/hisilicon/kernel-dev/private-topic-nvme-5.6-profiling/ann.txt, 
report

Or maybe I'm just not using the tool properly ...

Cheers,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
