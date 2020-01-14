Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC8B13A339
	for <lists.iommu@lfdr.de>; Tue, 14 Jan 2020 09:49:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43929844A1;
	Tue, 14 Jan 2020 08:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8f-b5RNIqrc8; Tue, 14 Jan 2020 08:49:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A058843ED;
	Tue, 14 Jan 2020 08:49:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26142C077D;
	Tue, 14 Jan 2020 08:49:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34DE7C077D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 08:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 22ED2841E9
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 08:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rT_ko2rUpEVG for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 08:49:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CDCAC84508
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 08:49:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F22E068B20; Tue, 14 Jan 2020 09:49:16 +0100 (CET)
Date: Tue, 14 Jan 2020 09:49:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [PATCH v3 1/5] x86/pci: Add a to_pci_sysdata helper
Message-ID: <20200114084916.GA32024@lst.de>
References: <1578676873-6206-1-git-send-email-jonathan.derrick@intel.com>
 <1578676873-6206-2-git-send-email-jonathan.derrick@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578676873-6206-2-git-send-email-jonathan.derrick@intel.com>
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

On Fri, Jan 10, 2020 at 10:21:09AM -0700, Jon Derrick wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> Various helpers need the pci_sysdata just to dereference a single field
> in it.  Add a little helper that returns the properly typed sysdata
> pointer to require a little less boilerplate code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> [jonathan.derrick: added un-const cast]

> +	return to_pci_sysdata((struct pci_bus *) bus)->node;

Instead of this case I think we'd be better off marking the bus
argument to to_pci_sysdata const.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
