Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F11DAEDF
	for <lists.iommu@lfdr.de>; Wed, 20 May 2020 11:33:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8420886303;
	Wed, 20 May 2020 09:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZbBZXNtzy-n; Wed, 20 May 2020 09:32:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56A5A862BC;
	Wed, 20 May 2020 09:32:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 425E1C0176;
	Wed, 20 May 2020 09:32:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF3C2C0176
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 09:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9DCAF862FC
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 09:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3lzBHxPp0S3 for <iommu@lists.linux-foundation.org>;
 Wed, 20 May 2020 09:32:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 04746862BC
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 09:32:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589967175; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kj7KetK7iFPOosbvpCUKYMpyUHmudAmdvJ6fI1OKUq0=;
 b=Z8XCrgMZ0FgPrvTHQLt8XXraCvJo7euCdn+BP8PNrirxhe/dNyQO6d9KvRRJZmRcH/u7h4lA
 Rgs39f2fNvZrUEeI1vXr5na4EaRvKtWIqWkaPi32ko8VNG0fzInE/+U+HGTTZvjJjU/uhizF
 nsRojQ7B6qHBPDnRQaUsq+XU8pQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ec4f93f0d1be1ca017221a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 May 2020 09:32:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D0810C43387; Wed, 20 May 2020 09:32:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 87D87C433CA;
 Wed, 20 May 2020 09:32:45 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 20 May 2020 15:02:45 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
In-Reply-To: <CAF6AEGuzBtj+srindmOvhaom5BdS2adLaOF=v_MtguMja14V2w@mail.gmail.com>
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
 <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <20200507125357.GA31783@willie-the-truck>
 <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
 <CAF6AEGvuHKObTR97XdSXjmjKB+qjQ8N1_wxM=ZU8bEkF=cXp-A@mail.gmail.com>
 <20200511173008.GA24282@jcrouse1-lnx.qualcomm.com>
 <20200518154522.GN32394@willie-the-truck>
 <5a0ad639e272026c8be57393937cda22@codeaurora.org>
 <CAF6AEGuzBtj+srindmOvhaom5BdS2adLaOF=v_MtguMja14V2w@mail.gmail.com>
Message-ID: <a801e79a0a75092c28a6646ae7fa5e36@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, "list@263.net:IOMMU DRIVERS ,
 Joerg
 Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On 2020-05-19 20:41, Rob Clark wrote:
