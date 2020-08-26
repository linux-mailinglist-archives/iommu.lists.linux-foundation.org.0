Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A922252D3D
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 14:01:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D992F86D2D;
	Wed, 26 Aug 2020 12:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-L5rJ2JK44H; Wed, 26 Aug 2020 12:01:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63AF287C11;
	Wed, 26 Aug 2020 12:01:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A0E7C07FF;
	Wed, 26 Aug 2020 12:01:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E040C0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 582F6861F1
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTdXgz-yPByi for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 12:01:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 077FB86511
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:01 +0000 (UTC)
Message-Id: <20200826112330.928952181@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=GJq1CEkWcaKs7Em2GYlhCtoVPP5Bukhfi2C/MO87oqU=;
 b=dUiCUdbmQOpMkybm8iOwgllxN+rbWKXHIOv8xVx9P0CYcEvTrFfH+U510MWl4oVPJ0gtga
 ahqCxi9ahMWxjIEsaydAa/rKy2pLoS0XfR5K4IDb4uihwE2PQKBjV4F9A8pFZYgGN7PuxQ
 EOB1SaNvp8dPe4VJ46qh1GtqJBzaIwyAez52Agf9f+0VgyaCndFq+l56XNDg+v6HO0uzx9
 KwoWueh6GMvJjAnouk8aSNrY7sJJRDuvX4Ynt2UCn35woH/JnJXgQKrYdLfLlaCEBkFk9c
 Y7WVHB/k+RUE/B1QV9Xa55mz4IiFTHSC1D8o3oA/1GFewMJzkzQ+YqY5c8skRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=GJq1CEkWcaKs7Em2GYlhCtoVPP5Bukhfi2C/MO87oqU=;
 b=HQTmvGI7KkXeaCWVTYGHuxhaaAjsX1BJNwh3dDUbNFgWHKVDFEbHlgJXRMU0uVeDi8WgHM
 cnjckdDSNiedpnBg==
Date: Wed, 26 Aug 2020 13:16:31 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 03/46] PCI: vmd: Dont abuse vector irqomain as parent
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

VMD has it's own PCI/MSI interrupt domain which is not in any way depending
on the x86 vector domain. PCI devices behind VMD share the VMD MSIX vector
entries via a VMD specific message translation to the actual VMD MSIX
vector. The VMD device interrupt handler for the VMD MSIX vectors invokes
all interrupt handlers of the devices which share a vector.

Making the x86 vector domain the actual parent of the VMD irq domain is
pointless and actually counterproductive. When a device interrupt is
requested then it will activate the interrupt which traverses down the
hierarchy and consumes an interrupt vector in the vector domain which is
never used.

The domain is self contained and has no parent dependencies, so just hand
in NULL for the parent and be done with it.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Derrick <jonathan.derrick@intel.com>
Cc: linux-pci@vger.kernel.org
---
V2: New patch.
---
 drivers/pci/controller/vmd.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -573,7 +573,8 @@ static int vmd_enable_domain(struct vmd_
 		return -ENODEV;
 
 	vmd->irq_domain = pci_msi_create_irq_domain(fn, &vmd_msi_domain_info,
-						    x86_vector_domain);
+						    NULL);
+
 	if (!vmd->irq_domain) {
 		irq_domain_free_fwnode(fn);
 		return -ENODEV;

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
