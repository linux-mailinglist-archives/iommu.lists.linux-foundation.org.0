Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F4266503
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 18:50:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B426E878F6;
	Fri, 11 Sep 2020 16:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nxCN8RCslfM; Fri, 11 Sep 2020 16:50:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 04EAE878F7;
	Fri, 11 Sep 2020 16:50:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F22EC089E;
	Fri, 11 Sep 2020 16:50:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AC6AC0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 16:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0CCBB878F8
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 16:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7GqlGwP6Jc6 for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 16:50:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-18.smtp-out.us-west-2.amazonses.com
 (a27-18.smtp-out.us-west-2.amazonses.com [54.240.27.18])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6F3BF878F1
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599843011;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=75M3K27A75eW01qMnHulweMV5JfADkFu3ldMwzlgYeY=;
 b=MKxHsrtYXjJ6irtLkjI/Pr7QPqB+Lbh80Tp81K4dJyNbs29+zA0q27v2t0+r5o5l
 McH/D+gajK721bAv0OFOdgnp7e1l0jOV+b4i22onX8dC9tfxICJ+ZZm2mvOgBOHALLF
 wdh+Oj2rdkmL9cDqitDtxK3xYLy32SdE8moxwgqs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599843011;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=75M3K27A75eW01qMnHulweMV5JfADkFu3ldMwzlgYeY=;
 b=adykPrcyjx+llW53S4YzrbXOjpSA7BZVnhslfOOD2Jwc9l3ePfFA9eY87gmEvDW/
 3RskhkH+ll68UGh6R5/dd6NkppnWlwEjrV9uefPa80uhMvvQ3sAwOGs5AvRyIRYTC+h
 fmkEPkrCFEQtKlNkkaF/Aupit62S6gjo6t/yfe9Y=
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 16:50:10 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
In-Reply-To: <7ff9b238-e203-059f-d793-1c44475c6aa2@arm.com>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
 <20200911160706.GA20802@willie-the-truck>
 <010101747df8e9df-fad2f88d-e970-4753-a99a-2cfeeb1a29a9-000000@us-west-2.amazonses.com>
 <7ff9b238-e203-059f-d793-1c44475c6aa2@arm.com>
Message-ID: <010101747e13090b-0578b6a5-4428-45ec-8148-e26b3a2b9822-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: Will Deacon <will@kernel.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
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

On 2020-09-11 22:04, Robin Murphy wrote:
> On 2020-09-11 17:21, Sai Prakash Ranjan wrote:
>> On 2020-09-11 21:37, Will Deacon wrote:
>>> On Fri, Sep 11, 2020 at 05:03:06PM +0100, Robin Murphy wrote:
>>>> BTW am I supposed to have received 3 copies of everything? Because I 
>>>> did...
>>> 
>>> Yeah, this seems to be happening for all of Sai's emails :/
>>> 
>> 
>> Sorry, I am not sure what went wrong as I only sent this once
>> and there are no recent changes to any of my configs, I'll
>> check it further.
> 
> Actually on closer inspection it appears to be "correct" behaviour.
> I'm still subscribed to LAKML and the IOMMU list on this account, but
> normally Office 365 deduplicates so aggressively that I have rules set
> up to copy list mails that I'm cc'ed on back to my inbox, in case they
> arrive first and cause the direct copy to get eaten - apparently
> there's something unique about your email setup that manages to defeat
> the deduplicator and make it deliver all 3 copies intact... :/
> 

No changes in my local setup atleast, but in the past we have
had cases with codeaurora mail acting weird or it could be my vpn,
will have to check.

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
