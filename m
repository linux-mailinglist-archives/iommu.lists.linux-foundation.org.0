Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416930E467
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 21:57:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E56186974;
	Wed,  3 Feb 2021 20:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DF+692mspzvF; Wed,  3 Feb 2021 20:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBC4B86B4A;
	Wed,  3 Feb 2021 20:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3141C013A;
	Wed,  3 Feb 2021 20:57:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEBB4C013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C9F0587164
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asYn8qb8lxUa for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1C0AC871B2
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:31 +0000 (UTC)
IronPort-SDR: lZXyw82UYJuK80A+huIDohcUa66adGH0S+S0x4mG2+jyb6TlpzzBmoOVipbqyx16EdEe5eXwGp
 CmuMlb1oHSng==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160875312"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="160875312"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 12:57:30 -0800
IronPort-SDR: z24OHgspgXrmUufwOeutvV6tlHGf9al7sBOIJbNf8aGLHBQtLiLTIBb2vJCFLQOMgpXsLQm86z
 uHnTQ4xRdMlA==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="372510575"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Feb 2021 12:57:30 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [PATCH 08/12] genirq: Set auxiliary data for an interrupt
Date: Wed,  3 Feb 2021 12:56:41 -0800
Message-Id: <1612385805-3412-9-git-send-email-megha.dey@intel.com>
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

Introduce a new function pointer in the irq_chip structure(irq_set_auxdata)
which is responsible for updating data which is stored in a shared register
or data storage. For example, the idxd driver uses the auxiliary data API
to enable/set and disable PASID field that is in the IMS entry (introduced
in a later patch) and that data are not typically present in MSI entry.

Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Megha Dey <megha.dey@intel.com>
---
 include/linux/interrupt.h |  2 ++
 include/linux/irq.h       |  4 ++++
 kernel/irq/manage.c       | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index bb8ff90..d3f419b 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -496,6 +496,8 @@ extern int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 extern int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 				 bool state);
 
+int irq_set_auxdata(unsigned int irq, unsigned int which, u64 val);
+
 #ifdef CONFIG_IRQ_FORCED_THREADING
 # ifdef CONFIG_PREEMPT_RT
 #  define force_irqthreads	(true)
diff --git a/include/linux/irq.h b/include/linux/irq.h
index 4aeb1c4..568cdf5 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -491,6 +491,8 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  *				irq_request_resources
  * @irq_compose_msi_msg:	optional to compose message content for MSI
  * @irq_write_msi_msg:	optional to write message content for MSI
+ * @irq_set_auxdata:	Optional function to update auxiliary data e.g. in
+ *			shared registers
  * @irq_get_irqchip_state:	return the internal state of an interrupt
  * @irq_set_irqchip_state:	set the internal state of a interrupt
  * @irq_set_vcpu_affinity:	optional to target a vCPU in a virtual machine
@@ -538,6 +540,8 @@ struct irq_chip {
 	void		(*irq_compose_msi_msg)(struct irq_data *data, struct msi_msg *msg);
 	void		(*irq_write_msi_msg)(struct irq_data *data, struct msi_msg *msg);
 
+	int		(*irq_set_auxdata)(struct irq_data *data, unsigned int which, u64 auxval);
+
 	int		(*irq_get_irqchip_state)(struct irq_data *data, enum irqchip_irq_state which, bool *state);
 	int		(*irq_set_irqchip_state)(struct irq_data *data, enum irqchip_irq_state which, bool state);
 
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 85ede4e..68ff559 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2860,3 +2860,35 @@ bool irq_check_status_bit(unsigned int irq, unsigned int bitmask)
 	return res;
 }
 EXPORT_SYMBOL_GPL(irq_check_status_bit);
+
+/**
+ * irq_set_auxdata - Set auxiliary data
+ * @irq:	Interrupt to update
+ * @which:	Selector which data to update
+ * @auxval:	Auxiliary data value
+ *
+ * Function to update auxiliary data for an interrupt, e.g. to update data
+ * which is stored in a shared register or data storage (e.g. IMS).
+ */
+int irq_set_auxdata(unsigned int irq, unsigned int which, u64 val)
+{
+	struct irq_desc *desc;
+	struct irq_data *data;
+	unsigned long flags;
+	int res = -ENODEV;
+
+	desc = irq_get_desc_buslock(irq, &flags, 0);
+	if (!desc)
+		return -EINVAL;
+
+	for (data = &desc->irq_data; data; data = irqd_get_parent_data(data)) {
+		if (data->chip->irq_set_auxdata) {
+			res = data->chip->irq_set_auxdata(data, which, val);
+			break;
+		}
+	}
+
+	irq_put_desc_busunlock(desc, flags);
+	return res;
+}
+EXPORT_SYMBOL_GPL(irq_set_auxdata);
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
