Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE843C7E7
	for <lists.iommu@lfdr.de>; Wed, 27 Oct 2021 12:45:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E93F680EC8;
	Wed, 27 Oct 2021 10:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0v2h3naIDT3n; Wed, 27 Oct 2021 10:45:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DFFE380EC5;
	Wed, 27 Oct 2021 10:45:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBC3BC0036;
	Wed, 27 Oct 2021 10:45:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD530C000E
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 10:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC94D80EC8
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 10:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iFXtUCACKG9 for <iommu@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 10:45:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E48EE80EC5
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635331516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYKtuFeI92e2qzvw3oJX8Blw0OOiqQbveU+79Ggu+Ko=;
 b=buf6P+OudhSsi68x83hCwWGCdXqedivgp41QqQp1CacPGA7S6jVGozJ1x8TDnknFAeFcKD
 Tj2ZbHhreZvVMZTHecsqbBykFz7zd1l5D1CfBSGtsbqiNWw4XzAgD8WSvxKgtMLYyzG9TV
 eCVYLwPZiWK+aakGNy6tqxKKmBp2tcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-XEWrSar_PfGWmbj8tWOsww-1; Wed, 27 Oct 2021 06:45:13 -0400
X-MC-Unique: XEWrSar_PfGWmbj8tWOsww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD3A19200C0;
 Wed, 27 Oct 2021 10:45:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44FDC100E12D;
 Wed, 27 Oct 2021 10:44:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org,
 zhukeqian1@huawei.com
Subject: [RFC v16 2/9] iommu: Introduce iommu_get_nesting
Date: Wed, 27 Oct 2021 12:44:21 +0200
Message-Id: <20211027104428.1059740-3-eric.auger@redhat.com>
In-Reply-To: <20211027104428.1059740-1-eric.auger@redhat.com>
References: <20211027104428.1059740-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 maz@kernel.org, vivek.gautam@arm.com, alex.williamson@redhat.com,
 vsethi@nvidia.com, zhangfei.gao@linaro.org, lushenming@huawei.com,
 wangxingang5@huawei.com
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

Add iommu_get_nesting() which allow to retrieve whether a domain
uses nested stages.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  8 ++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  8 ++++++++
 drivers/iommu/intel/iommu.c                 | 13 +++++++++++++
 drivers/iommu/iommu.c                       | 10 ++++++++++
 include/linux/iommu.h                       |  8 ++++++++
 5 files changed, 47 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a388e318f86e..61477853a536 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2731,6 +2731,13 @@ static int arm_smmu_enable_nesting(struct iommu_domain *domain)
 	return ret;
 }
 
+static bool arm_smmu_get_nesting(struct iommu_domain *domain)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+
+	return smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED;
+}
+
 static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -2845,6 +2852,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
 	.enable_nesting		= arm_smmu_enable_nesting,
+	.get_nesting		= arm_smmu_get_nesting,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4bc75c4ce402..167cf1d51279 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1522,6 +1522,13 @@ static int arm_smmu_enable_nesting(struct iommu_domain *domain)
 	return ret;
 }
 
+static bool arm_smmu_get_nesting(struct iommu_domain *domain)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+
+	return smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED;
+}
+
 static int arm_smmu_set_pgtable_quirks(struct iommu_domain *domain,
 		unsigned long quirks)
 {
@@ -1595,6 +1602,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.probe_finalize		= arm_smmu_probe_finalize,
 	.device_group		= arm_smmu_device_group,
 	.enable_nesting		= arm_smmu_enable_nesting,
+	.get_nesting		= arm_smmu_get_nesting,
 	.set_pgtable_quirks	= arm_smmu_set_pgtable_quirks,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d75f59ae28e6..e42767bd47f9 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5524,6 +5524,18 @@ intel_iommu_enable_nesting(struct iommu_domain *domain)
 	return ret;
 }
 
+static bool intel_iommu_get_nesting(struct iommu_domain *domain)
+{
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	bool nesting;
+
+	spin_lock_irqsave(&device_domain_lock, flags);
+	nesting =  dmar_domain->flags & DOMAIN_FLAG_NESTING_MODE &&
+		   !(dmar_domain->flags & DOMAIN_FLAG_USE_FIRST_LEVEL);
+	spin_unlock_irqrestore(&device_domain_lock, flags);
+	return nesting;
+}
+
 /*
  * Check that the device does not live on an external facing PCI port that is
  * marked as untrusted. Such devices should not be able to apply quirks and
@@ -5561,6 +5573,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.domain_alloc		= intel_iommu_domain_alloc,
 	.domain_free		= intel_iommu_domain_free,
 	.enable_nesting		= intel_iommu_enable_nesting,
+	.get_nesting		= intel_iommu_get_nesting,
 	.attach_dev		= intel_iommu_attach_device,
 	.detach_dev		= intel_iommu_detach_device,
 	.aux_attach_dev		= intel_iommu_aux_attach_device,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 6033c263c6e6..3e639c4e8015 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2843,6 +2843,16 @@ int iommu_enable_nesting(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL_GPL(iommu_enable_nesting);
 
+bool iommu_get_nesting(struct iommu_domain *domain)
+{
+	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
+		return false;
+	if (!domain->ops->enable_nesting)
+		return false;
+	return domain->ops->get_nesting(domain);
+}
+EXPORT_SYMBOL_GPL(iommu_get_nesting);
+
 int iommu_set_pgtable_quirks(struct iommu_domain *domain,
 		unsigned long quirk)
 {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e34a1b1c805b..846e19151f40 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -213,6 +213,7 @@ struct iommu_iotlb_gather {
  *                  group and attached to the groups domain
  * @device_group: find iommu group for a particular device
  * @enable_nesting: Enable nesting
+ * @get_nesting: get whether the domain uses nested stages
  * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
  * @get_resv_regions: Request list of reserved regions for a device
  * @put_resv_regions: Free list of reserved regions for a device
@@ -271,6 +272,7 @@ struct iommu_ops {
 	void (*probe_finalize)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
 	int (*enable_nesting)(struct iommu_domain *domain);
+	bool (*get_nesting)(struct iommu_domain *domain);
 	int (*set_pgtable_quirks)(struct iommu_domain *domain,
 				  unsigned long quirks);
 
@@ -690,6 +692,7 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					void *drvdata);
 void iommu_sva_unbind_device(struct iommu_sva *handle);
 u32 iommu_sva_get_pasid(struct iommu_sva *handle);
+bool iommu_get_nesting(struct iommu_domain *domain);
 
 #else /* CONFIG_IOMMU_API */
 
@@ -1108,6 +1111,11 @@ static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
 {
 	return NULL;
 }
+
+static inline bool iommu_get_nesting(struct iommu_domain *domain)
+{
+	return false;
+}
 #endif /* CONFIG_IOMMU_API */
 
 /**
-- 
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
