Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA13D5929
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 14:06:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 910EF40106;
	Mon, 26 Jul 2021 12:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yh1cG9-hobwm; Mon, 26 Jul 2021 12:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A089740142;
	Mon, 26 Jul 2021 12:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72778C000E;
	Mon, 26 Jul 2021 12:06:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16965C000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 059434012F
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWGlTtABUhHP for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 12:06:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84BC540106
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:06:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AADC631B;
 Mon, 26 Jul 2021 05:06:48 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F3BD3F70D;
 Mon, 26 Jul 2021 05:06:47 -0700 (PDT)
Subject: Re: [PATCH 00/23] iommu: Refactor DMA domain strictness
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org
References: <cover.1626888444.git.robin.murphy@arm.com>
 <8e9da41e-4e3a-7098-bece-7f6cba89a2aa@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <519d4a00-a251-3437-6c3e-6ee3e75bf64c@arm.com>
Date: Mon, 26 Jul 2021 13:06:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8e9da41e-4e3a-7098-bece-7f6cba89a2aa@huawei.com>
Content-Language: en-GB
Cc: dianders@chromium.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 2021-07-26 09:13, John Garry wrote:
> On 21/07/2021 19:20, Robin Murphy wrote:
>> Hi all,
>>
>> First off, yes, this conflicts with just about everything else
>> currently in-flight. Sorry about that. If it stands up to initial review
>> then I'll start giving some thought to how to fit everything together
>> (particularly John's cleanup of strictness defaults, which I'd be
>> inclined to fold into a v2 of this series).
> 
> It seems to me that patch #20 is the only real conflict, and that is 
> just a different form of mine in that passthrough, strict, and lazy are 
> under a single choice, as opposed to passthrough being a separate config 
> (for mine). And on that point, I did assume that we would have a 
> different sysfs file for strict vs lazy in this series, and not a new 
> domain type. But I assume that there is a good reason for that.

Yes, as mentioned by patch #18 it helps a surprising number of things 
fall into place really neatly.

> Anyway, I'd really like to see my series just merged now.

Sure, I was going to say I can happily rebase on top of your series 
as-is if Joerg wants to apply it first, and now that's just happened :)

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
