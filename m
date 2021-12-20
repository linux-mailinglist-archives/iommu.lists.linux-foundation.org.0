Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E724047AABF
	for <lists.iommu@lfdr.de>; Mon, 20 Dec 2021 14:57:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59ADA60C18;
	Mon, 20 Dec 2021 13:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJkRFkiRk71T; Mon, 20 Dec 2021 13:57:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7EB9660D5D;
	Mon, 20 Dec 2021 13:57:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DE96C0012;
	Mon, 20 Dec 2021 13:57:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5058C0012;
 Mon, 20 Dec 2021 13:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C31FA40130;
 Mon, 20 Dec 2021 13:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnu17zC1zLJm; Mon, 20 Dec 2021 13:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FF1C40110;
 Mon, 20 Dec 2021 13:57:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93520D6E;
 Mon, 20 Dec 2021 05:57:23 -0800 (PST)
Received: from [10.57.34.58] (unknown [10.57.34.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D37F3F718;
 Mon, 20 Dec 2021 05:57:21 -0800 (PST)
Message-ID: <85c60ef4-e1af-c947-a2ed-b63c4fef36c3@arm.com>
Date: Mon, 20 Dec 2021 13:57:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] iommu: Separate IOVA rcache memories from iova_domain
 structure
Content-Language: en-GB
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 mst@redhat.com, jasowang@redhat.com
References: <1632477717-5254-1-git-send-email-john.garry@huawei.com>
 <1632477717-5254-5-git-send-email-john.garry@huawei.com>
 <2c58036f-d9aa-61f9-ae4b-f6938a135de5@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <2c58036f-d9aa-61f9-ae4b-f6938a135de5@huawei.com>
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org, xieyongji@bytedance.com,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
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

Hi John,

On 2021-12-20 08:49, John Garry wrote:
> On 24/09/2021 11:01, John Garry wrote:
>> Only dma-iommu.c and vdpa actually use the "fast" mode of IOVA alloc and
>> free. As such, it's wasteful that all other IOVA domains hold the rcache
>> memories.
>>
>> In addition, the current IOVA domain init implementation is poor
>> (init_iova_domain()), in that errors are ignored and not passed to the
>> caller. The only errors can come from the IOVA rcache init, and fixing up
>> all the IOVA domain init callsites to handle the errors would take some
>> work.
>>
>> Separate the IOVA rache out of the IOVA domain, and create a new IOVA
>> domain structure, iova_caching_domain.
>>
>> Signed-off-by: John Garry <john.garry@huawei.com>
> 
> Hi Robin,
> 
> Do you have any thoughts on this patch? The decision is whether we stick 
> with a single iova domain structure or support this super structure for 
> iova domains which support the rcache. I did not try the former - it 
> would be do-able but I am not sure on how it would look.

TBH I feel inclined to take the simpler approach of just splitting the 
rcache array to a separate allocation, making init_iova_rcaches() public 
(with a proper return value), and tweaking put_iova_domain() to make 
rcache cleanup conditional. A residual overhead of 3 extra pointers in 
iova_domain doesn't seem like *too* much for non-DMA-API users to bear. 
Unless you want to try generalising the rcache mechanism completely away 
from IOVA API specifics, it doesn't seem like there's really enough to 
justify the bother of having its own distinct abstraction layer.

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
