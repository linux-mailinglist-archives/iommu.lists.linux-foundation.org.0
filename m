Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4098563A59
	for <lists.iommu@lfdr.de>; Fri,  1 Jul 2022 22:10:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D14F7415C5;
	Fri,  1 Jul 2022 20:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D14F7415C5
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sholland.org header.i=@sholland.org header.a=rsa-sha256 header.s=fm3 header.b=lImLZgXi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=swj9eb2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMUzD_NyAaEy; Fri,  1 Jul 2022 20:10:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E572740420;
	Fri,  1 Jul 2022 20:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E572740420
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDEFBC0039;
	Fri,  1 Jul 2022 20:10:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DA85C002D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 20:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22F0640134
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 20:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22F0640134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KyhYXQJLAohI for <iommu@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 20:10:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C52DB40386
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C52DB40386
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 20:10:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7D327580349;
 Fri,  1 Jul 2022 16:01:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 01 Jul 2022 16:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1656705714; x=1656712914; bh=eX
 ge2IdClR+d/3BSSaE+9pvQi9MnqCUCBzZI2A/q3+Y=; b=lImLZgXi07b4AZOlUz
 ewCsOrGtD6ZG0b0Mwa2BHgRwjFJmUlv0aH5fIk/DFa7yX2gI/3SZ/0xuOkd8jDjZ
 BbNp1qO7x0eSKZBj1sd1hXOLG/sNI5FsZUaZakMr6rsWHtRYiFSFc8hCCdBSWD+4
 6O2YrMjeZ/AoZIkX9FYOQ4vEtHx1y7a1tweDcek1Ml4Gv4ckD/1v2cjeAemIIIjI
 oqu6hoU7YENo5WoZZrUdWM/Go6RBzeGWW8DbMfuUywji9JyCz8RN59j3Sx45lf/G
 fS2D7jR5wRlvMjddPMgm/uvDWZR7y/pOpjeXGCJ1ZxDL+ZZFkXsELAFJBSY9i4w8
 BCpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656705714; x=1656712914; bh=eXge2IdClR+d/
 3BSSaE+9pvQi9MnqCUCBzZI2A/q3+Y=; b=swj9eb2D+mogmU8eUS1kfG8FTODks
 1/zWKUjEPxZEmSvMtrBYsfF5C22QcJB4FQjn/CXr6CYKXO6MFMWUlGpNz27m2Bm3
 0klqwEwuEi9mGsvk4WVshdGyJ/bVCk2NnK/JfaZMjFjdeDgGl50Q+/8Cw//Lop94
 y3fvLWqnMEX83eS4l/KXUJ59M8/Qrzl7mcIo1Ivji8q2SGQYZ+wyLDsbeXvZdrFQ
 2lcXegwwX6ewyuzWNdmlIJy+3BkKGlnQfYjCZDdpas0JVugj0w6PexiSaI1UznbT
 mwqF+H/9QSHFuUj7i7Lx+Ftx5w/bzNBrifQVKKFiIyb9S26Ed5xCveTmQ==
X-ME-Sender: <xms:sVK_YuM53pBklxw_EiY5xuJQWEm1PlvY6nchREdpH8NtgoCLylqYew>
 <xme:sVK_Ys-z2tVelUvUpPCNfojsyizsFeeF3Z_9KcVyX55h_RISKngIQbkdbZZpcMg7A
 LSxXTTgOcbIB07rQw>
X-ME-Received: <xmr:sVK_YlTh3scDtEf7FDpkPnoxq3vm6wgRJyk5rzuVNPaLE3-ikPkffKEO8cR3Wa7cvSZVzs0F15blWdGHapSuixZaGMNznuhE5BITdfmKQWQD4EaN8mryVe0XvCTBLywvznukjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
 gfdufeeitdevteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:sVK_YuvUqi44ParWKtxvS6q212MhDECXLeXkh7MFyHlXlTE_1K4r7w>
 <xmx:sVK_YmeO76g57Yak1c3Fs_MzWwZ-3neWVgahhPkyiNW3ezmWBVBWwQ>
 <xmx:sVK_Yi3IykGxFWEwSPlguaHxovLQFugimBznEFfFACWrNsfrGMzKSQ>
 <xmx:slK_Yh-rLP8WQHZRn5785cU8lLsvrhfLpIyeo1EPwNDAIU1n4PFOKA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:01:51 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 7/8] genirq: Return a const cpumask from
 irq_data_get_affinity_mask
