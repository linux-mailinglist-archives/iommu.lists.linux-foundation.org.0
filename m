Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 141973E128C
	for <lists.iommu@lfdr.de>; Thu,  5 Aug 2021 12:23:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 528F5402A3;
	Thu,  5 Aug 2021 10:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eL5tO7zWtkc2; Thu,  5 Aug 2021 10:22:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 24AF040330;
	Thu,  5 Aug 2021 10:22:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 007DCC000E;
	Thu,  5 Aug 2021 10:22:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0810DC000E
 for <iommu@lists.linux-foundation.org>; Thu,  5 Aug 2021 10:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAC954044D
 for <iommu@lists.linux-foundation.org>; Thu,  5 Aug 2021 10:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_y4tdT1XMY8 for <iommu@lists.linux-foundation.org>;
 Thu,  5 Aug 2021 10:22:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E200D4040F
 for <iommu@lists.linux-foundation.org>; Thu,  5 Aug 2021 10:22:50 +0000 (UTC)
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GgPn36gKWz6F8JB;
 Thu,  5 Aug 2021 18:22:31 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 12:22:47 +0200
Received: from [10.47.24.8] (10.47.24.8) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 5 Aug 2021
 11:22:46 +0100
Subject: Re: [PATCH] iommu/arm-smmu-v3: Remove some unneeded init in
 arm_smmu_cmdq_issue_cmdlist()
To: <will@kernel.org>, <robin.murphy@arm.com>
References: <1624293394-202509-1-git-send-email-john.garry@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <bebc7b1b-e60c-d5e6-812a-63580d7029cc@huawei.com>
Date: Thu, 5 Aug 2021 11:22:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1624293394-202509-1-git-send-email-john.garry@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.47.24.8]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On 21/06/2021 17:36, John Garry wrote:
> Members of struct "llq" will be zero-inited, apart from member max_n_shift.
> But we write llq.val straight after the init, so it was pointless to zero
> init those other members. As such, separately init member max_n_shift
> only.
> 
> In addition, struct "head" is initialised to "llq" only so that member
> max_n_shift is set. But that member is never referenced for "head", so
> remove any init there.
> 
> Removing these initializations is seen as a small performance optimisation,
> as this code is (very) hot path.
> 

Hi Will,

Any chance you can pick up this small optimisation?

Cheers

> Signed-off-by: John Garry <john.garry@huawei.com>
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 54b2f27b81d4..8a8ad49bb7fd 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -727,11 +727,11 @@ static int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>   	unsigned long flags;
>   	bool owner;
>   	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> -	struct arm_smmu_ll_queue llq = {
> -		.max_n_shift = cmdq->q.llq.max_n_shift,
> -	}, head = llq;
> +	struct arm_smmu_ll_queue llq, head;
>   	int ret = 0;
>   
> +	llq.max_n_shift = cmdq->q.llq.max_n_shift;
> +
>   	/* 1. Allocate some space in the queue */
>   	local_irq_save(flags);
>   	llq.val = READ_ONCE(cmdq->q.llq.val);
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
