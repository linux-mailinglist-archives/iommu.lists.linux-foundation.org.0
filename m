Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E4420F311
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 12:49:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B0E286C47;
	Tue, 30 Jun 2020 10:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6s4h_aWrJIHg; Tue, 30 Jun 2020 10:49:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0A12986BB5;
	Tue, 30 Jun 2020 10:49:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E27FEC08A6;
	Tue, 30 Jun 2020 10:49:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FFB0C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4C2E586786
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OWF9pbYr2TW9 for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 10:49:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7622C8675F
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:49:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14FF330E;
 Tue, 30 Jun 2020 03:49:21 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7B33F68F;
 Tue, 30 Jun 2020 03:49:19 -0700 (PDT)
Subject: Re: [PATCH] iommu: SUN50I_IOMMU should depend on HAS_DMA
To: Joerg Roedel <joro@8bytes.org>
References: <20200629121146.24011-1-geert@linux-m68k.org>
 <c2047394-ea6e-3bc3-4bf0-a732237dbeca@arm.com>
 <20200630100947.GL28824@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e66478ff-1df0-8f3a-b164-76a430eca58b@arm.com>
Date: Tue, 30 Jun 2020 11:49:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630100947.GL28824@8bytes.org>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org
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

On 2020-06-30 11:09, Joerg Roedel wrote:
> On Mon, Jun 29, 2020 at 05:29:36PM +0100, Robin Murphy wrote:
>> On 2020-06-29 13:11, Geert Uytterhoeven wrote:
>>> If NO_DMA=y (e.g. Sun-3 all{mod,yes}-config):
>>>
>>>       drivers/iommu/dma-iommu.o: In function `iommu_dma_mmap':
>>>       dma-iommu.c:(.text+0x92e): undefined reference to `dma_pgprot'
>>>
>>> IOMMU_DMA must not be selected, unless HAS_DMA=y.
>>
>> Wait, no, IOMMU_DMA should not be selected by drivers at all - it's for arch
>> code to choose.
> 
> Okay, but that is a different fix, right? I queued this patch for v5.8
> for now.

If the driver didn't select IOMMU_DMA (completely unnecessarily, I might 
add), there wouldn't be any problem to fix in the first place ;)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
