Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BD54D5578DF
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 13:41:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB739424BC;
	Thu, 23 Jun 2022 11:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB739424BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqcK8vQ4dgNt; Thu, 23 Jun 2022 11:41:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BC47F424B8;
	Thu, 23 Jun 2022 11:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC47F424B8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B6D9C007E;
	Thu, 23 Jun 2022 11:41:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9589C002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 11:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9299A405D6
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 11:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9299A405D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GK8SMluJ4Zak for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 11:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE5304019C
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE5304019C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 11:41:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24B8112FC;
 Thu, 23 Jun 2022 04:41:09 -0700 (PDT)
Received: from [10.57.85.4] (unknown [10.57.85.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 092363F534;
 Thu, 23 Jun 2022 04:41:07 -0700 (PDT)
Message-ID: <653fba02-7eef-5f0d-66dd-7599af84db86@arm.com>
Date: Thu, 23 Jun 2022 12:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] iommu/dma: Add config for PCI SAC address trick
Content-Language: en-GB
To: Joerg Roedel <joro@8bytes.org>
References: <3f06994f9f370f9d35b2630ab75171ecd2065621.1654782107.git.robin.murphy@arm.com>
 <YrMSJ6AGwn3PxSIH@8bytes.org> <b9439692-c72b-b856-c7c0-e60a863f3e74@arm.com>
 <YrRPfhXvdPo0Y6Cx@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YrRPfhXvdPo0Y6Cx@8bytes.org>
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

On 2022-06-23 12:33, Joerg Roedel wrote:
> On Wed, Jun 22, 2022 at 02:12:39PM +0100, Robin Murphy wrote:
>> Thanks for your bravery!
> 
> It already starts, with that patch I am getting:
> 
> 	xhci_hcd 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000f address=0xff00ffffffefe000 flags=0x0000]
> 
> In my kernel log. The device is an AMD XHCI controller and seems to
> funciton normally after boot. The message disappears with
> iommu.forcedac=0.
> 
> Need to look more into that...

Given how amd_iommu_domain_alloc() sets the domain aperture, presumably 
the DMA address allocated was 0xffffffffffefe000? Odd that it gets bits 
punched out in the middle rather than simply truncated off the top as I 
would have expected :/

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
