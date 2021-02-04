Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DA230BF1E
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 14:16:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EEAC720763;
	Tue,  2 Feb 2021 13:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBm8TmTYPkSl; Tue,  2 Feb 2021 13:14:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ABD0120453;
	Tue,  2 Feb 2021 13:14:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CB63C013A;
	Tue,  2 Feb 2021 13:14:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4636FC013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 39B0384906
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:14:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANOCwH8ER3fp for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 13:14:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ED29D8489C
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:14:45 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVQGh3THKzMSx2;
 Tue,  2 Feb 2021 21:13:00 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Feb 2021 21:14:30 +0800
Subject: Re: [PATCH] iommu: Update the document of IOMMU_DOMAIN_UNMANAGED
To: Robin Murphy <robin.murphy@arm.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>
References: <20210202085330.31716-1-zhukeqian1@huawei.com>
 <8eac9259-66e5-9b83-39a9-46a86097d450@arm.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <c8aebb44-a5ff-9532-facf-b33e0402e660@huawei.com>
Date: Tue, 2 Feb 2021 21:14:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <8eac9259-66e5-9b83-39a9-46a86097d450@arm.com>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Marc Zyngier <maz@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 jiangkunkun@huawei.com, Will Deacon <will@kernel.org>,
 wanghaibin.wang@huawei.com
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



On 2021/2/2 20:58, Robin Murphy wrote:
> On 2021-02-02 08:53, Keqian Zhu wrote:
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>   include/linux/iommu.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> index 77e561ed57fd..e8f2efae212b 100644
>> --- a/include/linux/iommu.h
>> +++ b/include/linux/iommu.h
>> @@ -68,7 +68,7 @@ struct iommu_domain_geometry {
>>    *                  devices
>>    *    IOMMU_DOMAIN_IDENTITY    - DMA addresses are system physical addresses
>>    *    IOMMU_DOMAIN_UNMANAGED    - DMA mappings managed by IOMMU-API user, used
>> - *                  for VMs
>> + *                  for VMs or userspace driver frameworks
> 
> Given that "VMs" effectively has to mean VFIO, doesn't it effectively already imply other uses of VFIO anyway? Unmanaged domains are also used in other subsystems/drivers inside the kernel and we're not naming those, so I don't see that it's particularly helpful to specifically call out one more VFIO use-case.
> 
> Perhaps the current wording could be generalised a little more, but we certainly don't want to start trying to maintain an exhaustive list of users here...
Yep, a more generalised description is better. After I have a look at all the use cases...

Thanks,
Keqian

> 
> Robin.
> 
>>    *    IOMMU_DOMAIN_DMA    - Internally used for DMA-API implementations.
>>    *                  This flag allows IOMMU drivers to implement
>>    *                  certain optimizations for these domains
>>
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
