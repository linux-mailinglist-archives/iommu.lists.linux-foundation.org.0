Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CDD20ECDA
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 06:50:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 84CB08821F;
	Tue, 30 Jun 2020 04:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GseFKi96YJ4c; Tue, 30 Jun 2020 04:50:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0B93881EC;
	Tue, 30 Jun 2020 04:50:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A726DC0892;
	Tue, 30 Jun 2020 04:50:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F5F0C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 04:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7BC3C881EC
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 04:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MexHag15Yexd for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 04:50:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com
 [209.85.219.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 77C208821F
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 04:50:00 +0000 (UTC)
Received: by mail-qv1-f74.google.com with SMTP id v10so2999306qvm.17
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 21:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hBtBLiuYQovdw2Rd8BSYQSNQYTDXp+WTcpVtHvbxicA=;
 b=Fol1HvbQl98QxE4Uz8ftjRVLMaJY+OftVa1vPS+FAfOc5MOSE+8tW26BoGDyKXDin8
 KQ5gB+SgH4AiAbtI9MRBXaFA2Vop/Yurs0AkVC04HIKAkyiQrp99NNlwv2wPdflik8WC
 +cI70T4nQo9tbc8G8kOk3DzfB1IBiBNJP7daJlmQeAjcviOd6mych8Sh64dXfX7GddPJ
 /dkE9PFXpGNBH9NWNOGb2ocoOGc9z5+HzxpPioenbNHI03kKQxybFS5ftD1cBZLmWpWp
 2i8DOULp9/FmZqHRn+8vxPwlX6TVkjBYYLf7BhunHn/ZOgmDD8FoY6+dVAcPzeJyNKR+
 s+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hBtBLiuYQovdw2Rd8BSYQSNQYTDXp+WTcpVtHvbxicA=;
 b=IOnmE5F0r5agCuhHfJxXrEbXqWj+M9zta7hNKSaPj2Qnv33Kx/P2WOYfDCbRwKCmob
 iaIENaSLVQOpnppD914DO9IL1qD5sNKzya5C5orp53GMnpDiUji2LLf9C69cBbWdNv9f
 lYkVcHnkEB3tNB6oupsjbO7DKmhwVVFlQQwyyCLi18KUvJMp+iohLqOpolh7ly1f8kRu
 OjPsemy+EJCaCbnW77/KwbGtSlXcHotIFls3Z5W7sybm5Yn9An5MGKcDhd89rG4QzWMR
 4RhP2M+LPd4wMW+F3LPTMvGWXB/hsLG+7MyTYtpL8P5AMRf03dZlCzidY9CnpY0KlyD5
 CS5w==
X-Gm-Message-State: AOAM532B52jYW3BwkUm4klT9C3K5PmV8Wg5fZxSbnX6NL5YZUM7Y8F1b
 ztXeR7q1Kvjc0cmwvuxaig1YBQ6Xq1ga
X-Google-Smtp-Source: ABdhPJyjVX27ds35IkYeoQIJsCb9P/mxeuyhXqgxOUKC5sFj+QfIr6P8ounIRWCJje4e6H6YgC+lpugLhJJ3
X-Received: by 2002:a05:6214:1927:: with SMTP id
 es7mr10601213qvb.166.1593492599301; 
 Mon, 29 Jun 2020 21:49:59 -0700 (PDT)
Date: Mon, 29 Jun 2020 21:49:42 -0700
In-Reply-To: <20200630044943.3425049-1-rajatja@google.com>
Message-Id: <20200630044943.3425049-7-rajatja@google.com>
Mime-Version: 1.0
References: <20200630044943.3425049-1-rajatja@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 6/7] PCI: Move pci_dev->untrusted logic to use device
 location instead
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

The firmware was provinding "ExternalFacing" attribute on PCI root ports,
to allow the kernel to mark devices behind it as external. Note that the
firmware provides an immutable, read-only property, i.e. the location of
the device.

The use of (external) device location as hint for (dis)trust, is a
decision that IOMMU drivers have taken, so we should call it out
explicitly.

