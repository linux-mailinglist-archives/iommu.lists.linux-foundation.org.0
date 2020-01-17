Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB5141425
	for <lists.iommu@lfdr.de>; Fri, 17 Jan 2020 23:32:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DAA0886957;
	Fri, 17 Jan 2020 22:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYh55zG6jdvo; Fri, 17 Jan 2020 22:32:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A7414868C4;
	Fri, 17 Jan 2020 22:32:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98B9AC077D;
	Fri, 17 Jan 2020 22:32:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFD4AC077D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 22:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A3E7884D9F
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 22:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQdxJSrT-7or for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 22:32:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 948BC84F4F
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 22:32:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 14:30:29 -0800
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; d="scan'208";a="219052205"
Received: from nsgsw-rhel7p6.lm.intel.com ([10.232.116.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 14:30:28 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v4 2/7] x86/PCI: Expose VMD's PCI Device in pci_sysdata
Date: Fri, 17 Jan 2020 09:27:24 -0700
Message-Id: <1579278449-174098-3-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579278449-174098-1-git-send-email-jonathan.derrick@intel.com>
References: <1579278449-174098-1-git-send-email-jonathan.derrick@intel.com>
Cc: iommu@lists.linux-foundation.org, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Jon Derrick <jonathan.derrick@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

To be used by Intel-IOMMU code to find the correct domain.

CC: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 arch/x86/include/asm/pci.h   | 4 ++--
 drivers/pci/controller/vmd.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
index a4e09db60..6512c54 100644
--- a/arch/x86/include/asm/pci.h
+++ b/arch/x86/include/asm/pci.h
@@ -25,7 +25,7 @@ struct pci_sysdata {
 	void		*fwnode;	/* IRQ domain for MSI assignment */
 #endif
 #if IS_ENABLED(CONFIG_VMD)
-	bool vmd_domain;		/* True if in Intel VMD domain */
+	struct pci_dev	*vmd_dev;	/* VMD Device if in Intel VMD domain */
 #endif
 };
 
@@ -64,7 +64,7 @@ static inline void *_pci_root_bus_fwnode(struct pci_bus *bus)
 #if IS_ENABLED(CONFIG_VMD)
 static inline bool is_vmd(struct pci_bus *bus)
 {
-	return to_pci_sysdata(bus)->vmd_domain;
+	return to_pci_sysdata(bus)->vmd_dev != NULL;
 }
 #else
 #define is_vmd(bus)		false
diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index 2128422..d67ad56 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -679,7 +679,7 @@ static int vmd_enable_domain(struct vmd_dev *vmd, unsigned long features)
 		.parent = res,
 	};
 
-	sd->vmd_domain = true;
+	sd->vmd_dev = vmd->dev;
 	sd->domain = vmd_find_free_domain();
 	if (sd->domain < 0)
 		return sd->domain;
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
