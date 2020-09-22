Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB10D273A9B
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 08:17:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6015021543;
	Tue, 22 Sep 2020 06:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyY+RnZNNpZK; Tue, 22 Sep 2020 06:17:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6DFD0226E9;
	Tue, 22 Sep 2020 06:17:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 595B4C0051;
	Tue, 22 Sep 2020 06:17:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C41D0C0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C0B7485AA1
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bzpjcaUexKqv for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 06:17:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 57E8385BEE
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:17:10 +0000 (UTC)
IronPort-SDR: F9QKbzPL/qJo3Y91g+IUUOenJR6SCnOO5L7gp11pVxAe4xUa89pw8Mrav/159sOrzVBBYowHE4
 z7KAxJAM35tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148206710"
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; d="scan'208";a="148206710"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 23:17:09 -0700
IronPort-SDR: vx0uJLVWEl95aHT1KuxIUA+fg3G/YT09cw/01+8KQGLzGppvXrxrY/Kp+kJQsXKDfbyxXO5VKx
 kdm7kFHcV2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; d="scan'208";a="334877518"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2020 23:17:06 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v5 5/5] iommu/vt-d: Add is_aux_domain support
Date: Tue, 22 Sep 2020 14:10:42 +0800
Message-Id: <20200922061042.31633-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922061042.31633-1-baolu.lu@linux.intel.com>
References: <20200922061042.31633-1-baolu.lu@linux.intel.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

With subdevice information opt-in through iommu_ops.aux_at(de)tach_dev()
interfaces, the vendor iommu driver is able to learn the knowledge about
the relationships between the subdevices and the aux-domains. Implement
is_aux_domain() support based on the relationship knowledges.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 129 ++++++++++++++++++++++++++----------
 include/linux/intel-iommu.h |  17 +++--
 2 files changed, 105 insertions(+), 41 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 86142ce32f21..9ba314e2872f 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -334,6 +334,8 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 				     struct device *dev);
 static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
 					    dma_addr_t iova);
+static bool intel_iommu_dev_feat_enabled(struct device *dev,
+					 enum iommu_dev_features feat);
 
 #ifdef CONFIG_INTEL_IOMMU_DEFAULT_ON
 int dmar_disabled = 0;
@@ -1881,6 +1883,7 @@ static struct dmar_domain *alloc_domain(int flags)
 		domain->flags |= DOMAIN_FLAG_USE_FIRST_LEVEL;
 	domain->has_iotlb_device = false;
 	INIT_LIST_HEAD(&domain->devices);
+	INIT_LIST_HEAD(&domain->subdevices);
 
 	return domain;
 }
@@ -2629,7 +2632,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 	info->iommu = iommu;
 	info->pasid_table = NULL;
 	info->auxd_enabled = 0;
-	INIT_LIST_HEAD(&info->auxiliary_domains);
+	INIT_LIST_HEAD(&info->subdevices);
 
 	if (dev && dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(info->dev);
@@ -5152,21 +5155,28 @@ static void intel_iommu_domain_free(struct iommu_domain *domain)
 		domain_exit(to_dmar_domain(domain));
 }
 
-/*
- * Check whether a @domain could be attached to the @dev through the
- * aux-domain attach/detach APIs.
- */
-static inline bool
-is_aux_domain(struct device *dev, struct iommu_domain *domain)
+/* Lookup subdev_info in the domain's subdevice siblings. */
+static struct subdev_info *
+subdev_lookup_domain(struct dmar_domain *domain, struct device *dev,
+		     struct device *subdev)
 {
-	struct device_domain_info *info = get_domain_info(dev);
+	struct subdev_info *sinfo = NULL, *tmp;
+
+	assert_spin_locked(&device_domain_lock);
+
+	list_for_each_entry(tmp, &domain->subdevices, link_domain) {
+		if ((!dev || tmp->pdev == dev) && tmp->dev == subdev) {
+			sinfo = tmp;
+			break;
+		}
+	}
 
-	return info && info->auxd_enabled &&
-			domain->type == IOMMU_DOMAIN_UNMANAGED;
+	return sinfo;
 }
 
