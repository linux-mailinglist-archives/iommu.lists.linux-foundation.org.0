Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A137B83B
	for <lists.iommu@lfdr.de>; Wed, 12 May 2021 10:44:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50A6583BA9;
	Wed, 12 May 2021 08:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-pqoNRhyJya; Wed, 12 May 2021 08:44:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69B1C83C0E;
	Wed, 12 May 2021 08:44:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34905C0024;
	Wed, 12 May 2021 08:44:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DE57C0001
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 08:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2808F402D8
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 08:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAaTA9bmZFMg for <iommu@lists.linux-foundation.org>;
 Wed, 12 May 2021 08:44:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B4584019A
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 08:44:21 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fg7ZR35LGzlYJM;
 Wed, 12 May 2021 16:42:07 +0800 (CST)
Received: from [10.174.187.224] (10.174.187.224) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 16:44:11 +0800
Subject: Re: [RFC PATCH v4 01/13] iommu: Introduce dirty log tracking framework
To: Lu Baolu <baolu.lu@linux.intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yi Sun <yi.y.sun@linux.intel.com>, Tian Kevin <kevin.tian@intel.com>
References: <20210507102211.8836-1-zhukeqian1@huawei.com>
 <20210507102211.8836-2-zhukeqian1@huawei.com>
 <efc2d868-28ba-8ed9-1d6b-610b67d671b5@linux.intel.com>
 <18ac787a-179e-71f7-728b-c43feda80a16@huawei.com>
 <55fda826-9ab6-a3a0-b17e-a4d4879f00bc@linux.intel.com>
 <a8df289a-47c2-c193-cd6f-8415f68b900f@huawei.com>
 <f47e90c6-f3c4-b28f-a810-e03afe79e62d@linux.intel.com>
 <60182a35-e151-7150-3708-4e58dd8e78da@huawei.com>
 <36cc7267-6aa3-db54-b08c-c2dfc0bbacb6@linux.intel.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <e38f1837-b814-3717-2faf-4df8349cb57c@huawei.com>
Date: Wed, 12 May 2021 16:44:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <36cc7267-6aa3-db54-b08c-c2dfc0bbacb6@linux.intel.com>
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



On 2021/5/12 11:20, Lu Baolu wrote:
> On 5/11/21 3:40 PM, Keqian Zhu wrote:
>>> For upper layers, before starting page tracking, they check the
>>> dirty_page_trackable attribution of the domain and start it only it's
>>> capable. Once the page tracking is switched on the vendor iommu driver
>>> (or iommu core) should block further device attach/detach operations
>>> until page tracking is stopped.
>> But when a domain becomes capable after detaching a device, the upper layer
>> still needs to query it and enable dirty log for it...
>>
>> To make things coordinated, maybe the upper layer can register a notifier,
>> when the domain's capability change, the upper layer do not need to query, instead
>> they just need to realize a callback, and do their specific policy in the callback.
>> What do you think?
>>
> 
> That might be an option. But why not checking domain's attribution every
> time a new tracking period is about to start?
Hi Baolu,

I'll add an attribution in iommu_domain, and the vendor iommu driver will update
the attribution when attach/detach devices.

The attribute should be protected by a lock, so the upper layer shouldn't access
the attribute directly. Then the iommu_domain_support_dirty_log() still should be
retained. Does this design looks good to you?

Thanks,
Keqian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
