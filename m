Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 511EF30857D
	for <lists.iommu@lfdr.de>; Fri, 29 Jan 2021 07:13:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA2EC86FFE;
	Fri, 29 Jan 2021 06:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XD74lL5Zf12; Fri, 29 Jan 2021 06:13:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E10D98700A;
	Fri, 29 Jan 2021 06:13:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1FC5C013A;
	Fri, 29 Jan 2021 06:13:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3DB1C013A
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 06:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A473687002
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 06:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqBKC7KWP9fF for <iommu@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 06:13:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B6A0186FFE
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 06:13:02 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRn6g44f9zjDnm;
 Fri, 29 Jan 2021 14:11:55 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 14:12:47 +0800
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: add support for BBML
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
References: <20201126034230.777-1-thunder.leizhen@huawei.com>
 <20210122125132.GB24102@willie-the-truck>
 <aac11411-f6cd-f990-fe53-db0d8c07f3a0@huawei.com>
 <1bfd1ca0-953e-e943-f87e-144d5537bd0c@arm.com>
 <20210126101230.GA29204@willie-the-truck>
 <8a9685ec-67aa-824f-5429-f408bf79c5ab@huawei.com>
 <32f4752f-6954-183a-a0c1-b5d719c85b67@huawei.com>
 <319e3532-4555-7431-9d6f-3c3b7c11a5d9@arm.com>
 <d3aaa7e7-edb0-f867-0519-9a4e0bee35d2@huawei.com>
 <301590f1-817b-d8eb-1585-31208cba18af@arm.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <29fd5c20-faeb-1fd3-6535-4fca60463d01@huawei.com>
Date: Fri, 29 Jan 2021 14:12:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <301590f1-817b-d8eb-1585-31208cba18af@arm.com>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu <iommu@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Yang Yingliang <yangyingliang@huawei.com>
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



On 2021/1/29 0:17, Robin Murphy wrote:
> On 2021-01-28 15:18, Keqian Zhu wrote:
>>
>>
>> On 2021/1/27 17:39, Robin Murphy wrote:
>>> On 2021-01-27 07:36, Keqian Zhu wrote:
>>>>
>>>>
>>>> On 2021/1/27 10:01, Leizhen (ThunderTown) wrote:
>>>>>
>>>>>
>>>>> On 2021/1/26 18:12, Will Deacon wrote:
>>>>>> On Mon, Jan 25, 2021 at 08:23:40PM +0000, Robin Murphy wrote:
>>>>>>> Now we probably will need some degreee of BBML feature awareness for the
>>>>>>> sake of SVA if and when we start using it for CPU pagetables, but I still
>>>>>>> cannot see any need to consider it in io-pgtable.
>>>>>>
>>>>>> Agreed; I don't think this is something that io-pgtable should have to care
>>>>>> about.
>>>> Hi,
>>>>
>>>> I have a question here :-).
>>>> If the old table is not live, then the break procedure seems unnecessary. Do I miss something?
>>>
>>> The MMU is allowed to prefetch translations at any time, so not following the proper update procedure could still potentially lead to a TLB conflict, even if there's no device traffic to worry about disrupting.
>>>
>>> Robin.
>>
>> Thanks. Does the MMU you mention here includes MMU and SMMU? I know that at SMMU side, ATS can prefetch translation.
> 
> Yes, both - VMSAv8 allows speculative translation table walks, so SMMUv3 inherits from there (per 3.21.1 "Translation tables and TLB invalidation completion behavior").
OK, I Get it. Thanks.

Keqian.

> 
> Robin.
> 
>>
>> Keqian
>>>
>>>> Thanks,
>>>> Keqian
>>>>
>>>>>
>>>>> Yes, the SVA works in stall mode, and the failed device access requests are not
>>>>> discarded.
>>>>>
>>>>> Let me look for examples. The BBML usage scenario was told by a former colleague.
>>>>>
>>>>>>
>>>>>> Will
>>>>>>
>>>>>> .
>>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> linux-arm-kernel mailing list
>>>>> linux-arm-kernel@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>>> .
>>>>>
>>>> _______________________________________________
>>>> iommu mailing list
>>>> iommu@lists.linux-foundation.org
>>>> https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>>>
>>> .
>>>
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
