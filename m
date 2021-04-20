Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F98364FD2
	for <lists.iommu@lfdr.de>; Tue, 20 Apr 2021 03:26:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D93BF404D2;
	Tue, 20 Apr 2021 01:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I34Mxjkvlq61; Tue, 20 Apr 2021 01:26:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59B540394;
	Tue, 20 Apr 2021 01:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96AD0C000B;
	Tue, 20 Apr 2021 01:26:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9FB8C000B
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 01:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0E4340347
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 01:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zR7nM-lw2bly for <iommu@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 01:26:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E79240355
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 01:26:03 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FPQsw6RDnzmdXJ;
 Tue, 20 Apr 2021 09:23:00 +0800 (CST)
Received: from [10.174.187.224] (10.174.187.224) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 20 Apr 2021 09:25:54 +0800
Subject: Re: [PATCH v3 02/12] iommu: Add iommu_split_block interface
To: Lu Baolu <baolu.lu@linux.intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Yi Sun <yi.y.sun@linux.intel.com>, "Jean-Philippe
 Brucker" <jean-philippe@linaro.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Tian Kevin <kevin.tian@intel.com>
References: <20210413085457.25400-1-zhukeqian1@huawei.com>
 <20210413085457.25400-3-zhukeqian1@huawei.com>
 <fb350f27-be8b-80bf-1ce8-e7e8aba26f02@linux.intel.com>
 <491da550-dc54-42e6-ac91-13d411575fad@huawei.com>
 <bc2da48b-f4f7-5a46-2696-2c412a83d190@linux.intel.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <ac966fbc-7bc6-9d88-e53e-bcd92d536fdb@huawei.com>
Date: Tue, 20 Apr 2021 09:25:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <bc2da48b-f4f7-5a46-2696-2c412a83d190@linux.intel.com>
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

On 2021/4/19 21:33, Lu Baolu wrote:
> Hi Keqian,
> 
> On 2021/4/19 17:32, Keqian Zhu wrote:
>>>> +EXPORT_SYMBOL_GPL(iommu_split_block);
>>> Do you really have any consumers of this interface other than the dirty
>>> bit tracking? If not, I don't suggest to make this as a generic IOMMU
>>> interface.
>>>
>>> There is an implicit requirement for such interfaces. The
>>> iommu_map/unmap(iova, size) shouldn't be called at the same time.
>>> Currently there's no such sanity check in the iommu core. A poorly
>>> written driver could mess up the kernel by misusing this interface.
>> Yes, I don't think up a scenario except dirty tracking.
>>
>> Indeed, we'd better not make them as a generic interface.
>>
>> Do you have any suggestion that underlying iommu drivers can share these code but
>> not make it as a generic iommu interface?
>>
>> I have a not so good idea. Make the "split" interfaces as a static function, and
>> transfer the function pointer to start_dirty_log. But it looks weird and inflexible.
> 
> I understand splitting/merging super pages is an optimization, but not a
> functional requirement. So is it possible to let the vendor iommu driver
> decide whether splitting super pages when starting dirty bit tracking
> and the opposite operation during when stopping it? The requirement for
Right. If I understand you correct, actually that is what this series does.
We realized split/merge in IOMMU core layer, but don't force vendor driver to use it.

The problem is that when we expose these interfaces to vendor IOMMU driver, will also
expose them to upper driver.

> upper layer is that starting/stopping dirty bit tracking and
> mapping/unmapping are mutually exclusive.
OK, I will explicitly add the hints. Thanks.

Thanks,
Keqian
> 
>>
>> On the other hand, if a driver calls map/unmap with split/merge at the same time,
>> it's a bug of driver, it should follow the rule.
>>
> 
> Best regards,
> baolu
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
