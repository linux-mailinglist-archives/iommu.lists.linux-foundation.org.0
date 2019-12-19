Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 580CF12618A
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 13:04:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 13C0E2324B;
	Thu, 19 Dec 2019 12:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X80p5YTGIKDL; Thu, 19 Dec 2019 12:04:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C7AC223251;
	Thu, 19 Dec 2019 12:04:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B52C3C077D;
	Thu, 19 Dec 2019 12:04:12 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38A19C077D
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1D81C886C8
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCr3OTZgfS78 for <iommu@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 12:04:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CB367886C5
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:09 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01FB724683;
 Thu, 19 Dec 2019 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576757049;
 bh=+WTtqAFVopoXQZplgExaFV+agqrd+AIa7dTwWybSTC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J751/wORuYIf/VyBBcqzUDOT1gqPqORGxyQUdPBzOPU0m5n9XO+WcQb08vZjupFzw
 2YXK9CVR5ce6pwbRf9IiFrdYdga9JtJYNlBxcgoa/GRJe7bRCaIYZ/RnDqOa0Zx0N0
 bTH2XhHL5l+/DYNi10C4WU/Pxao3lKvX32WD8dN4=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linuxfoundation.org
Subject: [PATCH v4 03/16] PCI/ATS: Restore EXPORT_SYMBOL_GPL() for pci_{enable,
 disable}_ats()
Date: Thu, 19 Dec 2019 12:03:39 +0000
Message-Id: <20191219120352.382-4-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219120352.382-1-will@kernel.org>
References: <20191219120352.382-1-will@kernel.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <jroedel@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
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

From: Greg Kroah-Hartman <gregkh@google.com>

Commit d355bb209783 ("PCI/ATS: Remove unnecessary EXPORT_SYMBOL_GPL()")
unexported a bunch of symbols from the PCI core since the only external
users were non-modular IOMMU drivers. Although most of those symbols
can remain private for now, 'pci_{enable,disable_ats()' is required for
the ARM SMMUv3 driver to build as a module, otherwise we get a build
failure as follows:

  | ERROR: "pci_enable_ats" [drivers/iommu/arm-smmu-v3.ko] undefined!
  | ERROR: "pci_disable_ats" [drivers/iommu/arm-smmu-v3.ko] undefined!

Re-export these two functions so that the ARM SMMUv3 driver can be build
as a module.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@google.com>
[will: rewrote commit message]
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/pci/ats.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 982b46f0a54d..dcbcf1331bb2 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -69,6 +69,7 @@ int pci_enable_ats(struct pci_dev *dev, int ps)
 	dev->ats_enabled = 1;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_enable_ats);
 
 /**
  * pci_disable_ats - disable the ATS capability
@@ -87,6 +88,7 @@ void pci_disable_ats(struct pci_dev *dev)
 
 	dev->ats_enabled = 0;
 }
+EXPORT_SYMBOL_GPL(pci_disable_ats);
 
 void pci_restore_ats_state(struct pci_dev *dev)
 {
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
