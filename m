Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35F44162F
	for <lists.iommu@lfdr.de>; Mon,  1 Nov 2021 10:21:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E5CE60705;
	Mon,  1 Nov 2021 09:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xz_WGCFCjvBe; Mon,  1 Nov 2021 09:21:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B3D7F606BF;
	Mon,  1 Nov 2021 09:21:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92B20C000E;
	Mon,  1 Nov 2021 09:21:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 746DDC000E
 for <iommu@lists.linux-foundation.org>; Mon,  1 Nov 2021 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55C2480CEB
 for <iommu@lists.linux-foundation.org>; Mon,  1 Nov 2021 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oHM9sCw9Ihmv for <iommu@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 09:21:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E40080CEA
 for <iommu@lists.linux-foundation.org>; Mon,  1 Nov 2021 09:21:25 +0000 (UTC)
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HjS8p4P2Kz67PwL;
 Mon,  1 Nov 2021 17:16:58 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 1 Nov 2021 10:21:22 +0100
Received: from [10.202.227.179] (10.202.227.179) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 1 Nov 2021 09:21:21 +0000
Subject: Re: [PATCH] iommu/dma: fix incorrect error return on iommu deferred
 attach
To: Logan Gunthorpe <logang@deltatee.com>, <linux-kernel@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, Christoph Hellwig <hch@lst.de>
References: <20211027174757.119755-1-logang@deltatee.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <0ad0367d-1242-1c41-ad7c-6c4cc4f70983@huawei.com>
Date: Mon, 1 Nov 2021 09:21:20 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20211027174757.119755-1-logang@deltatee.com>
Content-Language: en-US
X-Originating-IP: [10.202.227.179]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: Marshall Midden <marshallmidden@gmail.com>, Will Deacon <will@kernel.org>
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

On 27/10/2021 18:47, Logan Gunthorpe wrote:
> scsi_dma_map() was reporting a failure during boot on an AMD machine
> with the IOMMU enabled.
> 
>    scsi_dma_map failed: request for 36 bytes!
> 
> The issue was tracked down to a mistake in logic: should not return
> an error if iommu_deferred_attach() returns zero.
> 
> Reported-by: Marshall Midden<marshallmidden@gmail.com>
> Fixes: dabb16f67215 ("iommu/dma: return error code from iommu_dma_map_sg()")
> Link:https://lore.kernel.org/all/CAD2CkAWjS8=kKwEEN4cgVNjyFORUibzEiCUA-X+SMtbo0JoMmA@mail.gmail.com
> Signed-off-by: Logan Gunthorpe<logang@deltatee.com>
> Cc: Joerg Roedel<joro@8bytes.org>
> Cc: Will Deacon<will@kernel.org>

Seems reasonable, FWIW:
Reviewed-by: John Garry <john.garry@huawei.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
