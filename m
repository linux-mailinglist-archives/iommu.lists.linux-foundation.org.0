Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 255403B8099
	for <lists.iommu@lfdr.de>; Wed, 30 Jun 2021 12:08:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA55A4043F;
	Wed, 30 Jun 2021 10:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1DQGv0sAYgm; Wed, 30 Jun 2021 10:08:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B968F403F9;
	Wed, 30 Jun 2021 10:08:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9546AC0022;
	Wed, 30 Jun 2021 10:08:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14D99C000E
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 10:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 0E47B60650
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 10:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id Kv10Pp2umQXC for <iommu@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 10:08:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id C917F605E6
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 10:08:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625047694; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=V2ANtGMjJP031vwtea0cvuT0DcS61OO8FRdPjBQ676g=;
 b=i4UqcSLEXdc2JM9cK5p25V3wesj0kzB+u7tR6M/IyTtux4eGiwt9whU+0IkD5VxeWpXl5g8H
 Zi7pfYQPa69v5mnJW15x3KTCwQvBzNb1vPTgPdOAcZyv/+7h0cJJCuOxdQFuqhpQcQUrPTvT
 lUUKdUHkRrmhy/W7pzZMMZ3w6vY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60dc4281ec0b18a7459eb612 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 10:08:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 761EBC4323A; Wed, 30 Jun 2021 10:08:00 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 17A87C433D3;
 Wed, 30 Jun 2021 10:07:59 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 30 Jun 2021 15:37:59 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
In-Reply-To: <20210325173311.GA15504@willie-the-truck>
References: <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
 <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
 <20210203214612.GB19847@willie-the-truck>
 <4988e2ef35f76a0c2f1fe3f66f023a3b@codeaurora.org>
 <9362873a3bcf37cdd073a6128f29c683@codeaurora.org>
 <20210325173311.GA15504@willie-the-truck>
Message-ID: <21239ba603d0bdc4e4c696588a905f88@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, "list@263.net:IOMMU
 DRIVERS , Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

Hi Will,

On 2021-03-25 23:03, Will Deacon wrote:
> On Tue, Mar 09, 2021 at 12:10:44PM +0530, Sai Prakash Ranjan wrote:
>> On 2021-02-05 17:38, Sai Prakash Ranjan wrote:
>> > On 2021-02-04 03:16, Will Deacon wrote:
>> > > On Tue, Feb 02, 2021 at 11:56:27AM +0530, Sai Prakash Ranjan wrote:
>> > > > On 2021-02-01 23:50, Jordan Crouse wrote:
>> > > > > On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
>> > > > > > On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
>> > > > > > > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
>> > > > > > > > On 2021-01-29 14:35, Will Deacon wrote:
>> > > > > > > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
>> > > > > > > > > > +#define IOMMU_LLC        (1 << 6)
>> > > > > > > > >
>> > > > > > > > > On reflection, I'm a bit worried about exposing this because I think it
>> > > > > > > > > will
>> > > > > > > > > introduce a mismatched virtual alias with the CPU (we don't even have a
>> > > > > > > > > MAIR
>> > > > > > > > > set up for this memory type). Now, we also have that issue for the PTW,
>> > > > > > > > > but
>> > > > > > > > > since we always use cache maintenance (i.e. the streaming API) for
>> > > > > > > > > publishing the page-tables to a non-coheren walker, it works out.
>> > > > > > > > > However,
>> > > > > > > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
>> > > > > > > > > allocation, then they're potentially in for a nasty surprise due to the
>> > > > > > > > > mismatched outer-cacheability attributes.
>> > > > > > > > >
>> > > > > > > >
>> > > > > > > > Can't we add the syscached memory type similar to what is done on android?
>> > > > > > >
>> > > > > > > Maybe. How does the GPU driver map these things on the CPU side?
>> > > > > >
>> > > > > > Currently we use writecombine mappings for everything, although there
>> > > > > > are some cases that we'd like to use cached (but have not merged
>> > > > > > patches that would give userspace a way to flush/invalidate)
>> > > > > >
>> > > > >
>> > > > > LLC/system cache doesn't have a relationship with the CPU cache.  Its
>> > > > > just a
>> > > > > little accelerator that sits on the connection from the GPU to DDR and
>> > > > > caches
>> > > > > accesses. The hint that Sai is suggesting is used to mark the buffers as
>> > > > > 'no-write-allocate' to prevent GPU write operations from being cached in
>> > > > > the LLC
>> > > > > which a) isn't interesting and b) takes up cache space for read
>> > > > > operations.
>> > > > >
>> > > > > Its easiest to think of the LLC as a bonus accelerator that has no cost
>> > > > > for
>> > > > > us to use outside of the unfortunate per buffer hint.
>> > > > >
>> > > > > We do have to worry about the CPU cache w.r.t I/O coherency (which is a
>> > > > > different hint) and in that case we have all of concerns that Will
>> > > > > identified.
>> > > > >
>> > > >
>> > > > For mismatched outer cacheability attributes which Will
>> > > > mentioned, I was
>> > > > referring to [1] in android kernel.
>> > >
>> > > I've lost track of the conversation here :/
>> > >
>> > > When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also
>> > > mapped
>> > > into the CPU and with what attributes? Rob said "writecombine for
>> > > everything" -- does that mean ioremap_wc() / MEMREMAP_WC?
>> > >
>> >
>> > Rob answered this.
>> >
>> > > Finally, we need to be careful when we use the word "hint" as
>> > > "allocation
>> > > hint" has a specific meaning in the architecture, and if we only
>> > > mismatch on
>> > > those then we're actually ok. But I think IOMMU_LLC is more than
>> > > just a
>> > > hint, since it actually drives eviction policy (i.e. it enables
>> > > writeback).
>> > >
>> > > Sorry for the pedantry, but I just want to make sure we're all talking
>> > > about the same things!
>> > >
>> >
>> > Sorry for the confusion which probably was caused by my mentioning of
>> > android, NWA(no write allocate) is an allocation hint which we can
>> > ignore
>> > for now as it is not introduced yet in upstream.
>> >
>> 
>> Any chance of taking this forward? We do not want to miss out on small 
>> fps
>> gain when the product gets released.
> 
> Do we have a solution to the mismatched virtual alias?
> 

Sorry for the long delay on this thread.

For mismatched virtual alias question, wasn't this already discussed in 
stretch
when initial support for system cache [1] (which was reverted by you) 
was added?

Excerpt from there,

"As seen in downstream kernels there are few non-coherent devices which
would not want to allocate in system cache, and therefore would want
Inner/Outer non-cached memory. So, we may want to either override the
attributes per-device, or as you suggested we may want to introduce
another memory type 'sys-cached' that can be added with its separate
infra."

As for DMA API usage, we do not have any upstream users (video will be
one if they decide to upstream that).

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20180615105329.26800-1-vivek.gautam@codeaurora.org/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
