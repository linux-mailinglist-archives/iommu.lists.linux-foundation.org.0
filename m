Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 71818144548
	for <lists.iommu@lfdr.de>; Tue, 21 Jan 2020 20:41:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0DC7386439;
	Tue, 21 Jan 2020 19:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Mxkvzu+zb08; Tue, 21 Jan 2020 19:41:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 46E648671B;
	Tue, 21 Jan 2020 19:41:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32457C1D80;
	Tue, 21 Jan 2020 19:41:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EC40C0174
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 19:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B4F984B7E
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 19:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9iICrVX4iGIR for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 19:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 537EC81DC1
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 19:41:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 11:41:39 -0800
X-IronPort-AV: E=Sophos;i="5.70,347,1574150400"; d="scan'208";a="220070710"
Received: from nsgsw-rhel7p6.lm.intel.com ([10.232.116.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 11:41:38 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v5 5/7] iommu/vt-d: Remove VMD child device sanity check
Date: Tue, 21 Jan 2020 06:37:49 -0700
Message-Id: <1579613871-301529-6-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579613871-301529-1-git-send-email-jonathan.derrick@intel.com>
References: <1579613871-301529-1-git-send-email-jonathan.derrick@intel.com>
Cc: iommu@lists.linux-foundation.org, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Jon Derrick <jonathan.derrick@intel.com>
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

This removes the sanity check required for VMD child devices. The new
pci_real_dma_dev() DMA alias mechanism places them in the same IOMMU
group as the VMD endpoint. Assignment of the group would require
assigning the VMD endpoint, where unbinding the VMD endpoint removes the
child device domain from the hierarchy.

Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 drivers/iommu/intel-iommu.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 72f26e8..7e2c492f 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -774,15 +774,7 @@ static struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devf
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pf_pdev;
 
-		pdev = to_pci_dev(dev);
-
-#ifdef CONFIG_X86
-		/* VMD child devices currently cannot be handled individually */
-		if (is_vmd(pdev->bus))
-			return NULL;
-#endif
-
-		pdev = pci_real_dma_dev(pdev);
+		pdev = pci_real_dma_dev(to_pci_dev(dev));
 
 		/* VFs aren't listed in scope tables; we need to look up
 		 * the PF instead to find the IOMMU. */
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
