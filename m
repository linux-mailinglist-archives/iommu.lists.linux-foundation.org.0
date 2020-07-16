Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5C222173
	for <lists.iommu@lfdr.de>; Thu, 16 Jul 2020 13:32:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75F4E86A88;
	Thu, 16 Jul 2020 11:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVnZHujRsu04; Thu, 16 Jul 2020 11:32:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E20DF86A85;
	Thu, 16 Jul 2020 11:32:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8D9AC0733;
	Thu, 16 Jul 2020 11:32:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F571C0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 11:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6E4FC86A88
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 11:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7UKn_tjFDPe2 for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 11:32:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 16FC386A85
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 11:32:21 +0000 (UTC)
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 2518E8DCE03CF4265438;
 Thu, 16 Jul 2020 12:32:19 +0100 (IST)
Received: from [127.0.0.1] (10.210.168.254) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 16 Jul
 2020 12:32:18 +0100
Subject: Re: [PATCH 0/4] iommu/arm-smmu-v3: Improve cmdq lock efficiency
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
References: <1592846920-45338-1-git-send-email-john.garry@huawei.com>
 <20200716101940.GA7036@willie-the-truck>
 <20200716102233.GC7036@willie-the-truck>
 <20200716102814.GD7036@willie-the-truck>
 <bd302efa-20d8-e1b3-6a80-db65ab5ad752@huawei.com>
 <aef1e4a4-d594-f477-9029-8f4295bb9f6c@arm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <eba2b8f4-2e3c-5e1d-b0b3-0d76a10c64fa@huawei.com>
Date: Thu, 16 Jul 2020 12:30:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <aef1e4a4-d594-f477-9029-8f4295bb9f6c@arm.com>
Content-Language: en-US
X-Originating-IP: [10.210.168.254]
X-ClientProxiedBy: lhreml714-chm.china.huawei.com (10.201.108.65) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: "trivial@kernel.org" <trivial@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On 16/07/2020 12:22, Robin Murphy wrote:
> On 2020-07-16 11:56, John Garry wrote:
>> On 16/07/2020 11:28, Will Deacon wrote:
>>> On Thu, Jul 16, 2020 at 11:22:33AM +0100, Will Deacon wrote:
>>>> On Thu, Jul 16, 2020 at 11:19:41AM +0100, Will Deacon wrote:
>>>>> On Tue, Jun 23, 2020 at 01:28:36AM +0800, John Garry wrote:
>>>>>> As mentioned in [0], the CPU may consume many cycles processing
>>>>>> arm_smmu_cmdq_issue_cmdlist(). One issue we find is the cmpxchg()
>>>>>> loop to
>>>>>> get space on the queue takes approx 25% of the cycles for this
>>>>>> function.
>>>>>>
>>>>>> This series removes that cmpxchg().
>>>>>
>>>>> How about something much simpler like the diff below? >>
>>>> Ah, scratch that, I don't drop the lock if we fail the cas with it held.
>>>> Let me hack it some more (I have no hardware so I can only build-test
>>>> this).
>>>
>>> Right, second attempt...
>>
>> I can try it, but if performance if not as good, then please check mine
>> further (patch 4/4 specifically) - performance is really good, IMHO.
> 
> Perhaps a silly question (I'm too engrossed in PMU world ATM to get
> properly back up to speed on this), but couldn't this be done without
> cmpxchg anyway? Instinctively it feels like instead of maintaining a
> literal software copy of the prod value, we could resolve the "claim my
> slot in the queue" part with atomic_fetch_add on a free-running 32-bit
> "pseudo-prod" index, then whoever updates the hardware deals with the
> truncation and wrap bit to convert it to an actual register value.
> 

That's what mine does. But I also need to take care of cmdq locking and 
how we unconditionally provide space.

Cheers,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