-static void auxiliary_link_device(struct dmar_domain *domain,
-				  struct device *dev)
+static void
+subdev_link_device(struct dmar_domain *domain, struct device *dev,
+		   struct subdev_info *sinfo)
 {
 	struct device_domain_info *info = get_domain_info(dev);
 
@@ -5174,12 +5184,13 @@ static void auxiliary_link_device(struct dmar_domain *domain,
 	if (WARN_ON(!info))
 		return;
 
-	domain->auxd_refcnt++;
-	list_add(&domain->auxd, &info->auxiliary_domains);
+	list_add(&sinfo->link_phys, &info->subdevices);
+	list_add(&sinfo->link_domain, &domain->subdevices);
 }
 
-static void auxiliary_unlink_device(struct dmar_domain *domain,
-				    struct device *dev)
+static void
+subdev_unlink_device(struct dmar_domain *domain, struct device *dev,
+		     struct subdev_info *sinfo)
 {
 	struct device_domain_info *info = get_domain_info(dev);
 
@@ -5187,24 +5198,26 @@ static void auxiliary_unlink_device(struct dmar_domain *domain,
 	if (WARN_ON(!info))
 		return;
 
-	list_del(&domain->auxd);
-	domain->auxd_refcnt--;
-
-	if (!domain->auxd_refcnt && domain->default_pasid > 0)
-		ioasid_free(domain->default_pasid);
+	list_del(&sinfo->link_phys);
+	list_del(&sinfo->link_domain);
 }
 
-static int aux_domain_add_dev(struct dmar_domain *domain,
-			      struct device *dev)
+static int aux_domain_add_dev(struct dmar_domain *domain, struct device *dev,
+			      struct device *subdev)
 {
 	int ret;
 	unsigned long flags;
 	struct intel_iommu *iommu;
+	struct subdev_info *sinfo;
 
 	iommu = device_to_iommu(dev, NULL, NULL);
 	if (!iommu)
 		return -ENODEV;
 
+	sinfo = kzalloc(sizeof(*sinfo), GFP_KERNEL);
+	if (!sinfo)
+		return -ENOMEM;
+
 	if (domain->default_pasid <= 0) {
 		int pasid;
 
@@ -5214,7 +5227,8 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
 				     NULL);
 		if (pasid == INVALID_IOASID) {
 			pr_err("Can't allocate default pasid\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto pasid_failed;
 		}
 		domain->default_pasid = pasid;
 	}
@@ -5240,7 +5254,10 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
 		goto table_failed;
 	spin_unlock(&iommu->lock);
 
-	auxiliary_link_device(domain, dev);
+	sinfo->dev = subdev;
+	sinfo->domain = domain;
+	sinfo->pdev = dev;
+	subdev_link_device(domain, dev, sinfo);
 
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 
@@ -5251,27 +5268,36 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
 attach_failed:
 	spin_unlock(&iommu->lock);
 	spin_unlock_irqrestore(&device_domain_lock, flags);
-	if (!domain->auxd_refcnt && domain->default_pasid > 0)
+	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
 		ioasid_free(domain->default_pasid);
+pasid_failed:
+	kfree(sinfo);
 
 	return ret;
 }
 
-static void aux_domain_remove_dev(struct dmar_domain *domain,
-				  struct device *dev)
+static void
+aux_domain_remove_dev(struct dmar_domain *domain, struct device *dev,
+		      struct device *subdev)
 {
 	struct device_domain_info *info;
 	struct intel_iommu *iommu;
+	struct subdev_info *sinfo;
 	unsigned long flags;
 
-	if (!is_aux_domain(dev, &domain->domain))
+	if (!intel_iommu_dev_feat_enabled(dev, IOMMU_DEV_FEAT_AUX) ||
+	    domain->domain.type != IOMMU_DOMAIN_UNMANAGED)
 		return;
 
 	spin_lock_irqsave(&device_domain_lock, flags);
 	info = get_domain_info(dev);
 	iommu = info->iommu;
-
-	auxiliary_unlink_device(domain, dev);
+	sinfo = subdev_lookup_domain(domain, dev, subdev);
+	if (!sinfo) {
+		spin_unlock_irqrestore(&device_domain_lock, flags);
+		return;
+	}
+	subdev_unlink_device(domain, dev, sinfo);
 
 	spin_lock(&iommu->lock);
 	intel_pasid_tear_down_entry(iommu, dev, domain->default_pasid, false);
@@ -5279,6 +5305,10 @@ static void aux_domain_remove_dev(struct dmar_domain *domain,
 	spin_unlock(&iommu->lock);
 
 	spin_unlock_irqrestore(&device_domain_lock, flags);
+
+	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
+		ioasid_free(domain->default_pasid);
+	kfree(sinfo);
 }
 
 static int prepare_domain_attach_device(struct iommu_domain *domain,
@@ -5334,7 +5364,8 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 		return -EPERM;
 	}
 
-	if (is_aux_domain(dev, domain))
+	if (intel_iommu_dev_feat_enabled(dev, IOMMU_DEV_FEAT_AUX) &&
+	    domain->type == IOMMU_DOMAIN_UNMANAGED)
 		return -EPERM;
 
 	/* normally dev is not mapped */
@@ -5359,14 +5390,15 @@ intel_iommu_aux_attach_device(struct iommu_domain *domain,
 {
 	int ret;
 
-	if (!is_aux_domain(dev, domain))
+	if (!intel_iommu_dev_feat_enabled(dev, IOMMU_DEV_FEAT_AUX) ||
+	    domain->type != IOMMU_DOMAIN_UNMANAGED)
 		return -EPERM;
 
 	ret = prepare_domain_attach_device(domain, dev);
 	if (ret)
 		return ret;
 
-	return aux_domain_add_dev(to_dmar_domain(domain), dev);
+	return aux_domain_add_dev(to_dmar_domain(domain), dev, subdev);
 }
 
 static void intel_iommu_detach_device(struct iommu_domain *domain,
@@ -5379,7 +5411,7 @@ static void
 intel_iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev,
 			      struct device *subdev)
 {
-	aux_domain_remove_dev(to_dmar_domain(domain), dev);
+	aux_domain_remove_dev(to_dmar_domain(domain), dev, subdev);
 }
 
 /*
@@ -6035,6 +6067,32 @@ static bool intel_iommu_is_attach_deferred(struct iommu_domain *domain,
 	return attach_deferred(dev);
 }
 
+static int
+intel_iommu_domain_get_attr(struct iommu_domain *domain,
+			    enum iommu_attr attr, void *data)
+{
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	unsigned long flags;
+	int ret;
+
+	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
+		return -EINVAL;
+
+	switch (attr) {
+	case DOMAIN_ATTR_IS_AUX:
+		spin_lock_irqsave(&device_domain_lock, flags);
+		ret = !IS_ERR_OR_NULL(subdev_lookup_domain(dmar_domain,
+							   NULL, data));
+		spin_unlock_irqrestore(&device_domain_lock, flags);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static int
 intel_iommu_domain_set_attr(struct iommu_domain *domain,
 			    enum iommu_attr attr, void *data)
@@ -6088,6 +6146,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.domain_alloc		= intel_iommu_domain_alloc,
 	.domain_free		= intel_iommu_domain_free,
 	.domain_set_attr	= intel_iommu_domain_set_attr,
+	.domain_get_attr	= intel_iommu_domain_get_attr,
 	.attach_dev		= intel_iommu_attach_device,
 	.detach_dev		= intel_iommu_detach_device,
 	.aux_attach_dev		= intel_iommu_aux_attach_device,
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 6a3ddaabf3f5..3b112356c6ea 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -526,11 +526,9 @@ struct dmar_domain {
 					/* Domain ids per IOMMU. Use u16 since
 					 * domain ids are 16 bit wide according
 					 * to VT-d spec, section 9.3 */
-	unsigned int	auxd_refcnt;	/* Refcount of auxiliary attaching */
-
 	bool has_iotlb_device;
 	struct list_head devices;	/* all devices' list */
-	struct list_head auxd;		/* link to device's auxiliary list */
+	struct list_head subdevices;	/* all subdevices' list */
 	struct iova_domain iovad;	/* iova's that belong to this domain */
 
 	struct dma_pte	*pgd;		/* virtual address */
@@ -603,14 +601,21 @@ struct intel_iommu {
 	struct dmar_drhd_unit *drhd;
 };
 
+/* Per subdevice private data */
+struct subdev_info {
+	struct list_head link_phys;	/* link to phys device siblings */
+	struct list_head link_domain;	/* link to domain siblings */
+	struct device *pdev;		/* physical device derived from */
+	struct device *dev;		/* subdevice node */
+	struct dmar_domain *domain;	/* aux-domain */
+};
+
 /* PCI domain-device relationship */
 struct device_domain_info {
 	struct list_head link;	/* link to domain siblings */
 	struct list_head global; /* link to global list */
 	struct list_head table;	/* link to pasid table */
-	struct list_head auxiliary_domains; /* auxiliary domains
-					     * attached to this device
-					     */
+	struct list_head subdevices; /* subdevices sibling */
 	u32 segment;		/* PCI segment number */
 	u8 bus;			/* PCI bus number */
 	u8 devfn;		/* PCI devfn number */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
