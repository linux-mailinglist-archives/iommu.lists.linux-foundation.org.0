Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C610D9C8
	for <lists.iommu@lfdr.de>; Fri, 29 Nov 2019 19:56:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A136A86B16;
	Fri, 29 Nov 2019 18:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_9tMjG-Zb3a; Fri, 29 Nov 2019 18:56:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 87B7B86B15;
	Fri, 29 Nov 2019 18:56:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C999C0881;
	Fri, 29 Nov 2019 18:56:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94170C0881
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 18:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 75823231A8
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 18:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgdnkfanbsoA for <iommu@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 18:56:10 +0000 (UTC)
X-Greylist: delayed 00:28:00 by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 3DE9020461
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 18:56:10 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j13so33486457ioe.0
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 10:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qRbvRGI95q9n8HmLSu7axtCeZCjpjfZCyst7xGr13mA=;
 b=YOA8tU6R8Q32dCBcenMm/PsZbZlt/QOW7oQA6kvbFcfemmSpUti2yX6o2bT6xy4IUs
 rfGyEbX2vQWY3Stbj+TDXnF2DrZQjTpIX/mgmmYSr2QtQHsTnBPSlwggTRfsf8yYICPq
 CDNlmBE8FK3Eb5xv7jNiETGY8VR0iBUxsyAsxwU9stA0F3OEJFx89HNjQvN7N2Xe4nNb
 FvaqSKguwEQJq++MmxTky5tULwQeZAFAauLtby/OeHQvoDqeCB0QHX7fIVbrMQg4Q2M1
 fF7N+vn3GA6DC7rRIQ4j4kJYQkm2wYuEmjNx89MdfG+NT27RtiktQEXUdTZTvXkI8eVv
 u1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qRbvRGI95q9n8HmLSu7axtCeZCjpjfZCyst7xGr13mA=;
 b=dPYeGYOX4GExLBBDNSwDialxfbuEG05FViAj52E7cgdnY/N2lXLC7api1LyvbtoVuM
 t3bN4OyO+u4QDF+aDKcLBflkR9UnNzPj7Lc/d+gwgveRjSjI8aV6A+FAq/xqLqzhc25m
 SmnNO0TTem32d4sVZcWct/dgKyHwWuy1HOB9TpX7ycv/J2JkQRcThIRfbR564+y190WK
 9a3CSdIa+BZyAbnLqCX5wYv0goZ5+YCxBq230G1Nkhp6L5jqoWXR29W+oWH3QieBlMYF
 MCxrkdOI3zI7L6mwUV3RDCnCu1VVUVo7vaeRZRBMu2QjluZNQmbX3ivNxfVxjlg0jbBN
 VPUg==
X-Gm-Message-State: APjAAAVWZ4gse83kRMSC71wYdeIq6q5FhIkn7ONf6OfirLTE+DYX94pO
 N+PJPvFI53hL9bwkJ4CjnBbtUUHRnG6rxQ==
X-Google-Smtp-Source: APXvYqwAT3uzkjkz+anc+nX8KobmkmHzI+Sw5M0xnZcf5Ma8eI4N+Ywc38p5EMTNNnf1LcnLtmCCyg==
X-Received: by 2002:a63:da13:: with SMTP id c19mr17488191pgh.435.1575050218308; 
 Fri, 29 Nov 2019 09:56:58 -0800 (PST)
Received: from [10.83.36.220] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id s7sm9962922pfe.22.2019.11.29.09.56.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 09:56:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: [PATCH v5 2/3] PCI: Add parameter nr_devfns to pci_add_dma_alias
In-Reply-To: <9DD82D05-6B9E-4AF5-9A3C-D459B75C0089@arista.com>
Date: Fri, 29 Nov 2019 17:56:55 +0000
Message-Id: <07D724A1-308F-44C3-8937-EE0C21EF3170@arista.com>
References: <20191120193228.GA103670@google.com>
 <6A902F0D-FE98-4760-ADBB-4D5987D866BE@arista.com>
 <20191126173833.GA16069@infradead.org>
 <547214A9-9FD0-4DD5-80E1-1F5A467A0913@arista.com>
 <9c54c5dd-702c-a19b-38ba-55ab73b24729@deltatee.com>
 <435064D4-00F0-47F5-94D2-2C354F6B1206@arista.com>
 <058383d9-69fe-65e3-e410-eebd99840261@deltatee.com>
 <F26CC19F-66C2-466B-AE30-D65E10BA3022@arista.com>
 <d811576e-0f89-2303-a554-2701af5c5647@deltatee.com>
 <9DD82D05-6B9E-4AF5-9A3C-D459B75C0089@arista.com>
To: linux-pci@vger.kernel.org
X-Mailer: Apple Mail (2.3445.102.3)
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Safonov <dima@arista.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
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

pci_add_dma_alias can now be used to create a dma alias for a range of
devfns.

Signed-off-by: James Sewart <jamessewart@arista.com>
---
 drivers/pci/pci.c    | 23 ++++++++++++++++++-----
 drivers/pci/quirks.c | 14 +++++++-------
 include/linux/pci.h  |  2 +-
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 0a4449a30ace..f9800a610ca1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5857,7 +5857,8 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
 /**
  * pci_add_dma_alias - Add a DMA devfn alias for a device
  * @dev: the PCI device for which alias is added
- * @devfn: alias slot and function
+ * @devfn_from: alias slot and function
+ * @nr_devfns: Number of subsequent devfns to alias
  *
  * This helper encodes an 8-bit devfn as a bit number in dma_alias_mask
  * which is used to program permissible bus-devfn source addresses for DMA
@@ -5873,8 +5874,14 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
  * cannot be left as a userspace activity).  DMA aliases should therefore
  * be configured via quirks, such as the PCI fixup header quirk.
  */
