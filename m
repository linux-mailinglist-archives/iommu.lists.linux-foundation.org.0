Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A34C1ECDEF
	for <lists.iommu@lfdr.de>; Wed,  3 Jun 2020 13:00:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E02C8805C;
	Wed,  3 Jun 2020 11:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddVgwnxWvZ9t; Wed,  3 Jun 2020 11:00:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 35C6888071;
	Wed,  3 Jun 2020 11:00:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C760C016E;
	Wed,  3 Jun 2020 11:00:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D028CC016E
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 11:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C4A6785313
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 11:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eu2MEyxy865A for <iommu@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 11:00:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 914F0852CF
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 11:00:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E435B31B;
 Wed,  3 Jun 2020 04:00:41 -0700 (PDT)
Received: from [10.57.0.45] (unknown [10.57.0.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DD503F305;
 Wed,  3 Jun 2020 04:00:40 -0700 (PDT)
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Will Deacon <will@kernel.org>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder> <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck> <20200602063210.GT11847@yoga>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a1f9ee83-66cd-1f04-3e78-3281b3cafd07@arm.com>
Date: Wed, 3 Jun 2020 12:00:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602063210.GT11847@yoga>
Content-Language: en-GB
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <john.stultz@linaro.org>, linux-tegra@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On 2020-06-02 07:32, Bjorn Andersson wrote:
> On Wed 27 May 04:03 PDT 2020, Will Deacon wrote:
> 
>> Hi John, Bjorn,
>>
>> On Tue, May 26, 2020 at 01:34:45PM -0700, John Stultz wrote:
>>> On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
>>>>
>>>> On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
>>>>
>>>> Rob, Will, we're reaching the point where upstream has enough
>>>> functionality that this is becoming a critical issue for us.
>>>>
>>>> E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
>>>> mainline with display, GPU, WiFi and audio working and the story is
>>>> similar on several devboards.
>>>>
>>>> As previously described, the only thing I want is the stream mapping
>>>> related to the display controller in place, either with the CB with
>>>> translation disabled or possibly with a way to specify the framebuffer
>>>> region (although this turns out to mess things up in the display
>>>> driver...)
>>>>
>>>> I did pick this up again recently and concluded that by omitting the
>>>> streams for the USB controllers causes an instability issue seen on one
>>>> of the controller to disappear. So I would prefer if we somehow could
>>>> have a mechanism to only pick the display streams and the context
>>>> allocation for this.
>>>>
>>>>
>>>> Can you please share some pointers/insights/wishes for how we can
>>>> conclude on this subject?
>>>
>>> Ping? I just wanted to follow up on this discussion as this small
>>> series is crucial for booting mainline on the Dragonboard 845c
>>> devboard. It would be really valuable to be able to get some solution
>>> upstream so we can test mainline w/o adding additional patches.
>>
>> Sorry, it's been insanely busy recently and I haven't had a chance to think
>> about this on top of everything else. We're also carrying a hack in Android
>> for you :)
>>
> 
> Thanks for taking the time to get back to us on this!
> 
>>> The rest of the db845c series has been moving forward smoothly, but
>>> this set seems to be very stuck with no visible progress since Dec.
>>>
>>> Are there any pointers for what folks would prefer to see?
>>
>> I've had a chat with Robin about this. Originally, I was hoping that
>> people would all work together towards an idyllic future where firmware
>> would be able to describe arbitrary pre-existing mappings for devices,
>> irrespective of the IOMMU through which they master and Linux could
>> inherit this configuration. However, that hasn't materialised (there was
>> supposed to be an IORT update, but I don't know what happened to that)
>> and, in actual fact, the problem that you have on db845 is /far/ more
>> restricted than the general problem.
>>
>> Could you please try hacking something along the following lines and see
>> how you get on? You may need my for-joerg/arm-smmu/updates branch for
>> all the pieces:
>>
>>    1. Use the ->cfg_probe() callback to reserve the SMR/S2CRs you need
>>       "pinning" and configure for bypass.
>>
>>    2. Use the ->def_domain_type() callback to return IOMMU_DOMAIN_IDENTITY
>>       for the display controller
>>
>> I /think/ that's sufficient, but note that it differs from the current
>> approach because we don't end up reserving a CB -- bypass is configured
>> in the S2CR instead. Some invalidation might therefore be needed in
>> ->cfg_probe() after unhooking the CB.
>>
>> Thanks, and please yell if you run into problems with this approach.
>>
> 
> This sounded straight forward and cleaner, so I implemented it...
> 
> Unfortunately the hypervisor is playing tricks on me when writing to
> S2CR registers:
> - TRANS writes lands as requested
> - BYPASS writes ends up in the register as requested, with type FAULT
> - FAULT writes are ignored
> 
> In other words, the Qualcomm firmware prevents us from relying on
> marking the relevant streams as BYPASS type.

Sigh... at that point I'm inclined to suggest we give up and stop trying 
to drive these things with arm-smmu. The XZR thing was bad enough, but 
if they're not even going to pretend to implement the architecture 
correctly then I'm not massively keen to continue tying the 
architectural driver in further knots if innocent things like 
CONFIG_IOMMU_DEFAULT_PASSTHROUGH are going to unexpectedly and 
catastrophically fail. We have qcom-iommu for hypervisor-mediated SMMUs, 
and this new hypervisor behaviour sounds to me more like "qcom-iommu++" 
with reassignable stream-to-context mappings, rather than a proper Arm 
SMMU emulation.

> Instead Qualcomm seems to implement "bypass" by setting up stream
> mapping, of TRANS type, pointing to a context bank without
> ARM_SMMU_SCTLR_M set.

...which arm-smmu specifically does not do because it's a silly waste of 
resources - typically context banks are even scarcer than S2CRs.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
