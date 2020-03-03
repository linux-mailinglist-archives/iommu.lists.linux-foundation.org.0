Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 948771776BB
	for <lists.iommu@lfdr.de>; Tue,  3 Mar 2020 14:13:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1539420491;
	Tue,  3 Mar 2020 13:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDZ6kAquYMg4; Tue,  3 Mar 2020 13:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3F4692044B;
	Tue,  3 Mar 2020 13:13:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 211ADC07FF;
	Tue,  3 Mar 2020 13:13:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D35AFC013E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BCACE84C33
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FamyTtBtYohL for <iommu@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 13:13:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D2F9E84C2C
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 13:13:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8CAFD385; Tue,  3 Mar 2020 14:13:30 +0100 (CET)
Date: Tue, 3 Mar 2020 14:13:27 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH V2 3/5] iommu: Add support to change default domain of an
 iommu_group
Message-ID: <20200303131326.GB13185@8bytes.org>
References: <cover.1581619464.git.sai.praneeth.prakhya@intel.com>
 <5aa5ef20ff81f706aafa9a6af68cef98fe60ad0f.1581619464.git.sai.praneeth.prakhya@intel.com>
 <20200302150833.GA6540@8bytes.org>
 <7fcadd2a-76cd-2114-bb5f-c916fd14e1cb@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fcadd2a-76cd-2114-bb5f-c916fd14e1cb@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
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

Hi Baolu,

On Tue, Mar 03, 2020 at 02:47:02PM +0800, Lu Baolu wrote:
> Theoretically speaking, per-device default domain is impractical. PCI
> aliased devices (PCI bridge and all devices beneath it, VMD devices and
> various devices quirked with pci_add_dma_alias()) must use the same
> domain. It's likely that we have to introduce something like a sub-group
> with all PCI aliased devices staying in it. Current private-domain
> implementation in the vt-d driver was introduced for compatible purpose
> and I wanted to abandon it from the first day. :-)

What hinders you from removing it now? I looked a bit closer into
these private default domain implementation and it is very fragile. If
it can be removed, then better do so sooner than later.

> Probably, we are able to configure per-group default domain type with
> below two interfaces.
> 
> - (ops->)dev_def_domain_type: Return the required default domain type
>   for a device. It returns
>   - IOMMU_DOMAIN_DMA (device must use a DMA domain), unlikely
>   - IOMMU_DOMAIN_IDENTITY (device must use an Identity domain), unlikely
>   - 0 (both are okay), likely

If we stay at the group level, this interface should work on the group
level too, and not on the device level.

> - iommu_group_change_def_domain: Change the default domain of a group
>   Works only when all devices have no driver bond.

Btw, I have no objections about the concept of private default domains
for devices, but the implementation should be moved to generic IOMMU
code so that the behavior is consistent accross differnet IOMMU
platforms, and of course be robust.


Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
