Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9829CD73
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 02:57:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CDF9B86987;
	Wed, 28 Oct 2020 01:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGQG4_szc3tb; Wed, 28 Oct 2020 01:57:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 66C3786992;
	Wed, 28 Oct 2020 01:57:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5406BC0051;
	Wed, 28 Oct 2020 01:57:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC932C0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BBB622049B
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUDBODGWRncw for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 01:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 65CE2203FF
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:47 +0000 (UTC)
IronPort-SDR: OAmu04RzZh0lQGEp0fPrHY8wfgFnzERfT33jcqZ4aH+qH8bpvmXlVKd+cadxAKbYCb5Gbu1Ri+
 YyFtUGQFsVDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="185942619"
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="185942619"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 18:57:45 -0700
IronPort-SDR: l68km0f1HGCR1GONPp+2zpe2QT1f029zQ0jPlAmh1psYOKvt5NUUMummNS0tnmJki0jkfJuFo9
 TpJxRJLVfO/Q==
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="468554099"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.145.59])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 27 Oct 2020 18:57:43 -0700
From: Yi Sun <yi.y.sun@linux.intel.com>
To: joro@8bytes.org,
	dwmw2@infradead.org,
	baolu.lu@linux.intel.com
Subject: [PATCH v1 1/3] iommu/vt-d: Fix prq reporting issues
Date: Wed, 28 Oct 2020 09:36:56 +0800
Message-Id: <1603849018-6578-2-git-send-email-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603849018-6578-1-git-send-email-yi.y.sun@linux.intel.com>
References: <1603849018-6578-1-git-send-email-yi.y.sun@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, Yi Sun <yi.y.sun@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Should get correct sid and set it into sdev. Because we execute
'sdev->sid != req->rid' in the loop of prq_event_thread().

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
---
 drivers/iommu/intel/svm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index f1861fa..75d9dc9 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -277,6 +277,7 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 			  struct iommu_gpasid_bind_data *data)
 {
 	struct intel_iommu *iommu = device_to_iommu(dev, NULL, NULL);
+	struct device_domain_info *info;
 	struct intel_svm_dev *sdev = NULL;
 	struct dmar_domain *dmar_domain;
 	struct intel_svm *svm = NULL;
@@ -357,6 +358,8 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 		goto out;
 	}
 	sdev->dev = dev;
+	info = get_domain_info(dev);
+	sdev->sid = PCI_DEVID(info->bus, info->devfn);
 
 	/* Only count users if device has aux domains */
 	if (iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX))
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
