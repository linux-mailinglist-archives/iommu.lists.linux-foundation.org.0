Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0B329EB2
	for <lists.iommu@lfdr.de>; Tue,  2 Mar 2021 13:32:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE224EDC3;
	Tue,  2 Mar 2021 12:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HkLSPjDCQGY; Tue,  2 Mar 2021 12:32:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FBE64EDCB;
	Tue,  2 Mar 2021 12:32:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00C56C0012;
	Tue,  2 Mar 2021 12:32:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF120C0001
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 12:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E90F605DD
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 12:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0gwBBYUa7Ri for <iommu@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 12:32:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CB6760612
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 12:32:50 +0000 (UTC)
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DqbtX75nlz67rNr;
 Tue,  2 Mar 2021 20:25:08 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Mar 2021 13:32:47 +0100
Received: from [10.47.2.166] (10.47.2.166) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 2 Mar 2021
 12:32:45 +0000
Subject: Re: [PATCH 1/1] Revert "iommu/iova: Retry from last rb tree node if
 iova search fails"
From: John Garry <john.garry@huawei.com>
To: Robin Murphy <robin.murphy@arm.com>, "Leizhen (ThunderTown)"
 <thunder.leizhen@huawei.com>, Will Deacon <will@kernel.org>, Joerg Roedel
 <joro@8bytes.org>, iommu <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
References: <20210129092120.1482-1-thunder.leizhen@huawei.com>
 <5505b1e5-2450-d5c4-6d77-5bb21fd0b6a1@huawei.com>
 <e8ff095f-7b7c-da38-3675-cd3c1ee84b1a@arm.com>
 <7e18829a-3e7e-cc82-9d33-366cf2025624@huawei.com>
 <4c634a22-7168-b51c-a012-2009fc03e6c3@arm.com>
 <d090b869-b3ac-fecc-9efd-d870e43e0d99@huawei.com>
Message-ID: <0cb64d74-0ec1-2284-f67a-b1619a3eb138@huawei.com>
Date: Tue, 2 Mar 2021 12:30:51 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <d090b869-b3ac-fecc-9efd-d870e43e0d99@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.47.2.166]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: Vijayanand Jitta <vjitta@codeaurora.org>, Linuxarm <linuxarm@huawei.com>
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

On 01/03/2021 15:48, John Garry wrote:
>>
>> While max32_alloc_size indirectly tracks the largest*contiguous* 
>> available space, one of the ideas from which it grew was to simply keep
>> count of the total number of free PFNs. If you're really spending
>> significant time determining that the tree is full, as opposed to just
>> taking longer to eventually succeed, then it might be relatively
>> innocuous to tack on that semi-redundant extra accounting as a
>> self-contained quick fix for that worst case.
>>
>>> Anyway, we see ~50% throughput regression, which is intolerable. As seen
>>> in [0], I put this down to the fact that we have so many IOVA requests
>>> which exceed the rcache size limit, which means many RB tree accesses
>>> for non-cacheble IOVAs, which are now slower.
> 
> I will attempt to prove this by increasing RCACHE RANGE, such that all 
> IOVA sizes may be cached.

About this one, as expected, we restore performance by increasing the 
RCACHE RANGE.

Some figures:
Baseline v5.12-rc1

strict mode:
600K IOPs

Revert "iommu/iova: Retry from last rb tree node if iova search fails":
1215K

Increase IOVA RCACHE range 6 -> 10 (All IOVAs size requests now 
cacheable for this experiment):
1400K

Reduce LLDD max SGE count 124 -> 16:
1288K

non-strict mode
1650K

So ideally we can work towards something for which IOVAs of all size 
could be cached.

Cheers,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