> On Tue, May 19, 2020 at 2:26 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Will,
>> 
>> On 2020-05-18 21:15, Will Deacon wrote:
>> > On Mon, May 11, 2020 at 11:30:08AM -0600, Jordan Crouse wrote:
>> >> On Fri, May 08, 2020 at 08:40:40AM -0700, Rob Clark wrote:
>> >> > On Fri, May 8, 2020 at 8:32 AM Rob Clark <robdclark@gmail.com> wrote:
>> >> > >
>> >> > > On Thu, May 7, 2020 at 5:54 AM Will Deacon <will@kernel.org> wrote:
>> >> > > >
>> >> > > > On Thu, May 07, 2020 at 11:55:54AM +0100, Robin Murphy wrote:
>> >> > > > > On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
>> >> > > > > > On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
>> >> > > > > > > Add stall implementation hook to enable stalling
>> >> > > > > > > faults on QCOM platforms which supports it without
>> >> > > > > > > causing any kind of hardware mishaps. Without this
>> >> > > > > > > on QCOM platforms, GPU faults can cause unrelated
>> >> > > > > > > GPU memory accesses to return zeroes. This has the
>> >> > > > > > > unfortunate result of command-stream reads from CP
>> >> > > > > > > getting invalid data, causing a cascade of fail.
>> >> > > > >
>> >> > > > > I think this came up before, but something about this rationale doesn't add
>> >> > > > > up - we're not *using* stalls at all, we're still terminating faulting
>> >> > > > > transactions unconditionally; we're just using CFCFG to terminate them with
>> >> > > > > a slight delay, rather than immediately. It's really not clear how or why
>> >> > > > > that makes a difference. Is it a GPU bug? Or an SMMU bug? Is this reliable
>> >> > > > > (or even a documented workaround for something), or might things start
>> >> > > > > blowing up again if any other behaviour subtly changes? I'm not dead set
>> >> > > > > against adding this, but I'd *really* like to have a lot more confidence in
>> >> > > > > it.
>> >> > > >
>> >> > > > Rob mentioned something about the "bus returning zeroes" before, but I agree
>> >> > > > that we need more information so that we can reason about this and maintain
>> >> > > > the code as the driver continues to change. That needs to be a comment in
>> >> > > > the driver, and I don't think "but android seems to work" is a good enough
>> >> > > > justification. There was some interaction with HUPCF as well.
>> >> > >
>> >> > > The issue is that there are multiple parallel memory accesses
>> >> > > happening at the same time, for example CP (the cmdstream processor)
>> >> > > will be reading ahead and setting things up for the next draw or
>> >> > > compute grid, in parallel with some memory accesses from the shader
>> >> > > which could trigger a fault.  (And with faults triggered by something
>> >> > > in the shader, there are *many* shader threads running in parallel so
>> >> > > those tend to generate a big number of faults at the same time.)
>> >> > >
>> >> > > We need either CFCFG or HUPCF, otherwise what I have observed is that
>> >> > > while the fault happens, CP's memory access will start returning
>> >> > > zero's instead of valid cmdstream data, which triggers a GPU hang.  I
>> >> > > can't say whether this is something unique to qcom's implementation of
>> >> > > the smmu spec or not.
>> >> > >
>> >> > > *Often* a fault is the result of the usermode gl/vk/cl driver bug,
>> >> > > although I don't think that is an argument against fixing this in the
>> >> > > smmu driver.. I've been carrying around a local patch to set HUPCF for
>> >> > > *years* because debugging usermode driver issues is so much harder
>> >> > > without.  But there are some APIs where faults can be caused by the
>> >> > > user's app on top of the usermode driver.
>> >> > >
>> >> >
>> >> > Also, I'll add to that, a big wish of mine is to have stall with the
>> >> > ability to resume later from a wq context.  That would enable me to
>> >> > hook in the gpu crash dump handling for faults, which would make
>> >> > debugging these sorts of issues much easier.  I think I posted a
>> >> > prototype of this quite some time back, which would schedule a worker
>> >> > on the first fault (since there are cases where you see 1000's of
>> >> > faults at once), which grabbed some information about the currently
>> >> > executing submit and some gpu registers to indicate *where* in the
>> >> > submit (a single submit could have 100's or 1000's of draws), and then
>> >> > resumed the iommu cb.
>> >> >
>> >> > (This would ofc eventually be useful for svm type things.. I expect
>> >> > we'll eventually care about that too.)
>> >>
>> >> Rob is right about HUPCF. Due to the parallel nature of the command
>> >> processor
>> >> there is always a very good chance that a CP access is somewhere in
>> >> the bus so
>> >> any pagefault is usually a death sentence. The GPU context bank would
>> >> always
>> >> want HUPCF set to 1.
>> >
>> > So this sounds like an erratum to me, and I'm happy to set HUPCF if we
>> > detect the broken implementation. However, it will need an entry in
>> > Documentation/arm64/silicon-errata.rst and a decent comment in the
>> > driver
>> > to explain what we're doing and why.
>> >
>> 
>> AFAIK there is no erratum documented internally for this behaviour and
>> this
>> exists from MSM8996 SoC time and errata usually don't survive this 
>> long
>> across generation of SoCs and there is no point for us in disguising 
>> it.
> 
> possibly longer, qcom_iommu sets CFCFG..
> 

Oh right, I was still in college when those SoCs were released ;)

>> Is it OK if we clearly mention it as the "design limitation" or some
>> other
>> term which we can agree upon along with the description which Rob and
>> Jordan
>> provided for setting HUPCF in the driver when we add the set_hupcf
>> callback?
> 
> I'm not too picky on what we call it, but afaict it has been this way
> since the beginning of time, rather than specific to a certain SoC or
> generation of SoCs.  So it doesn't seem like the hw designers consider
> it a bug.
> 
> (I'm not sure what the expected behavior is.. nor if any other SMMU
> implementation encounters this sort of situation..)
> 

Yes, that was my point as well that its probably not counted as a bug
by the hw designers. So I'm going to post setting HUPCF on QCOM
implementation with clear comments based on yours and Jordan's 
description
of this problem, but I wanted to have a way to set this only for GPU 
context
bank and not GMU as Jordan mentioned earlier that GMU doesnt need HUPCF 
set.
I was checking as to how do we map cb to device, if it was possible then 
we can have
a compatibility thing like we did for identity mapping. Any ideas Robin?

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
