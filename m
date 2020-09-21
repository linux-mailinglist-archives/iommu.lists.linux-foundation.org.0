Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A776A272682
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 16:01:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E340A8610E;
	Mon, 21 Sep 2020 14:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPWkMELjrPNV; Mon, 21 Sep 2020 14:01:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 945BB86108;
	Mon, 21 Sep 2020 14:01:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DF0FC0889;
	Mon, 21 Sep 2020 14:01:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18713C0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D04DF204F9
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 14:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rwsWTQk633V for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 14:01:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by silver.osuosl.org (Postfix) with ESMTPS id 1D50520012
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 14:01:03 +0000 (UTC)
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id C85C03125A0D1D39BC16;
 Mon, 21 Sep 2020 15:01:00 +0100 (IST)
Received: from [127.0.0.1] (10.210.166.25) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Mon, 21 Sep
 2020 15:01:00 +0100
Subject: Re: [PATCH v2 0/2] iommu/arm-smmu-v3: Improve cmdq lock efficiency
To: Will Deacon <will@kernel.org>
References: <1598018062-175608-1-git-send-email-john.garry@huawei.com>
 <20200921134324.GK2139@willie-the-truck>
From: John Garry <john.garry@huawei.com>
Message-ID: <b13d0858-e164-4670-a5c6-ab84e81724b7@huawei.com>
Date: Mon, 21 Sep 2020 14:58:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200921134324.GK2139@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.210.166.25]
X-ClientProxiedBy: lhreml701-chm.china.huawei.com (10.201.108.50) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: maz@kernel.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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

On 21/09/2020 14:43, Will Deacon wrote:
> On Fri, Aug 21, 2020 at 09:54:20PM +0800, John Garry wrote:
>> As mentioned in [0], the CPU may consume many cycles processing
>> arm_smmu_cmdq_issue_cmdlist(). One issue we find is the cmpxchg() loop to
>> get space on the queue takes a lot of time once we start getting many
>> CPUs contending - from experiment, for 64 CPUs contending the cmdq,
>> success rate is ~ 1 in 12, which is poor, but not totally awful.
>>
>> This series removes that cmpxchg() and replaces with an atomic_add,
>> same as how the actual cmdq deals with maintaining the prod pointer.
>  > I'm still not a fan of this.

:(

> Could you try to adapt the hacks I sent before,
> please? I know they weren't quite right (I have no hardware to test on), but
> the basic idea is to fall back to a spinlock if the cmpxchg() fails. The
> queueing in the spinlock implementation should avoid the contention.

OK, so if you're asking me to try this again, then I can do that, and 
see what it gives us.

John

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
