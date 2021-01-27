Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C8930571A
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 10:39:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CEC7E214F6;
	Wed, 27 Jan 2021 09:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9-WFpAIJ77P; Wed, 27 Jan 2021 09:39:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0931921080;
	Wed, 27 Jan 2021 09:39:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D25D3C013A;
	Wed, 27 Jan 2021 09:39:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EBE3C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 13A3885BA9
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prSKSVE5Hq6P for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 09:39:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2DB948639E
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:39:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8957131B;
 Wed, 27 Jan 2021 01:39:40 -0800 (PST)
Received: from [10.57.46.236] (unknown [10.57.46.236])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65DC03F66B;
 Wed, 27 Jan 2021 01:39:39 -0800 (PST)
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: add support for BBML
To: Keqian Zhu <zhukeqian1@huawei.com>, Will Deacon <will@kernel.org>
References: <20201126034230.777-1-thunder.leizhen@huawei.com>
 <20210122125132.GB24102@willie-the-truck>
 <aac11411-f6cd-f990-fe53-db0d8c07f3a0@huawei.com>
 <1bfd1ca0-953e-e943-f87e-144d5537bd0c@arm.com>
 <20210126101230.GA29204@willie-the-truck>
 <8a9685ec-67aa-824f-5429-f408bf79c5ab@huawei.com>
 <32f4752f-6954-183a-a0c1-b5d719c85b67@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <319e3532-4555-7431-9d6f-3c3b7c11a5d9@arm.com>
Date: Wed, 27 Jan 2021 09:39:38 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <32f4752f-6954-183a-a0c1-b5d719c85b67@huawei.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-01-27 07:36, Keqian Zhu wrote:
> 
> 
> On 2021/1/27 10:01, Leizhen (ThunderTown) wrote:
>>
>>
>> On 2021/1/26 18:12, Will Deacon wrote:
>>> On Mon, Jan 25, 2021 at 08:23:40PM +0000, Robin Murphy wrote:
>>>> Now we probably will need some degreee of BBML feature awareness for the
>>>> sake of SVA if and when we start using it for CPU pagetables, but I still
>>>> cannot see any need to consider it in io-pgtable.
>>>
>>> Agreed; I don't think this is something that io-pgtable should have to care
>>> about.
> Hi,
> 
> I have a question here :-).
> If the old table is not live, then the break procedure seems unnecessary. Do I miss something?

The MMU is allowed to prefetch translations at any time, so not 
following the proper update procedure could still potentially lead to a 
TLB conflict, even if there's no device traffic to worry about disrupting.

Robin.

> Thanks,
> Keqian
> 
>>
>> Yes, the SVA works in stall mode, and the failed device access requests are not
>> discarded.
>>
>> Let me look for examples. The BBML usage scenario was told by a former colleague.
>>
>>>
>>> Will
>>>
>>> .
>>>
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>> .
>>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
