Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 411394210C6
	for <lists.iommu@lfdr.de>; Mon,  4 Oct 2021 15:54:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9B0427AF;
	Mon,  4 Oct 2021 13:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvHU8M2EQLjN; Mon,  4 Oct 2021 13:54:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DA2F9427A0;
	Mon,  4 Oct 2021 13:54:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6C84C000D;
	Mon,  4 Oct 2021 13:54:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64BA1C000D;
 Mon,  4 Oct 2021 13:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47DF184B87;
 Mon,  4 Oct 2021 13:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nch2CRXxVkrq; Mon,  4 Oct 2021 13:54:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CC4384B55;
 Mon,  4 Oct 2021 13:54:12 +0000 (UTC)
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HNMZ019Tfz67lgF;
 Mon,  4 Oct 2021 21:51:04 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 4 Oct 2021 15:54:09 +0200
Received: from [10.47.27.199] (10.47.27.199) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 4 Oct 2021
 14:54:07 +0100
Subject: Re: [PATCH 0/5] iommu: Some IOVA code reorganisation
To: Will Deacon <will@kernel.org>
References: <1632477717-5254-1-git-send-email-john.garry@huawei.com>
 <20211004114418.GC27373@willie-the-truck>
From: John Garry <john.garry@huawei.com>
Message-ID: <1ff2aeb0-a5d0-f2a4-bd5d-d8f9669a54ed@huawei.com>
Date: Mon, 4 Oct 2021 14:56:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20211004114418.GC27373@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.47.27.199]
X-ClientProxiedBy: lhreml710-chm.china.huawei.com (10.201.108.61) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: mst@redhat.com, linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, jasowang@redhat.com
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

On 04/10/2021 12:44, Will Deacon wrote:



> On Fri, Sep 24, 2021 at 06:01:52PM +0800, John Garry wrote:
>> The IOVA domain structure is a bit overloaded, holding:
>> - IOVA tree management
>> - FQ control
>> - IOVA rcache memories
>>
>> Indeed only a couple of IOVA users use the rcache, and only dma-iommu.c
>> uses the FQ feature.
>>
>> This series separates out that structure. In addition, it moves the FQ
>> code into dma-iommu.c . This is not strictly necessary, but it does make
>> it easier for the FQ domain lookup the rcache domain.
>>
>> The rcache code stays where it is, as it may be reworked in future, so
>> there is not much point in relocating and then discarding.
>>
>> This topic was initially discussed and suggested (I think) by Robin here:
>> https://lore.kernel.org/linux-iommu/1d06eda1-9961-d023-f5e7-fe87e768f067@arm.com/
> 

Hi Will,

> It would be useful to have Robin's Ack on patches 2-4. The implementation
> looks straightforward to me, but the thread above isn't very clear about
> what is being suggested.

Sure, I intentionally didn't add names to patches so avoid possible 
incorrect attribution.

> 
> To play devil's advocate: there aren't many direct users of the iovad code:
> either they'll die out entirely (and everybody will use the dma-iommu code)
> and it's fine having the flush queue code where it is, or we'll get more
> users and the likelihood of somebody else wanting flush queues increases.
> 

I make it 5x direct users (including vdpa).

Anyway, as I mentioned, I'm not totally determined to relocate the FQ 
code. It's just that dma-iommu is the only user today and co-locating 
makes the iova rcache domain info lookup easier from the FQ code.

Thanks,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
