Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A436D56B
	for <lists.iommu@lfdr.de>; Wed, 28 Apr 2021 12:06:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 049E040ECA;
	Wed, 28 Apr 2021 10:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feaBk9_a-mG2; Wed, 28 Apr 2021 10:06:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA8E040EC3;
	Wed, 28 Apr 2021 10:06:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0FB8C0025;
	Wed, 28 Apr 2021 10:06:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EB86C0001
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 10:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69C5F40EC3
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 10:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4hz4iKum9il for <iommu@lists.linux-foundation.org>;
 Wed, 28 Apr 2021 10:06:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2DF40EC2
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 10:06:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 557241FB;
 Wed, 28 Apr 2021 03:06:18 -0700 (PDT)
Received: from [10.57.61.101] (unknown [10.57.61.101])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A06CD3F70D;
 Wed, 28 Apr 2021 03:06:16 -0700 (PDT)
Subject: Re: DMA mapping fill dma_address to 0
To: Corentin Labbe <clabbe.montjoie@gmail.com>, hch@lst.de,
 m.szyprowski@samsung.com, iommu@lists.linux-foundation.org
References: <YIkf4yqt14dGPoyr@Red>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6ce3614e-af79-2a36-de83-6cbb4d9fe9a4@arm.com>
Date: Wed, 28 Apr 2021 11:06:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIkf4yqt14dGPoyr@Red>
Content-Language: en-GB
Cc: linux-kernel@vger.kernel.org
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

On 2021-04-28 09:42, Corentin Labbe wrote:
> Hello
> 
> I work on the crypto offloader driver of cortina/gemini SL3516 SoC.
> I test it by filling a LUKS2 partition.
> I got a reproductible problem when handling skcipher requests.
> I use dma_map_sg() and when iterating other the result, sg_dma_address(sg) return 0.
> But sg_dma_len(sg) is still correct (4096 in my case).
> 
> Below is a simplified view of my code:
> nr_sgs = dma_map_sg(ce->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
> (nr_sgs = 1 in my case)
> sg = areq->src;
> if (!sg_dma_address(sg))
> 	FAIL

What is this check supposed to be for in the first place? 0 is a valid 
DMA address, because it's also a valid physical address, and I recall 
RAM at PA 0 on Hikey 960 flushing out some bugs in the past when we 
tried to use 0 for DMA_MAPPING_ERROR. All the Gemini DTs appear to show 
RAM starting at PA 0 too, so I'd have to guess that it's simply the case 
that your DMA buffer happened to end up using that particular page.

Robin.

> I have digged to find what do dma_map_sg() and I have added some debug.
> sg_page(sg) return c7efb000 for example so sg_page() works.
> But it seems the problem is that page_to_phys(sg_page(sg)) return 0.
> 
> This problem does not appear immediatly, luksOpen and subsequent fsck always work.
> But it appears fast after, when mouting or rsync files in it.
> 
> I have added CONFIG_DEBUG_SG, CONFIG_DMA_API_DEBUG, CONFIG_DMA_API_DEBUG_SG but they didnt bringed any more hints.
> Only "DMA-API: cacheline tracking ENOMEM, dma-debug disabled" appears but always with some "time" between my problem and its display.
> So I am not sure it is related.
> 
> Regards
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
