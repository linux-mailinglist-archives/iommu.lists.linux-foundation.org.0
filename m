Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 128BC450801
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 16:15:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFAE540239;
	Mon, 15 Nov 2021 15:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2GqhvybSzIS; Mon, 15 Nov 2021 15:14:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C23C34022E;
	Mon, 15 Nov 2021 15:14:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F537C0036;
	Mon, 15 Nov 2021 15:14:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23A5FC0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 15:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D4040178
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 15:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbhXB6-PX1ty for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 15:14:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9330F40106
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 15:14:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD01E6D;
 Mon, 15 Nov 2021 07:14:53 -0800 (PST)
Received: from [10.57.82.45] (unknown [10.57.82.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E86B3F766;
 Mon, 15 Nov 2021 07:14:51 -0800 (PST)
Message-ID: <495c65e4-bd97-5f29-d39b-43671acfec78@arm.com>
Date: Mon, 15 Nov 2021 15:14:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/11] PCI: pci_stub: Suppress kernel DMA ownership
 auto-claiming
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@infradead.org>
References: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
 <20211115020552.2378167-4-baolu.lu@linux.intel.com>
 <YZJe1jquP+osF+Wn@infradead.org> <20211115133107.GB2379906@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211115133107.GB2379906@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jacob jun Pan <jacob.jun.pan@intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Will Deacon <will@kernel.org>, Diana Craciun <diana.craciun@oss.nxp.com>
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

On 2021-11-15 13:31, Jason Gunthorpe via iommu wrote:
> On Mon, Nov 15, 2021 at 05:21:26AM -0800, Christoph Hellwig wrote:
>> On Mon, Nov 15, 2021 at 10:05:44AM +0800, Lu Baolu wrote:
>>> pci_stub allows the admin to block driver binding on a device and make
>>> it permanently shared with userspace. Since pci_stub does not do DMA,
>>> it is safe.
>>
>> If an IOMMU is setup and dma-iommu or friends are not used nothing is
>> unsafe anyway, it just is that IOMMU won't work..
>>
>>> However the admin must understand that using pci_stub allows
>>> userspace to attack whatever device it was bound to.
>>
>> I don't understand this sentence at all.
> 
> If userspace has control of device A and can cause A to issue DMA to
> arbitary DMA addresses then there are certain PCI topologies where A
> can now issue peer to peer DMA and manipulate the MMMIO registers in
> device B.
> 
> A kernel driver on device B is thus subjected to concurrent
> manipulation of the device registers from userspace.
> 
> So, a 'safe' kernel driver is one that can tolerate this, and an
> 'unsafe' driver is one where userspace can break kernel integrity.

You mean in the case where the kernel driver is trying to use device B 
in a purely PIO mode, such that userspace might potentially be able to 
interfere with data being transferred in and out of the kernel? Perhaps 
it's not so clear to put that under a notion of "DMA ownership", since 
device B's DMA is irrelevant and it's really much more equivalent to 
/dev/mem access or mmaping BARs to userspace while a driver is bound.

> The second issue is DMA - because there is only one iommu_domain
> underlying many devices if we give that iommu_domain to userspace it
> means the kernel DMA API on other devices no longer works.

Actually, the DMA API itself via iommu-dma will "work" just fine in the 
sense that it will still successfully perform all its operations in the 
unattached default domain, it's just that if the driver then programs 
the device to access the returned DMA address, the device is likely to 
get a nasty surprise.

> So no kernel driver doing DMA can work at all, under any PCI topology,
> if userspace owns the IO page table.

This isn't really about userspace at all - it's true of any case where a 
kernel driver wants to attach a grouped device to its own unmanaged 
domain. The fact that the VFIO kernel driver uses its unmanaged domains 
to map user pages upon user requests is merely a VFIO detail, and VFIO 
happens to be the only common case where unmanaged domains and 
non-singleton groups intersect. I'd say that, logically, if you want to 
put policy on mutual driver/usage compatibility anywhere it should be in 
iommu_attach_group().

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
