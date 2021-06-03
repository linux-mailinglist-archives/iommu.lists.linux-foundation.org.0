Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EE42E39A16E
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 14:49:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 560A982D61;
	Thu,  3 Jun 2021 12:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIpR1Eijuhmi; Thu,  3 Jun 2021 12:49:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0444E82BBD;
	Thu,  3 Jun 2021 12:49:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9A85C0001;
	Thu,  3 Jun 2021 12:49:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30118C0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FAFB400ED
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqcSmHw87QZx for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 12:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EAA3400CA
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:49:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D04D1063;
 Thu,  3 Jun 2021 05:49:27 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ED163F774;
 Thu,  3 Jun 2021 05:49:25 -0700 (PDT)
Subject: Re: Different type iommus integrated in a SoC
To: Peter Geis <pgwipeout@gmail.com>
References: <2021052710373173260118@rock-chips.com>
 <5d7127d5-b73c-2002-1734-98aab2295c8e@arm.com>
 <CAMdYzYpiykTtK3CtAN9F4g+f6JasTSsUh54wvAZ_st3C=_LygQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <144e1c48-96f2-3596-3354-4c023bf6ccc0@arm.com>
Date: Thu, 3 Jun 2021 13:49:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYpiykTtK3CtAN9F4g+f6JasTSsUh54wvAZ_st3C=_LygQ@mail.gmail.com>
Content-Language: en-GB
Cc: linux-rockchip <linux-rockchip@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>, will <will@kernel.org>,
 hch <hch@lst.de>
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

On 2021-06-03 13:24, Peter Geis wrote:
> On Thu, Jun 3, 2021 at 8:07 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2021-05-27 03:37, xxm@rock-chips.com wrote:
>>> Hi all,
>>>
>>> I have a SoC integrate with two different types of iommus, one is ARM SMMU, serves the PCIe/SATA/USB,
>>> the others are vendor specific iommus, serves display device and multimedia device.
>>>
>>> In the current linux kernel, the iommu framework seems only support one type iommu at runtime, if enable both types iommu, only one type can work.
>>> Is there any way to support this kind of SoC?
>>
>> Hooray! I've been forecasting this for years, but the cases we regularly
>> hit with internal FPGA prototyping (nor the secret unused MMU-400 I
>> found on RK3288) have never really been a strong enough argument to
>> stand behind.
>>
>> Based on what I remember from looking into this a few years ago,
>> converting *most* of the API to per-device ops (now via dev->iommu) is
>> trivial; the main challenge will be getting the per-device data
>> bootstrapped in iommu_probe_device(), which would probably need to rely
>> on the fwspec and/or list of registered IOMMU instances.
>>
>> The other notable thing which will need to change is the domain
>> allocation interface, but in practice I think everyone who calls
>> iommu_domain_alloc() today is in fact doing so for a specific device, so
>> I don't think it's as big a problem as it might first appear.
>>
>> Robin.
>>
> 
> Good Morning Robin,
> 
> I think the Tegra group would also be interested in this work.
> AFAIK they have the smmu and the tegra gart and have been trying to
> figure out the runtime handover from the bootloader to the kernel
> without smashing everything and starting over.

No, handoff of live DMA from the bootlader is an entirely unrelated 
issue, and there are already several patchsets in flight to address 
various parts of that. My understanding of Tegras is that they *either* 
use tegra-gart, tegra-smmu, or arm-smmu depending on the SoC generation, 
but they aren't mixed within any single SoC.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
