Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0341C3267EF
	for <lists.iommu@lfdr.de>; Fri, 26 Feb 2021 21:11:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1C44F0BA;
	Fri, 26 Feb 2021 20:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gt6GqVo1glFY; Fri, 26 Feb 2021 20:11:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id B41E04F09B;
	Fri, 26 Feb 2021 20:11:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95506C000C;
	Fri, 26 Feb 2021 20:11:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AD83C0012
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C3F3842CD
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRdngmmW6xxz for <iommu@lists.linux-foundation.org>;
 Fri, 26 Feb 2021 20:11:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 744228433A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:14 +0000 (UTC)
IronPort-SDR: kKvS/ePVTxOmDvHxZGwX/pZ4unMkzOif4JoniAoHvHSNLboz7qJd6v2HfNsvOUkFm1gOl9Gx/1
 CS5OTgk2pWRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="247407454"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="247407454"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 12:11:14 -0800
IronPort-SDR: +EpK/x9VncNDE5qsC6U/B0HcBszgCBpXa4e1qFTeKEWYJgpXogusVejBQoXRMwu4tztbv7ye9z
 g5dY5zB++ODA==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="405109442"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Feb 2021 12:11:13 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [Patch V2 07/13] irqdomain/msi: Provide msi_alloc/free_store()
 callbacks
Date: Fri, 26 Feb 2021 12:11:11 -0800
Message-Id: <1614370277-23235-8-git-send-email-megha.dey@intel.com>
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

From: Thomas Gleixner <tglx@linutronix.de>

For devices which don't have a standard storage for MSI messages like the
upcoming IMS (Interrupt Message Store) it's required to allocate storage
space before allocating interrupts and after freeing them.

This could be achieved with the existing callbacks, but that would be
awkward because they operate on msi_alloc_info_t which is not uniform
across architectures. Also these callbacks are invoked per interrupt but
the allocation might have bulk requirements depending on the device.

As such devices can operate on different architectures it is simpler to
have separate callbacks which operate on struct device. The resulting
storage information has to be stored in struct msi_desc so the underlying
irq chip implementation can retrieve it for the relevant operations.

Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Megha Dey <megha.dey@intel.com>
---
 include/linux/msi.h |  8 ++++++++
 kernel/irq/msi.c    | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 46e879c..e915932 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -323,6 +323,10 @@ struct msi_domain_info;
  *			function.
  * @domain_free_irqs:	Optional function to override the default free
  *			function.
+ * @msi_alloc_store:	Optional callback to allocate storage in a device
+ *			specific non-standard MSI store
+ * @msi_alloc_free:	Optional callback to free storage in a device
+ *			specific non-standard MSI store
  *
  * @get_hwirq, @msi_init and @msi_free are callbacks used by
  * msi_create_irq_domain() and related interfaces
@@ -372,6 +376,10 @@ struct msi_domain_ops {
 					     struct device *dev, int nvec);
 	void		(*domain_free_irqs)(struct irq_domain *domain,
 					    struct device *dev);
+	int		(*msi_alloc_store)(struct irq_domain *domain,
+					   struct device *dev, int nvec);
+	void		(*msi_free_store)(struct irq_domain *domain,
+					  struct device *dev);
 };
 
 /**
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index c54316d..047b59d 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -434,6 +434,12 @@ int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 	if (ret)
 		return ret;
 
+	if (ops->msi_alloc_store) {
+		ret = ops->msi_alloc_store(domain, dev, nvec);
+		if (ret)
+			return ret;
+	}
+
 	for_each_msi_entry(desc, dev) {
 		ops->set_desc(&arg, desc);
 
@@ -529,6 +535,8 @@ int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 
 void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
 {
+	struct msi_domain_info *info = domain->host_data;
+	struct msi_domain_ops *ops = info->ops;
 	struct msi_desc *desc;
 
 	for_each_msi_entry(desc, dev) {
@@ -542,6 +550,9 @@ void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
 			desc->irq = 0;
 		}
 	}
+
+	if (ops->msi_free_store)
+		ops->msi_free_store(domain, dev);
 }
 
 /**
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
