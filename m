Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC69251F6E
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 21:01:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9F7508646F;
	Tue, 25 Aug 2020 19:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4l1MQFNpT8d; Tue, 25 Aug 2020 19:01:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6EF386322;
	Tue, 25 Aug 2020 19:01:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A041FC0051;
	Tue, 25 Aug 2020 19:01:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D18EC0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 19:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0F7D787774
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 19:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEH9F6At0oQO for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 19:01:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2902C88373
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 19:01:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598382091; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TRQuySeZQtx9Xu8p/LTvIapZAq6d9k1oOwhDjvqNYBE=;
 b=inv0oad5RcS3D7DVL9JjYi0p+0SOQf+jm6zEzqhYBQqfwsYzNlWb9/j4PEJhpQ803cmR/H+X
 NTRKx+DHUOWFHpNxGR85NgjVXqVcP1gqbCFfaTQ5Z+zWWEdQHj+k4WOuQsN6j/MErkDu4Vdc
 XabXyHPpflNs+cjBn+mMmlSkDy0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f455fd7e2cf79f0e2a628a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Aug 2020 19:00:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29C18C433A1; Tue, 25 Aug 2020 19:00:39 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 142A3C433CB;
 Tue, 25 Aug 2020 19:00:38 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 26 Aug 2020 00:30:38 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
In-Reply-To: <CAD=FV=XK3Xa3rRWvuSA_jA+5_1XYBmHEX2B2XSb8h3oOe1PHLw@mail.gmail.com>
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=XK3Xa3rRWvuSA_jA+5_1XYBmHEX2B2XSb8h3oOe1PHLw@mail.gmail.com>
Message-ID: <3df7edd53ebca00be288e69b92b8d4b9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Will Deacon <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, iommu@lists.linux-foundation.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi,

On 2020-08-25 21:40, Doug Anderson wrote:
> Hi,
> 
> On Tue, Aug 25, 2020 at 8:43 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Currently the non-strict or lazy mode of TLB invalidation can only be 
>> set
>> for all or no domains. This works well for development platforms where
>> setting to non-strict/lazy mode is fine for performance reasons but on
>> production devices, we need a more fine grained control to allow only
>> certain peripherals to support this mode where we can be sure that it 
>> is
>> safe. So add support to filter non-strict/lazy mode based on the 
>> device
>> names that are passed via cmdline parameter "iommu.nonstrict_device".
>> 
>> Example: 
>> iommu.nonstrict_device="7c4000.sdhci,a600000.dwc3,6048000.etr"
> 
> I have an inherent dislike of jamming things like this onto the
> command line.  IMHO the command line is the last resort for specifying
> configuration and generally should be limited to some specialized
> debug options and cases where the person running the kernel needs to
> override a config that was set by the person (or company) compiling
> the kernel.  Specifically, having a long/unwieldy command line makes
> it harder to use for the case when an end user actually wants to use
> it to override something.  It's also just another place to look for
> config.
> 

Good thing about command line parameters are that they are optional, 
they do
not specify any default behaviour (I mean they are not mandatory to be 
set
for the system to be functional), so I would like to view it as an 
optional
config. And this command line parameter (nonstrict_device) is strictly 
optional
with default being strict already set in the driver.

They can be passed from the bootloader via chosen node for DT platforms 
or choose
a new *bootconfig* as a way to pass the cmdline but finally it does boil 
down to
just another config.

I agree with general boolean or single value command line parameters 
being just
more messy which could just be Kconfigs instead but for multiple value 
parameters
like these do not fit in Kconfig.

As you might already know, command line also gives an advantage to the 
end user
to configure system without building kernel, for this specific command 
line its
very useful because the performance bump is quite noticeable when the 
iommu.strict
is off. Now for end user who would not be interested in building entire 
kernel(majority)
and just cares about good speeds or throughput can find this very 
beneficial.
I am not talking about one specific OS usecase here but more in general 
term.

> The other problem is that this doesn't necessarily scale very well.
> While it works OK for embedded cases it doesn't work terribly well for
> distributions.  I know that in an out-of-band thread you indicated
> that it doesn't break anything that's not already broken (AKA this
> doesn't fix the distro case but it doesn't make it worse), it would be
> better to come up with a more universal solution.
> 

Is the universal solution here referring to fix all the command line 
parameters
in the kernel or this specific command line? Are we going to remove any 
more
addition to the cmdline ;)

So possible other solution is the *bootconfig* which is again just 
another place
to look for a config. So thing is that this universal solution would 
result in
just more new fancy ways of passing configs or adding such configs to 
the drivers
or subsystems in kernel which is pretty much similar to implementing 
policy in
kernel which I think is frowned upon and mentioned in the other thread.

> Ideally it feels like we should figure out how to tag devices in a
> generic manner automatically (hardcode at the driver or in the device
> tree).  I think the out-of-band discussions talked about "external
> facing" and the like.  We could also, perhaps, tag devices that have
> "binary blob" firmware if we wanted.  Then we'd have a policy (set by
> Kconfig, perhaps overridable via commandline) that indicated the
> strictness level for the various classes of devices.  So policy would
> be decided by KConfig and/or command line.
> 

How is tagging in driver or device tree better than the simple command 
line
approach to pass the same list of devices which otherwise you would 
hardcode
in the corresponding drivers and device tree all over the kernel other 
than
the scalability part for command line? IMHO it is too much churn.

Device tree could be used but then we have a problem with it being for 
only
describing hardware and it doesn't work for ACPI based systems.

Command line approach works for all systems (both DT and ACPI) without 
having
to add too much churn to drivers. Lastly, I think we can have both 
options, it
doesn't hurt to add command line parameter since it is optional.

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
