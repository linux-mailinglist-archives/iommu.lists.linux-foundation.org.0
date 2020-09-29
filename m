Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 372CA27C498
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 13:15:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25C55867D5;
	Tue, 29 Sep 2020 11:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7P15q2N0UDBy; Tue, 29 Sep 2020 11:15:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3735D867D9;
	Tue, 29 Sep 2020 11:15:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2383BC016F;
	Tue, 29 Sep 2020 11:15:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33A56C016F
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 11:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2FBE7867B7
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 11:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSSqL7Qt0VdW for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 11:15:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A5168855E1
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 11:15:41 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DCFDFD0187B43990C58A;
 Tue, 29 Sep 2020 19:15:37 +0800 (CST)
Received: from [10.63.139.185] (10.63.139.185) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 29 Sep 2020 19:15:31 +0800
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add rmb after reading event queue
 prod_reg
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Joerg Roedel
 <joro@8bytes.org>
References: <1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com>
 <160132830305.1858738.13352352759100546799.b4-ty@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <5F731754.5040609@hisilicon.com>
Date: Tue, 29 Sep 2020 19:15:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <160132830305.1858738.13352352759100546799.b4-ty@kernel.org>
X-Originating-IP: [10.63.139.185]
X-CFilter-Loop: Reflected
Cc: catalin.marinas@arm.com, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linuxarm@huawei.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020/9/29 6:13, Will Deacon wrote:
> On Mon, 28 Sep 2020 16:32:02 +0800, Zhou Wang wrote:
>> In arm_smmu_evtq_thread, reading event queue is from consumer pointer,
>> which has no address dependency on producer pointer, prog_reg(MMIO) and
>> event queue memory(Normal memory) can disorder. So the load for event queue
>> can be done before the load of prod_reg, then perhaps wrong event entry
>> value will be got.
>>
>> Add rmb to make sure to get correct event queue entry value.
> 
> Applied to will (for-joerg/arm-smmu/updates), thanks!
> 
> [1/1] iommu/arm-smmu-v3: Add rmb after reading event queue prod_reg
>       https://git.kernel.org/will/c/a76a37777f2c 
> 
> (please note that I changed the patch to use readl() instead of an rmb()
> in conjunction with the _relaxed() accessor, and then adjusted the cons
> side to match in terms of DMB vs DSB).

Thanks for taking this patch!

Best,
Zhou

> 
> Cheers,
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