-void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
+void pci_add_dma_alias(struct pci_dev *dev, u8 devfn_from, unsigned nr_devfns)
 {
+	int devfn_to;
+
+	if (nr_devfns > U8_MAX+1)
+		nr_devfns = U8_MAX+1;
+	devfn_to = devfn_from + nr_devfns - 1;
+
 	if (!dev->dma_alias_mask)
 		dev->dma_alias_mask = bitmap_zalloc(U8_MAX+1, GFP_KERNEL);
 	if (!dev->dma_alias_mask) {
@@ -5882,9 +5889,15 @@ void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
 		return;
 	}
 
-	set_bit(devfn, dev->dma_alias_mask);
-	pci_info(dev, "Enabling fixed DMA alias to %02x.%d\n",
-		 PCI_SLOT(devfn), PCI_FUNC(devfn));
+	bitmap_set(dev->dma_alias_mask, devfn_from, nr_devfns);
+
+	if (nr_devfns == 1)
+		pci_info(dev, "Enabling fixed DMA alias to %02x.%d\n",
+				PCI_SLOT(devfn_from), PCI_FUNC(devfn_from));
+	else if (nr_devfns > 1)
+		pci_info(dev, "Enabling fixed DMA alias for devfn range from %02x.%d to %02x.%d\n",
+				PCI_SLOT(devfn_from), PCI_FUNC(devfn_from),
+				PCI_SLOT(devfn_to), PCI_FUNC(devfn_to));
 }
 
 bool pci_devs_are_dma_aliases(struct pci_dev *dev1, struct pci_dev *dev2)
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 320255e5e8f8..0f3f5afc73fd 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3932,7 +3932,7 @@ int pci_dev_specific_reset(struct pci_dev *dev, int probe)
 static void quirk_dma_func0_alias(struct pci_dev *dev)
 {
 	if (PCI_FUNC(dev->devfn) != 0)
-		pci_add_dma_alias(dev, PCI_DEVFN(PCI_SLOT(dev->devfn), 0));
+		pci_add_dma_alias(dev, PCI_DEVFN(PCI_SLOT(dev->devfn), 0), 1);
 }
 
 /*
@@ -3946,7 +3946,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_RICOH, 0xe476, quirk_dma_func0_alias);
 static void quirk_dma_func1_alias(struct pci_dev *dev)
 {
 	if (PCI_FUNC(dev->devfn) != 1)
-		pci_add_dma_alias(dev, PCI_DEVFN(PCI_SLOT(dev->devfn), 1));
+		pci_add_dma_alias(dev, PCI_DEVFN(PCI_SLOT(dev->devfn), 1), 1);
 }
 
 /*
@@ -4031,7 +4031,7 @@ static void quirk_fixed_dma_alias(struct pci_dev *dev)
 
 	id = pci_match_id(fixed_dma_alias_tbl, dev);
 	if (id)
-		pci_add_dma_alias(dev, id->driver_data);
+		pci_add_dma_alias(dev, id->driver_data, 1);
 }
 
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ADAPTEC2, 0x0285, quirk_fixed_dma_alias);
@@ -4073,9 +4073,9 @@ DECLARE_PCI_FIXUP_HEADER(0x8086, 0x244e, quirk_use_pcie_bridge_dma_alias);
  */
 static void quirk_mic_x200_dma_alias(struct pci_dev *pdev)
 {
-	pci_add_dma_alias(pdev, PCI_DEVFN(0x10, 0x0));
-	pci_add_dma_alias(pdev, PCI_DEVFN(0x11, 0x0));
-	pci_add_dma_alias(pdev, PCI_DEVFN(0x12, 0x3));
+	pci_add_dma_alias(pdev, PCI_DEVFN(0x10, 0x0), 1);
+	pci_add_dma_alias(pdev, PCI_DEVFN(0x11, 0x0), 1);
+	pci_add_dma_alias(pdev, PCI_DEVFN(0x12, 0x3), 1);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2260, quirk_mic_x200_dma_alias);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2264, quirk_mic_x200_dma_alias);
@@ -5273,7 +5273,7 @@ static void quirk_switchtec_ntb_dma_alias(struct pci_dev *pdev)
 			pci_dbg(pdev,
 				"Aliasing Partition %d Proxy ID %02x.%d\n",
 				pp, PCI_SLOT(devfn), PCI_FUNC(devfn));
-			pci_add_dma_alias(pdev, devfn);
+			pci_add_dma_alias(pdev, devfn, 1);
 		}
 	}
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1a6cf19eac2d..84a8d4c2b24e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2323,7 +2323,7 @@ static inline struct eeh_dev *pci_dev_to_eeh_dev(struct pci_dev *pdev)
 }
 #endif
 
-void pci_add_dma_alias(struct pci_dev *dev, u8 devfn);
+void pci_add_dma_alias(struct pci_dev *dev, u8 devfn_from, unsigned nr_devfns);
 bool pci_devs_are_dma_aliases(struct pci_dev *dev1, struct pci_dev *dev2);
 int pci_for_each_dma_alias(struct pci_dev *pdev,
 			   int (*fn)(struct pci_dev *pdev,
-- 
2.24.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
