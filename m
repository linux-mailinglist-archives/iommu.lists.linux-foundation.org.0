Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 871DE2273BD
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 02:22:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 40696221B1;
	Tue, 21 Jul 2020 00:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u51O3K9Qk+2A; Tue, 21 Jul 2020 00:22:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4BA5720512;
	Tue, 21 Jul 2020 00:22:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27602C016F;
	Tue, 21 Jul 2020 00:22:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10103C016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 00:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0589B85FAE
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 00:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nAAqgaL87iO for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 00:22:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F1BEE85F6A
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 00:22:13 +0000 (UTC)
IronPort-SDR: MeYoVBAQeUiBKVahYA730u+9GNklhbP5V0hI+omNKdttb1uaSBeIGy4sSkZzBTTYS8uUvckuZ2
 6fX3tX6Fgj7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="129602723"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="129602723"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 17:22:13 -0700
IronPort-SDR: YGNVZvEBQgpxioGzgLfEJ1vMMoK3rFYQVgVrEurwjX/NBTcMcM2yxNpd1v8UQp1hlu5tqECHgp
 38rTGIhJAlvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="392189693"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2020 17:22:11 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/vt-d: Skip TE disabling on quirky gfx dedicated
 iommu
Date: Tue, 21 Jul 2020 08:17:13 +0800
Message-Id: <20200721001713.24282-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Koba Ko <koba.ko@canonical.com>,
 iommu@lists.linux-foundation.org
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

The VT-d spec requires (10.4.4 Global Command Register, TE field) that:

Hardware implementations supporting DMA draining must drain any in-flight
DMA read/write requests queued within the Root-Complex before completing
the translation enable command and reflecting the status of the command
through the TES field in the Global Status register.

Unfortunately, some integrated graphic devices fail to do so after some
kind of power state transition. As the result, the system might stuck in
iommu_disable_translation(), waiting for the completion of TE transition.

This provides a quirk list for those devices and skips TE disabling if
the qurik hits.

Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=208363
Tested-by: Koba Ko <koba.ko@canonical.com>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/dmar.c  |  1 +
 drivers/iommu/intel/iommu.c | 27 +++++++++++++++++++++++++++
 include/linux/dmar.h        |  1 +
 include/linux/intel-iommu.h |  2 ++
 4 files changed, 31 insertions(+)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 683b812c5c47..16f47041f1bf 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1102,6 +1102,7 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
 	}
 
 	drhd->iommu = iommu;
+	iommu->drhd = drhd;
 
 	return 0;
 
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 98390a6d8113..11418b14cc3f 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -356,6 +356,7 @@ static int intel_iommu_strict;
 static int intel_iommu_superpage = 1;
 static int iommu_identity_mapping;
 static int intel_no_bounce;
+static int iommu_skip_te_disable;
 
 #define IDENTMAP_GFX		2
 #define IDENTMAP_AZALIA		4
@@ -1633,6 +1634,10 @@ static void iommu_disable_translation(struct intel_iommu *iommu)
 	u32 sts;
 	unsigned long flag;
 
+	if (iommu_skip_te_disable && iommu->drhd->gfx_dedicated &&
+	    (cap_read_drain(iommu->cap) || cap_write_drain(iommu->cap)))
+		return;
+
 	raw_spin_lock_irqsave(&iommu->register_lock, flag);
 	iommu->gcmd &= ~DMA_GCMD_TE;
 	writel(iommu->gcmd, iommu->reg + DMAR_GCMD_REG);
@@ -4043,6 +4048,7 @@ static void __init init_no_remapping_devices(void)
 
 		/* This IOMMU has *only* gfx devices. Either bypass it or
 		   set the gfx_mapped flag, as appropriate */
+		drhd->gfx_dedicated = 1;
 		if (!dmar_map_gfx) {
 			drhd->ignored = 1;
 			for_each_active_dev_scope(drhd->devices,
@@ -6160,6 +6166,27 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x0044, quirk_calpella_no_shadow_g
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x0062, quirk_calpella_no_shadow_gtt);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x006a, quirk_calpella_no_shadow_gtt);
 
+static void quirk_igfx_skip_te_disable(struct pci_dev *dev)
+{
+	unsigned short ver;
+
+	if (!IS_GFX_DEVICE(dev))
+		return;
+
+	ver = (dev->device >> 8) & 0xff;
+	if (ver != 0x45 && ver != 0x46 && ver != 0x4c &&
+	    ver != 0x4e && ver != 0x8a && ver != 0x98 &&
+	    ver != 0x9a)
+		return;
+
+	if (risky_device(dev))
+		return;
+
+	pci_info(dev, "Skip IOMMU disabling for graphics\n");
+	iommu_skip_te_disable = 1;
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_ANY_ID, quirk_igfx_skip_te_disable);
+
 /* On Tylersburg chipsets, some BIOSes have been known to enable the
    ISOCH DMAR unit for the Azalia sound device, but not give it any
    TLB entries, which causes it to deadlock. Check for that.  We do
diff --git a/include/linux/dmar.h b/include/linux/dmar.h
index d7bf029df737..65565820328a 100644
--- a/include/linux/dmar.h
+++ b/include/linux/dmar.h
@@ -48,6 +48,7 @@ struct dmar_drhd_unit {
 	u16	segment;		/* PCI domain		*/
 	u8	ignored:1; 		/* ignore drhd		*/
 	u8	include_all:1;
+	u8	gfx_dedicated:1;	/* graphic dedicated	*/
 	struct intel_iommu *iommu;
 };
 
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index bf6009a344f5..329629e1e9de 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -600,6 +600,8 @@ struct intel_iommu {
 	struct iommu_device iommu;  /* IOMMU core code handle */
 	int		node;
 	u32		flags;      /* Software defined flags */
+
+	struct dmar_drhd_unit *drhd;
 };
 
 /* PCI domain-device relationship */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
