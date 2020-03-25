Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE247192C8F
	for <lists.iommu@lfdr.de>; Wed, 25 Mar 2020 16:31:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CFDC87D7F;
	Wed, 25 Mar 2020 15:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXsVrrOt2odB; Wed, 25 Mar 2020 15:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ABA8A87D6C;
	Wed, 25 Mar 2020 15:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EC04C1D89;
	Wed, 25 Mar 2020 15:31:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94909C0177
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 15:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8F9A587D63
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 15:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id at07bOC+zemf for <iommu@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 15:31:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 27D6F87D5D
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 15:31:53 +0000 (UTC)
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 68AECC11BE6B087C9C06;
 Wed, 25 Mar 2020 15:31:51 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml704-cah.china.huawei.com (10.201.108.45) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 25 Mar 2020 15:31:50 +0000
Received: from [127.0.0.1] (10.210.165.24) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 25 Mar
 2020 15:31:50 +0000
Subject: Re: arm-smmu-v3 high cpu usage for NVMe
From: John Garry <john.garry@huawei.com>
To: Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>
References: <20190821151749.23743-1-will@kernel.org>
 <b2a6e26d-6d0d-7f0d-f222-589812f701d2@huawei.com>
 <20200318205313.GB8094@willie-the-truck>
 <c6ab8020-dc06-0c7d-7a41-e792d90f97ba@huawei.com>
 <20200319184349.GA1697676@myrica>
 <c9ebe17d-66b8-1b8c-cc2c-5be0bd1501a7@huawei.com>
 <20200320111842.GD1702630@myrica>
 <b412fc9c-6266-e320-0769-f214d7752675@huawei.com>
 <5198fcffc8ad6233e0274ebff9e9aa5f@kernel.org>
 <cca67355-672d-81c5-3d37-72004eb8f14f@huawei.com>
 <dd375cf6bffacd82174c84a4c7d46283@kernel.org>
 <0e00de15-596a-d342-f3cb-e19c389294e6@huawei.com>
 <20200324104307.57d2cde0@why>
 <4c5e2482-1493-6bb7-d592-58cd027d39f9@huawei.com>
 <10d5bcb3-e7c4-18f0-ede6-9fd8f0385254@arm.com>
 <9f1c719f-b876-66a1-2d3e-7787e1f1ed9f@huawei.com>
Message-ID: <2ae1221a-aec1-b9fd-7aa6-204b9e5e04e1@huawei.com>
Date: Wed, 25 Mar 2020 15:31:35 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <9f1c719f-b876-66a1-2d3e-7787e1f1ed9f@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.210.165.24]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Ming Lei <ming.lei@redhat.com>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Julien
 Thierry <julien.thierry.kdev@gmail.com>
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

> 
>>
>> FWIW I believe is is still on the plan for someone here to dust off 
>> the PMU pNMI patches at some point.
> 
> Cool. Well I can try to experiment with what Julien had at v4 for now.
> 

JFYI, I have done some more perf record capturing, and updated the 
"annotate" and "report" output here 
https://raw.githubusercontent.com/hisilicon/kernel-dev/679eca1008b1d11b42e1b5fa8a205266c240d1e1/ann.txt 
and .../report

This capture is just for cpu0, since NVMe irq handling+dma unmapping 
will occur on specific CPUs, cpu0 being one of them.

The reports look somewhat sane. So we no longer have ~99% of time 
attributed to re-enabling interrupts, now that's like:


     3.14 :   ffff80001071eae0:       ldr     w0, [x29, #108]
          :                      int ret = 0;
     0.00 :   ffff80001071eae4:       mov     w24, #0x0 
      // #0
          :                      if (sync) {
     0.00 :   ffff80001071eae8:       cbnz    w0, ffff80001071eb44 
<arm_smmu_cmdq_issue_cmdlist+0x44c>
          :                      arch_local_irq_restore():
          :                      asm volatile(ALTERNATIVE(
     0.00 :   ffff80001071eaec:       msr     daif, x21
          :                      arch_static_branch():
     0.25 :   ffff80001071eaf0:       nop
          :                      arm_smmu_cmdq_issue_cmdlist():
          :                      }
          :                      }
          :
          :                      local_irq_restore(flags);
          :                      return ret;
          :                      }
One observation (if these reports are to be believed) is that we may 
spend a lot of time in the CAS loop, trying to get a place in the queue 
initially:

          :                      __CMPXCHG_CASE(w,  ,     , 32,   )
          :                      __CMPXCHG_CASE(x,  ,     , 64,   )
     0.00 :   ffff80001071e828:       mov     x0, x27
     0.00 :   ffff80001071e82c:       mov     x4, x1
     0.00 :   ffff80001071e830:       cas     x4, x2, [x27]
    28.61 :   ffff80001071e834:       mov     x0, x4
          :                      arm_smmu_cmdq_issue_cmdlist():
          :                      if (old == llq.val)
     0.00 :   ffff80001071e838:       ldr     x1, [x23]

John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
