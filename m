Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC8217B68
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 00:54:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A470421FAD;
	Tue,  7 Jul 2020 22:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DSVF1YzCCgx; Tue,  7 Jul 2020 22:54:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6677E20519;
	Tue,  7 Jul 2020 22:54:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44C65C016F;
	Tue,  7 Jul 2020 22:54:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE665C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 22:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D384D8768C
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 22:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DJKlcC2mnaYg for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 22:54:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3412787454
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 22:54:17 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id u128so29957421pfu.12
 for <iommu@lists.linux-foundation.org>; Tue, 07 Jul 2020 15:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=L05dCShs4KTehcbE/VodR/bsgP2KIT3Bu7CXzpGXdK4=;
 b=Z+LepKpVl7XXp/qBkk8nzJb/sC43u1qSEuujNdnQlJu/YnO1I1ptL6LURN5f1AqpHu
 fWLUs6nARZr2ufhQkh4zMKcLFoQBpoayBFsPajiGXNLlD4DGBZYachE6/SypTXxjP5Nb
 dIz43Ub2qSWIsif6OXhmf7FU5KzFdtCZLbBhgzWlFq6u5yPKTBLV2fM/UOSuY0oNGwhp
 9bzVVsievUpnNWfTWbp2sNl4d0MIaQnJINertNpMFemUKWJ0DnSFm3YWbyLPWW8bT0BP
 HpSD7HOLX5tJqOUwt5vlaOAMd1s/+xbOg66FmMPBsrZo3a6qzYKDFM6q+x5DROloqfKK
 yn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=L05dCShs4KTehcbE/VodR/bsgP2KIT3Bu7CXzpGXdK4=;
 b=s+tPLRRvK/crRPvxuVOqHZVp45a9q/YyBGmnzGXaOg49GfiYMoN6TvkBZKWSGGCf0Q
 Od1anGauX7mVQpiiq8VTiAGcMdprj4OQpOhz0cQciglpY0xONXNmjoCTjdCUs5N9ES1w
 nWegL4L0Gi8XNJXvFCoDHnXnGcO7h22I5ThLSOY1zhvisha+gMc2IzNdA1R7T/FRK4mY
 4No5xXcuLNliK7Z2AOSKd2gscbQUQt3Ie3evs61UkmsMsiJJ4ANN5Ip3BdQmP8lcrTDH
 /hFEXjd/rfUsQArGYwoNx86JvFTjhmqXWYawRgnId+WdTm+EDdepkHYfCJtsKsIGKQ5R
 Yijg==
X-Gm-Message-State: AOAM532zAhNSlf7fDBvl8i+wcKh+H42j0x2zDdsyjhTuvA/JobxUsov3
 Bw8/Cw7b0QHM+hHntQjphOrU4xAmGnBU
X-Google-Smtp-Source: ABdhPJw7JEoSx1+EuOq36ExRI11zKZzfZcbpC37J9ZnBIjRCaa8so7nSh+13cFmWmnp2c88ISnKo1cwDvw+m
X-Received: by 2002:a05:6214:8d1:: with SMTP id
 da17mr54058981qvb.62.1594161969267; 
 Tue, 07 Jul 2020 15:46:09 -0700 (PDT)
Date: Tue,  7 Jul 2020 15:46:02 -0700
In-Reply-To: <20200707224604.3737893-1-rajatja@google.com>
Message-Id: <20200707224604.3737893-2-rajatja@google.com>
Mime-Version: 1.0
References: <20200707224604.3737893-1-rajatja@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v4 2/4] PCI: Keep the ACS capability offset in device
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 iommu@lists.linux-foundation.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-acpi@vger.kernel.org, Raj Ashok <ashok.raj@intel.com>, 
 lalithambika.krishnakumar@intel.com, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Prashant Malani <pmalani@google.com>, 
 Benson Leung <bleung@google.com>, Todd Broch <tbroch@google.com>,
 Alex Levin <levinale@google.com>, 
 Mattias Nissler <mnissler@google.com>, Rajat Jain <rajatxjain@gmail.com>, 
 Bernie Keany <bernie.keany@intel.com>, Aaron Durbin <adurbin@google.com>, 
 Diego Rivas <diegorivas@google.com>, Duncan Laurie <dlaurie@google.com>, 
 Furquan Shaikh <furquan@google.com>, Jesse Barnes <jsbarnes@google.com>, 
 Christian Kellner <christian@kellner.me>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oohall@gmail.com, 
 Saravana Kannan <saravanak@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Rajat Jain <rajatja@google.com>
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
From: Rajat Jain via iommu <iommu@lists.linux-foundation.org>
Reply-To: Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Currently ACS capabiity is being looked up at a number of places. Read and
store it once at bootup so that it can be used by all later.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v4: No change
v3: fix commit log, remove forward declation of static function
v2: Commit log cosmetic changes

 drivers/pci/p2pdma.c |  2 +-
 drivers/pci/pci.c    | 20 ++++++++++++++++----
 drivers/pci/pci.h    |  2 +-
 drivers/pci/probe.c  |  2 +-
 drivers/pci/quirks.c |  8 ++++----
 include/linux/pci.h  |  1 +
 6 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index e8e444eeb1cd2..f29a48f8fa594 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -253,7 +253,7 @@ static int pci_bridge_has_acs_redir(struct pci_dev *pdev)
 	int pos;
 	u16 ctrl;
 
