Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BBE30E462
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 21:57:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 490C08621D;
	Wed,  3 Feb 2021 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdZj9NVLlR88; Wed,  3 Feb 2021 20:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A559986234;
	Wed,  3 Feb 2021 20:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92D05C013A;
	Wed,  3 Feb 2021 20:57:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2AB5C0FA7
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91E7B871C4
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3mbxt3WNd3f for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 20:57:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CEA9187164
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:30 +0000 (UTC)
IronPort-SDR: 7fQUp+R1S2TBeGfe7ByWcY4aWMnVgMl9mum+Aphui7mCjMUa2GREfzaVY2sXB31vHFi+M9wzj7
 +IPfHtL3ot1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160875308"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="160875308"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 12:57:30 -0800
IronPort-SDR: lDo9vV/MuzOHHPofxqRXtGbAdWNRgvbAUKvbBGjO753BaEOXV7JitXKSTe0CQfbNmOqU4s3e7x
 fwWzf2myIIFg==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="372510573"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Feb 2021 12:57:30 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [PATCH 07/12] irqdomain/msi: Provide msi_alloc/free_store() callbacks
Date: Wed,  3 Feb 2021 12:56:40 -0800
Message-Id: <1612385805-3412-8-git-send-email-megha.dey@intel.com>
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

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Megha Dey <megha.dey@intel.com>
---
 include/linux/msi.h |  8 ++++++++
 kernel/irq/msi.c    | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index fbf2258..a6b419d 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -317,6 +317,10 @@ struct msi_domain_info;
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
@@ -366,6 +370,10 @@ struct msi_domain_ops {
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
index 3697909..d70d92e 100644
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
 
@@ -533,6 +539,8 @@ int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 
 void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
 {
+	struct msi_domain_info *info = domain->host_data;
+	struct msi_domain_ops *ops = info->ops;
 	struct msi_desc *desc;
 
 	for_each_msi_entry(desc, dev) {
@@ -546,6 +554,9 @@ void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
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
