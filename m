Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 464662B0C7
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 10:56:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D427C1625;
	Mon, 27 May 2019 08:56:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 883571605
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:56:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3AF0A13A
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:56:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C37433172D64;
	Mon, 27 May 2019 08:56:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 616B45D97C;
	Mon, 27 May 2019 08:56:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	dwmw2@infradead.org, lorenzo.pieralisi@arm.com, robin.murphy@arm.com,
	will.deacon@arm.com, hanjun.guo@linaro.org, sudeep.holla@arm.com
Subject: [PATCH v4 4/8] iommu/vt-d: Introduce is_downstream_to_pci_bridge
	helper
Date: Mon, 27 May 2019 10:55:37 +0200
Message-Id: <20190527085541.5294-5-eric.auger@redhat.com>
In-Reply-To: <20190527085541.5294-1-eric.auger@redhat.com>
References: <20190527085541.5294-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 27 May 2019 08:56:23 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Several call sites are about to check whether a device belongs
to the PCI sub-hierarchy of a candidate PCI-PCI bridge.
Introduce an helper to perform that check.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/iommu/intel-iommu.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 590a0e78d11d..15c2f9677491 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -736,12 +736,39 @@ static int iommu_dummy(struct device *dev)
 	return dev->archdata.iommu == DUMMY_DEVICE_DOMAIN_INFO;
 }
 
+/* is_downstream_to_pci_bridge - test if a device belongs to the
+ * PCI sub-hierarchy of a candidate PCI-PCI bridge
+ *
+ * @dev: candidate PCI device belonging to @bridge PCI sub-hierarchy
+ * @bridge: the candidate PCI-PCI bridge
+ *
+ * Return: true if @dev belongs to @bridge PCI sub-hierarchy
+ */
+static bool
+is_downstream_to_pci_bridge(struct device *dev, struct device *bridge)
+{
+	struct pci_dev *pdev, *pbridge;
+
+	if (!dev_is_pci(dev) || !dev_is_pci(bridge))
+		return false;
+
+	pdev = to_pci_dev(dev);
+	pbridge = to_pci_dev(bridge);
+
+	if (pbridge->subordinate &&
+	    pbridge->subordinate->number <= pdev->bus->number &&
+	    pbridge->subordinate->busn_res.end >= pdev->bus->number)
+		return true;
+
+	return false;
+}
+
 static struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devfn)
 {
 	struct dmar_drhd_unit *drhd = NULL;
 	struct intel_iommu *iommu;
 	struct device *tmp;
-	struct pci_dev *ptmp, *pdev = NULL;
+	struct pci_dev *pdev = NULL;
 	u16 segment = 0;
 	int i;
 
@@ -787,13 +814,7 @@ static struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devf
 				goto out;
 			}
 
-			if (!pdev || !dev_is_pci(tmp))
-				continue;
-
-			ptmp = to_pci_dev(tmp);
-			if (ptmp->subordinate &&
-			    ptmp->subordinate->number <= pdev->bus->number &&
-			    ptmp->subordinate->busn_res.end >= pdev->bus->number)
+			if (is_downstream_to_pci_bridge(dev, tmp))
 				goto got_pdev;
 		}
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