This patch removes the pci_dev->untrusted and changes the users of it to
use device core provided device location instead. This location is
populated by PCI using the same "ExternalFacing" firmware info. Any
device not behind the "ExternalFacing" bridges are marked internal and
the ones behind such bridges are markes external.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v2: (Initial version)

 drivers/iommu/intel/iommu.c | 31 +++++++++++++++++++++----------
 drivers/pci/ats.c           |  2 +-
 drivers/pci/pci-driver.c    |  1 +
 drivers/pci/pci.c           |  2 +-
 drivers/pci/probe.c         | 18 ++++++++++++------
 drivers/pci/quirks.c        |  2 +-
 include/linux/pci.h         | 10 +---------
 7 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 1ccb224f82496..ca66a196f5e97 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -168,6 +168,22 @@ static inline unsigned long virt_to_dma_pfn(void *p)
 	return page_to_dma_pfn(virt_to_page(p));
 }
 
+static inline bool untrusted_dev(struct device *dev)
+{
+	/*
+	 * Treat all external PCI devices as untrusted devices. These are the
+	 * devices behing marked behind external-facing bridges as marked by
+	 * the firmware. The untrusted devices are the ones that can potentially
+	 * execute DMA attacks and similar. They are typically connected through
+	 * external thunderbolt ports. When an IOMMU is enabled they should be
+	 * getting full mappings to ensure they cannot access arbitrary memory.
+	 */
+	if (dev_is_pci(dev) && dev_is_external(dev))
+		return true;
+
+	return false;
+}
+
 /* global iommu list, set NULL for ignored DMAR units */
 static struct intel_iommu **g_iommus;
 
@@ -383,8 +399,7 @@ struct device_domain_info *get_domain_info(struct device *dev)
 DEFINE_SPINLOCK(device_domain_lock);
 static LIST_HEAD(device_domain_list);
 
-#define device_needs_bounce(d) (!intel_no_bounce && dev_is_pci(d) &&	\
-				to_pci_dev(d)->untrusted)
+#define device_needs_bounce(d) (!intel_no_bounce && untrusted_dev(d))
 
 /*
  * Iterate over elements in device_domain_list and call the specified
@@ -2830,7 +2845,7 @@ static int device_def_domain_type(struct device *dev)
 		 * Prevent any device marked as untrusted from getting
 		 * placed into the statically identity mapping domain.
 		 */
-		if (pdev->untrusted)
+		if (untrusted_dev(dev))
 			return IOMMU_DOMAIN_DMA;
 
 		if ((iommu_identity_mapping & IDENTMAP_AZALIA) && IS_AZALIA(pdev))
@@ -3464,7 +3479,6 @@ static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
 	unsigned long iova_pfn;
 	struct intel_iommu *iommu;
 	struct page *freelist;
-	struct pci_dev *pdev = NULL;
 
 	domain = find_domain(dev);
 	BUG_ON(!domain);
@@ -3477,11 +3491,8 @@ static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
 	start_pfn = mm_to_dma_pfn(iova_pfn);
 	last_pfn = start_pfn + nrpages - 1;
 
-	if (dev_is_pci(dev))
-		pdev = to_pci_dev(dev);
-
 	freelist = domain_unmap(domain, start_pfn, last_pfn);
