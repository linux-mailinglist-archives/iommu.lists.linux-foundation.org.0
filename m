Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 17835559CA7
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 16:49:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C984175E;
	Fri, 24 Jun 2022 14:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79C984175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fn5-J8h7skMe; Fri, 24 Jun 2022 14:49:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 43BF9425E6;
	Fri, 24 Jun 2022 14:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43BF9425E6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10EB6C0081;
	Fri, 24 Jun 2022 14:49:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD8B5C002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 14:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9968E84746
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 14:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9968E84746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5J28zc5jtKf for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 14:49:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4828460B
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB4828460B
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 14:49:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5317F1042;
 Fri, 24 Jun 2022 07:49:52 -0700 (PDT)
Received: from [10.57.84.111] (unknown [10.57.84.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35F0D3F534;
 Fri, 24 Jun 2022 07:49:51 -0700 (PDT)
Message-ID: <809b0d12-c5ce-2364-268f-f0c4564414c9@arm.com>
Date: Fri, 24 Jun 2022 15:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] iommu/dma: Add config for PCI SAC address trick
Content-Language: en-GB
To: Joerg Roedel <joro@8bytes.org>
References: <3f06994f9f370f9d35b2630ab75171ecd2065621.1654782107.git.robin.murphy@arm.com>
 <YrMSJ6AGwn3PxSIH@8bytes.org> <b9439692-c72b-b856-c7c0-e60a863f3e74@arm.com>
 <YrRPfhXvdPo0Y6Cx@8bytes.org> <653fba02-7eef-5f0d-66dd-7599af84db86@arm.com>
 <YrW76PPKadbZuN/3@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YrW76PPKadbZuN/3@8bytes.org>
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, hch@lst.de
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

On 2022-06-24 14:28, Joerg Roedel wrote:
> On Thu, Jun 23, 2022 at 12:41:00PM +0100, Robin Murphy wrote:
>> On 2022-06-23 12:33, Joerg Roedel wrote:
>>> On Wed, Jun 22, 2022 at 02:12:39PM +0100, Robin Murphy wrote:
>>>> Thanks for your bravery!
>>>
>>> It already starts, with that patch I am getting:
>>>
>>> 	xhci_hcd 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000f address=0xff00ffffffefe000 flags=0x0000]
>>>
>>> In my kernel log. The device is an AMD XHCI controller and seems to
>>> funciton normally after boot. The message disappears with
>>> iommu.forcedac=0.
>>>
>>> Need to look more into that...
>>
>> Given how amd_iommu_domain_alloc() sets the domain aperture, presumably the
>> DMA address allocated was 0xffffffffffefe000? Odd that it gets bits punched
>> out in the middle rather than simply truncated off the top as I would have
>> expected :/
> 
> So even more weird, as a workaround I changed the AMD IOMMU driver to
> allocate a 4-level page-table and limit the DMA aperture to 48 bits. I
> still get the same message.

Hmm, in that case my best guess would be that somewhere between the 
device itself and the IOMMU input it's trying to sign-extend the address 
from bit 47 or lower, but for whatever reason bits 55:48 get lost.

Comparing the PCI xHCI I have to hand, mine (with nothing plugged in) 
only has 6 pages mapped for its command ring and other stuff. Thus 
unless it's sharing that domain with other devices, to be accessing 
something down in the second MB of IOVA space suggests that this 
probably isn't the very first access it's made, and therefore it would 
almost certainly have to be the endpoint emitting a corrupted address, 
but only for certain operations.

FWIW I'd be inclined to turn on DMA debug and call 
debug_dma_dump_mappings() from the IOMMU fault handler, and/or add a bit 
of tracing to all the DMA mapping/allocation sites in the xHCI driver, 
to see what the offending address most likely represents.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
