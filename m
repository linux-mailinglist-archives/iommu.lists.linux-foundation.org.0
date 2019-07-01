Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D921A24912
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 09:37:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1ABFFAEF;
	Tue, 21 May 2019 07:37:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 829C8AC8
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 07:37:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0A9D36C5
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 07:37:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2019 00:37:11 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by orsmga005.jf.intel.com with ESMTP; 21 May 2019 00:37:09 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: joro@8bytes.org,
	dwmw2@infradead.org
Subject: [PATCH 1/2] iommu/vt-d: Fix lock inversion between iommu->lock and
	device_domain_lock
Date: Tue, 21 May 2019 15:30:15 +0800
Message-Id: <20190521073016.27525-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
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

From: Dave Jiang <dave.jiang@intel.com>

Lockdep debug reported lock inversion related with the iommu code
caused by dmar_insert_one_dev_info() grabbing the iommu->lock and
the device_domain_lock out of order versus the code path in
iommu_flush_dev_iotlb(). Expanding the scope of the iommu->lock and
reversing the order of lock acquisition fixes the issue.

[   76.238180] dsa_bus wq0.0: dsa wq wq0.0 disabled
[   76.248706]
[   76.250486] ========================================================
[   76.257113] WARNING: possible irq lock inversion dependency detected
[   76.263736] 5.1.0-rc5+ #162 Not tainted
[   76.267854] --------------------------------------------------------
[   76.274485] systemd-journal/521 just changed the state of lock:
[   76.280685] 0000000055b330f5 (device_domain_lock){..-.}, at: iommu_flush_dev_iotlb.part.63+0x29/0x90
[   76.290099] but this lock took another, SOFTIRQ-unsafe lock in the past:
[   76.297093]  (&(&iommu->lock)->rlock){+.+.}
[   76.297094]
[   76.297094]
[   76.297094] and interrupts could create inverse lock ordering between them.
[   76.297094]
[   76.314257]
[   76.314257] other info that might help us debug this:
[   76.321448]  Possible interrupt unsafe locking scenario:
[   76.321448]
[   76.328907]        CPU0                    CPU1
[   76.333777]        ----                    ----
[   76.338642]   lock(&(&iommu->lock)->rlock);
[   76.343165]                                local_irq_disable();
[   76.349422]                                lock(device_domain_lock);
[   76.356116]                                lock(&(&iommu->lock)->rlock);
[   76.363154]   <Interrupt>
[   76.366134]     lock(device_domain_lock);
[   76.370548]
[   76.370548]  *** DEADLOCK ***

Fixes: 745f2586e78e ("iommu/vt-d: Simplify function get_domain_for_dev()")
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index a209199f3af6..91f4912c09c6 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2512,6 +2512,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 		}
 	}
 
+	spin_lock(&iommu->lock);
 	spin_lock_irqsave(&device_domain_lock, flags);
 	if (dev)
 		found = find_domain(dev);
@@ -2527,17 +2528,16 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 
 	if (found) {
 		spin_unlock_irqrestore(&device_domain_lock, flags);
+		spin_unlock(&iommu->lock);
 		free_devinfo_mem(info);
 		/* Caller must free the original domain */
 		return found;
 	}
 
-	spin_lock(&iommu->lock);
 	ret = domain_attach_iommu(domain, iommu);
-	spin_unlock(&iommu->lock);
-
 	if (ret) {
 		spin_unlock_irqrestore(&device_domain_lock, flags);
+		spin_unlock(&iommu->lock);
 		free_devinfo_mem(info);
 		return NULL;
 	}
@@ -2547,6 +2547,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 	if (dev)
 		dev->archdata.iommu = info;
 	spin_unlock_irqrestore(&device_domain_lock, flags);
+	spin_unlock(&iommu->lock);
 
 	/* PASID table is mandatory for a PCI device in scalable mode. */
 	if (dev && dev_is_pci(dev) && sm_supported(iommu)) {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
