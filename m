Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D66C4F300E
	for <lists.iommu@lfdr.de>; Tue,  5 Apr 2022 14:20:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2FC581AEF;
	Tue,  5 Apr 2022 12:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kPnJmr7KEhu; Tue,  5 Apr 2022 12:20:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 124498196E;
	Tue,  5 Apr 2022 12:20:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D017CC0073;
	Tue,  5 Apr 2022 12:20:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EEB4C0012
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 12:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C10E4109D
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 12:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJGQlsOnSSB1 for <iommu@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 12:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB6BF41061
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 12:20:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6BDBD6E;
 Tue,  5 Apr 2022 05:20:03 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 014163F5A1;
 Tue,  5 Apr 2022 05:20:02 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: benve@cisco.com,
	neescoba@cisco.com,
	jgg@ziepe.ca
Subject: [PATCH] RDMA/usnic: Stop using iommu_present()
Date: Tue,  5 Apr 2022 13:19:59 +0100
Message-Id: <f707b4248e1d33b6d2c7f1d7c94febb802cf9890.1649161199.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Cc: linux-rdma@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

Even if an IOMMU might be present for some PCI segment in the system,
that doesn't necessarily mean it provides translation for the device(s)
we care about. Replace iommu_present() with a more appropriate check at
probe time, and garbage-collect the resulting empty init function.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/infiniband/hw/usnic/usnic_ib_main.c | 11 +++++------
 drivers/infiniband/hw/usnic/usnic_uiom.c    | 10 ----------
 drivers/infiniband/hw/usnic/usnic_uiom.h    |  1 -
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_ib_main.c b/drivers/infiniband/hw/usnic/usnic_ib_main.c
index d346dd48e731..46653ad56f5a 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_main.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_main.c
@@ -534,6 +534,11 @@ static int usnic_ib_pci_probe(struct pci_dev *pdev,
 	struct usnic_ib_vf *vf;
 	enum usnic_vnic_res_type res_type;
 
+	if (!device_iommu_mapped(&pdev->dev)) {
+		usnic_err("IOMMU required but not present or enabled.  USNIC QPs will not function w/o enabling IOMMU\n");
+		return -EPERM;
+	}
+
 	vf = kzalloc(sizeof(*vf), GFP_KERNEL);
 	if (!vf)
 		return -ENOMEM;
@@ -642,12 +647,6 @@ static int __init usnic_ib_init(void)
 
 	printk_once(KERN_INFO "%s", usnic_version);
 
-	err = usnic_uiom_init(DRV_NAME);
-	if (err) {
-		usnic_err("Unable to initialize umem with err %d\n", err);
-		return err;
-	}
-
 	err = pci_register_driver(&usnic_ib_pci_driver);
 	if (err) {
 		usnic_err("Unable to register with PCI\n");
diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index 760b254ba42d..8c48027614a1 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -556,13 +556,3 @@ void usnic_uiom_free_dev_list(struct device **devs)
 {
 	kfree(devs);
 }
-
-int usnic_uiom_init(char *drv_name)
-{
-	if (!iommu_present(&pci_bus_type)) {
-		usnic_err("IOMMU required but not present or enabled.  USNIC QPs will not function w/o enabling IOMMU\n");
-		return -EPERM;
-	}
-
-	return 0;
-}
diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.h b/drivers/infiniband/hw/usnic/usnic_uiom.h
index 7ec8991ace67..9407522179e9 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.h
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.h
@@ -91,5 +91,4 @@ struct usnic_uiom_reg *usnic_uiom_reg_get(struct usnic_uiom_pd *pd,
 						unsigned long addr, size_t size,
 						int access, int dmasync);
 void usnic_uiom_reg_release(struct usnic_uiom_reg *uiomr);
-int usnic_uiom_init(char *drv_name);
 #endif /* USNIC_UIOM_H_ */
-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
