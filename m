Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 445C434FD95
	for <lists.iommu@lfdr.de>; Wed, 31 Mar 2021 11:58:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC846086C;
	Wed, 31 Mar 2021 09:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFAMsdmRm_lm; Wed, 31 Mar 2021 09:58:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE19D607F2;
	Wed, 31 Mar 2021 09:58:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98413C000A;
	Wed, 31 Mar 2021 09:58:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78087C000A
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 09:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F844063D
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 09:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vdwWLk5I5oZ for <iommu@lists.linux-foundation.org>;
 Wed, 31 Mar 2021 09:58:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id B86C8405F0
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 09:58:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CB561042;
 Wed, 31 Mar 2021 02:58:42 -0700 (PDT)
Received: from [10.57.24.208] (unknown [10.57.24.208])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5A3F3F792;
 Wed, 31 Mar 2021 02:58:40 -0700 (PDT)
Subject: Re: [PATCH 1/6] iommu: Move IOVA power-of-2 roundup into allocator
To: John Garry <john.garry@huawei.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
References: <1616160348-29451-1-git-send-email-john.garry@huawei.com>
 <1616160348-29451-2-git-send-email-john.garry@huawei.com>
 <ee935a6d-a94c-313e-f0ed-e14cc6dac055@arm.com>
 <73d459de-b5cc-e2f5-bcd7-2ee23c8d5075@huawei.com>
 <afc2fc05-a799-cb14-debd-d36afed8f456@arm.com>
 <08c0f4b9-8713-fa97-3986-3cfb0d6b820b@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e4b9146a-ca32-50f5-4fe0-42aa0b66d2d6@arm.com>
Date: Wed, 31 Mar 2021 10:58:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <08c0f4b9-8713-fa97-3986-3cfb0d6b820b@huawei.com>
Content-Language: en-GB
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>
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

On 2021-03-22 15:01, John Garry wrote:
> On 19/03/2021 19:20, Robin Murphy wrote:
> 
> Hi Robin,
> 
>>> So then we have the issue of how to dynamically increase this rcache
>>> threshold. The problem is that we may have many devices associated with
>>> the same domain. So, in theory, we can't assume that when we increase
>>> the threshold that some other device will try to fast free an IOVA which
>>> was allocated prior to the increase and was not rounded up.
>>>
>>> I'm very open to better (or less bad) suggestions on how to do this ...
>> ...but yes, regardless of exactly where it happens, rounding up or not
>> is the problem for rcaches in general. I've said several times that my
>> preferred approach is to not change it that dynamically at all, but
>> instead treat it more like we treat the default domain type.
>>
> 
> Can you remind me of that idea? I don't remember you mentioning using 
> default domain handling as a reference in any context.

Sorry if the phrasing was unclear there - the allusion to default 
domains is new, it just occurred to me that what we do there is in fact 
fairly close to what I've suggested previously for this. In that case, 
we have a global policy set by the command line, which *can* be 
overridden per-domain via sysfs at runtime, provided the user is willing 
to tear the whole thing down. Using a similar approach here would give a 
fair degree of flexibility but still mean that changes never have to be 
made dynamically to a live domain.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
