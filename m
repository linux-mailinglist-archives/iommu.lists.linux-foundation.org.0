Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E084C3CB731
	for <lists.iommu@lfdr.de>; Fri, 16 Jul 2021 14:11:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36AC860755;
	Fri, 16 Jul 2021 12:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMcu7FWYVUz4; Fri, 16 Jul 2021 12:11:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5132160683;
	Fri, 16 Jul 2021 12:11:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AAE2C000E;
	Fri, 16 Jul 2021 12:11:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88A73C000E
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 12:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 749E242476
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 12:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fv4ogAupv9_1 for <iommu@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 12:11:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8CBE4246C
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 12:11:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03A52D6E;
 Fri, 16 Jul 2021 05:11:43 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7A2A3F774;
 Fri, 16 Jul 2021 05:11:39 -0700 (PDT)
Subject: Re: [PATCH v1 14/16] x86/amd_gart: return error code from
 gart_map_sg()
To: Christoph Hellwig <hch@lst.de>, Logan Gunthorpe <logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715164544.6827-15-logang@deltatee.com> <20210716063241.GC13345@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <98c09e65-35d0-dde5-75fc-e3d99864d078@arm.com>
Date: Fri, 16 Jul 2021 13:11:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716063241.GC13345@lst.de>
Content-Language: en-GB
Cc: linux-s390@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Bates <sbates@raithlin.com>,
 linuxppc-dev@lists.ozlabs.org, Martin Oliveira <martin.oliveira@eideticom.com>,
 linux-arm-kernel@lists.infradead.org
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

On 2021-07-16 07:32, Christoph Hellwig wrote:
> On Thu, Jul 15, 2021 at 10:45:42AM -0600, Logan Gunthorpe wrote:
>> @@ -458,7 +460,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>>   	iommu_full(dev, pages << PAGE_SHIFT, dir);
>>   	for_each_sg(sg, s, nents, i)
>>   		s->dma_address = DMA_MAPPING_ERROR;
>> -	return 0;
>> +	return ret;
> 
> While we're at it - setting the ->dma_address to DMA_MAPPING_ERROR is
> not part of the ->map_sg calling convention.  Might be worth to fix
> up while we're at it.

Especially since it's not even zeroing dma_length, which at least is a 
documented indicator of validity (even if it's not strictly defined for 
failure cases either).

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
