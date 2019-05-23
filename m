Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C2728CF5
	for <lists.iommu@lfdr.de>; Fri, 24 May 2019 00:31:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0CB9CF90;
	Thu, 23 May 2019 22:31:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CAE97F68
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 22:31:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3F960829
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 22:31:09 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <gunthorp@deltatee.com>)
	id 1hTwEs-00062O-Eu; Thu, 23 May 2019 16:31:08 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
	(envelope-from <gunthorp@deltatee.com>)
	id 1hTwEp-0001S5-Qq; Thu, 23 May 2019 16:31:03 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-ntb@googlegroups.com,
	linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-kselftest@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
	Joerg Roedel <joro@8bytes.org>
Date: Thu, 23 May 2019 16:30:52 -0600
Message-Id: <20190523223100.5526-3-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523223100.5526-1-logang@deltatee.com>
References: <20190523223100.5526-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-ntb@googlegroups.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, jdmason@kudzu.us,
	joro@8bytes.org, bhelgaas@google.com, dave.jiang@intel.com,
	allenbh@gmail.com, fancer.lancer@gmail.com, epilmore@gigaio.com,
	logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
Subject: [PATCH v5 02/10] PCI/switchtec: Add module parameter to request more
	interrupts
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Allen Hubbe <allenbh@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
	Serge Semin <fancer.lancer@gmail.com>, Eric Pilmore <epilmore@gigaio.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>
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

Seeing the we want to use more interrupts in the NTB MSI code
we need to be able allocate more (sometimes virtual) interrupts
in the switchtec driver. Therefore add a module parameter to
request to allocate additional interrupts.

This puts virtually no limit on the number of MSI interrupts available
to NTB clients.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/switch/switchtec.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
index e22766c79fe9..8b1db78197d9 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -30,6 +30,10 @@ module_param(use_dma_mrpc, bool, 0644);
 MODULE_PARM_DESC(use_dma_mrpc,
 		 "Enable the use of the DMA MRPC feature");
 
+static int nirqs = 32;
+module_param(nirqs, int, 0644);
+MODULE_PARM_DESC(nirqs, "number of interrupts to allocate (more may be useful for NTB applications)");
+
 static dev_t switchtec_devt;
 static DEFINE_IDA(switchtec_minor_ida);
 
@@ -1247,8 +1251,12 @@ static int switchtec_init_isr(struct switchtec_dev *stdev)
 	int dma_mrpc_irq;
 	int rc;
 
-	nvecs = pci_alloc_irq_vectors(stdev->pdev, 1, 4,
-				      PCI_IRQ_MSIX | PCI_IRQ_MSI);
+	if (nirqs < 4)
+		nirqs = 4;
+
+	nvecs = pci_alloc_irq_vectors(stdev->pdev, 1, nirqs,
+				      PCI_IRQ_MSIX | PCI_IRQ_MSI |
+				      PCI_IRQ_VIRTUAL);
 	if (nvecs < 0)
 		return nvecs;
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