Date: Fri,  1 Jul 2022 15:00:55 -0500
Message-Id: <20220701200056.46555-8-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701200056.46555-1-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Samuel Holland <samuel@sholland.org>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, x86@kernel.org,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Wei Xu <xuwei5@hisilicon.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Maximilian Heyne <mheyne@amazon.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Juergen Gross <jgross@suse.com>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Colin Ian King <colin.king@intel.com>,
 Helge Deller <deller@gmx.de>
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

Now that the irq_data_update_affinity helper exists, enforce its use
by returning a a const cpumask from irq_data_get_affinity_mask.

Since the previous commit already updated places that needed to call
irq_data_update_affinity, this commit updates the remaining code that
either did not modify the cpumask or immediately passed the modified
mask to irq_set_affinity.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - New patch to make the returned cpumasks const

 arch/mips/cavium-octeon/octeon-irq.c |  4 ++--
 arch/sh/kernel/irq.c                 |  7 ++++---
 arch/x86/hyperv/irqdomain.c          |  2 +-
 arch/xtensa/kernel/irq.c             |  7 ++++---
 drivers/iommu/hyperv-iommu.c         |  2 +-
 drivers/pci/controller/pci-hyperv.c  | 10 +++++-----
 include/linux/irq.h                  | 12 +++++++-----
 kernel/irq/chip.c                    |  8 +++++---
 kernel/irq/debugfs.c                 |  2 +-
 kernel/irq/ipi.c                     | 16 +++++++++-------
 10 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index 6cdcbf4de763..9cb9ed44bcaf 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -263,7 +263,7 @@ static int next_cpu_for_irq(struct irq_data *data)
 
 #ifdef CONFIG_SMP
 	int cpu;
-	struct cpumask *mask = irq_data_get_affinity_mask(data);
+	const struct cpumask *mask = irq_data_get_affinity_mask(data);
 	int weight = cpumask_weight(mask);
 	struct octeon_ciu_chip_data *cd = irq_data_get_irq_chip_data(data);
 
@@ -758,7 +758,7 @@ static void octeon_irq_cpu_offline_ciu(struct irq_data *data)
 {
 	int cpu = smp_processor_id();
 	cpumask_t new_affinity;
-	struct cpumask *mask = irq_data_get_affinity_mask(data);
+	const struct cpumask *mask = irq_data_get_affinity_mask(data);
 
 	if (!cpumask_test_cpu(cpu, mask))
 		return;
diff --git a/arch/sh/kernel/irq.c b/arch/sh/kernel/irq.c
index ef0f0827cf57..56269c2c3414 100644
--- a/arch/sh/kernel/irq.c
+++ b/arch/sh/kernel/irq.c
@@ -230,16 +230,17 @@ void migrate_irqs(void)
 		struct irq_data *data = irq_get_irq_data(irq);
 
 		if (irq_data_get_node(data) == cpu) {
-			struct cpumask *mask = irq_data_get_affinity_mask(data);
+			const struct cpumask *mask = irq_data_get_affinity_mask(data);
 			unsigned int newcpu = cpumask_any_and(mask,
 							      cpu_online_mask);
 			if (newcpu >= nr_cpu_ids) {
 				pr_info_ratelimited("IRQ%u no longer affine to CPU%u\n",
 						    irq, cpu);
 
-				cpumask_setall(mask);
+				irq_set_affinity(irq, cpu_all_mask);
+			} else {
+				irq_set_affinity(irq, mask);
 			}
-			irq_set_affinity(irq, mask);
 		}
 	}
 }
diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
index 7e0f6bedc248..42c70d28ef27 100644
--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -192,7 +192,7 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	struct pci_dev *dev;
 	struct hv_interrupt_entry out_entry, *stored_entry;
 	struct irq_cfg *cfg = irqd_cfg(data);
-	cpumask_t *affinity;
+	const cpumask_t *affinity;
 	int cpu;
 	u64 status;
 
diff --git a/arch/xtensa/kernel/irq.c b/arch/xtensa/kernel/irq.c
index 529fe9245821..42f106004400 100644
--- a/arch/xtensa/kernel/irq.c
+++ b/arch/xtensa/kernel/irq.c
@@ -169,7 +169,7 @@ void migrate_irqs(void)
 
 	for_each_active_irq(i) {
 		struct irq_data *data = irq_get_irq_data(i);
-		struct cpumask *mask;
+		const struct cpumask *mask;
 		unsigned int newcpu;
 
 		if (irqd_is_per_cpu(data))
@@ -185,9 +185,10 @@ void migrate_irqs(void)
 			pr_info_ratelimited("IRQ%u no longer affine to CPU%u\n",
 					    i, cpu);
 
-			cpumask_setall(mask);
+			irq_set_affinity(i, cpu_all_mask);
+		} else {
+			irq_set_affinity(i, mask);
 		}
