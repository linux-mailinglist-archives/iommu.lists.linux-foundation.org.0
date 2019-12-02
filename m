Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CBB10E81A
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 11:02:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C217420524;
	Mon,  2 Dec 2019 10:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 674tGmVjk1om; Mon,  2 Dec 2019 10:02:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB2E620529;
	Mon,  2 Dec 2019 10:02:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2591C087F;
	Mon,  2 Dec 2019 10:02:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A2EFC087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 10:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C91B20524
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 10:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDXOZTrfxBw0 for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 10:02:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by silver.osuosl.org (Postfix) with ESMTPS id F26702051A
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 10:02:41 +0000 (UTC)
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 2998B39E9A46CA465067;
 Mon,  2 Dec 2019 10:02:39 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml704-cah.china.huawei.com (10.201.108.45) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 2 Dec 2019 10:02:38 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 10:02:38 +0000
Subject: Re: [Patch v2 2/3] iommu: optimize iova_magazine_free_pfns()
To: Cong Wang <xiyou.wangcong@gmail.com>
References: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
 <20191129004855.18506-3-xiyou.wangcong@gmail.com>
 <dc182be3-be98-9a8e-013c-16df0e529ed2@huawei.com>
 <CAM_iQpX3MKoBRvxqc-bJ0HvASNeZmvVCYhbT53maMy-rqy4eiw@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <9996d30c-e063-e74d-925f-4181c36ca764@huawei.com>
Date: Mon, 2 Dec 2019 10:02:38 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAM_iQpX3MKoBRvxqc-bJ0HvASNeZmvVCYhbT53maMy-rqy4eiw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>
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

On 30/11/2019 06:02, Cong Wang wrote:
> On Fri, Nov 29, 2019 at 5:24 AM John Garry <john.garry@huawei.com> wrote:
>>
>> On 29/11/2019 00:48, Cong Wang wrote:
>>> If the maganize is empty, iova_magazine_free_pfns() should
>>
>> magazine
> 
> Good catch!
> 
>>
>>> be a nop, however it misses the case of mag->size==0. So we
>>> should just call iova_magazine_empty().
>>>
>>> This should reduce the contention on iovad->iova_rbtree_lock
>>> a little bit.
>>>
>>> Cc: Joerg Roedel <joro@8bytes.org>
>>> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
>>> ---
>>>    drivers/iommu/iova.c | 22 +++++++++++-----------
>>>    1 file changed, 11 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
>>> index cb473ddce4cf..184d4c0e20b5 100644
>>> --- a/drivers/iommu/iova.c
>>> +++ b/drivers/iommu/iova.c
>>> @@ -797,13 +797,23 @@ static void iova_magazine_free(struct iova_magazine *mag)
>>>        kfree(mag);
>>>    }
>>>
>>> +static bool iova_magazine_full(struct iova_magazine *mag)
>>> +{
>>> +     return (mag && mag->size == IOVA_MAG_SIZE);
>>> +}
>>> +
>>> +static bool iova_magazine_empty(struct iova_magazine *mag)
>>> +{
>>> +     return (!mag || mag->size == 0);
>>> +}
>>> +
>>>    static void
>>>    iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
>>>    {
>>>        unsigned long flags;
>>>        int i;
>>>
>>> -     if (!mag)
>>> +     if (iova_magazine_empty(mag))
>>
>> The only hot path we this call is
>> __iova_rcache_insert()->iova_magazine_free_pfns(mag_to_free) and
>> mag_to_free is full in this case, so I am sure how the additional check
>> helps, right?
> 
> This is what I mean by "a little bit" in changelog, did you miss it or
> misunderstand it? :)

I was concerned that in the fastpath we actually make things very 
marginally slower by adding a check which will fail.

Thanks,
John

> 
> Thanks.
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
