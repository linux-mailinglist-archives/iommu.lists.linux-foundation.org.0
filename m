Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE3BD1C1F
	for <lists.iommu@lfdr.de>; Thu, 10 Oct 2019 00:46:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B7D14DF2;
	Wed,  9 Oct 2019 22:46:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DD4BBBDC
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 22:46:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A2BA714D
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 22:46:44 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 27B9820B7C;
	Wed,  9 Oct 2019 22:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570661204;
	bh=T/sptErry+zYk95pBQaGv5ewZEsfKA7Zo0hyLyEPIq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbdtngIW/1XIXa2HYPt9nI8DYeCsu41NxFgraLGnT40mZz/QrqLMgSYV0w6C7ZDSY
	mFue7vHyVXdqTpjRw8r39G469v35jYvYg9Ibyhjt4vBcNyYWbf0U7jj3obe3EaVPW+
	Mr3Rpp9UzjbMDPhqnp/EO+aZVreadWgsxjQSv9MU=
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/2] iommu/vt-d: Select PCI_PRI for INTEL_IOMMU_SVM
Date: Wed,  9 Oct 2019 17:45:50 -0500
Message-Id: <20191009224551.179497-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191009224551.179497-1-helgaas@kernel.org>
References: <20191009224551.179497-1-helgaas@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>,
	iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>
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

When CONFIG_INTEL_IOMMU_SVM=y, iommu_enable_dev_iotlb() calls PRI
interfaces (pci_reset_pri() and pci_enable_pri()), but those are only
implemented when CONFIG_PCI_PRI is enabled.

Previously INTEL_IOMMU_SVM selected PCI_PASID but not PCI_PRI, so the state
of PCI_PRI depended on whether AMD_IOMMU (which selects PCI_PRI) was
enabled or PCI_PRI was enabled explicitly.

The behavior of iommu_enable_dev_iotlb() should not depend on whether
AMD_IOMMU is enabled.  Make it predictable by having INTEL_IOMMU_SVM select
PCI_PRI so iommu_enable_dev_iotlb() always uses the full implementations of
PRI interfaces.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/iommu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index e3842eabcfdd..b183c9f916b0 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -207,6 +207,7 @@ config INTEL_IOMMU_SVM
 	bool "Support for Shared Virtual Memory with Intel IOMMU"
 	depends on INTEL_IOMMU && X86
 	select PCI_PASID
+	select PCI_PRI
 	select MMU_NOTIFIER
 	help
 	  Shared Virtual Memory (SVM) provides a facility for devices
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
