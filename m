Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C173A390C
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 02:54:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 598924017D;
	Fri, 11 Jun 2021 00:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSASprICc4b5; Fri, 11 Jun 2021 00:54:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5C3094013A;
	Fri, 11 Jun 2021 00:54:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A4C9C0022;
	Fri, 11 Jun 2021 00:54:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CE26C000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 00:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 3143260AAA
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 00:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id dQu_Zoj0gh6X for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 00:54:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id 7307760AA7
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 00:54:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623372872; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dcfJebiUK44kAjvGVha7ugPfEUhpoyAPBqW17zs14Co=;
 b=Wr1vEiqqVwpScbOYUQeoHspCHLGGbfyX/vvjJgBDj8HrdZaceu6bC5eae8JpIIBZ029MynYb
 8HP/QLdFMH3rOc/e3AzqKgZEAm2tcoeYamRXiZgyGCMhcfczyhwPdJPp6zCwc3fgVItKrqgU
 /8Oa+Eq32uERM5XNubenBKH/x3g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c2b42fabfd22a3dca34391 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 11 Jun 2021 00:54:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B3734C43460; Fri, 11 Jun 2021 00:54:06 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D9D1C4338A;
 Fri, 11 Jun 2021 00:54:06 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 11 Jun 2021 06:24:06 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <BY5PR12MB37646698F37C00381EFF7C77B3349@BY5PR12MB3764.namprd12.prod.outlook.com>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
 <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
 <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
 <dfdabcdec99a4c6e3bf2b3c5eebe067f@codeaurora.org>
 <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
 <BY5PR12MB37646698F37C00381EFF7C77B3349@BY5PR12MB3764.namprd12.prod.outlook.com>
Message-ID: <07001b4ed6c0a491eacce6e4dc13ab5e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Thierry Reding <treding@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
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

Hi Krishna,

On 2021-06-11 06:07, Krishna Reddy wrote:
>> > No, the unmap latency is not just in some test case written, the issue
>> > is very real and we have workloads where camera is reporting frame
>> > drops because of this unmap latency in the order of 100s of milliseconds.
>> > And hardware team recommends using ASID based invalidations for
>> > anything larger than 128 TLB entries. So yes, we have taken note of
>> > impacts here before going this way and hence feel more inclined to
>> > make this qcom specific if required.
> 
> Seems like the real issue here is not the unmap API latency.
> It should be the high number of back to back SMMU TLB invalidate
> register writes that is resulting
> in lower ISO BW to Camera and overflow. Isn't it?
> Even Tegra186 SoC has similar issue and HW team recommended to rate
> limit the number of
> back to back SMMU tlb invalidate registers writes. The subsequent
> Tegra194 SoC has a dedicated SMMU for
> ISO clients to avoid the impact of TLB invalidates from NISO clients on 
> ISO BW.
> 

Not exactly, this issue is not specific to camera. If you look at
the numbers in the commit text, even for the test device its the
same observation. It depends on the buffer size we are unmapping
which affects the number of TLBIs issue. I am not aware of any
such HW side bw issues for camera specifically on QCOM devices.

Thanks,
Sai

>>> Thinking some more, I
>>> wonder if the Tegra folks might have an opinion to add here, given
>>> that their multiple-SMMU solution was seemingly about trying to get
>>> enough TLB and pagetable walk bandwidth in the first place?
> 
> While it is good to reduce the number of tlb register writes, Flushing
> all TLB entries at context granularity arbitrarily
> can have negative impact on active traffic and BW. I don't have much
> data on possible impact at this point.
> Can the flushing at context granularity be made a quirk than
> performing it as default?
> 
> -KR

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
