Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 83838186BDE
	for <lists.iommu@lfdr.de>; Mon, 16 Mar 2020 14:16:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 075BA881F0;
	Mon, 16 Mar 2020 13:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WxtPX_nXmOF; Mon, 16 Mar 2020 13:16:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30554881F5;
	Mon, 16 Mar 2020 13:16:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17CE1C1D88;
	Mon, 16 Mar 2020 13:16:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FC14C013E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 13:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 589FF881F0
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 13:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38ArMq-9myQF for <iommu@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 13:16:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 68D47881E6
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 13:16:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF55B30E;
 Mon, 16 Mar 2020 06:16:26 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2C6C3F52E;
 Mon, 16 Mar 2020 06:16:25 -0700 (PDT)
Subject: Re: [RFC][PATCH] dma-mapping: align default segment_boundary_mask
 with dma_mask
To: Christoph Hellwig <hch@lst.de>
References: <20200314000007.13778-1-nicoleotsuka@gmail.com>
 <f36ac67e-0eca-46df-78ec-c8b1c4fbe951@arm.com>
 <20200316124652.GA17386@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <09b61b1d-800a-ff18-71f6-57a5f569ea3c@arm.com>
Date: Mon, 16 Mar 2020 13:16:16 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316124652.GA17386@lst.de>
Content-Language: en-GB
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On 2020-03-16 12:46 pm, Christoph Hellwig wrote:
> On Mon, Mar 16, 2020 at 12:12:08PM +0000, Robin Murphy wrote:
>> On 2020-03-14 12:00 am, Nicolin Chen wrote:
>>> More and more drivers set dma_masks above DMA_BIT_MAKS(32) while
>>> only a handful of drivers call dma_set_seg_boundary(). This means
>>> that most drivers have a 4GB segmention boundary because DMA API
>>> returns DMA_BIT_MAKS(32) as a default value, though they might be
>>> able to handle things above 32-bit.
>>
>> Don't assume the boundary mask and the DMA mask are related. There do exist
>> devices which can DMA to a 64-bit address space in general, but due to
>> descriptor formats/hardware design/whatever still require any single
>> transfer not to cross some smaller boundary. XHCI is 64-bit yet requires
>> most things not to cross a 64KB boundary. EHCI's 64-bit mode is an example
>> of the 4GB boundary (not the best example, admittedly, but it undeniably
>> exists).
> 
> Yes, which is what the boundary is for.  But why would we default to
> something restrictive by default even if the driver didn't ask for it?

I've always assumed it was for the same reason as the 64KB segment 
length, i.e. it was sufficiently common as an actual restriction, but 
still "good enough" for everyone else. I remember digging up all the 
history to understand what these were about back when I implemented the 
map_sg stuff, and from that I'd imagine the actual values are somewhat 
biased towards SCSI HBAs, since they originated in the block and SCSI 
layers.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
