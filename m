Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFE321885E
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 15:02:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C154887871;
	Wed,  8 Jul 2020 13:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gt41h+4PeByj; Wed,  8 Jul 2020 13:02:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB36187799;
	Wed,  8 Jul 2020 13:02:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A13A6C016F;
	Wed,  8 Jul 2020 13:02:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A748C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 13:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 967A78948F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 13:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bsgi2g6LNFKy for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 13:02:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 883F68946D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 13:02:40 +0000 (UTC)
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 6303BD8543793A5CD515;
 Wed,  8 Jul 2020 14:02:36 +0100 (IST)
Received: from [127.0.0.1] (10.210.171.111) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Wed, 8 Jul 2020
 14:02:35 +0100
From: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH 0/4] iommu/arm-smmu-v3: Improve cmdq lock efficiency
To: <will@kernel.org>, <robin.murphy@arm.com>
References: <1592846920-45338-1-git-send-email-john.garry@huawei.com>
Message-ID: <a5f98ff2-2d93-7306-9af9-a7bfc347757e@huawei.com>
Date: Wed, 8 Jul 2020 14:00:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1592846920-45338-1-git-send-email-john.garry@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.210.171.111]
X-ClientProxiedBy: lhreml709-chm.china.huawei.com (10.201.108.58) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: trivial@kernel.org, maz@kernel.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
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

On 22/06/2020 18:28, John Garry wrote:

Hi, Can you guys let me know if this is on the radar at all?

I have been talking about this performance issue since Jan, and not 
getting anything really.

thanks

> As mentioned in [0], the CPU may consume many cycles processing
> arm_smmu_cmdq_issue_cmdlist(). One issue we find is the cmpxchg() loop to
> get space on the queue takes approx 25% of the cycles for this function.
> 
> This series removes that cmpxchg().
> 
> For my NVMe test with 3x NVMe SSDs, I'm getting a ~24% throughput
> increase:
> Before: 1310 IOPs
> After: 1630 IOPs
> 
> I also have a test harness to check the rate of DMA map+unmaps we can
> achieve:
> 
> CPU count	32	64	128
> Before:		63187	19418	10169
> After:		93287	44789	15862
> 
> (unit is map+unmaps per CPU per second)
> 
> [0] https://lore.kernel.org/linux-iommu/B926444035E5E2439431908E3842AFD24B86DB@DGGEMI525-MBS.china.huawei.com/T/#ma02e301c38c3e94b7725e685757c27e39c7cbde3
> 
> John Garry (4):
>    iommu/arm-smmu-v3: Fix trivial typo
>    iommu/arm-smmu-v3: Calculate bits for prod and owner
>    iommu/arm-smmu-v3: Always issue a CMD_SYNC per batch
>    iommu/arm-smmu-v3: Remove cmpxchg() in arm_smmu_cmdq_issue_cmdlist()
> 
>   drivers/iommu/arm-smmu-v3.c | 233 +++++++++++++++++++++++-------------
>   1 file changed, 151 insertions(+), 82 deletions(-)
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
