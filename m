Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F6253067
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 15:51:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E2C4A8798B;
	Wed, 26 Aug 2020 13:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14x4brP4HkWs; Wed, 26 Aug 2020 13:51:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 65A0787A3A;
	Wed, 26 Aug 2020 13:51:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4837DC0051;
	Wed, 26 Aug 2020 13:51:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DD43C0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 13:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CCC187A00
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 13:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESa7hqBJIolp for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 13:51:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E01D8798B
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 13:51:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56820101E;
 Wed, 26 Aug 2020 06:51:29 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CB003F68F;
 Wed, 26 Aug 2020 06:51:27 -0700 (PDT)
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
 <e3e4da33-a44f-0a07-9e2e-0f806875ab0b@arm.com>
 <d9b1f1b614057d87279c26e13cbbb1f5@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a03ce8f0-cab5-2782-ac50-930cf94b7dcd@arm.com>
Date: Wed, 26 Aug 2020 14:51:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d9b1f1b614057d87279c26e13cbbb1f5@codeaurora.org>
Content-Language: en-GB
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On 2020-08-26 13:17, Sai Prakash Ranjan wrote:
> On 2020-08-26 17:07, Robin Murphy wrote:
>> On 2020-08-25 16:42, Sai Prakash Ranjan wrote:
>>> Currently the non-strict or lazy mode of TLB invalidation can only be 
>>> set
>>> for all or no domains. This works well for development platforms where
>>> setting to non-strict/lazy mode is fine for performance reasons but on
>>> production devices, we need a more fine grained control to allow only
>>> certain peripherals to support this mode where we can be sure that it is
>>> safe. So add support to filter non-strict/lazy mode based on the device
>>> names that are passed via cmdline parameter "iommu.nonstrict_device".
>>
>> There seems to be considerable overlap here with both the existing
>> patches for per-device default domain control [1], and the broader
>> ongoing development on how to define, evaluate and handle "trusted"
>> vs. "untrusted" devices (e.g. [2],[3]). I'd rather see work done to
>> make sure those integrate properly together and work well for
>> everyone's purposes, than add more disjoint mechanisms that only
>> address small pieces of the overall issue.
>>
>> Robin.
>>
>> [1]
>> https://lore.kernel.org/linux-iommu/20200824051726.7xaJRTTszJuzdFWGJ8YNsshCtfNR0BNeMrlILAyqt_0@z/ 
>>
>> [2]
>> https://lore.kernel.org/linux-iommu/20200630044943.3425049-1-rajatja@google.com/ 
>>
>> [3]
>> https://lore.kernel.org/linux-iommu/20200626002710.110200-2-rajatja@google.com/ 
>>
>>
> 
> Thanks for the links, [1] definitely sounds interesting, I was under the 
> impression
> that changing such via sysfs is late, but seems like other Sai has got 
> it working
> for the default domain type. So we can extend that and add a strict 
> attribute as well,
> we should be definitely OK with system booting with default strict mode 
> for all
> peripherals as long as we have an option to change that later, Doug?

Right, IIRC there was initially a proposal of a command line option 
there too, and it faced the same criticism around not being very generic 
or scalable. I believe sysfs works as a reasonable compromise since in 
many cases it can be tweaked relatively early from an initrd, and 
non-essential devices can effectively be switched at any time by 
removing and reprobing their driver.

As for a general approach for internal devices where you do believe the 
hardware is honest but don't necessarily trust whatever firmware it 
happens to be running, I'm pretty sure that's come up already, but I'll 
be sure to mention it at Rajat's imminent LPC talk if nobody else does.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
