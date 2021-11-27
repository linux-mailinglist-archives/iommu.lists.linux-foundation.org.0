Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F445F8C8
	for <lists.iommu@lfdr.de>; Sat, 27 Nov 2021 02:22:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01C4161C1E;
	Sat, 27 Nov 2021 01:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INtFkSpAyjuA; Sat, 27 Nov 2021 01:22:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0666E61C3A;
	Sat, 27 Nov 2021 01:22:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E0F7C000A;
	Sat, 27 Nov 2021 01:22:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23208C000A
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 839D940593
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="nwr34SK8";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="YyV9a7ip"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2tUA7IAiGUF for <iommu@lists.linux-foundation.org>;
 Sat, 27 Nov 2021 01:22:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDE2C40595
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:22:08 +0000 (UTC)
Message-ID: <20211126230525.773495940@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637976127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=eogXL9InvhL5Ge9dFq9uLhqM//0IPGCuEWm7SufDzqc=;
 b=nwr34SK8HnNP+qktWGTxWiJARNt6AciCj1qIedpnIr3jpIoUnz7JlbGSd4ap87gkqlWrlG
 mtTfZvWPTpJwF0Yuma12eAWjhqr+tPFdgPUWjKZR+IREHhOlqrrN47ZsL0O9ShEDrSp+hY
 QWRX6FE56ZRPCX+x9MDiZGCd6F41poz41bRsSHSmFfNBXtAs3W+mNnWjaArDOiPbh5VPY8
 GBXjOYR6p2+EaO0UQQgPOEx8pyux8wdQeTEbWHb8eWGZjz3/jWhtlk6FM/D1MIyvbETHXS
 anxj2yyV8IZINUWZxE6llc++NKd7zcz1MIcZ8ouatAGSel5M4r89QEN5Js1hSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637976127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=eogXL9InvhL5Ge9dFq9uLhqM//0IPGCuEWm7SufDzqc=;
 b=YyV9a7ipxiPOpaNQQvoOO+6BS/R+DIx0/N8LF8Z9jsAtBFUgiJaD0D6S2mpcpl8gCzUQCe
 Cc5wChT/0eppWqCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 31/37] dmaengine: mv_xor_v2: Get rid of msi_desc abuse
References: <20211126224100.303046749@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:22:06 +0100 (CET)
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, x86@kernel.org, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
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

Storing a pointer to the MSI descriptor just to keep track of the Linux
interrupt number is daft. Use msi_get_virq() instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/mv_xor_v2.c |   16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -149,7 +149,7 @@ struct mv_xor_v2_descriptor {
  * @desc_size: HW descriptor size
  * @npendings: number of pending descriptors (for which tx_submit has
  * @hw_queue_idx: HW queue index
- * @msi_desc: local interrupt descriptor information
+ * @irq: The Linux interrupt number
  * been called, but not yet issue_pending)
  */
 struct mv_xor_v2_device {
@@ -168,7 +168,7 @@ struct mv_xor_v2_device {
 	int desc_size;
 	unsigned int npendings;
 	unsigned int hw_queue_idx;
-	struct msi_desc *msi_desc;
+	unsigned int irq;
 };
 
 /**
@@ -718,7 +718,6 @@ static int mv_xor_v2_probe(struct platfo
 	int i, ret = 0;
 	struct dma_device *dma_dev;
 	struct mv_xor_v2_sw_desc *sw_desc;
-	struct msi_desc *msi_desc;
 
 	BUILD_BUG_ON(sizeof(struct mv_xor_v2_descriptor) !=
 		     MV_XOR_V2_EXT_DESC_SIZE);
@@ -770,14 +769,9 @@ static int mv_xor_v2_probe(struct platfo
 	if (ret)
 		goto disable_clk;
 
-	msi_desc = first_msi_entry(&pdev->dev);
-	if (!msi_desc) {
-		ret = -ENODEV;
-		goto free_msi_irqs;
-	}
-	xor_dev->msi_desc = msi_desc;
+	xor_dev->irq = msi_get_virq(&pdev->dev, 0);
 
-	ret = devm_request_irq(&pdev->dev, msi_desc->irq,
+	ret = devm_request_irq(&pdev->dev, xor_dev->irq,
 			       mv_xor_v2_interrupt_handler, 0,
 			       dev_name(&pdev->dev), xor_dev);
 	if (ret)
@@ -892,7 +886,7 @@ static int mv_xor_v2_remove(struct platf
 			  xor_dev->desc_size * MV_XOR_V2_DESC_NUM,
 			  xor_dev->hw_desq_virt, xor_dev->hw_desq);
 
-	devm_free_irq(&pdev->dev, xor_dev->msi_desc->irq, xor_dev);
+	devm_free_irq(&pdev->dev, xor_dev->irq, xor_dev);
 
 	platform_msi_domain_free_irqs(&pdev->dev);
 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
