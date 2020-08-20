Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23D24C825
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 01:01:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 140D786C9E;
	Thu, 20 Aug 2020 23:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AIyszy3-iYh; Thu, 20 Aug 2020 23:01:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E5D2886C92;
	Thu, 20 Aug 2020 23:01:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC5F4C0889;
	Thu, 20 Aug 2020 23:01:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD753C0051
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 23:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A98DC884BF
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 23:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id twkwaHCbUaB6 for <iommu@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 23:01:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id B6DF0884BE
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 23:01:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6C6331B;
 Thu, 20 Aug 2020 16:01:44 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98AAB3F71F;
 Thu, 20 Aug 2020 16:01:39 -0700 (PDT)
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
To: Sakari Ailus <sakari.ailus@iki.fi>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
 <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5190a40e-ad24-d98e-3588-b95592ea2db3@arm.com>
Date: Fri, 21 Aug 2020 00:01:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
Content-Language: en-GB
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, will@kernel.org,
 hch@lst.de, linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 inki.dae@samsung.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sw0312.kim@samsung.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, t-kristo@ti.com, kyungmin.park@samsung.com
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

On 2020-08-20 20:55, Sakari Ailus wrote:
> On Thu, Aug 20, 2020 at 06:25:19PM +0100, Robin Murphy wrote:
>> On 2020-08-20 17:53, Sakari Ailus wrote:
>>> Hi Robin,
>>>
>>> On Thu, Aug 20, 2020 at 04:08:36PM +0100, Robin Murphy wrote:
>>>> Now that arch/arm is wired up for default domains and iommu-dma, devices
>>>> behind IOMMUs will get mappings set up automatically as appropriate, so
>>>> there is no need for drivers to do so manually.
>>>>
>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>
>>> Thanks for the patch.
>>
>> Many thanks for testing so quickly!
>>
>>> I haven't looked at the details but it seems that this causes the buffer
>>> memory allocation to be physically contiguous, which causes a failure to
>>> allocate video buffers of entirely normal size. I guess that was not
>>> intentional?
>>
>> Hmm, it looks like the device ends up with the wrong DMA ops, which implies
>> something didn't go as expected with the earlier IOMMU setup and default
>> domain creation. Chances are that either I missed some subtlety in the
>> omap_iommu change, or I've fundamentally misjudged how the ISP probing works
>> and it never actually goes down the of_iommu_configure() path in the first
>> place. Do you get any messages from the IOMMU layer earlier on during boot?
> 
> I do get these:
> 
> [    2.934936] iommu: Default domain type: Translated
> [    2.940917] omap-iommu 480bd400.mmu: 480bd400.mmu registered
> [    2.946899] platform 480bc000.isp: Adding to iommu group 0
> 

So that much looks OK, if there are no obvious errors. Unfortunately 
there's no easy way to tell exactly what of_iommu_configure() is doing 
(beyond enabling a couple of vague debug messages). The first thing I'll 
do tomorrow is double-check whether it's really working on my boards 
here, or whether I was just getting lucky with CMA... (I assume you 
don't have CMA enabled if you're ending up in remap_allocator_alloc())

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
