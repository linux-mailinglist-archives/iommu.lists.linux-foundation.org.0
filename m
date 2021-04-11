Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F3835B36A
	for <lists.iommu@lfdr.de>; Sun, 11 Apr 2021 13:14:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4644608DC;
	Sun, 11 Apr 2021 11:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlRirOyMFOAf; Sun, 11 Apr 2021 11:14:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2963605C1;
	Sun, 11 Apr 2021 11:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CA2EC000A;
	Sun, 11 Apr 2021 11:14:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F684C000A
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EDDA608DC
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUmOHl-jeynX for <iommu@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 11:14:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61D48605C1
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618139648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cFlj/1AeQfl9sLv9z3wLrqxiFp8jmwkjiJsT07pmm8=;
 b=Zz+555JyMPQv9QobC0/5SW5Ye09ltJ4sgX4FzSzd8UpvyPtJoMbDUcpBzEb+Brcqx5kk/p
 cMZWG9O5f2hPUeR1n6mrKonCQnmi8W0zybmLPxBUKtxDjOSer94r/JsOnu1JEDmhosjFE5
 PSh3t9l8NRxSdQ30UhKMSLfekLAZ4rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318---LZYghMOO-qmosDt4pXtg-1; Sun, 11 Apr 2021 07:14:04 -0400
X-MC-Unique: --LZYghMOO-qmosDt4pXtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CDED80D6A8;
 Sun, 11 Apr 2021 11:14:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E76B100164A;
 Sun, 11 Apr 2021 11:13:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 maz@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 alex.williamson@redhat.com, tn@semihalf.com, zhukeqian1@huawei.com
Subject: [PATCH v15 07/12] iommu/smmuv3: Implement cache_invalidate
Date: Sun, 11 Apr 2021 13:12:23 +0200
Message-Id: <20210411111228.14386-8-eric.auger@redhat.com>
In-Reply-To: <20210411111228.14386-1-eric.auger@redhat.com>
References: <20210411111228.14386-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: jean-philippe@linaro.org, wangxingang5@huawei.com, lushenming@huawei.com,
 vivek.gautam@arm.com, vsethi@nvidia.com, zhangfei.gao@linaro.org,
 jiangkunkun@huawei.com
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

Implement domain-selective, pasid selective and page-selective
IOTLB invalidations.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v15:
- remove the redundant arm_smmu_cmdq_issue_sync(smmu)
  in IOMMU_INV_GRANU_ADDR case (Zenghui)
- if RIL is not supported by the host, make sure the granule_size
  that is passed by the userspace is supported or fix it
  (Chenxiang)

v13 -> v14:
- Add domain invalidation
- do global inval when asid is not provided with addr
  granularity

v7 -> v8:
- ASID based invalidation using iommu_inv_pasid_info
- check ARCHID/PASID flags in addr based invalidation
- use __arm_smmu_tlb_inv_context and __arm_smmu_tlb_inv_range_nosync

v6 -> v7
- check the uapi version

v3 -> v4:
- adapt to changes in the uapi
- add support for leaf parameter
- do not use arm_smmu_tlb_inv_range_nosync or arm_smmu_tlb_inv_context
  anymore

v2 -> v3:
- replace __arm_smmu_tlb_sync by arm_smmu_cmdq_issue_sync

v1 -> v2:
- properly pass the asid
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 89 +++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 56a301fbe75a..bfc112cc0d38 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2961,6 +2961,94 @@ static void arm_smmu_detach_pasid_table(struct iommu_domain *domain)
 	mutex_unlock(&smmu_domain->init_mutex);
 }
 
+static int
+arm_smmu_cache_invalidate(struct iommu_domain *domain, struct device *dev,
+			  struct iommu_cache_invalidate_info *inv_info)
+{
+	struct arm_smmu_cmdq_ent cmd = {.opcode = CMDQ_OP_TLBI_NSNH_ALL};
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+
+	if (smmu_domain->stage != ARM_SMMU_DOMAIN_NESTED)
+		return -EINVAL;
+
+	if (!smmu)
+		return -EINVAL;
+
+	if (inv_info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
+		return -EINVAL;
+
+	if (inv_info->cache & IOMMU_CACHE_INV_TYPE_PASID ||
+	    inv_info->cache & IOMMU_CACHE_INV_TYPE_DEV_IOTLB) {
+		return -ENOENT;
+	}
+
+	if (!(inv_info->cache & IOMMU_CACHE_INV_TYPE_IOTLB))
+		return -EINVAL;
+
+	/* IOTLB invalidation */
+
+	switch (inv_info->granularity) {
+	case IOMMU_INV_GRANU_PASID:
+	{
+		struct iommu_inv_pasid_info *info =
+			&inv_info->granu.pasid_info;
+
+		if (info->flags & IOMMU_INV_ADDR_FLAGS_PASID)
+			return -ENOENT;
+		if (!(info->flags & IOMMU_INV_PASID_FLAGS_ARCHID))
+			return -EINVAL;
+
+		__arm_smmu_tlb_inv_context(smmu_domain, info->archid);
+		return 0;
+	}
+	case IOMMU_INV_GRANU_ADDR:
+	{
+		struct iommu_inv_addr_info *info = &inv_info->granu.addr_info;
+		size_t granule_size  = info->granule_size;
+		size_t size = info->nb_granules * info->granule_size;
+		bool leaf = info->flags & IOMMU_INV_ADDR_FLAGS_LEAF;
+		int tg;
+
+		if (info->flags & IOMMU_INV_ADDR_FLAGS_PASID)
+			return -ENOENT;
+
+		if (!(info->flags & IOMMU_INV_ADDR_FLAGS_ARCHID))
+			break;
+
+		tg = __ffs(granule_size);
+		if (granule_size & ~(1 << tg))
+			return -EINVAL;
+		/*
+		 * When RIL is not supported, make sure the granule size that is
+		 * passed is supported. In RIL mode, this is enforced in
+		 * __arm_smmu_tlb_inv_range()
+		 */
+		if (!(smmu->features & ARM_SMMU_FEAT_RANGE_INV) &&
+		    !(granule_size & smmu_domain->domain.pgsize_bitmap)) {
+			tg = __ffs(smmu_domain->domain.pgsize_bitmap);
+			granule_size = 1 << tg;
+			size = size >> tg;
+		}
+
+		arm_smmu_tlb_inv_range_domain(info->addr, size,
+					      granule_size, leaf,
+					      info->archid, smmu_domain);
+		return 0;
+	}
+	case IOMMU_INV_GRANU_DOMAIN:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Global S1 invalidation */
+	cmd.tlbi.vmid   = smmu_domain->s2_cfg.vmid;
+	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
+	arm_smmu_cmdq_issue_sync(smmu);
+	return 0;
+}
+
 static bool arm_smmu_dev_has_feature(struct device *dev,
 				     enum iommu_dev_features feat)
 {
@@ -3060,6 +3148,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.attach_pasid_table	= arm_smmu_attach_pasid_table,
 	.detach_pasid_table	= arm_smmu_detach_pasid_table,
+	.cache_invalidate	= arm_smmu_cache_invalidate,
 	.dev_has_feat		= arm_smmu_dev_has_feature,
 	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
 	.dev_enable_feat	= arm_smmu_dev_enable_feature,
-- 
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
