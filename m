Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5EB311D7E
	for <lists.iommu@lfdr.de>; Sat,  6 Feb 2021 14:40:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 23A622042E;
	Sat,  6 Feb 2021 13:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAWPUuXzFIuB; Sat,  6 Feb 2021 13:40:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 557F220442;
	Sat,  6 Feb 2021 13:40:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBA86C1834;
	Sat,  6 Feb 2021 13:40:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D137C013A
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 13:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6300F85E08
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 13:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jF6AnA3-Ge8x for <iommu@lists.linux-foundation.org>;
 Sat,  6 Feb 2021 13:40:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 006F285D4C
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 13:40:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id BC0CA1F41177
Subject: Re: [PATCH RESEND v2 4/5] iommu/tegra-smmu: Rework
 tegra_smmu_probe_device()
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
 <20210205052422.GA11329@Asurada-Nvidia>
 <20210205094556.GA32677@Asurada-Nvidia>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <f45c94b4-2949-4eac-5944-85d43a8afef5@collabora.com>
Date: Sat, 6 Feb 2021 13:40:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205094556.GA32677@Asurada-Nvidia>
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

On 05/02/2021 09:45, Nicolin Chen wrote:
> Hi Guillaume,
> 
> On Thu, Feb 04, 2021 at 09:24:23PM -0800, Nicolin Chen wrote:
>>> Please let us know if you need any help debugging this issue or
>>> to try a fix on this platform.
>>
>> Yes, I don't have any Tegra124 platform to run. It'd be very nice
>> if you can run some debugging patch (I can provide you) and a fix
>> after I root cause the issue.
> 
> Would it be possible for you to run with the given debugging patch?
> 
> It'd be nicer if I can get both logs of the vanilla kernel (failing)
> and the commit-reverted version (passing), each applying this patch.

Sure, I've run 3 jobs:

* v5.11-rc6 as a reference, to see the original issue:
  https://lava.collabora.co.uk/scheduler/job/3187848

* + your debug patch:
  https://lava.collabora.co.uk/scheduler/job/3187849

* + the "breaking" commit reverted, passing the tests:
  https://lava.collabora.co.uk/scheduler/job/3187851


You can see the history of the test branch I'm using here, with
the 3 revisions mentioned above:

  https://gitlab.collabora.com/gtucker/linux/-/commits/linux-5.11-rc6-nyan-big-drm-read/


Hope that helps,
Guillaume
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
