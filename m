Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7043C66B
	for <lists.iommu@lfdr.de>; Wed, 27 Oct 2021 11:25:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17FE480EC2;
	Wed, 27 Oct 2021 09:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8Q9ZyLDgBDO; Wed, 27 Oct 2021 09:25:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2A59080EA6;
	Wed, 27 Oct 2021 09:25:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F34FAC000E;
	Wed, 27 Oct 2021 09:25:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 307A5C000E;
 Wed, 27 Oct 2021 09:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F76D80EA6;
 Wed, 27 Oct 2021 09:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OrDepfdmKhRP; Wed, 27 Oct 2021 09:25:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73E4D80E6D;
 Wed, 27 Oct 2021 09:25:33 +0000 (UTC)
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HfNTf60vGz6H6sb;
 Wed, 27 Oct 2021 17:20:54 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 27 Oct 2021 11:25:29 +0200
Received: from [10.47.27.251] (10.47.27.251) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 27 Oct
 2021 10:25:28 +0100
Subject: Re: [PATCH 1/5] iova: Move fast alloc size roundup into
 alloc_iova_fast()
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
References: <1632477717-5254-1-git-send-email-john.garry@huawei.com>
 <1632477717-5254-2-git-send-email-john.garry@huawei.com>
 <CACGkMEt8FcoJ4zMXFZzmrFjm=ynWfr5yLfvSHCckawpa3FvhkA@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <c0d35d67-e6b0-3165-0968-30eb9998d242@huawei.com>
Date: Wed, 27 Oct 2021 10:25:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACGkMEt8FcoJ4zMXFZzmrFjm=ynWfr5yLfvSHCckawpa3FvhkA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.47.27.251]
X-ClientProxiedBy: lhreml712-chm.china.huawei.com (10.201.108.63) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: mst <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linuxarm@huawei.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Yongji Xie <xieyongji@bytedance.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
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

On 11/10/2021 03:06, Jason Wang wrote:
> On Fri, Sep 24, 2021 at 6:07 PM John Garry<john.garry@huawei.com>  wrote:
>> It really is a property of the IOVA rcache code that we need to alloc a
>> power-of-2 size, so relocate the functionality to resize into
>> alloc_iova_fast(), rather than the callsites.
>>
>> Signed-off-by: John Garry<john.garry@huawei.com>
> Acked-by: Jason Wang<jasowang@redhat.com>

Thanks
> 

Hi Joerg,

Can you pick up this patch only for 5.16? It has a good few tags, and 
I'm waiting for feedback/update from Robin on the rest of the series.

Cheers,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
