Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F218061
	for <lists.iommu@lfdr.de>; Wed,  8 May 2019 21:20:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0059AE52;
	Wed,  8 May 2019 19:20:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E6BCEDCB
	for <iommu@lists.linux-foundation.org>;
	Wed,  8 May 2019 19:19:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9DF8387C
	for <iommu@lists.linux-foundation.org>;
	Wed,  8 May 2019 19:19:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2019 12:19:58 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2019 12:19:57 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] iommu/vt-d: Fix bind svm with multiple devices
Date: Wed,  8 May 2019 12:22:46 -0700
Message-Id: <1557343366-18686-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Raj Ashok <ashok.raj@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

If multiple devices try to bind to the same mm/PASID, we need to
set up first level PASID entries for all the devices. The current
code does not consider this case which results in failed DMA for
devices after the first bind.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reported-by: Mike Campin <mike.campin@intel.com>
---
 drivers/iommu/intel-svm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index 3a4b09a..f3d59d1 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -357,6 +357,21 @@ int intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct svm_dev_
 		}
 
 		list_add_tail(&svm->list, &global_svm_list);
+	} else {
+		/*
+		 * Binding a new device with existing PASID, need to setup
+		 * the PASID entry.
+		 */
+		spin_lock(&iommu->lock);
+		ret = intel_pasid_setup_first_level(iommu, dev,
+						mm ? mm->pgd : init_mm.pgd,
+						svm->pasid, FLPT_DEFAULT_DID,
+						mm ? 0 : PASID_FLAG_SUPERVISOR_MODE);
+		spin_unlock(&iommu->lock);
+		if (ret) {
+			kfree(sdev);
+			goto out;
+		}
 	}
 	list_add_rcu(&sdev->list, &svm->devs);
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
