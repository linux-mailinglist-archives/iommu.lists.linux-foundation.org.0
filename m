Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBEF26DBB7
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 14:38:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2530A84C44;
	Thu, 17 Sep 2020 12:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwGehe-XGi6c; Thu, 17 Sep 2020 12:38:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7552184C2C;
	Thu, 17 Sep 2020 12:38:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EE25C089E;
	Thu, 17 Sep 2020 12:38:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EB3CC0051
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 12:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8D6BB81726
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 12:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EI9h5GGTsbfH for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 12:38:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 93C18816F3
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 12:38:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D639B30E;
 Thu, 17 Sep 2020 05:38:27 -0700 (PDT)
Received: from [10.57.47.84] (unknown [10.57.47.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 388B63F68F;
 Thu, 17 Sep 2020 05:38:25 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
To: Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
 <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <88bc6b29-9206-477f-4c45-a1e55efb66af@arm.com>
Date: Thu, 17 Sep 2020 13:38:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
Content-Language: en-GB
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
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

On 2020-09-16 18:46, Rob Herring wrote:
> On Wed, Sep 16, 2020 at 11:04 AM Alyssa Rosenzweig
> <alyssa.rosenzweig@collabora.com> wrote:
>>
>>> So I get a performance regression with the dma-coherent approach, even if it's
>>> clearly the cleaner.
>>
>> That's bizarre -- this should really be the faster of the two.
> 
> Coherency may not be free. CortexA9 had something like 4x slower
> memcpy if SMP was enabled as an example. I don't know if there's
> anything going on like that specifically here. If there's never any
> CPU accesses mixed in with kmscube, then there would be no benefit to
> coherency.

There will still be CPU benefits in terms of not having to spend time 
cache-cleaning every BO upon allocation, and less overhead on writing 
out descriptors in the first place (due to cacheable vs. non-cacheable).

I haven't tried the NSh hack on Juno, but I don't see any notable 
performance issue as-is - kmscube hits a solid 60FPS from the off (now 
that it works without spewing faults). Given that the hardware on Juno 
can be generously described as "less good", it would certainly be 
interesting to figure out what difference is at play here...

The usual argument against I/O coherency is that it adds latency to 
every access, but if you already have a coherent interconnect anyway 
then the sensible answer to that is implementing decent snoop filters, 
rather than making software more complicated.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
