Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C346AC70
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 23:39:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DA660D9D;
	Mon,  6 Dec 2021 22:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CL_RBR4xTg1t; Mon,  6 Dec 2021 22:39:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 775CA60E02;
	Mon,  6 Dec 2021 22:39:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E5FCC0012;
	Mon,  6 Dec 2021 22:39:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03C3CC0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE53A404CF
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="j5c3qESX";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="JSs01xY7"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KT0lWgfSjK41 for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 22:39:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 267A94052D
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:39:20 +0000 (UTC)
Message-ID: <20211206210438.364897376@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638830357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=lfwGVAEBcyklXLRbPUy5y5GselbZO14/n/aq+dgdtbc=;
 b=j5c3qESX9iBdKToldLXBE4mBiWWAKKPkYIDGM4CivqyqRgWtM2cKGyevuhXVf4+HIOVj8Q
 uFcTY3R24ZImom1z6RqeCXCb6yWXrMHG+qyZ+eZqau2JrqWTtlLIKZuaLDpk5+6fWXaVkN
 zlJdKJEEHNFGXgVT+uAychPQsmGEDwINyyH7moxf9SQkQwQT0+n/dnCqgd5Jk3uI4XxsNa
 lVL4PW2MBwfna8zZ7jo8QaeSVwu128+xqM7vH7CSpqxqPyWgl6PBq3bDqOLBbr+/I7iyDD
 DT11PndTjBvCPLPvVluOl7MWdNjWcKhSTv3uGUyJqmuE4tWaIf6I9k52Vih+PQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638830357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=lfwGVAEBcyklXLRbPUy5y5GselbZO14/n/aq+dgdtbc=;
 b=JSs01xY7YCRCdnomelvSKAC22yikmnenmgcpV5rsCfrz12HIIi3qNeX/mh2zqXJLNltFEQ
 nnWFosI79rPNqfBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 13/36] genirq/msi: Consolidate MSI descriptor data
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:39:17 +0100 (CET)
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
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

All non PCI/MSI usage variants have data structures in struct msi_desc with
only one member: xxx_index. PCI/MSI has a entry_nr member.

Add a common msi_index member to struct msi_desc so all implementations can
share it which allows further consolidation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/msi.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -142,6 +142,7 @@ struct ti_sci_inta_msi_desc {
  *			address or data changes
  * @write_msi_msg_data:	Data parameter for the callback.
  *
+ * @msi_index:	Index of the msi descriptor
  * @pci:	[PCI]	    PCI speficic msi descriptor data
  * @platform:	[platform]  Platform device specific msi descriptor data
  * @fsl_mc:	[fsl-mc]    FSL MC device specific msi descriptor data
@@ -162,6 +163,7 @@ struct msi_desc {
 	void (*write_msi_msg)(struct msi_desc *entry, void *data);
 	void *write_msi_msg_data;
 
+	u16				msi_index;
 	union {
 		struct pci_msi_desc		pci;
 		struct platform_msi_desc	platform;

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
