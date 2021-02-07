Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F23120BC
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 02:43:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 14BA1204D7;
	Sun,  7 Feb 2021 01:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTp9Tlb5sio5; Sun,  7 Feb 2021 01:43:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5BD98204A1;
	Sun,  7 Feb 2021 01:43:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31342C1834;
	Sun,  7 Feb 2021 01:43:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA910C013A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 01:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DCCA387094
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 01:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4cMQEawRVKn for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 01:43:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ACDB38708F
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 01:43:04 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DYBhf58fzz164j9;
 Sun,  7 Feb 2021 09:41:38 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Sun, 7 Feb 2021 09:42:50 +0800
Subject: Re: [RFC PATCH 01/11] iommu/arm-smmu-v3: Add feature detection for
 HTTU
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210128151742.18840-1-zhukeqian1@huawei.com>
 <20210128151742.18840-2-zhukeqian1@huawei.com>
 <f8be5718-d4d9-0565-eaf0-b5a128897d15@arm.com>
 <df1b8fb2-b853-e797-0072-9dbdffc4ff67@huawei.com> <YB0VErwkA0ivRXTd@myrica>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <a07eee49-e997-8e7a-f510-64d23b9c9b98@huawei.com>
Date: Sun, 7 Feb 2021 09:42:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <YB0VErwkA0ivRXTd@myrica>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will
 Deacon <will@kernel.org>, jiangkunkun@huawei.com, lushenming@huawei.com,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux-foundation.org,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 wanghaibin.wang@huawei.com, Robin Murphy <robin.murphy@arm.com>,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
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

Hi Jean,

On 2021/2/5 17:51, Jean-Philippe Brucker wrote:
> Hi Keqian,
> 
> On Fri, Feb 05, 2021 at 05:13:50PM +0800, Keqian Zhu wrote:
>>> We need to accommodate the firmware override as well if we need this to be meaningful. Jean-Philippe is already carrying a suitable patch in the SVA stack[1].
>> Robin, Thanks for pointing it out.
>>
>> Jean, I see that the IORT HTTU flag overrides the hardware register info unconditionally. I have some concern about it:
>>
>> If the override flag has HTTU but hardware doesn't support it, then driver will use this feature but receive access fault or permission fault from SMMU unexpectedly.
>> 1) If IOPF is not supported, then kernel can not work normally.
>> 2) If IOPF is supported, kernel will perform useless actions, such as HTTU based dma dirty tracking (this series).
>>
>> As the IORT spec doesn't give an explicit explanation for HTTU override, can we comprehend it as a mask for HTTU related hardware register?
> 
> To me "Overrides the value of SMMU_IDR0.HTTU" is clear enough: disregard
> the value of SMMU_IDR0.HTTU and use the one specified by IORT instead. And
> that's both ways, since there is no validity mask for the IORT value: if
> there is an IORT table, always ignore SMMU_IDR0.HTTU.
> 
> That's how the SMMU driver implements the COHACC bit, which has the same
> wording in IORT. So I think we should implement HTTU the same way.
OK, and Robin said that the latest IORT spec literally states it.

> 
> One complication is that there is no equivalent override for device tree.
> I think it can be added later if necessary, because unlike IORT it can be
> tri state (property not present, overriden positive, overridden negative).
Yeah, that would be more flexible. ;-)

> 
> Thanks,
> Jean
> 
> .
> 
Thanks,
Keqian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
