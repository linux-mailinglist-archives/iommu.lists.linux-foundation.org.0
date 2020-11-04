Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF42A615A
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 11:15:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E303869A5;
	Wed,  4 Nov 2020 10:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ikb-gmaNZVID; Wed,  4 Nov 2020 10:15:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F7BB869A4;
	Wed,  4 Nov 2020 10:15:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B8ABC0051;
	Wed,  4 Nov 2020 10:15:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3534C0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 91816868A6
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DMGf1YuOPES for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 10:15:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE95586896
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:15:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F301A13D5;
 Wed,  4 Nov 2020 02:15:51 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BDDB3F66E;
 Wed,  4 Nov 2020 02:15:50 -0800 (PST)
Subject: Re: use of dma_direct_set_offset in (allwinner) drivers
To: Maxime Ripard <maxime@cerno.tech>, Christoph Hellwig <hch@lst.de>
References: <20201103095538.GA19136@lst.de>
 <20201104081411.bnt5kixgunaczbzj@gilmour.lan>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9623c346-c86c-e3ce-332b-95492576a859@arm.com>
Date: Wed, 4 Nov 2020 10:15:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104081411.bnt5kixgunaczbzj@gilmour.lan>
Content-Language: en-GB
Cc: devel@driverdev.osuosl.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On 2020-11-04 08:14, Maxime Ripard wrote:
> Hi Christoph,
> 
> On Tue, Nov 03, 2020 at 10:55:38AM +0100, Christoph Hellwig wrote:
>> Linux 5.10-rc1 switched from having a single dma offset in struct device
>> to a set of DMA ranges, and introduced a new helper to set them,
>> dma_direct_set_offset.
>>
>> This in fact surfaced that a bunch of drivers that violate our layering
>> and set the offset from drivers, which meant we had to reluctantly
>> export the symbol to set up the DMA range.
>>
>> The drivers are:
>>
>> drivers/gpu/drm/sun4i/sun4i_backend.c
>>
>>    This just use dma_direct_set_offset as a fallback.  Is there any good
>>    reason to not just kill off the fallback?
>>
>> drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
>>
>>    Same as above.
> 
> So, the history of this is:
> 
>    - We initially introduced the support for those two controllers
>      assuming that there was a direct mapping between the physical and
>      DMA addresses. It turns out it didn't and the DMA accesses were
>      going through a secondary, dedicated, bus that didn't have the same
>      mapping of the RAM than the CPU.
> 
>      4690803b09c6 ("drm/sun4i: backend: Offset layer buffer address by DRAM starting address")
> 
>    - This dedicated bus is undocumented and barely used in the vendor
>      kernel so this was overlooked, and it's fairly hard to get infos on
>      it for all the SoCs we support. We added the DT support for it
>      though on some SoCs we had enough infos to do so:
> 
>      c43a4469402f ("dt-bindings: interconnect: Add a dma interconnect name")
>      22f88e311399 ("ARM: dts: sun5i: Add the MBUS controller")
> 
>      This explains the check on the interconnect property
> 
>    - However, due to the stable DT rule, we still need to operate without
>      regressions on older DTs that wouldn't have that property (and for
>      SoCs we haven't figured out). Hence the fallback.

How about having something in the platform code that keys off the 
top-level SoC compatible and uses a bus notifier to create offsets for 
the relevant devices if an MBUS description is missing? At least that 
way the workaround could be confined to a single dedicated place and 
look somewhat similar to other special cases like sta2x11, rather than 
being duplicated all over the place.

Robin.

>> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
>>
>>    This driver unconditionally sets the offset.  Why can't we do this
>>    in the device tree?
>>
>> drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>>
>>    Same as above.
>>
> 
> We should make those two match the previous ones, but we'll have the
> same issue here eventually. Most likely they were never ran on an SoC
> for which we have the MBUS figured out.
> 
> Maxime
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
