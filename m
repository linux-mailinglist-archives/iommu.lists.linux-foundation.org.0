Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8B2A8457
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 18:00:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD9AA23115;
	Thu,  5 Nov 2020 17:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hl7IXCJ1K9WF; Thu,  5 Nov 2020 17:00:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9D46723042;
	Thu,  5 Nov 2020 17:00:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80D4EC0889;
	Thu,  5 Nov 2020 17:00:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CADFC0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EF37185193
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eu3rSWLmAKiB for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 17:00:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 32882851CB
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:00:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0E0A568B02; Thu,  5 Nov 2020 18:00:05 +0100 (CET)
Date: Thu, 5 Nov 2020 18:00:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/6] RMDA/sw: don't allow drivers using dma_virt_ops on
 highmem configs
Message-ID: <20201105170004.GA7502@lst.de>
References: <20201105074205.1690638-1-hch@lst.de>
 <20201105074205.1690638-2-hch@lst.de>
 <40d0a990-0fca-6f12-16ff-3612a9847ab3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40d0a990-0fca-6f12-16ff-3612a9847ab3@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <bhelgaas@google.com>, Bernard Metzler <bmt@zurich.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Nov 05, 2020 at 12:15:46PM +0000, Robin Murphy wrote:
> On 2020-11-05 07:42, Christoph Hellwig wrote:
>> dma_virt_ops requires that all pages have a kernel virtual address.
>> Introduce a INFINIBAND_VIRT_DMA Kconfig symbol that depends on !HIGHMEM
>> and a large enough dma_addr_t, and make all three driver depend on the
>> new symbol.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>   drivers/infiniband/Kconfig           | 6 ++++++
>>   drivers/infiniband/sw/rdmavt/Kconfig | 3 ++-
>>   drivers/infiniband/sw/rxe/Kconfig    | 2 +-
>>   drivers/infiniband/sw/siw/Kconfig    | 1 +
>>   4 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
>> index 32a51432ec4f73..81acaf5fb5be67 100644
>> --- a/drivers/infiniband/Kconfig
>> +++ b/drivers/infiniband/Kconfig
>> @@ -73,6 +73,12 @@ config INFINIBAND_ADDR_TRANS_CONFIGFS
>>   	  This allows the user to config the default GID type that the CM
>>   	  uses for each device, when initiaing new connections.
>>   +config INFINIBAND_VIRT_DMA
>> +	bool
>> +	default y
>> +	depends on !HIGHMEM
>> +	depends on !64BIT || ARCH_DMA_ADDR_T_64BIT
>
> Isn't that effectively always true now since 4965a68780c5? I had a quick 
> try of manually overriding CONFIG_ARCH_DMA_ADDR_T_64BIT in my .config, and 
> the build just forces it back to "=y".

True.  The guy who did the commit should have really told me about it :)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
