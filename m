Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0689136030A
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 09:13:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C446846D1;
	Thu, 15 Apr 2021 07:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_oYtOUoDuIJ; Thu, 15 Apr 2021 07:13:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 560FD846D0;
	Thu, 15 Apr 2021 07:13:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F6C3C000A;
	Thu, 15 Apr 2021 07:13:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17DC2C000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 07:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 040E240F62
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 07:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jdWgUHp7S4RU for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:13:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A495C40E9C
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 07:13:34 +0000 (UTC)
IronPort-SDR: Wr2G9hSPdYaFd3FFBT2kqbUI5iUXfAmU2ss//7SqIUvimFEjsU9yYrbecfESRaKQdi6HssU831
 EYlDchBOvEJg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174299038"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="174299038"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 00:13:33 -0700
IronPort-SDR: N7a/losEaCAlfPsp0RkiF5M5/3RUguWGDB4OlvAUxaL1WE0aXMlAc18uuES1cel2X0mOe1zXJ4
 U37IARQwIqgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="444089450"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2021 00:13:29 -0700
Subject: Re: [PATCH v3 01/12] iommu: Introduce dirty log tracking framework
To: Keqian Zhu <zhukeqian1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Yi Sun <yi.y.sun@linux.intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Tian Kevin <kevin.tian@intel.com>
References: <20210413085457.25400-1-zhukeqian1@huawei.com>
 <20210413085457.25400-2-zhukeqian1@huawei.com>
 <fe337950-f8d0-3d21-a7b1-98b385d71f3e@linux.intel.com>
 <e42373e3-10d5-5a34-8f33-8bb82d64fb19@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <56b001fa-b4fe-c595-dc5e-f362d2f07a19@linux.intel.com>
Date: Thu, 15 Apr 2021 15:03:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e42373e3-10d5-5a34-8f33-8bb82d64fb19@huawei.com>
Content-Language: en-US
Cc: jiangkunkun@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, lushenming@huawei.com,
 Alex Williamson <alex.williamson@redhat.com>, wanghaibin.wang@huawei.com
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

