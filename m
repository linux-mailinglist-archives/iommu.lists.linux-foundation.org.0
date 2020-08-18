Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A271247ED6
	for <lists.iommu@lfdr.de>; Tue, 18 Aug 2020 08:59:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 340618754B;
	Tue, 18 Aug 2020 06:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ohpr-JuNTtpU; Tue, 18 Aug 2020 06:59:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4B4218738B;
	Tue, 18 Aug 2020 06:59:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3811CC0051;
	Tue, 18 Aug 2020 06:59:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FB2CC0051
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 06:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1826184D41
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 06:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaByuoK-1XvK for <iommu@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 06:59:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B762F84D0A
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 06:59:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1DC1A68AFE; Tue, 18 Aug 2020 08:59:12 +0200 (CEST)
Date: Tue, 18 Aug 2020 08:59:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries/svm: Allocate SWIOTLB buffer
 anywhere in memory
Message-ID: <20200818065911.GA2324@lst.de>
References: <20200817214658.103093-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817214658.103093-1-bauerman@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
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

On Mon, Aug 17, 2020 at 06:46:58PM -0300, Thiago Jung Bauermann wrote:
> POWER secure guests (i.e., guests which use the Protection Execution
> Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
> they don't need the SWIOTLB memory to be in low addresses since the
> hypervisor doesn't have any addressing limitation.
> 
> This solves a SWIOTLB initialization problem we are seeing in secure guests
> with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
> memory, which leaves no space for SWIOTLB in low addresses.
> 
> To do this, we use mostly the same code as swiotlb_init(), but allocate the
> buffer using memblock_alloc() instead of memblock_alloc_low().
> 
> We also need to add swiotlb_set_no_iotlb_memory() in order to set the
> no_iotlb_memory flag if initialization fails.

Do you really need the helper?  As far as I can tell the secure guests
very much rely on swiotlb for all I/O, so you might as well panic if
you fail to allocate it.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
