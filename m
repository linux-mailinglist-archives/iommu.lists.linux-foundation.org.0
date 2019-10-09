Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE545D1C42
	for <lists.iommu@lfdr.de>; Thu, 10 Oct 2019 00:54:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C2F43C03;
	Wed,  9 Oct 2019 22:54:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE290941
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 22:54:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 99E566CE
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 22:54:10 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2C57220B7C;
	Wed,  9 Oct 2019 22:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570661650;
	bh=8Nlqxp+t3d/SxUKiK4OInRALysoVn832+0LN9EyvS/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EyunVZAf/t7AAzUOk50vb9ICtbpAKLycfzckejjaZk0NQaoCpAdoUQKDymAMBrLIS
	kwDGcBB7vMrZ23FfY3++/mT+qhYoUFsgO3vK6qOIk8Sla3TLK58iFU4Yu0C3Tzqkku
	97fAiowVbzFyJKVvLHFGeBS5wi7fCM5aqBVafNOI=
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 1/3] PCI/ATS: Remove unused PRI and PASID stubs
Date: Wed,  9 Oct 2019 17:53:52 -0500
Message-Id: <20191009225354.181018-2-helgaas@kernel.org>
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

The following functions are only used by amd_iommu.c and intel-iommu.c
(when CONFIG_INTEL_IOMMU_SVM is enabled).  CONFIG_PCI_PRI and
CONFIG_PCI_PASID are always defined in those cases, so there's no need for
the stubs.

  pci_enable_pri()
  pci_disable_pri()
  pci_reset_pri()
  pci_prg_resp_pasid_required()
  pci_enable_pasid()
  pci_disable_pasid()

Remove the unused stubs.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 include/linux/pci-ats.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index 67de3a9499bb..963c11f7c56b 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -27,14 +27,7 @@ void pci_restore_pri_state(struct pci_dev *pdev);
 int pci_reset_pri(struct pci_dev *pdev);
 int pci_prg_resp_pasid_required(struct pci_dev *pdev);
 #else /* CONFIG_PCI_PRI */
-static inline int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
-{ return -ENODEV; }
-static inline void pci_disable_pri(struct pci_dev *pdev) { }
 static inline void pci_restore_pri_state(struct pci_dev *pdev) { }
-static inline int pci_reset_pri(struct pci_dev *pdev)
-{ return -ENODEV; }
-static inline int pci_prg_resp_pasid_required(struct pci_dev *pdev)
-{ return 0; }
 #endif /* CONFIG_PCI_PRI */
 
 #ifdef CONFIG_PCI_PASID
@@ -44,9 +37,6 @@ void pci_restore_pasid_state(struct pci_dev *pdev);
 int pci_pasid_features(struct pci_dev *pdev);
 int pci_max_pasids(struct pci_dev *pdev);
 #else /* CONFIG_PCI_PASID */
-static inline int pci_enable_pasid(struct pci_dev *pdev, int features)
-{ return -EINVAL; }
-static inline void pci_disable_pasid(struct pci_dev *pdev) { }
 static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
 static inline int pci_pasid_features(struct pci_dev *pdev)
 { return -EINVAL; }
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