-	if (intel_iommu_strict || (pdev && pdev->untrusted) ||
+	if (intel_iommu_strict || untrusted_dev(dev) ||
 			!has_iova_flush_queue(&domain->iovad)) {
 		iommu_flush_iotlb_psi(iommu, domain, start_pfn,
 				      nrpages, !freelist, 0);
@@ -4743,7 +4754,7 @@ static inline bool has_untrusted_dev(void)
 	struct pci_dev *pdev = NULL;
 
 	for_each_pci_dev(pdev)
-		if (pdev->untrusted || pdev->external_facing)
+		if (pdev->external_facing || untrusted_dev(&pdev->dev))
 			return true;
 
 	return false;
@@ -6036,7 +6047,7 @@ intel_iommu_domain_set_attr(struct iommu_domain *domain,
  */
 static bool risky_device(struct pci_dev *pdev)
 {
-	if (pdev->untrusted) {
+	if (untrusted_dev(&pdev->dev)) {
 		pci_info(pdev,
 			 "Skipping IOMMU quirk for dev [%04X:%04X] on untrusted PCI link\n",
 			 pdev->vendor, pdev->device);
diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index b761c1f72f672..ebd370f4d5b06 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -42,7 +42,7 @@ bool pci_ats_supported(struct pci_dev *dev)
 	if (!dev->ats_cap)
 		return false;
 
-	return (dev->untrusted == 0);
+	return (!dev_is_external(&dev->dev));
 }
 EXPORT_SYMBOL_GPL(pci_ats_supported);
 
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index da6510af12214..9608053a8a62c 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1630,6 +1630,7 @@ struct bus_type pci_bus_type = {
 	.pm		= PCI_PM_OPS_PTR,
 	.num_vf		= pci_bus_num_vf,
 	.dma_configure	= pci_dma_configure,
+	.supports_site	= true,
 };
 EXPORT_SYMBOL(pci_bus_type);
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 79853b52658a2..35f25ac39167b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3330,7 +3330,7 @@ static void pci_std_enable_acs(struct pci_dev *dev)
 	/* Upstream Forwarding */
 	ctrl |= (cap & PCI_ACS_UF);
 
-	if (dev->external_facing || dev->untrusted)
+	if (dev->external_facing || dev_is_external(&dev->dev))
 		/* Translation Blocking */
 		ctrl |= (cap & PCI_ACS_TB);
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 8c40c00413e74..1609329cc5b4e 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1543,17 +1543,23 @@ static void set_pcie_thunderbolt(struct pci_dev *dev)
 	}
 }
 
-static void set_pcie_untrusted(struct pci_dev *dev)
+static void set_pcie_dev_site(struct pci_dev *dev)
 {
 	struct pci_dev *parent;
 
 	/*
-	 * If the upstream bridge is untrusted we treat this device
-	 * untrusted as well.
+	 * All devices are considered internal by default, unless behind an
+	 * external-facing bridge, as marked by the firmware.
+	 */
+	dev_set_site(&dev->dev, SITE_INTERNAL);
+
+	/*
+	 * If the upstream bridge is external or external-facing, this device
+	 * is also external.
 	 */
 	parent = pci_upstream_bridge(dev);
-	if (parent && (parent->untrusted || parent->external_facing))
-		dev->untrusted = true;
+	if (parent && (parent->external_facing || dev_is_external(&parent->dev)))
+		dev_set_site(&dev->dev, SITE_EXTERNAL);
 }
 
 /**
@@ -1814,7 +1820,7 @@ int pci_setup_device(struct pci_dev *dev)
 	/* Need to have dev->cfg_size ready */
 	set_pcie_thunderbolt(dev);
 
-	set_pcie_untrusted(dev);
+	set_pcie_dev_site(dev);
 
 	/* "Unknown power state" */
 	dev->current_state = PCI_UNKNOWN;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 6294adeac4049..65d0b8745c915 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4980,7 +4980,7 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
 	ctrl |= (cap & PCI_ACS_CR);
 	ctrl |= (cap & PCI_ACS_UF);
 
-	if (dev->external_facing || dev->untrusted)
+	if (dev->external_facing || dev_is_external(&dev->dev))
 		/* Translation Blocking */
 		ctrl |= (cap & PCI_ACS_TB);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index fe1bc603fda40..8bb5065e5aed2 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -424,20 +424,12 @@ struct pci_dev {
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
 	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
-	/*
-	 * Devices marked being untrusted are the ones that can potentially
-	 * execute DMA attacks and similar. They are typically connected
-	 * through external ports such as Thunderbolt but not limited to
-	 * that. When an IOMMU is enabled they should be getting full
-	 * mappings to make sure they cannot access arbitrary memory.
-	 */
-	unsigned int	untrusted:1;
 	/*
 	 * Devices are marked as external-facing using info from platform
 	 * (ACPI / devicetree). An external-facing device is still an internal
 	 * trusted device, but it faces external untrusted devices. Thus any
 	 * devices enumerated downstream an external-facing device is marked
-	 * as untrusted.
+	 * as external device.
 	 */
 	unsigned int	external_facing:1;
 	unsigned int	broken_intx_masking:1;	/* INTx masking can't be used */
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
