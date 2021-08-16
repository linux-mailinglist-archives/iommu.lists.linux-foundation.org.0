Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA03EDAD7
	for <lists.iommu@lfdr.de>; Mon, 16 Aug 2021 18:23:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A7A680F59;
	Mon, 16 Aug 2021 16:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2t5af7_jSpoB; Mon, 16 Aug 2021 16:23:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 32CD680F81;
	Mon, 16 Aug 2021 16:23:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11B87C000E;
	Mon, 16 Aug 2021 16:23:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A5FDC000E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 16:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58B3440283
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 16:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uqLcJSevtVcX for <iommu@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 16:23:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52ECF40163
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 16:23:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 779266D;
 Mon, 16 Aug 2021 09:23:34 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D8293F66F;
 Mon, 16 Aug 2021 09:23:33 -0700 (PDT)
Subject: Re: [iommu:apple/dart 3/3] drivers/iommu/apple-dart.c:730:17: error:
 initialization of 'size_t (*)(struct iommu_domain *, long unsigned int,
 size_t, struct iommu_iotlb_gather *)' {aka 'long unsigned int (*)(struct
 iommu_domain *, long unsigned int, long unsigned int, struct iom...
To: Sven Peter <sven@svenpeter.dev>, Joerg Roedel <jroedel@suse.de>
References: <202108100801.aYU4IXvh-lkp@intel.com>
 <0589c725-401b-482f-ba2b-0707c02ea40a@www.fastmail.com>
 <YRUF/JNi5tclQo6L@suse.de>
 <3c71050b-950f-4dbc-902b-c7e64dd3d0bc@www.fastmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7a10c384-d5e1-a86a-118e-981dd485d4f6@arm.com>
Date: Mon, 16 Aug 2021 17:23:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3c71050b-950f-4dbc-902b-c7e64dd3d0bc@www.fastmail.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>
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

On 2021-08-16 07:48, Sven Peter wrote:
> 
> 
> On Thu, Aug 12, 2021, at 13:29, Joerg Roedel wrote:
>> Hi Sven,
>>
>> On Tue, Aug 10, 2021 at 08:09:53AM +0200, Sven Peter wrote:
>>> This happens because apple/dart is missing the "Optimizing iommu_[map/unmap] performance"
>>> series which is already in the core branch [1].
>>> The same commit works fine in iommu/next since that branch merges both iommu/core and
>>> apple/dart.
>>
>> Okay, thanks. I re-based the DART patches on-top of my core branch,
>> which contains the changes for iommu_[map/unmap] performance. I
>> generally don't like rebasing topic branches, but made an exception here
>> to not break bisectability.
>>
>> Thanks,
>>
>> 	Joerg
>>
> 
> Hi Joerg,
> 
> Thanks, and sorry about that! I'll try to make it more clear if anything depends
> on another series in the future or just try to avoid it altogether if possible.
> 
> 
> Just a heads up about a similar situation you may already be aware of: Once Robin's
> DMA domain strictness refactoring [1] is merged, the current DART driver will fail due
> to patch 12 there, which unexports iommu_get_dma_cookie. It'll need a small
> adjustment just like all the other drivers (which will also fix two small bugs
> it just made me notice: I never use iommu_put_dma_cookie and also unconditionally
> grab a DMA cookie for all domain types).
> 
> Unless I'm mistaken I can't make that adjustment before the first patch of
> that series has been merged, and Robin can't make that adjustment in his series
> because it'll presumably go through another topic branch.

Hmm, the exports only affect modules though - the cookie functions are 
still public so that the core code can call them - so it should only 
break certain configs. Possibly the most self-contained way to avoid 
issues in -next would be to switch APPLE_DART from tristate to bool for 
now, then flip it back along with cleaning up the iommu-dma remnants at 
rc1. That should avoid any more rebasing at least.

At worst, my patch #12 could in principle be held back and applied at 
rc1 alongside the DART fixup - functionally it shouldn't be an issue, 
but patch #16 would need fixing up to apply without the context change.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
