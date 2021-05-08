Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EE4377071
	for <lists.iommu@lfdr.de>; Sat,  8 May 2021 09:36:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D2964026F;
	Sat,  8 May 2021 07:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXaawnhFnsQq; Sat,  8 May 2021 07:36:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26988403F2;
	Sat,  8 May 2021 07:36:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0231FC0001;
	Sat,  8 May 2021 07:36:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3915CC0001
 for <iommu@lists.linux-foundation.org>; Sat,  8 May 2021 07:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EB2A60718
 for <iommu@lists.linux-foundation.org>; Sat,  8 May 2021 07:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BF5G2tzKcWkH for <iommu@lists.linux-foundation.org>;
 Sat,  8 May 2021 07:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96CCF606E3
 for <iommu@lists.linux-foundation.org>; Sat,  8 May 2021 07:36:12 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FcfF53gzYzBt7y;
 Sat,  8 May 2021 15:33:29 +0800 (CST)
Received: from [10.174.187.224] (10.174.187.224) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 15:35:58 +0800
Subject: Re: [RFC PATCH v4 01/13] iommu: Introduce dirty log tracking framework
To: Lu Baolu <baolu.lu@linux.intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yi Sun <yi.y.sun@linux.intel.com>, Tian Kevin <kevin.tian@intel.com>
References: <20210507102211.8836-1-zhukeqian1@huawei.com>
 <20210507102211.8836-2-zhukeqian1@huawei.com>
 <efc2d868-28ba-8ed9-1d6b-610b67d671b5@linux.intel.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <18ac787a-179e-71f7-728b-c43feda80a16@huawei.com>
Date: Sat, 8 May 2021 15:35:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <efc2d868-28ba-8ed9-1d6b-610b67d671b5@linux.intel.com>
X-Originating-IP: [10.174.187.224]
X-CFilter-Loop: Reflected
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Baolu,

On 2021/5/8 11:46, Lu Baolu wrote:
> Hi Keqian,
> 
> On 5/7/21 6:21 PM, Keqian Zhu wrote:
>> Some types of IOMMU are capable of tracking DMA dirty log, such as
>> ARM SMMU with HTTU or Intel IOMMU with SLADE. This introduces the
>> dirty log tracking framework in the IOMMU base layer.
>>
>> Four new essential interfaces are added, and we maintaince the status
>> of dirty log tracking in iommu_domain.
>> 1. iommu_support_dirty_log: Check whether domain supports dirty log tracking
>> 2. iommu_switch_dirty_log: Perform actions to start|stop dirty log tracking
>> 3. iommu_sync_dirty_log: Sync dirty log from IOMMU into a dirty bitmap
>> 4. iommu_clear_dirty_log: Clear dirty log of IOMMU by a mask bitmap
>>
>> Note: Don't concurrently call these interfaces with other ops that
>> access underlying page table.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   drivers/iommu/iommu.c        | 201 +++++++++++++++++++++++++++++++++++
>>   include/linux/iommu.h        |  63 +++++++++++
>>   include/trace/events/iommu.h |  63 +++++++++++
>>   3 files changed, 327 insertions(+)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 808ab70d5df5..0d15620d1e90 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -1940,6 +1940,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
>>       domain->type = type;
>>       /* Assume all sizes by default; the driver may override this later */
>>       domain->pgsize_bitmap  = bus->iommu_ops->pgsize_bitmap;
>> +    mutex_init(&domain->switch_log_lock);
>>         return domain;
>>   }
>> @@ -2703,6 +2704,206 @@ int iommu_set_pgtable_quirks(struct iommu_domain *domain,
>>   }
>>   EXPORT_SYMBOL_GPL(iommu_set_pgtable_quirks);
>>   +bool iommu_support_dirty_log(struct iommu_domain *domain)
>> +{
>> +    const struct iommu_ops *ops = domain->ops;
>> +
>> +    return ops->support_dirty_log && ops->support_dirty_log(domain);
>> +}
>> +EXPORT_SYMBOL_GPL(iommu_support_dirty_log);
> 
> I suppose this interface is to ask the vendor IOMMU driver to check
> whether each device/iommu in the domain supports dirty bit tracking.
> But what will happen if new devices with different tracking capability
> are added afterward?
Yep, this is considered in the vfio part. We will query again after attaching or
detaching devices from the domain.  When the domain becomes capable, we enable
dirty log for it. When it becomes not capable, we disable dirty log for it.

> 
> To make things simple, is it possible to support this tracking only when
> all underlying IOMMUs support dirty bit tracking?
IIUC, all underlying IOMMUs you refer is of system wide. I think this idea may has
two issues. 1) The target domain may just contains part of system IOMMUs. 2) The
dirty tracking capability can be related to the capability of devices. For example,
we can track dirty log based on IOPF, which needs the capability of devices. That's
to say, we can make this framework more common.

> 
> Or, the more crazy idea is that we don't need to check this capability
> at all. If dirty bit tracking is not supported by hardware, just mark
> all pages dirty?
Yeah, I think this idea is nice :).

Still one concern is that we may have other dirty tracking methods in the future,
if we can't track dirty through iommu, we can still try other methods.

If there is no interface to check this capability, we have no chance to try
other methods. What do you think?

> 
>> +
>> +int iommu_switch_dirty_log(struct iommu_domain *domain, bool enable,
>> +               unsigned long iova, size_t size, int prot)
>> +{
>> +    const struct iommu_ops *ops = domain->ops;
>> +    unsigned long orig_iova = iova;
>> +    unsigned int min_pagesz;
>> +    size_t orig_size = size;
>> +    bool flush = false;
>> +    int ret = 0;
>> +
>> +    if (unlikely(!ops->switch_dirty_log))
>> +        return -ENODEV;
>> +
>> +    min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
>> +    if (!IS_ALIGNED(iova | size, min_pagesz)) {
>> +        pr_err("unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
>> +               iova, size, min_pagesz);
>> +        return -EINVAL;
>> +    }
>> +
>> +    mutex_lock(&domain->switch_log_lock);
>> +    if (enable && domain->dirty_log_tracking) {
>> +        ret = -EBUSY;
>> +        goto out;
>> +    } else if (!enable && !domain->dirty_log_tracking) {
>> +        ret = -EINVAL;
>> +        goto out;
>> +    }
>> +
>> +    pr_debug("switch_dirty_log %s for: iova 0x%lx size 0x%zx\n",
>> +         enable ? "enable" : "disable", iova, size);
>> +
>> +    while (size) {
>> +        size_t pgsize = iommu_pgsize(domain, iova, size);
>> +
>> +        flush = true;
>> +        ret = ops->switch_dirty_log(domain, enable, iova, pgsize, prot);
> 
> Per minimal page callback is much expensive. How about using (pagesize,
> count), so that all pages with the same page size could be handled in a
> single indirect call? I remember I commented this during last review,
> but I don't mind doing it again.
Thanks for reminding me again :). I'll do that in next version.

Thanks,
Keqian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
