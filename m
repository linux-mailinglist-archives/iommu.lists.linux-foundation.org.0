Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A506264457
	for <lists.iommu@lfdr.de>; Thu, 10 Sep 2020 12:43:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C30387046;
	Thu, 10 Sep 2020 10:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhcbBMQfUtTx; Thu, 10 Sep 2020 10:43:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6CB8584E6B;
	Thu, 10 Sep 2020 10:43:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CCE6C0051;
	Thu, 10 Sep 2020 10:43:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 874C6C0051
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 10:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7C92187507
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 10:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZIeVBxx7IEn for <iommu@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 10:43:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 48EB18742F
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 10:43:36 +0000 (UTC)
IronPort-SDR: fyGN8orZ//iq2XlReXY/DSiRAvZYAd6Kb9ZiiKT8oaWR8nqbOMHPw1lX50JXlV2HHYZu69wJGv
 nvcbs4LVNjow==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="138024908"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="138024908"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 03:43:35 -0700
IronPort-SDR: z/tjCvDoxY/xShbLCL/VbslXfBbwZznfbIBRqQgFok7okEcyIYeDSp4rNGuyKMXyetitYYS0PL
 lyblcrkwgGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="334137195"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 10 Sep 2020 03:43:34 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com, eric.auger@redhat.com,
 baolu.lu@linux.intel.com, joro@8bytes.org
Subject: [PATCH v7 06/16] iommu/vt-d: Remove get_task_mm() in bind_gpasid()
Date: Thu, 10 Sep 2020 03:45:23 -0700
Message-Id: <1599734733-6431-7-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599734733-6431-1-git-send-email-yi.l.liu@intel.com>
References: <1599734733-6431-1-git-send-email-yi.l.liu@intel.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, stefanha@gmail.com, jun.j.tian@intel.com,
 iommu@lists.linux-foundation.org, yi.y.sun@intel.com, jasowang@redhat.com,
 hao.wu@intel.com
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

This patch is to address a REVISIT. As ioasid_set is added to domain,
upper layer/VFIO can set ioasid_set to iommu driver, and track the
PASID ownership, so no need to get_task_mm() in intel_svm_bind_gpasid().

Cc: Kevin Tian <kevin.tian@intel.com>
CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 drivers/iommu/intel/svm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 519eabb..d3cf52b 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -400,12 +400,6 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 			ret = -ENOMEM;
 			goto out;
 		}
-		/* REVISIT: upper layer/VFIO can track host process that bind
-		 * the PASID. ioasid_set = mm might be sufficient for vfio to
-		 * check pasid VMM ownership. We can drop the following line
-		 * once VFIO and IOASID set check is in place.
-		 */
-		svm->mm = get_task_mm(current);
 		svm->pasid = data->hpasid;
 		if (data->flags & IOMMU_SVA_GPASID_VAL) {
 			svm->gpasid = data->gpasid;
@@ -420,7 +414,6 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 		INIT_WORK(&svm->work, intel_svm_free_async_fn);
 		ioasid_attach_data(data->hpasid, svm);
 		INIT_LIST_HEAD_RCU(&svm->devs);
-		mmput(svm->mm);
 	}
 	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
 	if (!sdev) {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
