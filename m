Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D03267ED
	for <lists.iommu@lfdr.de>; Fri, 26 Feb 2021 21:11:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E946B4341E;
	Fri, 26 Feb 2021 20:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id acKFzdxriVu2; Fri, 26 Feb 2021 20:11:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20ACE43410;
	Fri, 26 Feb 2021 20:11:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C812C0001;
	Fri, 26 Feb 2021 20:11:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11C38C0001
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E70C842D2
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldmxcBajrTOB for <iommu@lists.linux-foundation.org>;
 Fri, 26 Feb 2021 20:11:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96E3584314
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:14 +0000 (UTC)
IronPort-SDR: g6Vf/yMy7AwSVTHJU5hMzvKrDdE5qeK9Zp0+DXFmIAcP/GxJI3DXkF62XNj5SvPiUNkjhQ6SLS
 7ZXpdgvb+o8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="247407457"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="247407457"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 12:11:14 -0800
IronPort-SDR: 6eRWXMxbkZk4WWg4nf7WXCqgFHHUePNl/a+OsdoHo0lhY7FNfjLnXXfa+jiMWeI1DTvbAaSBUE
 8iojhtQHcn6Q==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="405109447"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Feb 2021 12:11:13 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [Patch V2 09/13] iommu/vt-d: Add DEV-MSI support
Date: Fri, 26 Feb 2021 12:11:13 -0800
Message-Id: <1614370277-23235-10-git-send-email-megha.dey@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614370277-23235-1-git-send-email-megha.dey@intel.com>
References: <1614370277-23235-1-git-send-email-megha.dey@intel.com>
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
index 611ef52..2a55e54 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1282,6 +1282,9 @@ static void intel_irq_remapping_prepare_irte(struct intel_ir_data *data,
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
 		set_msi_sid(irte, msi_desc_to_pci_dev(info->desc));
 		break;
+	case X86_IRQ_ALLOC_TYPE_DEV_MSI:
+		set_msi_sid(irte, to_pci_dev(info->desc->dev->parent));
+		break;
 	default:
 		BUG_ON(1);
 		break;
@@ -1325,7 +1328,8 @@ static int intel_irq_remapping_alloc(struct irq_domain *domain,
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
