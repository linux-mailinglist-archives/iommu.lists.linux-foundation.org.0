Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 329CF10A325
	for <lists.iommu@lfdr.de>; Tue, 26 Nov 2019 18:10:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C8E6286102;
	Tue, 26 Nov 2019 17:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_JomBbmFzAL; Tue, 26 Nov 2019 17:10:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 37A2286055;
	Tue, 26 Nov 2019 17:10:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BAF5C0878;
	Tue, 26 Nov 2019 17:10:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68591C0878
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 571DC86055
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfOXwnIiPQKC for <iommu@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 17:10:39 +0000 (UTC)
X-Greylist: delayed 00:07:09 by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EC5E78562A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:10:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so4232424wmf.2
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 09:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YDMkod26jBuYIctmZERW8YY/mOMbA2drn1QF1QAAIto=;
 b=oG4z8HUair3Guh/qOumEgxFQ6aBIbp46KkUmOTfHLc1N6N6/R9FKZH98lfCfS7K3cP
 gho0Bc8vDd7Y8WKXwjtG4rwG40ORm4nem3ny7EZDqZuEB/lMXSIdZtW2HokCNwyR+38t
 7Fe+gFVuCePWsD1JlCD/t1PA4VdaKONbLApcgQBKvw62AAPRzDvNuiczBT1mWUxDpaVW
 KMbgfYl7Gu6b9fZopFI2I6IL/ADvgD8sQ/pZYqdQ1i/hgRzumn81ik79ASXic9H7heMW
 mZ62q79cHrJcNi789FodWJgNEu1yxddYXSsj7JfuwXHeQCsIL+ZS004Cr5KPJcoybqqG
 hoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YDMkod26jBuYIctmZERW8YY/mOMbA2drn1QF1QAAIto=;
 b=RUxx8KmIP0sc60xhP8GHmmBN1Z99GoIJOUrZITE++cLyVJdH2w4y0NlL9CteeTNz9I
 6NV2k94s1z2GTS0UmFxcSWmukF9MyOPpFIniqh24EquTqe85CAltvy+J5yFqOqMr8TxY
 l8SrAWL9znImqLmf4eJ9X0XLr9kObWv8MQ1Pddnd6on5BB20RfxNsQHOXF7FL094rqHF
 G7/8m6q7jGHmhoZ8UupQPAHnP48zpqlqxmhCgb8vA3c96RclcT3GssE+nj0iORWkL+g+
 8qX/CBXQxI7QE/9VUDv8fN8DcgmyTreU0/katwxtSeavjtdGRvbH6z+3u8MeWibFG1IH
 2UNw==
X-Gm-Message-State: APjAAAVc5Dl1IMYsyPsWujFKZth9AJGCZywNbT0SdW89bmnst9lB2rdl
 U9f6wybzZ4tAGbQPSC4gVHDPGA==
X-Google-Smtp-Source: APXvYqwReaa4bwtmNp/NSgCoIIpzSMoMUduHgUDieWiBxVI+QLcOG66Jh98wtBHj+VxoZ+3N5o8lkg==
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr61452wmk.18.1574787808072;
 Tue, 26 Nov 2019 09:03:28 -0800 (PST)
Received: from [10.83.36.220] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id 19sm17789770wrc.47.2019.11.26.09.03.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 09:03:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: [PATCH v2] PCI: Add DMA alias quirk for PLX PEX NTB
In-Reply-To: <20191120193228.GA103670@google.com>
Date: Tue, 26 Nov 2019 17:03:23 +0000
Message-Id: <6A902F0D-FE98-4760-ADBB-4D5987D866BE@arista.com>
References: <20191120193228.GA103670@google.com>
To: linux-pci@vger.kernel.org
X-Mailer: Apple Mail (2.3445.102.3)
Cc: Dmitry Safonov <dima@arista.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
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
From: James Sewart via iommu <iommu@lists.linux-foundation.org>
Reply-To: James Sewart <jamessewart@arista.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The PLX PEX NTB forwards DMA transactions using Requester ID's that
don't exist as PCI devices. The devfn for a transaction is used as an
index into a lookup table storing the origin of a transaction on the
other side of the bridge.

Add helper pci_add_dma_alias_range that can alias a range of devfns in 
dma_alias_mask.

This patch aliases all possible devfn's to the NTB device so that any
transaction coming in is governed by the mappings for the NTB.

