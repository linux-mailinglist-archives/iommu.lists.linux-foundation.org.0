Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B413054C3
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 08:36:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3191D867C0;
	Wed, 27 Jan 2021 07:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I41k3xpoYVaa; Wed, 27 Jan 2021 07:36:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A5A58682D;
	Wed, 27 Jan 2021 07:36:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05DE2C013A;
	Wed, 27 Jan 2021 07:36:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4069AC013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 07:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 278DA8701A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 07:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4+VrZHYIRAEH for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 07:36:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 28B0086E6E
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 07:36:25 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DQb3s05f2zjCv3;
 Wed, 27 Jan 2021 15:35:21 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Wed, 27 Jan 2021 15:36:09 +0800
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: add support for BBML
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
References: <20201126034230.777-1-thunder.leizhen@huawei.com>
 <20210122125132.GB24102@willie-the-truck>
 <aac11411-f6cd-f990-fe53-db0d8c07f3a0@huawei.com>
 <1bfd1ca0-953e-e943-f87e-144d5537bd0c@arm.com>
 <20210126101230.GA29204@willie-the-truck>
 <8a9685ec-67aa-824f-5429-f408bf79c5ab@huawei.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <32f4752f-6954-183a-a0c1-b5d719c85b67@huawei.com>
Date: Wed, 27 Jan 2021 15:36:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <8a9685ec-67aa-824f-5429-f408bf79c5ab@huawei.com>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Jean-Philippe
 Brucker <jean-philippe@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, Yang
 Yingliang <yangyingliang@huawei.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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



On 2021/1/27 10:01, Leizhen (ThunderTown) wrote:
> 
> 
> On 2021/1/26 18:12, Will Deacon wrote:
>> On Mon, Jan 25, 2021 at 08:23:40PM +0000, Robin Murphy wrote:
>>> Now we probably will need some degreee of BBML feature awareness for the
>>> sake of SVA if and when we start using it for CPU pagetables, but I still
>>> cannot see any need to consider it in io-pgtable.
>>
>> Agreed; I don't think this is something that io-pgtable should have to care
>> about.
Hi,

I have a question here :-).
If the old table is not live, then the break procedure seems unnecessary. Do I miss something?

Thanks,
Keqian

> 
> Yes, the SVA works in stall mode, and the failed device access requests are not
> discarded.
> 
> Let me look for examples. The BBML usage scenario was told by a former colleague.
> 
>>
>> Will
>>
>> .
>>
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
