Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B7306430
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 20:36:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F169C8733C;
	Wed, 27 Jan 2021 19:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-ixXhhyXbMP; Wed, 27 Jan 2021 19:36:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C0A287326;
	Wed, 27 Jan 2021 19:36:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 180F7C08A1;
	Wed, 27 Jan 2021 19:36:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 766A2C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 19:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5148422D22
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 19:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEdgZkmmXaHy for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 19:36:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 96A28228EB
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 19:36:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95AF5106F;
 Wed, 27 Jan 2021 11:36:34 -0800 (PST)
Received: from [10.57.47.135] (unknown [10.57.47.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C789B3F68F;
 Wed, 27 Jan 2021 11:36:31 -0800 (PST)
Subject: Re: [PATCH v2] of/device: Update dma_range_map only when dev has
 valid dma-ranges
To: Rob Herring <robh+dt@kernel.org>
References: <20210119105203.15530-1-yong.wu@mediatek.com>
 <YBFj9whLvqlV2erm@aptenodytes> <159d4486-bb7e-249d-2bad-f5bba839041d@arm.com>
 <CAL_JsqKgGOAe-ZSw9qJ7POVv5nJuX+UoJE-MS3drKrM119pw-w@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8f742f94-4087-7fb6-4b7c-9058593b67cf@arm.com>
Date: Wed, 27 Jan 2021 19:36:30 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKgGOAe-ZSw9qJ7POVv5nJuX+UoJE-MS3drKrM119pw-w@mail.gmail.com>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tomasz Figa <tfiga@google.com>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On 2021-01-27 19:09, Rob Herring wrote:
> On Wed, Jan 27, 2021 at 7:13 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> [ + Christoph, Marek ]
>>
>> On 2021-01-27 13:00, Paul Kocialkowski wrote:
>>> Hi,
>>>
>>> On Tue 19 Jan 21, 18:52, Yong Wu wrote:
>>>> The commit e0d072782c73 ("dma-mapping: introduce DMA range map,
>>>> supplanting dma_pfn_offset") always update dma_range_map even though it was
>>>> already set, like in the sunxi_mbus driver. the issue is reported at [1].
>>>> This patch avoid this(Updating it only when dev has valid dma-ranges).
>>>>
>>>> Meanwhile, dma_range_map contains the devices' dma_ranges information,
>>>> This patch moves dma_range_map before of_iommu_configure. The iommu
>>>> driver may need to know the dma_address requirements of its iommu
>>>> consumer devices.
>>>
>>> Just a gentle ping on this issue, it would be nice to have this fix merged
>>> ASAP, in the next RC :)
>>
>> Ack to that - Rob, Frank, do you want to take this through the OF tree,
>> or shall we take it through the DMA-mapping tree like the original culprit?
> 
> I've already got some fixes queued up and can take it.

Brilliant, thanks!

> Suggested-by doesn't mean you are happy with the implementation. So
> Acked-by or Reviewed-by?

It still feels slightly awkward to give a tag to say "yes, this is 
exactly what I suggested", but for the avoidance of doubt,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