Signed-off-by: James Sewart <jamessewart@arista.com>
---
 drivers/pci/pci.c    | 29 ++++++++++++++++++++++-------
 drivers/pci/quirks.c | 15 +++++++++++++++
 include/linux/pci.h  |  1 +
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index a97e2571a527..f502af1b5d10 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5854,6 +5854,18 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
 	return 0;
 }
 
+int _pci_add_dma_alias_range(struct pci_dev *dev, u8 devfn_from, int len)
+{
+	if (!dev->dma_alias_mask)
+		dev->dma_alias_mask = bitmap_zalloc(U8_MAX, GFP_KERNEL);
+	if (!dev->dma_alias_mask) {
+		pci_warn(dev, "Unable to allocate DMA alias mask\n");
+		return -ENOMEM;
+	}
+	bitmap_set(dev->dma_alias_mask, devfn_from, len);
+	return 0;
+}
+
 /**
  * pci_add_dma_alias - Add a DMA devfn alias for a device
  * @dev: the PCI device for which alias is added
@@ -5875,18 +5887,21 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
  */
 void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
 {
-	if (!dev->dma_alias_mask)
-		dev->dma_alias_mask = bitmap_zalloc(U8_MAX, GFP_KERNEL);
-	if (!dev->dma_alias_mask) {
-		pci_warn(dev, "Unable to allocate DMA alias mask\n");
+	if (_pci_add_dma_alias_range(dev, devfn, 1) != 0)
 		return;
-	}
-
-	set_bit(devfn, dev->dma_alias_mask);
 	pci_info(dev, "Enabling fixed DMA alias to %02x.%d\n",
 		 PCI_SLOT(devfn), PCI_FUNC(devfn));
 }
 
+void pci_add_dma_alias_range(struct pci_dev *dev, u8 devfn_from, int len)
+{
+	int devfn_to = devfn_from + len - 1;
+	if (_pci_add_dma_alias_range(dev, devfn_from, len) != 0)
+		return;
+	pci_info(dev, "Enabling fixed DMA alias for devfn range from %02x.%d to %02x.%d\n",
+		 PCI_SLOT(devfn_from), PCI_FUNC(devfn_from), PCI_SLOT(devfn_to), PCI_FUNC(devfn_to));
+}
+
 bool pci_devs_are_dma_aliases(struct pci_dev *dev1, struct pci_dev *dev2)
 {
 	return (dev1->dma_alias_mask &&
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 320255e5e8f8..1ed230f739a4 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5315,6 +5315,21 @@ SWITCHTEC_QUIRK(0x8574);  /* PFXI 64XG3 */
 SWITCHTEC_QUIRK(0x8575);  /* PFXI 80XG3 */
 SWITCHTEC_QUIRK(0x8576);  /* PFXI 96XG3 */
 
+/*
+ * PLX NTB uses devfn proxy IDs to move TLPs between NT endpoints. These IDs
+ * are used to forward responses to the originator on the other side of the
+ * NTB. Alias all possible IDs to the NTB to permit access when the IOMMU is
+ * turned on.
+ */
+static void quirk_plx_ntb_dma_alias(struct pci_dev *pdev)
+{
+	pci_info(pdev, "Setting PLX NTB proxy ID aliases\n");
+	/* PLX NTB may use all 256 devfns */
+	pci_add_dma_alias_range(pdev, 0, 256);
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PLX, 0x87b0, quirk_plx_ntb_dma_alias);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PLX, 0x87b1, quirk_plx_ntb_dma_alias);
+
 /*
  * On Lenovo Thinkpad P50 SKUs with a Nvidia Quadro M1000M, the BIOS does
  * not always reset the secondary Nvidia GPU between reboots if the system
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1a6cf19eac2d..6765f3d0102b 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2324,6 +2324,7 @@ static inline struct eeh_dev *pci_dev_to_eeh_dev(struct pci_dev *pdev)
 #endif
 
 void pci_add_dma_alias(struct pci_dev *dev, u8 devfn);
+void pci_add_dma_alias_range(struct pci_dev *dev, u8 devfn_from, int len);
 bool pci_devs_are_dma_aliases(struct pci_dev *dev1, struct pci_dev *dev2);
 int pci_for_each_dma_alias(struct pci_dev *pdev,
 			   int (*fn)(struct pci_dev *pdev,
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
