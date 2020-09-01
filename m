Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8A258D78
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 13:33:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 739498707A;
	Tue,  1 Sep 2020 11:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7787OYzFkzD; Tue,  1 Sep 2020 11:33:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 43AE58706D;
	Tue,  1 Sep 2020 11:33:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07516C0051;
	Tue,  1 Sep 2020 11:33:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DDECC0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 11:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 54E7D8707A
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 11:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWLx--4l90xl for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 11:33:36 +0000 (UTC)
X-Greylist: delayed 00:16:17 by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C7A248706D
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 11:33:35 +0000 (UTC)
Received: from lhreml722-chm.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 3C539C7BD780D3CB7BE4;
 Tue,  1 Sep 2020 12:17:15 +0100 (IST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 lhreml722-chm.china.huawei.com (10.201.108.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Tue, 1 Sep 2020 12:17:13 +0100
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Tue, 1 Sep 2020 19:17:12 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: John Garry <john.garry@huawei.com>, "will@kernel.org" <will@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Subject: RE: [PATCH v2 0/2] iommu/arm-smmu-v3: Improve cmdq lock efficiency
Thread-Topic: [PATCH v2 0/2] iommu/arm-smmu-v3: Improve cmdq lock efficiency
Thread-Index: AQHWd8Ms2A2NyKB6nU+JQ9N/rJ8/HalTsKGw
Date: Tue, 1 Sep 2020 11:17:11 +0000
Message-ID: <1e2f9669220c4a8d91f08329a46dac00@hisilicon.com>
References: <1598018062-175608-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1598018062-175608-1-git-send-email-john.garry@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.239]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "maz@kernel.org" <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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



> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org
> [mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of John Garry
> Sent: Saturday, August 22, 2020 1:54 AM
> To: will@kernel.org; robin.murphy@arm.com
> Cc: joro@8bytes.org; linux-arm-kernel@lists.infradead.org;
> iommu@lists.linux-foundation.org; maz@kernel.org; Linuxarm
> <linuxarm@huawei.com>; linux-kernel@vger.kernel.org; John Garry
> <john.garry@huawei.com>
> Subject: [PATCH v2 0/2] iommu/arm-smmu-v3: Improve cmdq lock efficiency
> 
> As mentioned in [0], the CPU may consume many cycles processing
> arm_smmu_cmdq_issue_cmdlist(). One issue we find is the cmpxchg() loop to
> get space on the queue takes a lot of time once we start getting many CPUs
> contending - from experiment, for 64 CPUs contending the cmdq, success rate
> is ~ 1 in 12, which is poor, but not totally awful.
> 
> This series removes that cmpxchg() and replaces with an atomic_add, same as
> how the actual cmdq deals with maintaining the prod pointer.
> 
> For my NVMe test with 3x NVMe SSDs, I'm getting a ~24% throughput
> increase:
> Before: 1250K IOPs
> After: 1550K IOPs
> 
> I also have a test harness to check the rate of DMA map+unmaps we can
> achieve:
> 
> CPU count	8	16	32	64
> Before:		282K	115K	36K	11K
> After:		302K	193K	80K	30K
> 
> (unit is map+unmaps per CPU per second)

I have seen performance improvement on hns3 network by sending UDP with 1-32 threads:

Threads number        1        4           8         16       32
Before patch(TX Mbps)  7636.05  16444.36  21694.48  25746.40   25295.93
After  patch(TX Mbps)  7711.60  16478.98  26561.06  32628.75   33764.56

As you can see, for 8,16,32 threads, network TX throughput improve much. For 1 and 4 threads,
Tx throughput is almost seem before and after patch. This should be sensible as this patch
is mainly for decreasing the lock contention.

> 
> [0]
> https://lore.kernel.org/linux-iommu/B926444035E5E2439431908E3842AFD2
> 4B86DB@DGGEMI525-MBS.china.huawei.com/T/#ma02e301c38c3e94b7725e
> 685757c27e39c7cbde3
> 
> Differences to v1:
> - Simplify by dropping patch to always issue a CMD_SYNC
> - Use 64b atomic add, keeping prod in a separate 32b field
> 
> John Garry (2):
>   iommu/arm-smmu-v3: Calculate max commands per batch
>   iommu/arm-smmu-v3: Remove cmpxchg() in
> arm_smmu_cmdq_issue_cmdlist()
> 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 166
> ++++++++++++++------
>  1 file changed, 114 insertions(+), 52 deletions(-)
> 
> --
> 2.26.2

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
