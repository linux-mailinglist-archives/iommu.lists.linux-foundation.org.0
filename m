Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC5C1398B6
	for <lists.iommu@lfdr.de>; Mon, 13 Jan 2020 19:17:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A9CCA20471;
	Mon, 13 Jan 2020 18:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppyvbI5fsnds; Mon, 13 Jan 2020 18:17:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B675C2046D;
	Mon, 13 Jan 2020 18:17:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2D54C077D;
	Mon, 13 Jan 2020 18:17:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61FBEC077D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 18:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5E02F85C20
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 18:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BYAEZOSgenW for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 18:17:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1A07185BC0
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 18:17:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82B4113D5;
 Mon, 13 Jan 2020 10:17:49 -0800 (PST)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DB653F534;
 Mon, 13 Jan 2020 10:17:48 -0800 (PST)
Date: Mon, 13 Jan 2020 18:17:42 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 0/5] Clean up VMD DMA Map Ops
Message-ID: <20200113181742.GA27623@e121166-lin.cambridge.arm.com>
References: <7b55519959391b7102c54341c6f6f23b2d24dabb.camel@intel.com>
 <20200113180113.GA76810@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113180113.GA76810@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "hch@lst.de" <hch@lst.de>,
 "Derrick, Jonathan" <jonathan.derrick@intel.com>
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

On Mon, Jan 13, 2020 at 12:01:13PM -0600, Bjorn Helgaas wrote:
> On Mon, Jan 13, 2020 at 05:13:38PM +0000, Derrick, Jonathan wrote:
> > On Mon, 2020-01-13 at 12:08 +0000, Lorenzo Pieralisi wrote:
> > > On Fri, Jan 10, 2020 at 10:21:08AM -0700, Jon Derrick wrote:
> > > > v2 Set: https://lore.kernel.org/linux-iommu/1578580256-3483-1-git-send-email-jonathan.derrick@intel.com/T/#t
> > > > v1 Set: https://lore.kernel.org/linux-iommu/20200107134125.GD30750@8bytes.org/T/#t
> > > > 
> > > > VMD currently works with VT-d enabled by pointing DMA and IOMMU actions at the
> > > > VMD endpoint. The problem with this approach is that the VMD endpoint's
> > > > device-specific attributes, such as the DMA Mask Bits, are used instead.
> > > > 
> > > > This set cleans up VMD by removing the override that redirects DMA map
> > > > operations to the VMD endpoint. Instead it introduces a new DMA alias mechanism
> > > > into the existing DMA alias infrastructure.
> > > > 
> > > > v1 added a pointer in struct pci_dev that pointed to the DMA alias' struct
> > > > pci_dev and did the necessary DMA alias and IOMMU modifications.
> > > > 
> > > > v2 introduced a new weak function to reference the 'Direct DMA Alias', and
> > > > removed the need to add a pointer in struct device or pci_dev. Weak functions
> > > > are generally frowned upon when it's a single architecture implementation, so I
> > > > am open to alternatives.
> > > > 
> > > > v3 references the pci_dev rather than the struct device for the PCI
> > > > 'Direct DMA Alias' (pci_direct_dma_alias()). This revision also allows
> > > > pci_for_each_dma_alias() to call any DMA aliases for the Direct DMA alias
> > > > device, though I don't expect the VMD endpoint to need intra-bus DMA aliases.
> > > > 
> > > > Changes from v2:
> > > > Uses struct pci_dev for PCI Device 'Direct DMA aliasing' (pci_direct_dma_alias)
> > > > Allows pci_for_each_dma_alias to iterate over the alias mask of the 'Direct DMA alias'
> > > > 
> > > > Changes from v1:
> > > > Removed 1/5 & 2/5 misc fix patches that were merged
> > > > Uses Christoph's staging/cleanup patches
> > > > Introduce weak function rather than including pointer in struct device or pci_dev.
> > > > 
> > > > Based on Joerg's next:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/
> > > > 
> > > > Jon Derrick (5):
> > > >   x86/pci: Add a to_pci_sysdata helper
> > > >   x86/PCI: Expose VMD's PCI Device in pci_sysdata
> > > >   PCI: Introduce pci_direct_dma_alias()
> > > >   PCI: vmd: Stop overriding dma_map_ops
> > > >   x86/pci: Remove X86_DEV_DMA_OPS
> > > > 
> > > >  arch/x86/Kconfig               |   3 -
> > > >  arch/x86/include/asm/device.h  |  10 ---
> > > >  arch/x86/include/asm/pci.h     |  31 ++++-----
> > > >  arch/x86/pci/common.c          |  45 ++----------
> > > >  drivers/iommu/intel-iommu.c    |  18 +++--
> > > >  drivers/pci/controller/Kconfig |   1 -
> > > >  drivers/pci/controller/vmd.c   | 152 +----------------------------------------
> > > >  drivers/pci/pci.c              |  19 +++++-
> > > >  drivers/pci/search.c           |   7 ++
> > > >  include/linux/pci.h            |   1 +
> > > >  10 files changed, 61 insertions(+), 226 deletions(-)
> > > 
> > > Jon, Christoph,
> > > 
> > > AFAICS this series supersedes/overrides:
> > > 
> > > https://patchwork.kernel.org/patch/11114831/
> > > 
> > > Please let me know if that's correct, actually I was waiting to
> > > see consensus on the patch above but if this series supersedes
> > > it I would drop it from the PCI review queue.
> > > 
> > > Thanks,
> > > Lorenzo
> > 
> > It does supercede it (with Christoph's blessing). By the way, I have
> > been basing on Joerg's repo  due to the v1/RFC IOMMU modifcations. As
> > there's more pci work at this point, should I base it on Bjorn's repo
> > instead?
> 
> In general if I'm going to apply something, I prefer it based on my
> "master" branch unless there's a reason to the contrary.  I think
> Lorenzo works pretty much the same way.
> 
> Lorenzo will probably handle this series, but I applied it
> experimentally to check out the brace thing, and it applied fine to my
> "master" branch.  So I think everything's fine as-is.

I think it is mostly x86+core PCI code, VMD code is mostly deletions
so I think you can take it, let me know, I can ACK the VMD changes
straight away.

Thanks,
Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
