Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA9294C65
	for <lists.iommu@lfdr.de>; Mon, 19 Aug 2019 20:10:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5B8BBDDC;
	Mon, 19 Aug 2019 18:10:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2AD35DC8
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 18:10:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C681D8AB
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 18:10:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41286360;
	Mon, 19 Aug 2019 11:10:48 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3FEC3F246;
	Mon, 19 Aug 2019 11:10:46 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] Arm SMMU refactoring
To: Will Deacon <will@kernel.org>
References: <cover.1565892337.git.robin.murphy@arm.com>
	<20190819155634.xflkhxexzks3y7oa@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d8a47e62-0768-7ae2-f2fc-53b5b2b24685@arm.com>
Date: Mon, 19 Aug 2019 19:10:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190819155634.xflkhxexzks3y7oa@willie-the-truck>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
	gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
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

On 19/08/2019 16:56, Will Deacon wrote:
> On Thu, Aug 15, 2019 at 07:37:20PM +0100, Robin Murphy wrote:
>> v1 for context: https://patchwork.kernel.org/cover/11087347/
>>
>> Here's a quick v2 attempting to address all the minor comments; I've
>> tweaked a whole bunch of names, added some verbosity in macros and
>> comments for clarity, and rejigged arm_smmu_impl_init() for a bit more
>> structure. The (new) patches #1 and #2 are up front as conceptual fixes,
>> although they're not actually critical - it turns out to be more of an
>> embarrassment than a real problem in practice.
> 
> Thanks, I'll pick this up and send to Joerg later this week.

Oops, I've just noticed that the io-64-nonatomic-hi-lo.h include also 
needs to move to arm-smmu.h in #14 to avoid breaking 32-bit builds. I've 
pushed out an updated branch (along with the static fixes for good 
measure) - let me know if you'd like a resend of the patches.

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