On 4/15/21 2:18 PM, Keqian Zhu wrote:
> Hi Baolu,
> 
> Thanks for the review!
> 
> On 2021/4/14 15:00, Lu Baolu wrote:
>> Hi Keqian,
>>
>> On 4/13/21 4:54 PM, Keqian Zhu wrote:
>>> Some types of IOMMU are capable of tracking DMA dirty log, such as
>>> ARM SMMU with HTTU or Intel IOMMU with SLADE. This introduces the
>>> dirty log tracking framework in the IOMMU base layer.
>>>
>>> Three new essential interfaces are added, and we maintaince the status
>>> of dirty log tracking in iommu_domain.
>>> 1. iommu_switch_dirty_log: Perform actions to start|stop dirty log tracking
>>> 2. iommu_sync_dirty_log: Sync dirty log from IOMMU into a dirty bitmap
>>> 3. iommu_clear_dirty_log: Clear dirty log of IOMMU by a mask bitmap
>>>
>>> A new dev feature are added to indicate whether a specific type of
>>> iommu hardware supports and its driver realizes them.
>>>
>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>>> ---
>>>    drivers/iommu/iommu.c | 150 ++++++++++++++++++++++++++++++++++++++++++
>>>    include/linux/iommu.h |  53 +++++++++++++++
>>>    2 files changed, 203 insertions(+)
>>>
>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>> index d0b0a15dba84..667b2d6d2fc0 100644
>>> --- a/drivers/iommu/iommu.c
>>> +++ b/drivers/iommu/iommu.c
>>> @@ -1922,6 +1922,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
>>>        domain->type = type;
>>>        /* Assume all sizes by default; the driver may override this later */
>>>        domain->pgsize_bitmap  = bus->iommu_ops->pgsize_bitmap;
>>> +    mutex_init(&domain->switch_log_lock);
>>>          return domain;
>>>    }
>>> @@ -2720,6 +2721,155 @@ int iommu_domain_set_attr(struct iommu_domain *domain,
>>>    }
>>>    EXPORT_SYMBOL_GPL(iommu_domain_set_attr);
>>>    +int iommu_switch_dirty_log(struct iommu_domain *domain, bool enable,
>>> +               unsigned long iova, size_t size, int prot)
>>> +{
>>> +    const struct iommu_ops *ops = domain->ops;
>>> +    int ret;
>>> +
>>> +    if (unlikely(!ops || !ops->switch_dirty_log))
>>> +        return -ENODEV;
>>> +
>>> +    mutex_lock(&domain->switch_log_lock);
>>> +    if (enable && domain->dirty_log_tracking) {
>>> +        ret = -EBUSY;
>>> +        goto out;
>>> +    } else if (!enable && !domain->dirty_log_tracking) {
>>> +        ret = -EINVAL;
>>> +        goto out;
>>> +    }
>>> +
>>> +    ret = ops->switch_dirty_log(domain, enable, iova, size, prot);
>>> +    if (ret)
>>> +        goto out;
>>> +
>>> +    domain->dirty_log_tracking = enable;
>>> +out:
>>> +    mutex_unlock(&domain->switch_log_lock);
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(iommu_switch_dirty_log);
>>
>> Since you also added IOMMU_DEV_FEAT_HWDBM, I am wondering what's the
>> difference between
>>
>> iommu_switch_dirty_log(on) vs. iommu_dev_enable_feature(IOMMU_DEV_FEAT_HWDBM)
>>
>> iommu_switch_dirty_log(off) vs. iommu_dev_disable_feature(IOMMU_DEV_FEAT_HWDBM)
> Indeed. As I can see, IOMMU_DEV_FEAT_AUX is not switchable, so enable/disable
> are not applicable for it. IOMMU_DEV_FEAT_SVA is switchable, so we can use these
> interfaces for it.
> 
> IOMMU_DEV_FEAT_HWDBM is used to indicate whether hardware supports HWDBM, so we should

Previously we had iommu_dev_has_feature() and then was cleaned up due to
lack of real users. If you have a real case for it, why not bringing it
back?

> design it as not switchable. I will modify the commit message of patch#12, thanks!

I am not sure that I fully get your point. But I can't see any gaps of
using iommu_dev_enable/disable_feature() to switch dirty log on and off.
Probably I missed anything.

> 
>>
>>> +
>>> +int iommu_sync_dirty_log(struct iommu_domain *domain, unsigned long iova,
>>> +             size_t size, unsigned long *bitmap,
>>> +             unsigned long base_iova, unsigned long bitmap_pgshift)
>>> +{
>>> +    const struct iommu_ops *ops = domain->ops;
>>> +    unsigned int min_pagesz;
>>> +    size_t pgsize;
>>> +    int ret = 0;
>>> +
>>> +    if (unlikely(!ops || !ops->sync_dirty_log))
>>> +        return -ENODEV;
>>> +
>>> +    min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
>>> +    if (!IS_ALIGNED(iova | size, min_pagesz)) {
>>> +        pr_err("unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
>>> +               iova, size, min_pagesz);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    mutex_lock(&domain->switch_log_lock);
>>> +    if (!domain->dirty_log_tracking) {
>>> +        ret = -EINVAL;
>>> +        goto out;
>>> +    }
>>> +
>>> +    while (size) {
>>> +        pgsize = iommu_pgsize(domain, iova, size);
>>> +
>>> +        ret = ops->sync_dirty_log(domain, iova, pgsize,
>>> +                      bitmap, base_iova, bitmap_pgshift);
>>
>> Any reason why do you want to do this in a per-4K page manner? This can
>> lead to a lot of indirect calls and bad performance.
>>
>> How about a sync_dirty_pages()?
> The function name of iommu_pgsize() is a bit puzzling. Actually it will try to
> compute the max size that fit into size, so the pgsize can be a large page size
> even if the underlying mapping is 4K. The __iommu_unmap() also has a similar logic.

This series has some improvement on the iommu_pgsize() helper.

https://lore.kernel.org/linux-iommu/20210405191112.28192-1-isaacm@codeaurora.org/

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
