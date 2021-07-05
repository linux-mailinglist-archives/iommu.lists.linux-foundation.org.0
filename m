Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7C3BC0EB
	for <lists.iommu@lfdr.de>; Mon,  5 Jul 2021 17:39:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E732F40322;
	Mon,  5 Jul 2021 15:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7wrwDJS00l7; Mon,  5 Jul 2021 15:39:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C64BD4035A;
	Mon,  5 Jul 2021 15:39:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 884E0C000E;
	Mon,  5 Jul 2021 15:39:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7570C000E
 for <iommu@lists.linux-foundation.org>; Mon,  5 Jul 2021 15:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C989A831BD
 for <iommu@lists.linux-foundation.org>; Mon,  5 Jul 2021 15:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aw1H0N3PpvDp for <iommu@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 15:39:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 268D0831A5
 for <iommu@lists.linux-foundation.org>; Mon,  5 Jul 2021 15:39:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 716091FB;
 Mon,  5 Jul 2021 08:39:21 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 542423F694;
 Mon,  5 Jul 2021 08:39:20 -0700 (PDT)
Subject: Re: [bug report] IB/usnic: Add Cisco VIC low-level hardware driver
To: Jason Gunthorpe <jgg@ziepe.ca>, Christian Benvenuti <benve@cisco.com>,
 Nelson Escobar <neescoba@cisco.com>
References: <YOLdvTe4MJ4kS01z@mwanda>
 <0b8a876b-f71d-24a2-1826-07aa54248f40@arm.com>
 <20210705152138.GH4604@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b2fd45e1-58ee-a695-5560-dc71eca91eb7@arm.com>
Date: Mon, 5 Jul 2021 16:39:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705152138.GH4604@ziepe.ca>
Content-Language: en-GB
Cc: linux-rdma@vger.kernel.org, iommu@lists.linux-foundation.org,
 umalhi@cisco.com, Dan Carpenter <dan.carpenter@oracle.com>
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

On 2021-07-05 16:21, Jason Gunthorpe wrote:
> On Mon, Jul 05, 2021 at 02:47:36PM +0100, Robin Murphy wrote:
>> On 2021-07-05 11:23, Dan Carpenter wrote:
>>> [ Ancient code, but the bug seems real enough still.  -dan ]
>>>
>>> Hello Upinder Malhi,
>>>
>>> The patch e3cf00d0a87f: "IB/usnic: Add Cisco VIC low-level hardware
>>> driver" from Sep 10, 2013, leads to the following static checker
>>> warning:
>>>
>>> 	drivers/iommu/iommu.c:2482 iommu_map()
>>> 	warn: sleeping in atomic context
>>>
>>> drivers/infiniband/hw/usnic/usnic_uiom.c
>>>      244  static int usnic_uiom_map_sorted_intervals(struct list_head *intervals,
>>>      245                                                  struct usnic_uiom_reg *uiomr)
>>>
>>> This function is always called from usnic_uiom_reg_get() which is holding
>>> spin_lock(&pd->lock); so it can't sleep.
>>
>> FWIW back in those days it wasn't really well defined whether iommu_map()
>> was callable from non-sleeping contexts (the arch/arm DMA API code relied on
>> it, for instance). It was only formalised 2 years ago by 781ca2de89ba
>> ("iommu: Add gfp parameter to iommu_ops::map") which introduced the
>> might_sleep() check that's firing there. I guess these calls want to be
>> updated to iommu_map_atomic() now.
> 
> Does this mean this driver doesn't work at all upstream? I would be
> quite interested to delete it.

I think the only time it's actually in trouble is on AMD hardware if one 
of those iommu_map() calls has to allocate a new pagetable page and that 
allocation has to go down whichever reclaim path actually sleeps. 
Historically all the other IOMMU drivers it might have come into contact 
with already used GFP_ATOMIC for their internal allocations anyway (AMD 
was the only one using a mutex instead of a spinlock internally), and 
some like intel-iommu still haven't relaxed that even now.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
