Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30856135B7B
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 15:36:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C298F88035;
	Thu,  9 Jan 2020 14:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKyYN9Uhgi3K; Thu,  9 Jan 2020 14:36:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54A5D88018;
	Thu,  9 Jan 2020 14:36:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CDCAC18DC;
	Thu,  9 Jan 2020 14:36:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EAD0C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 54CAC88012
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKQ7RIN6ROkZ for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 14:36:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46AEF88007
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:36:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9F9BD68BFE; Thu,  9 Jan 2020 15:36:13 +0100 (CET)
Date: Thu, 9 Jan 2020 15:36:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [RFC 4/5] PCI: vmd: Stop overriding dma_map_ops
Message-ID: <20200109143613.GC22656@lst.de>
References: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
 <1577823863-3303-5-git-send-email-jonathan.derrick@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1577823863-3303-5-git-send-email-jonathan.derrick@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

On Tue, Dec 31, 2019 at 01:24:22PM -0700, Jon Derrick wrote:
> Devices on the VMD domain use the VMD endpoint's requester-id and have
> been relying on the VMD endpoint's dma operations. The downside of this
> was that VMD domain devices would use the VMD endpoint's attributes when
> doing DMA and IOMMU mapping. We can be smarter about this by only using
> the VMD endpoint when mapping and providing the correct child device's
> attributes during dma operations.
> 
> This patch adds a new dma alias mechanism by adding a hint to a pci_dev
> to point to a singular DMA requester's pci_dev. This integrates into the
> existing dma alias infrastructure to reduce the impact of the changes
> required to support this mode.

If we want to lift this check into common code I think it should go
into struct device, as that is what DMA operates on normally.  That
being said given that this insane hack only exists for braindamage in
Intel hardware I'd rather keep it as isolated as possible.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
