Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E00470811
	for <lists.iommu@lfdr.de>; Fri, 10 Dec 2021 19:05:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A40641272;
	Fri, 10 Dec 2021 18:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zXRDuUYdvKh; Fri, 10 Dec 2021 18:05:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6E4FB40562;
	Fri, 10 Dec 2021 18:05:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4606CC006E;
	Fri, 10 Dec 2021 18:05:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FCFFC0012
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 18:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F4D2614B6
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 18:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kfFlWOx5XsG for <iommu@lists.linux-foundation.org>;
 Fri, 10 Dec 2021 18:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A95686070C
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 18:05:23 +0000 (UTC)
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4J9f0G3hr0z67mFG;
 Sat, 11 Dec 2021 02:03:26 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 19:05:20 +0100
Received: from [10.47.93.58] (10.47.93.58) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 10 Dec
 2021 18:05:19 +0000
Subject: Re: [PATCH v2 01/11] iommu/iova: Fix race between FQ timeout and
 teardown
To: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, <will@kernel.org>
References: <cover.1639157090.git.robin.murphy@arm.com>
 <ecea6835baca75b945bd8ecfaa636ff01dabcc1d.1639157090.git.robin.murphy@arm.com>
Message-ID: <03cbd9c4-0f11-895b-8eb5-1b75bb74d37c@huawei.com>
Date: Fri, 10 Dec 2021 18:04:53 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <ecea6835baca75b945bd8ecfaa636ff01dabcc1d.1639157090.git.robin.murphy@arm.com>
Content-Language: en-US
X-Originating-IP: [10.47.93.58]
X-ClientProxiedBy: lhreml723-chm.china.huawei.com (10.201.108.74) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>
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
From: John Garry via iommu <iommu@lists.linux-foundation.org>
Reply-To: John Garry <john.garry@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 10/12/2021 17:54, Robin Murphy wrote:
> From: Xiongfeng Wang<wangxiongfeng2@huawei.com>
> 
> It turns out to be possible for hotplugging out a device to reach the
> stage of tearing down the device's group and default domain before the
> domain's flush queue has drained naturally. At this point, it is then
> possible for the timeout to expire just*before*  the del_timer() call

super nit: "just*before*  the" - needs a whitespace before "before" :)

> from free_iova_flush_queue(), such that we then proceed to free the FQ
> resources while fq_flush_timeout() is still accessing them on another
> CPU. Crashes due to this have been observed in the wild while removing
> NVMe devices.
> 
> Close the race window by using del_timer_sync() to safely wait for any
> active timeout handler to finish before we start to free things. We
> already avoid any locking in free_iova_flush_queue() since the FQ is
> supposed to be inactive anyway, so the potential deadlock scenario does
> not apply.
> 
> Fixes: 9a005a800ae8 ("iommu/iova: Add flush timer")
> Signed-off-by: Xiongfeng Wang<wangxiongfeng2@huawei.com>
> [ rm: rewrite commit message ]
> Signed-off-by: Robin Murphy<robin.murphy@arm.com>

FWIW,

Reviewed-by: John Garry <john.garry@huawei.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
