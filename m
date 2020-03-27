Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB96195D73
	for <lists.iommu@lfdr.de>; Fri, 27 Mar 2020 19:18:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9098288348;
	Fri, 27 Mar 2020 18:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6rEoIP8CaU7; Fri, 27 Mar 2020 18:18:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0616587D6D;
	Fri, 27 Mar 2020 18:18:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECF19C0177;
	Fri, 27 Mar 2020 18:18:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0F2BC0177
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 18:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EA06020363
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 18:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBknejEM6-TY for <iommu@lists.linux-foundation.org>;
 Fri, 27 Mar 2020 18:18:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by silver.osuosl.org (Postfix) with ESMTPS id BF1F220358
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 18:18:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585333121; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9j8az2wn5tFjF/j7S4vwuA3DngrkCuX03aHf5YAPc50=;
 b=dPgixVcLQ4nFKNaz5S7p8vONeT5uiHu/sehWvwtfJNHdv4Auxn3xcygoeoTqm27hjk8zp1V0
 rHu9f6qH7KD4S9x+0OkQu1lbz1OK3Oce8FITkyS9PHGOabgdBefCSBLiDjawmzvJGTLH3oTA
 CsCG/1o0VzQjUvtp2JM6nmNRzZI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7e4378.7f285f066068-smtp-out-n02;
 Fri, 27 Mar 2020 18:18:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 95538C433D2; Fri, 27 Mar 2020 18:18:32 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CAB97C433F2;
 Fri, 27 Mar 2020 18:18:31 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 27 Mar 2020 23:48:31 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
In-Reply-To: <CAF6AEGtWqaGf1m_ew=iSQG2cX0_tV=W_7DwKRkTJUWJaParsvw@mail.gmail.com>
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
 <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <CAF6AEGtWqaGf1m_ew=iSQG2cX0_tV=W_7DwKRkTJUWJaParsvw@mail.gmail.com>
Message-ID: <0148cf32b9770ad4b5b4f7baf4541a40@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Will Deacon <will@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, "list@263.net:IOMMU DRIVERS ,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
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

Hi Rob,

On 2020-03-27 21:47, Rob Clark wrote:
> On Fri, Mar 27, 2020 at 8:10 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Robin,
>> 
>> Thanks for taking a look at this.
>> 
>> On 2020-03-27 19:42, Robin Murphy wrote:
>> > On 2020-03-27 1:28 pm, Sai Prakash Ranjan wrote:
>> >> Currently on reboot/shutdown, the following messages are
>> >> displayed on the console as error messages before the
>> >> system reboots/shutdown.
>> >>
>> >> On SC7180:
>> >>
>> >>    arm-smmu 15000000.iommu: removing device with active domains!
>> >>    arm-smmu 5040000.iommu: removing device with active domains!
>> >>
>> >> Demote the log level to debug since it does not offer much
>> >> help in identifying/fixing any issue as the system is anyways
>> >> going down and reduce spamming the kernel log.
>> >
>> > I've gone back and forth on this pretty much ever since we added the
>> > shutdown hook - on the other hand, if any devices *are* still running
>> > in those domains at this point, then once we turn off the SMMU and let
>> > those IOVAs go out on the bus as physical addresses, all manner of
>> > weirdness may ensue. Thus there is an argument for *some* indication
>> > that this may happen, although IMO it could be downgraded to at least
>> > dev_warn().
>> >
>> 
>> Any pointers to the weirdness here after SMMU is turned off?
>> Because if we look at the call sites, device_shutdown is called
>> from kernel_restart_prepare or kernel_shutdown_prepare which would
>> mean system is going down anyways, so do we really care about these
>> error messages or warnings from SMMU?
>> 
>>   arm_smmu_device_shutdown
>>    platform_drv_shutdown
>>     device_shutdown
>>      kernel_restart_prepare
>>       kernel_restart
>> 
> 
> I'd guess that drm/msm is not detaching all of it's UNMANAGED domains
> in shutdown.  Although *presumably* the device_link stuff would
> prevent the SMMU from shutting down while gpu/display is still active?
>  If not I think we have bigger problems.
> 

Where is the shutdown callback in drm/msm? I don't see any...

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