-		irq_set_affinity(i, mask);
 	}
 }
 #endif /* CONFIG_HOTPLUG_CPU */
diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
index e285a220c913..51bd66a45a11 100644
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-iommu.c
@@ -194,7 +194,7 @@ hyperv_root_ir_compose_msi_msg(struct irq_data *irq_data, struct msi_msg *msg)
 	u32 vector;
 	struct irq_cfg *cfg;
 	int ioapic_id;
-	struct cpumask *affinity;
+	const struct cpumask *affinity;
 	int cpu;
 	struct hv_interrupt_entry entry;
 	struct hyperv_root_ir_data *data = irq_data->chip_data;
diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index db814f7b93ba..aebada45569b 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -642,7 +642,7 @@ static void hv_arch_irq_unmask(struct irq_data *data)
 	struct hv_retarget_device_interrupt *params;
 	struct tran_int_desc *int_desc;
 	struct hv_pcibus_device *hbus;
-	struct cpumask *dest;
+	const struct cpumask *dest;
 	cpumask_var_t tmp;
 	struct pci_bus *pbus;
 	struct pci_dev *pdev;
@@ -1613,7 +1613,7 @@ static void hv_pci_compose_compl(void *context, struct pci_response *resp,
 }
 
 static u32 hv_compose_msi_req_v1(
-	struct pci_create_interrupt *int_pkt, struct cpumask *affinity,
+	struct pci_create_interrupt *int_pkt, const struct cpumask *affinity,
 	u32 slot, u8 vector, u8 vector_count)
 {
 	int_pkt->message_type.type = PCI_CREATE_INTERRUPT_MESSAGE;
@@ -1641,7 +1641,7 @@ static int hv_compose_msi_req_get_cpu(struct cpumask *affinity)
 }
 
 static u32 hv_compose_msi_req_v2(
-	struct pci_create_interrupt2 *int_pkt, struct cpumask *affinity,
+	struct pci_create_interrupt2 *int_pkt, const struct cpumask *affinity,
 	u32 slot, u8 vector, u8 vector_count)
 {
 	int cpu;
@@ -1660,7 +1660,7 @@ static u32 hv_compose_msi_req_v2(
 }
 
 static u32 hv_compose_msi_req_v3(
-	struct pci_create_interrupt3 *int_pkt, struct cpumask *affinity,
+	struct pci_create_interrupt3 *int_pkt, const struct cpumask *affinity,
 	u32 slot, u32 vector, u8 vector_count)
 {
 	int cpu;
@@ -1697,7 +1697,7 @@ static void hv_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	struct hv_pci_dev *hpdev;
 	struct pci_bus *pbus;
 	struct pci_dev *pdev;
-	struct cpumask *dest;
+	const struct cpumask *dest;
 	struct compose_comp_ctxt comp;
 	struct tran_int_desc *int_desc;
 	struct msi_desc *msi_desc;
diff --git a/include/linux/irq.h b/include/linux/irq.h
index adcfebceb777..02073f7a156e 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -879,7 +879,8 @@ static inline int irq_data_get_node(struct irq_data *d)
 	return irq_common_data_get_node(d->common);
 }
 
-static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
+static inline
+const struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
 {
 	return d->common->affinity;
 }
@@ -890,7 +891,7 @@ static inline void irq_data_update_affinity(struct irq_data *d,
 	cpumask_copy(d->common->affinity, m);
 }
 
-static inline struct cpumask *irq_get_affinity_mask(int irq)
+static inline const struct cpumask *irq_get_affinity_mask(int irq)
 {
 	struct irq_data *d = irq_get_irq_data(irq);
 
@@ -899,7 +900,7 @@ static inline struct cpumask *irq_get_affinity_mask(int irq)
 
 #ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
 static inline
-struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
+const struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
 {
 	return d->common->effective_affinity;
 }
@@ -914,13 +915,14 @@ static inline void irq_data_update_effective_affinity(struct irq_data *d,
 {
 }
 static inline
-struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
+const struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
 {
 	return irq_data_get_affinity_mask(d);
 }
 #endif
 
-static inline struct cpumask *irq_get_effective_affinity_mask(unsigned int irq)
+static inline
+const struct cpumask *irq_get_effective_affinity_mask(unsigned int irq)
 {
 	struct irq_data *d = irq_get_irq_data(irq);
 
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 886789dcee43..9c7ad2266317 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -188,7 +188,8 @@ enum {
 
 #ifdef CONFIG_SMP
 static int
-__irq_startup_managed(struct irq_desc *desc, struct cpumask *aff, bool force)
+__irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
+		      bool force)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
 
@@ -224,7 +225,8 @@ __irq_startup_managed(struct irq_desc *desc, struct cpumask *aff, bool force)
 }
 #else
 static __always_inline int
-__irq_startup_managed(struct irq_desc *desc, struct cpumask *aff, bool force)
+__irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
+		      bool force)
 {
 	return IRQ_STARTUP_NORMAL;
 }
@@ -252,7 +254,7 @@ static int __irq_startup(struct irq_desc *desc)
 int irq_startup(struct irq_desc *desc, bool resend, bool force)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
-	struct cpumask *aff = irq_data_get_affinity_mask(d);
+	const struct cpumask *aff = irq_data_get_affinity_mask(d);
 	int ret = 0;
 
 	desc->depth = 0;
diff --git a/kernel/irq/debugfs.c b/kernel/irq/debugfs.c
index bc8e40cf2b65..bbcaac64038e 100644
--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -30,7 +30,7 @@ static void irq_debug_show_bits(struct seq_file *m, int ind, unsigned int state,
 static void irq_debug_show_masks(struct seq_file *m, struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct cpumask *msk;
+	const struct cpumask *msk;
 
 	msk = irq_data_get_affinity_mask(data);
 	seq_printf(m, "affinity: %*pbl\n", cpumask_pr_args(msk));
diff --git a/kernel/irq/ipi.c b/kernel/irq/ipi.c
index 08ce7da3b57c..bbd945bacef0 100644
--- a/kernel/irq/ipi.c
+++ b/kernel/irq/ipi.c
@@ -115,11 +115,11 @@ int irq_reserve_ipi(struct irq_domain *domain,
 int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest)
 {
 	struct irq_data *data = irq_get_irq_data(irq);
-	struct cpumask *ipimask = data ? irq_data_get_affinity_mask(data) : NULL;
+	const struct cpumask *ipimask;
 	struct irq_domain *domain;
 	unsigned int nr_irqs;
 
-	if (!irq || !data || !ipimask)
+	if (!irq || !data)
 		return -EINVAL;
 
 	domain = data->domain;
@@ -131,7 +131,8 @@ int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest)
 		return -EINVAL;
 	}
 
-	if (WARN_ON(!cpumask_subset(dest, ipimask)))
+	ipimask = irq_data_get_affinity_mask(data);
+	if (!ipimask || WARN_ON(!cpumask_subset(dest, ipimask)))
 		/*
 		 * Must be destroying a subset of CPUs to which this IPI
 		 * was set up to target
@@ -162,12 +163,13 @@ int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest)
 irq_hw_number_t ipi_get_hwirq(unsigned int irq, unsigned int cpu)
 {
 	struct irq_data *data = irq_get_irq_data(irq);
-	struct cpumask *ipimask = data ? irq_data_get_affinity_mask(data) : NULL;
+	const struct cpumask *ipimask;
 
-	if (!data || !ipimask || cpu >= nr_cpu_ids)
+	if (!data || cpu >= nr_cpu_ids)
 		return INVALID_HWIRQ;
 
-	if (!cpumask_test_cpu(cpu, ipimask))
+	ipimask = irq_data_get_affinity_mask(data);
+	if (!ipimask || !cpumask_test_cpu(cpu, ipimask))
 		return INVALID_HWIRQ;
 
 	/*
@@ -186,7 +188,7 @@ EXPORT_SYMBOL_GPL(ipi_get_hwirq);
 static int ipi_send_verify(struct irq_chip *chip, struct irq_data *data,
 			   const struct cpumask *dest, unsigned int cpu)
 {
-	struct cpumask *ipimask = irq_data_get_affinity_mask(data);
+	const struct cpumask *ipimask = irq_data_get_affinity_mask(data);
 
 	if (!chip || !ipimask)
 		return -EINVAL;
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
