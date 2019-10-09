Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 02720D1C4A
	for <lists.iommu@lfdr.de>; Thu, 10 Oct 2019 00:54:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 17404E21;
	Wed,  9 Oct 2019 22:54:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 45B5DDE0
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 22:54:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E1C0E81A
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 22:54:16 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 845C1218DE;
	Wed,  9 Oct 2019 22:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570661656;
	bh=qL8doCvFG2dqwmIvj9dzbxGepFbqsoz5/Woj99/nbXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vCYBpDSEqgTFPHA35CvDGN8KQKfOHRdEpExO7VVi8wm1f8GSnzrDu65OcL3Mt4VWh
	f6HZiyd5NYVqocLLFtSJkWie5M11dO/UkI4zWm+RtB32xxbf03jxTh6U96DwG/ZKeW
	jSG5Cw8wMVCtpgBzaKnuUyECwzVB9t67O1qC0h+0=
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 3/3] PCI/ATS: Make pci_restore_pri_state(),
	pci_restore_pasid_state() private
Date: Wed,  9 Oct 2019 17:53:54 -0500
Message-Id: <20191009225354.181018-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191009225354.181018-1-helgaas@kernel.org>
References: <20191009225354.181018-1-helgaas@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Krzysztof Wilczynski <kw@linux.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>,
	iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>
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

From: Bjorn Helgaas <bhelgaas@google.com>

These interfaces:

  void pci_restore_pri_state(struct pci_dev *pdev);
  void pci_restore_pasid_state(struct pci_dev *pdev);

are only used in drivers/pci and do not need to be seen by the rest of the
kernel.  Most them to drivers/pci/pci.h so they're private to the PCI
subsystem.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pci.h       | 4 ++++
 include/linux/pci-ats.h | 5 -----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ae84d28ba03a..e6b46d2b9846 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -458,14 +458,18 @@ static inline void pci_restore_ats_state(struct pci_dev *dev) { }
 
 #ifdef CONFIG_PCI_PRI
 void pci_pri_init(struct pci_dev *dev);
+void pci_restore_pri_state(struct pci_dev *pdev);
 #else
 static inline void pci_pri_init(struct pci_dev *dev) { }
+static inline void pci_restore_pri_state(struct pci_dev *pdev) { }
 #endif
 
 #ifdef CONFIG_PCI_PASID
 void pci_pasid_init(struct pci_dev *dev);
+void pci_restore_pasid_state(struct pci_dev *pdev);
 #else
 static inline void pci_pasid_init(struct pci_dev *dev) { }
+static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
 #endif
 
 #ifdef CONFIG_PCI_IOV
diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index 963c11f7c56b..5d62e78946a3 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -23,21 +23,16 @@ static inline int pci_ats_page_aligned(struct pci_dev *dev)
 #ifdef CONFIG_PCI_PRI
 int pci_enable_pri(struct pci_dev *pdev, u32 reqs);
 void pci_disable_pri(struct pci_dev *pdev);
-void pci_restore_pri_state(struct pci_dev *pdev);
 int pci_reset_pri(struct pci_dev *pdev);
 int pci_prg_resp_pasid_required(struct pci_dev *pdev);
-#else /* CONFIG_PCI_PRI */
-static inline void pci_restore_pri_state(struct pci_dev *pdev) { }
 #endif /* CONFIG_PCI_PRI */
 
 #ifdef CONFIG_PCI_PASID
 int pci_enable_pasid(struct pci_dev *pdev, int features);
 void pci_disable_pasid(struct pci_dev *pdev);
-void pci_restore_pasid_state(struct pci_dev *pdev);
 int pci_pasid_features(struct pci_dev *pdev);
 int pci_max_pasids(struct pci_dev *pdev);
 #else /* CONFIG_PCI_PASID */
-static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
 static inline int pci_pasid_features(struct pci_dev *pdev)
 { return -EINVAL; }
 static inline int pci_max_pasids(struct pci_dev *pdev)
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