-	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ACS);
+	pos = pdev->acs_cap;
 	if (!pos)
 		return 0;
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index eec625f0e594e..73a8627822140 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -831,7 +831,7 @@ static void pci_disable_acs_redir(struct pci_dev *dev)
 	if (!pci_dev_specific_disable_acs_redir(dev))
 		return;
 
-	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
+	pos = dev->acs_cap;
 	if (!pos) {
 		pci_warn(dev, "cannot disable ACS redirect for this hardware as it does not have ACS capabilities\n");
 		return;
@@ -857,7 +857,7 @@ static void pci_std_enable_acs(struct pci_dev *dev)
 	u16 cap;
 	u16 ctrl;
 
-	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
+	pos = dev->acs_cap;
 	if (!pos)
 		return;
 
@@ -883,7 +883,7 @@ static void pci_std_enable_acs(struct pci_dev *dev)
  * pci_enable_acs - enable ACS if hardware support it
  * @dev: the PCI device
  */
-void pci_enable_acs(struct pci_dev *dev)
+static void pci_enable_acs(struct pci_dev *dev)
 {
 	if (!pci_acs_enable)
 		goto disable_acs_redir;
@@ -3362,7 +3362,7 @@ static bool pci_acs_flags_enabled(struct pci_dev *pdev, u16 acs_flags)
 	int pos;
 	u16 cap, ctrl;
 
-	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ACS);
+	pos = pdev->acs_cap;
 	if (!pos)
 		return false;
 
@@ -3487,6 +3487,18 @@ bool pci_acs_path_enabled(struct pci_dev *start,
 	return true;
 }
 
+/**
+ * pci_acs_init - Initialize ACS if hardware supports it
+ * @dev: the PCI device
+ */
+void pci_acs_init(struct pci_dev *dev)
+{
+	dev->acs_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
+
+	if (dev->acs_cap)
+		pci_enable_acs(dev);
+}
+
 /**
  * pci_rebar_find_pos - find position of resize ctrl reg for BAR
  * @pdev: PCI device
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 6d3f758671064..12fb79fbe29d3 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -532,7 +532,7 @@ static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
 	return resource_alignment(res);
 }
 
-void pci_enable_acs(struct pci_dev *dev);
+void pci_acs_init(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
 int pci_dev_specific_acs_enabled(struct pci_dev *dev, u16 acs_flags);
 int pci_dev_specific_enable_acs(struct pci_dev *dev);
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2f66988cea257..6d87066a5ecc5 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2390,7 +2390,7 @@ static void pci_init_capabilities(struct pci_dev *dev)
 	pci_ats_init(dev);		/* Address Translation Services */
 	pci_pri_init(dev);		/* Page Request Interface */
 	pci_pasid_init(dev);		/* Process Address Space ID */
-	pci_enable_acs(dev);		/* Enable ACS P2P upstream forwarding */
+	pci_acs_init(dev);		/* Access Control Services */
 	pci_ptm_init(dev);		/* Precision Time Measurement */
 	pci_aer_init(dev);		/* Advanced Error Reporting */
 	pci_dpc_init(dev);		/* Downstream Port Containment */
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 812bfc32ecb82..b341628e47527 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4653,7 +4653,7 @@ static int pci_quirk_intel_spt_pch_acs(struct pci_dev *dev, u16 acs_flags)
 	if (!pci_quirk_intel_spt_pch_acs_match(dev))
 		return -ENOTTY;
 
-	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
+	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
 
@@ -4961,7 +4961,7 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
 	if (!pci_quirk_intel_spt_pch_acs_match(dev))
 		return -ENOTTY;
 
-	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
+	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
 
@@ -4988,7 +4988,7 @@ static int pci_quirk_disable_intel_spt_pch_acs_redir(struct pci_dev *dev)
 	if (!pci_quirk_intel_spt_pch_acs_match(dev))
 		return -ENOTTY;
 
-	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
+	pos = dev->acs_cap;
 	if (!pos)
 		return -ENOTTY;
 
@@ -5355,7 +5355,7 @@ int pci_idt_bus_quirk(struct pci_bus *bus, int devfn, u32 *l, int timeout)
 	bool found;
 	struct pci_dev *bridge = bus->self;
 
-	pos = pci_find_ext_capability(bridge, PCI_EXT_CAP_ID_ACS);
+	pos = bridge->acs_cap;
 
 	/* Disable ACS SV before initial config reads */
 	if (pos) {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 34c1c4f45288f..0ca39042507ce 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -486,6 +486,7 @@ struct pci_dev {
 #ifdef CONFIG_PCI_P2PDMA
 	struct pci_p2pdma *p2pdma;
 #endif
+	u16		acs_cap;	/* ACS Capability offset */
 	phys_addr_t	rom;		/* Physical address if not from BAR */
 	size_t		romlen;		/* Length if not from BAR */
 	char		*driver_override; /* Driver name to force a match */
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
