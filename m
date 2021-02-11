Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0D9318F23
	for <lists.iommu@lfdr.de>; Thu, 11 Feb 2021 16:50:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0B8BD875BF;
	Thu, 11 Feb 2021 15:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHf3zlKbz9Rt; Thu, 11 Feb 2021 15:50:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F19E5875C1;
	Thu, 11 Feb 2021 15:50:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3F53C013A;
	Thu, 11 Feb 2021 15:50:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA493C013A
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 15:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B8EA686ED1
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 15:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gIZe4SBPWPm for <iommu@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 15:50:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8834785F18
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 15:50:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 125381F45C38
Subject: Re: [PATCH RESEND v2 4/5] iommu/tegra-smmu: Rework
 tegra_smmu_probe_device()
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
 <20210205052422.GA11329@Asurada-Nvidia>
 <20210205094556.GA32677@Asurada-Nvidia>
 <f45c94b4-2949-4eac-5944-85d43a8afef5@collabora.com>
 <20210210082052.GA11455@Asurada-Nvidia>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <df170d15-f5b5-4238-f998-5b8f8e45849a@collabora.com>
Date: Thu, 11 Feb 2021 15:50:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210082052.GA11455@Asurada-Nvidia>
Content-Language: en-US
Cc: "kernelci-results@groups.io" <kernelci-results@groups.io>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, will@kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 10/02/2021 08:20, Nicolin Chen wrote:
> Hi Guillaume,
> 
> On Sat, Feb 06, 2021 at 01:40:13PM +0000, Guillaume Tucker wrote:
>>> It'd be nicer if I can get both logs of the vanilla kernel (failing)
>>> and the commit-reverted version (passing), each applying this patch.
>>
>> Sure, I've run 3 jobs:
>>
>> * v5.11-rc6 as a reference, to see the original issue:
>>   https://lava.collabora.co.uk/scheduler/job/3187848
>>
>> * + your debug patch:
>>   https://lava.collabora.co.uk/scheduler/job/3187849
>>
>> * + the "breaking" commit reverted, passing the tests:
>>   https://lava.collabora.co.uk/scheduler/job/3187851
> 
> Thanks for the help!
> 
> I am able to figure out what's probably wrong, yet not so sure
> about the best solution at this point.
> 
> Would it be possible for you to run one more time with another
> debugging patch? I'd like to see the same logs as previous:
> 1. Vanilla kernel + debug patch
> 2. Vanilla kernel + Reverted + debug patch

As it turns out, next-20210210 is passing all the tests again so
it looks like this got fixed in the meantime:

  https://lava.collabora.co.uk/scheduler/job/3210192
  https://lava.collabora.co.uk/results/3210192/0_igt-kms-tegra

And here's a more extensive list of IGT tests on next-20210211,
all the regressions have been fixed:

  https://kernelci.org/test/plan/id/60254c42f51df36be53abe62/


I haven't run a reversed bisection to find the fix, but I guess
it wouldn't be too hard to find out what happened by hand anyway.
I see the drm/tegra/for-5.12-rc1 tag has been merged into
linux-next, maybe that solved the issue?

FYI I've also run some jobs with your debug patch and with the
breaking patch reverted:

  https://lava.collabora.co.uk/scheduler/job/3210245
  https://lava.collabora.co.uk/scheduler/job/3210596

Meanwhile I'll see what can be done to improve the automated
bisection so if there are new IGT regressions they would get
reported earlier.  I guess it would have saved us all some time
if it had been bisected in December.

Thanks,
Guillaume
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
