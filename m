Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A218E89D
	for <lists.iommu@lfdr.de>; Sun, 22 Mar 2020 13:26:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 718128648C;
	Sun, 22 Mar 2020 12:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13RJCztE3YaX; Sun, 22 Mar 2020 12:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B193C864EC;
	Sun, 22 Mar 2020 12:26:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E542C0177;
	Sun, 22 Mar 2020 12:26:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B3E6C1D7E
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 12:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2AB86864D4
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 12:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BKm3o+XgbbD for <iommu@lists.linux-foundation.org>;
 Sun, 22 Mar 2020 12:26:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C6DA1865C1
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 12:26:24 +0000 (UTC)
IronPort-SDR: Diz5XthsrE+UsYPwssrYpGVEQMTuIodT1467zGdfvmfVwvNyI0TXYZG7qOf2SRZiIZkEgAUzhP
 FoyPbLXSXWpQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2020 05:26:23 -0700
IronPort-SDR: n+usVYSN9bVDhASoq4dNnClcMH2wws3t8OfgUpnS/JqtLHe1YyYt/DkSowJupqC+8CnPqami8x
 Qte9Jz14rSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,292,1580803200"; d="scan'208";a="239663876"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2020 05:26:23 -0700
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	eric.auger@redhat.com
Subject: [PATCH v1 5/8] vfio/type1: Report 1st-level/stage-1 format to
 userspace
Date: Sun, 22 Mar 2020 05:32:02 -0700
Message-Id: <1584880325-10561-6-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, jun.j.tian@intel.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, yi.y.sun@intel.com, hao.wu@intel.com
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

From: Liu Yi L <yi.l.liu@intel.com>

VFIO exposes IOMMU nesting translation (a.k.a dual stage translation)
capability to userspace. Thus applications like QEMU could support
vIOMMU with hardware's nesting translation capability for pass-through
devices. Before setting up nesting translation for pass-through devices,
QEMU and other applications need to learn the supported 1st-lvl/stage-1
translation structure format like page table format.

Take vSVA (virtual Shared Virtual Addressing) as an example, to support
vSVA for pass-through devices, QEMU setup nesting translation for pass-
through devices. The guest page table are configured to host as 1st-lvl/
stage-1 page table. Therefore, guest format should be compatible with
host side.

This patch reports the supported 1st-lvl/stage-1 page table format on the
current platform to userspace. QEMU and other alike applications should
use this format info when trying to setup IOMMU nesting translation on
host IOMMU.

Cc: Kevin Tian <kevin.tian@intel.com>
CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 drivers/vfio/vfio_iommu_type1.c | 56 +++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/vfio.h       |  1 +
 2 files changed, 57 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 9aa2a67..82a9e0b 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2234,11 +2234,66 @@ static int vfio_iommu_type1_pasid_free(struct vfio_iommu *iommu,
 	return ret;
 }
 
+static int vfio_iommu_get_stage1_format(struct vfio_iommu *iommu,
+					 u32 *stage1_format)
+{
+	struct vfio_domain *domain;
+	u32 format = 0, tmp_format = 0;
+	int ret;
+
+	mutex_lock(&iommu->lock);
+	if (list_empty(&iommu->domain_list)) {
+		mutex_unlock(&iommu->lock);
+		return -EINVAL;
+	}
+
+	list_for_each_entry(domain, &iommu->domain_list, next) {
+		if (iommu_domain_get_attr(domain->domain,
+			DOMAIN_ATTR_PASID_FORMAT, &format)) {
+			ret = -EINVAL;
+			format = 0;
+			goto out_unlock;
+		}
+		/*
+		 * format is always non-zero (the first format is
+		 * IOMMU_PASID_FORMAT_INTEL_VTD which is 1). For
+		 * the reason of potential different backed IOMMU
+		 * formats, here we expect to have identical formats
+		 * in the domain list, no mixed formats support.
+		 * return -EINVAL to fail the attempt of setup
+		 * VFIO_TYPE1_NESTING_IOMMU if non-identical formats
+		 * are detected.
+		 */
+		if (tmp_format && tmp_format != format) {
+			ret = -EINVAL;
+			format = 0;
+			goto out_unlock;
+		}
+
+		tmp_format = format;
+	}
+	ret = 0;
+
+out_unlock:
+	if (format)
+		*stage1_format = format;
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
 static int vfio_iommu_info_add_nesting_cap(struct vfio_iommu *iommu,
 					 struct vfio_info_cap *caps)
 {
 	struct vfio_info_cap_header *header;
 	struct vfio_iommu_type1_info_cap_nesting *nesting_cap;
+	u32 formats = 0;
+	int ret;
+
+	ret = vfio_iommu_get_stage1_format(iommu, &formats);
+	if (ret) {
+		pr_warn("Failed to get stage-1 format\n");
+		return ret;
+	}
 
 	header = vfio_info_cap_add(caps, sizeof(*nesting_cap),
 				   VFIO_IOMMU_TYPE1_INFO_CAP_NESTING, 1);
@@ -2254,6 +2309,7 @@ static int vfio_iommu_info_add_nesting_cap(struct vfio_iommu *iommu,
 		/* nesting iommu type supports PASID requests (alloc/free) */
 		nesting_cap->nesting_capabilities |= VFIO_IOMMU_PASID_REQS;
 	}
+	nesting_cap->stage1_formats = formats;
 
 	return 0;
 }
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index ed9881d..ebeaf3e 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -763,6 +763,7 @@ struct vfio_iommu_type1_info_cap_nesting {
 	struct	vfio_info_cap_header header;
 #define VFIO_IOMMU_PASID_REQS	(1 << 0)
 	__u32	nesting_capabilities;
+	__u32	stage1_formats;
 };
 
 #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
