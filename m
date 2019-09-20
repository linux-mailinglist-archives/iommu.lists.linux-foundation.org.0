Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B514B8C0B
	for <lists.iommu@lfdr.de>; Fri, 20 Sep 2019 09:54:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6C3F940B;
	Fri, 20 Sep 2019 07:54:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 36B6A40B
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 07:54:11 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D65F686E
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 07:54:10 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id AC3996155C; Fri, 20 Sep 2019 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1568966050;
	bh=J9ixUqe5hZvgjP3d9E63RycwkbxkMnQGaECw4yn9tE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iNg4yCYi6nJvVA7VKDGqgcKKIDXxTT+DAjnQ29dJ7SLbcCZFy1/MJv215C6R0U282
	Cpb714yrWX3K6J5vBTTkQ/W5GOY3FGy8tDHaxPP/xp80BMpXVuSBmyUNTS+ZO6qCrh
	ESCvMEcV8MCRirvsZ2wH2Mb4dtHB2R5X297BMdc4=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id 8B7E5602E1;
	Fri, 20 Sep 2019 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1568966049;
	bh=J9ixUqe5hZvgjP3d9E63RycwkbxkMnQGaECw4yn9tE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PZH5MrZCqbyeRs8OOxV425gJhjvxUQcZ3azcX7C8eV93q9fb6y8xYdtulKffI9moP
	m0zXJLnolr2rGQV0B3mIN0+FWGJ6VKNCJ1txtvuoH9d9e3LPwBmTawVm+udTcyEPdw
	H4Ku1Qn3VfL+Vq/2+H8BYLW3c+NgepdxerLO5JFU=
MIME-Version: 1.0
Date: Fri, 20 Sep 2019 13:24:09 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv6 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
In-Reply-To: <5d83de74.1c69fb81.71c0f.f162@mx.google.com>
References: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org>
	<1513424ecec891d19c1aa3c599ec67db7964b6b2.1568712606.git.saiprakash.ranjan@codeaurora.org>
	<20190919002501.GA20859@builder>
	<a45e8fb6fe1a8cc914fedbfac65af009@codeaurora.org>
	<081fff2f5dacfa7b6f5df6364f088045@codeaurora.org>
	<5d83de74.1c69fb81.71c0f.f162@mx.google.com>
Message-ID: <8268c9b4002f6b9b1c87fcc16920f57f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
	iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-arm-msm-owner@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 2019-09-20 01:30, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2019-09-19 11:54:27)
>> On 2019-09-19 08:48, Sai Prakash Ranjan wrote:
>> > On 2019-09-19 05:55, Bjorn Andersson wrote:
>> >> In the transition to this new design we lost the ability to
>> >> enable/disable the safe toggle per board, which according to Vivek
>> >> would result in some issue with Cheza.
>> >>
>> >> Can you confirm that this is okay? (Or introduce the DT property for
>> >> enabling the safe_toggle logic?)
>> >>
>> >
>> > Hmm, I don't remember Vivek telling about any issue on Cheza because
>> > of this logic.
>> > But I will test this on Cheza and let you know.
>> >
>> 
>> I tested this on Cheza and no perf degradation nor any other issue is
>> seen
>> atleast openly, although I see this below stack dump always with
>> cant_sleep change added.
> 
> The usage of cant_sleep() here is wrong then, and the comment should be
> removed from the scm API as well because it looks like it's perfectly 
> OK
> to call the function from a context that can sleep.
> 

Looking more into this downstream, it says this *can be called in atomic 
context*
and not *should be called only in atomic context*. So will remove 
cant_sleep and
modify the comment accordingly.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
