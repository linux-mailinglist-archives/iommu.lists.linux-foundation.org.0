Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E517CEA7
	for <lists.iommu@lfdr.de>; Sat,  7 Mar 2020 15:21:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B911D2002C;
	Sat,  7 Mar 2020 14:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tao29WNSjATh; Sat,  7 Mar 2020 14:21:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2E13320107;
	Sat,  7 Mar 2020 14:21:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1440CC1D89;
	Sat,  7 Mar 2020 14:21:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73F2BC013E
 for <iommu@lists.linux-foundation.org>; Sat,  7 Mar 2020 14:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5FE2486EA7
 for <iommu@lists.linux-foundation.org>; Sat,  7 Mar 2020 14:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SEsF6LAnWfY for <iommu@lists.linux-foundation.org>;
 Sat,  7 Mar 2020 14:21:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AEBF986E55
 for <iommu@lists.linux-foundation.org>; Sat,  7 Mar 2020 14:21:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DB26E68BE1; Sat,  7 Mar 2020 15:21:44 +0100 (CET)
Date: Sat, 7 Mar 2020 15:21:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 3/6] iommu/vt-d: Don't force 32bit devices to uses DMA
 domain
Message-ID: <20200307142144.GB26190@lst.de>
References: <20200307062014.3288-1-baolu.lu@linux.intel.com>
 <20200307062014.3288-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307062014.3288-4-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Derrick Jonathan <jonathan.derrick@intel.com>
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

On Sat, Mar 07, 2020 at 02:20:11PM +0800, Lu Baolu wrote:
> Currently, if a 32bit device initially uses an identity domain,
> Intel IOMMU driver will convert it forcibly to a DMA one if its
> address capability is not enough for the whole system memory.
> The motivation was to overcome the overhead caused by possible
> bounced buffer.
> 
> Unfortunately, this improvement has led to many problems. For
> example, some 32bit devices are required to use an identity
> domain, forcing them to use DMA domain will cause the device
> not to work anymore. On the other hand, the VMD sub-devices
> share a domain but each sub-device might have different address
> capability. Forcing a VMD sub-device to use DMA domain blindly
> will impact the operation of other sub-devices without any
> notification. Further more, PCI aliased devices (PCI bridge
> and all devices beneath it, VMD devices and various devices
> quirked with pci_add_dma_alias()) must use the same domain.
> Forcing one device to switch to DMA domain during runtime
> will cause in-fligh DMAs for other devices to abort or target
> to other memory which might cause undefind system behavior.

I still don't like the idea to enforce either a strict dynamic
IOMMU mapping or an identify mapping mode.

Can we add a new AUTO domain which will allow using the identity
mapping when available?  That somewhat matches the existing x86
default, and also what powerpc does.  I have a series to lift
that bypass mode into the core dma-mapping code that I need
to repost, which I think would be suitable for intel-iommu as well.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
