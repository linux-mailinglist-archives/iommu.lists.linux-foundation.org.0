Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5CE30E466
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 21:57:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1C9286B0B;
	Wed,  3 Feb 2021 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O70YNJztiqFA; Wed,  3 Feb 2021 20:57:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FDA086B21;
	Wed,  3 Feb 2021 20:57:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02115C1E72;
	Wed,  3 Feb 2021 20:57:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F39BEC1834
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E309487164
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XdWM0iuESwi3 for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7237E871CF
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
IronPort-SDR: IcS6/LwKZDYRU7WBPWYH5hpBm6aT9Rhn7QXfLbseWieRpDqcmwWjGadvazrLlDupB6+INhycxt
 2Ilz72QXgVnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160875316"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="160875316"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 12:57:31 -0800
IronPort-SDR: QZlpHv60LEgw1Tva4TVObVrye2zuMOFvuGuGwnX7Sj3M3Y5+jChKDshA8MTt8ME2eyNSHooii+
 3nLE0Ox0sqAA==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="372510580"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Feb 2021 12:57:30 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [PATCH 09/12] iommu/vt-d: Add DEV-MSI support
Date: Wed,  3 Feb 2021 12:56:42 -0800
Message-Id: <1612385805-3412-10-git-send-email-megha.dey@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612385805-3412-1-git-send-email-megha.dey@intel.com>
References: <1612385805-3412-1-git-send-email-megha.dey@intel.com>
Cc: alex.williamson@redhat.com, kevin.tian@intel.com, tony.luck@intel.com,
 dave.jiang@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 ravi.v.shankar@intel.com, maz@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jgg@mellanox.com, megha.dey@intel.com, linux-pci@vger.kernel.org,
 bhelgaas@google.com, dan.j.williams@intel.com, dwmw@amazon.co.uk
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

Add required support in the interrupt remapping driver for devices
which generate dev-msi interrupts and use the intel remapping
domain as the parent domain. Set the source-id of all dev-msi
interrupt requests to the parent PCI device associated with it.

Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Megha Dey <megha.dey@intel.com>
---
 drivers/iommu/intel/irq_remapping.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 685200a..18f1b53 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1278,6 +1278,9 @@ static void intel_irq_remapping_prepare_irte(struct intel_ir_data *data,
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
 		set_msi_sid(irte, msi_desc_to_pci_dev(info->desc));
 		break;
+	case X86_IRQ_ALLOC_TYPE_DEV_MSI:
+		set_msi_sid(irte, to_pci_dev(info->desc->dev->parent));
+		break;
 	default:
 		BUG_ON(1);
 		break;
@@ -1321,7 +1324,8 @@ static int intel_irq_remapping_alloc(struct irq_domain *domain,
 	if (!info || !iommu)
 		return -EINVAL;
 	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI &&
-	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX)
+	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX &&
+	    info->type != X86_IRQ_ALLOC_TYPE_DEV_MSI)
 		return -EINVAL;
 
 	/*
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
