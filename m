Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F847344DE7
	for <lists.iommu@lfdr.de>; Mon, 22 Mar 2021 18:58:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBF8E8316A;
	Mon, 22 Mar 2021 17:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHqwUpmq1bwM; Mon, 22 Mar 2021 17:58:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D2E83168;
	Mon, 22 Mar 2021 17:58:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E77AC0001;
	Mon, 22 Mar 2021 17:58:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25200C000B
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 17:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EB5D4038E
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 17:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ipTr4tF-ib8 for <iommu@lists.linux-foundation.org>;
 Mon, 22 Mar 2021 17:58:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C422040389
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 17:58:11 +0000 (UTC)
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4F42B73Xq5z6829K;
 Tue, 23 Mar 2021 01:51:43 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 18:58:08 +0100
Received: from [10.210.167.192] (10.210.167.192) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 17:58:07 +0000
Subject: Re: [PATCH 0/3] iommu/iova: Add CPU hotplug handler to flush rcaches
 to core code
To: <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <joro@8bytes.org>,
 <will@kernel.org>
References: <1614600741-15696-1-git-send-email-john.garry@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <7ff533de-d9da-6325-4275-79951fa5657c@huawei.com>
Date: Mon, 22 Mar 2021 17:55:53 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1614600741-15696-1-git-send-email-john.garry@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.210.167.192]
X-ClientProxiedBy: lhreml718-chm.china.huawei.com (10.201.108.69) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com
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

On 01/03/2021 12:12, John Garry wrote:
> The Intel IOMMU driver supports flushing the per-CPU rcaches when a CPU is
> offlined.
> 
> Let's move it to core code, so everyone can take advantage.
> 
> Also correct a code comment.
> 
> Based on v5.12-rc1. Tested on arm64 only.

Hi guys,

Friendly reminder ...

Thanks
John

> 
> John Garry (3):
>    iova: Add CPU hotplug handler to flush rcaches
>    iommu/vt-d: Remove IOVA domain rcache flushing for CPU offlining
>    iova: Correct comment for free_cpu_cached_iovas()
> 
>   drivers/iommu/intel/iommu.c | 31 -------------------------------
>   drivers/iommu/iova.c        | 32 ++++++++++++++++++++++++++++++--
>   include/linux/cpuhotplug.h  |  2 +-
>   include/linux/iova.h        |  1 +
>   4 files changed, 32 insertions(+), 34 deletions(-)
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
