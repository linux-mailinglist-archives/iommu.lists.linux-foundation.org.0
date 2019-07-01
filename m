Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3583A362
	for <lists.iommu@lfdr.de>; Sun,  9 Jun 2019 04:45:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A1D8DBA4;
	Sun,  9 Jun 2019 02:45:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ABA7AB7D
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 02:45:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 63A7B174
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 02:45:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2019 19:45:34 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2019 19:45:32 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/6] iommu/vt-d: Don't enable iommu's which have been ignored
Date: Sun,  9 Jun 2019 10:38:00 +0800
Message-Id: <20190609023803.23832-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190609023803.23832-1-baolu.lu@linux.intel.com>
References: <20190609023803.23832-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, cai@lca.pw, jacob.jun.pan@intel.com
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

The iommu driver will ignore some iommu units if there's no
device under its scope or those devices have been explicitly
set to bypass the DMA translation. Don't enable those iommu
units, otherwise the devices under its scope won't work.

Fixes: d8190dc638866 ("iommu/vt-d: Enable DMA remapping after rmrr mapped")
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index d1a82039e835..5251533a18a4 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3232,7 +3232,12 @@ static int __init init_dmars(void)
 		goto error;
 	}
 
-	for_each_active_iommu(iommu, drhd) {
+	for_each_iommu(iommu, drhd) {
+		if (drhd->ignored) {
+			iommu_disable_translation(iommu);
+			continue;
+		}
+
 		/*
 		 * Find the max pasid size of all IOMMU's in the system.
 		 * We need to ensure the system pasid table is no bigger
@@ -4793,7 +4798,7 @@ int __init intel_iommu_init(void)
 
 	/* Finally, we enable the DMA remapping hardware. */
 	for_each_iommu(iommu, drhd) {
-		if (!translation_pre_enabled(iommu))
+		if (!drhd->ignored && !translation_pre_enabled(iommu))
 			iommu_enable_translation(iommu);
 
 		iommu_disable_protect_mem_regions(iommu);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
