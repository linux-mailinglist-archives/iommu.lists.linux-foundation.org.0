Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8E145A9D
	for <lists.iommu@lfdr.de>; Wed, 22 Jan 2020 18:07:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DA63887DDE;
	Wed, 22 Jan 2020 17:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQ8VgCpFHtDG; Wed, 22 Jan 2020 17:07:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5283D87DB1;
	Wed, 22 Jan 2020 17:07:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4575AC1D81;
	Wed, 22 Jan 2020 17:07:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C29E3C0174
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 17:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BF44885EFB
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 17:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UH24y5hNpHWq for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 17:07:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A479B85546
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jan 2020 17:07:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D55931FB;
 Wed, 22 Jan 2020 09:07:50 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13C103F6C4;
 Wed, 22 Jan 2020 09:07:49 -0800 (PST)
Subject: Re: [Patch v3 1/3] iommu: avoid unnecessary magazine allocations
To: Cong Wang <xiyou.wangcong@gmail.com>
References: <20191218043951.10534-1-xiyou.wangcong@gmail.com>
 <20191218043951.10534-2-xiyou.wangcong@gmail.com>
 <db1c7741-e280-7930-1659-2ca43e8aac15@arm.com>
 <CAM_iQpUmRKfiQ-P3G-PkRuumXqxN4TPuZtuqoT3+AFjhnkSwQQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9033456d-1f17-44a3-2640-24de55421e79@arm.com>
Date: Wed, 22 Jan 2020 17:07:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAM_iQpUmRKfiQ-P3G-PkRuumXqxN4TPuZtuqoT3+AFjhnkSwQQ@mail.gmail.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>
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

On 21/01/2020 5:21 pm, Cong Wang wrote:
> On Tue, Jan 21, 2020 at 3:11 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 18/12/2019 4:39 am, Cong Wang wrote:
>>> The IOVA cache algorithm implemented in IOMMU code does not
>>> exactly match the original algorithm described in the paper
>>> "Magazines and Vmem: Extending the Slab Allocator to Many
>>> CPUs and Arbitrary Resources".
>>>
>>> Particularly, it doesn't need to free the loaded empty magazine
>>> when trying to put it back to global depot. To make it work, we
>>> have to pre-allocate magazines in the depot and only recycle them
>>> when all of them are full.
>>>
>>> Before this patch, rcache->depot[] contains either full or
>>> freed entries, after this patch, it contains either full or
>>> empty (but allocated) entries.
>>
>> How much additional memory overhead does this impose (particularly on
>> systems that may have many domains mostly used for large, long-term
>> mappings)? I'm wary that trying to micro-optimise for the "churn network
>> packets as fast as possible" case may penalise every other case,
>> potentially quite badly. Lower-end embedded systems are using IOMMUs in
>> front of their GPUs, video codecs, etc. precisely because they *don't*
>> have much memory to spare (and thus need to scrape together large
>> buffers out of whatever pages they can find).
> 
> The calculation is not complicated: 32 * 6 * 129 * 8 = 198144 bytes,
> which is roughly 192K, per domain.

Theoretically. On many architectures, kmalloc(1032,...) is going to 
consume rather more than 1032 bytes. Either way, it's rather a lot of 
memory to waste in the many cases where it will never be used at all.

>> But on the other hand, if we were to go down this route, then why is
>> there any dynamic allocation/freeing left at all? Once both the depot
>> and the rcaches are preallocated, then AFAICS it would make more sense
>> to rework the overflow case in __iova_rcache_insert() to just free the
>> IOVAs and swap the empty mag around rather than destroying and
>> recreating it entirely.
> 
> It's due to the algorithm requires a swap(), which can't be done with
> statically allocated magzine. I had the same thought initially but gave it
> up quickly when realized this.

I'm not sure I follow... we're replacing a "full magazine" pointer with 
an "empty magazine" pointer regardless of where that empty magazine came 
from. It would be trivial to preallocate an 'overflow' magazine for the 
one remaining case of handling a full depot, although to be honest, at 
that point it's probably most efficient to just free the pfns directly 
from cpu_rcache->loaded while still under the percpu lock and be done 
with it.

> If you are suggesting to change the algorithm, it is not a goal of this
> patchset. I do have plan to search for a better algorithm as the IOMMU
> performance still sucks (comparing to no IOMMU) after this patchset,
> but once again, I do not want to change it in this patchset.

"Still sucks" is probably the most interesting thing here - the headline 
number for the original patch series was that it reached about 98% of 
bypass performance on Intel VT-d[1]. Sounds like it would be well worth 
digging in to what's different about your system and/or workload.

> (My ultimate goal is to find a spinlock-free algorithm, otherwise there is
> no way to make it close to no-IOMMU performance.)
> 
>>
>> Perhaps there's a reasonable compromise wherein we don't preallocate,
>> but still 'free' empty magazines back to the depot, such that busy
>> domains will quickly reach a steady-state. In fact, having now dug up
>> the paper at this point of writing this reply, that appears to be what
>> fig. 3.1b describes anyway - I don't see any mention of preallocating
>> the depot.
> 
> That paper missed a lot of things, it doesn't even recommend a size
> of a depot or percpu cache. For implementation, we still have to
> think about those details, including whether to preallocate memory.

Heh, "missed"... To my reading, the original design actually describes a 
depot consisting of two unbounded (but garbage-collected) lists and a 
dynamically-adjusted magazine size - I'd hardly blame the authors for 
not discussing an implementation from 15 years in the future of a 
fixed-size design *based on* their concept ;)

Robin.

[1] 
https://lists.linuxfoundation.org/pipermail/iommu/2015-December/015271.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
