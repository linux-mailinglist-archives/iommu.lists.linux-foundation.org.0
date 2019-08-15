Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D338F563
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 22:10:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 42F7A123F;
	Thu, 15 Aug 2019 20:09:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6DC5B11E5
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 20:09:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E167E8A6
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 20:09:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2019 13:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="188596202"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2019 13:09:42 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v5 02/19] iommu: handle page response timeout
Date: Thu, 15 Aug 2019 13:13:08 -0700
Message-Id: <1565900005-62508-3-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565900005-62508-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1565900005-62508-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Jonathan Cameron <jic23@kernel.org>
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

When IO page faults are reported outside IOMMU subsystem, the page
request handler may fail for various reasons. E.g. a guest received
page requests but did not have a chance to run for a long time. The
irresponsive behavior could hold off limited resources on the pending
device.
There can be hardware or credit based software solutions as suggested
in the PCI ATS Ch-4. To provide a basic safty net this patch
introduces a per device deferrable timer which monitors the longest
pending page fault that requires a response. Proper action such as
sending failure response code could be taken when timer expires but not
included in this patch. We need to consider the life cycle of page
groupd ID to prevent confusion with reused group ID by a device.
For now, a warning message provides clue of such failure.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Ashok Raj <ashok.raj@intel.com>
---
 drivers/iommu/iommu.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/iommu.h |  4 ++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 5b26499..8f2c7d5 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -909,6 +909,39 @@ int iommu_group_unregister_notifier(struct iommu_group *group,
 }
 EXPORT_SYMBOL_GPL(iommu_group_unregister_notifier);
 
+static void iommu_dev_fault_timer_fn(struct timer_list *t)
+{
+	struct iommu_fault_param *fparam = from_timer(fparam, t, timer);
+	struct iommu_fault_event *evt;
+	struct iommu_fault_page_request *prm;
+
+	u64 now;
+
+	now = get_jiffies_64();
+
+	/* The goal is to ensure driver or guest page fault handler(via vfio)
+	 * send page response on time. Otherwise, limited queue resources
+	 * may be occupied by some irresponsive guests or drivers.
+	 * When per device pending fault list is not empty, we periodically checks
+	 * if any anticipated page response time has expired.
+	 *
+	 * TODO:
+	 * We could do the following if response time expires:
+	 * 1. send page response code FAILURE to all pending PRQ
+	 * 2. inform device driver or vfio
+	 * 3. drain in-flight page requests and responses for this device
+	 * 4. clear pending fault list such that driver can unregister fault
+	 *    handler(otherwise blocked when pending faults are present).
+	 */
+	list_for_each_entry(evt, &fparam->faults, list) {
+		prm = &evt->fault.prm;
+		if (time_after64(now, evt->expire))
+			pr_err("Page response time expired!, pasid %d gid %d exp %llu now %llu\n",
+				prm->pasid, prm->grpid, evt->expire, now);
+	}
+	mod_timer(t, now + prq_timeout);
+}
+
 /**
  * iommu_register_device_fault_handler() - Register a device fault handler
  * @dev: the device
@@ -956,6 +989,9 @@ int iommu_register_device_fault_handler(struct device *dev,
 	mutex_init(&param->fault_param->lock);
 	INIT_LIST_HEAD(&param->fault_param->faults);
 
+	if (prq_timeout)
+		timer_setup(&param->fault_param->timer, iommu_dev_fault_timer_fn,
+			TIMER_DEFERRABLE);
 done_unlock:
 	mutex_unlock(&param->lock);
 
@@ -1017,7 +1053,9 @@ int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
 	struct iommu_param *param = dev->iommu_param;
 	struct iommu_fault_event *evt_pending = NULL;
 	struct iommu_fault_param *fparam;
+	struct timer_list *tmr;
 	int ret = 0;
+	u64 exp;
 
 	if (!param || !evt)
 		return -EINVAL;
@@ -1038,7 +1076,17 @@ int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
 			ret = -ENOMEM;
 			goto done_unlock;
 		}
+		/* Keep track of response expiration time */
+		exp = get_jiffies_64() + prq_timeout;
+		evt_pending->expire = exp;
 		mutex_lock(&fparam->lock);
+		if (list_empty(&fparam->faults)) {
+			/* First pending event, start timer */
+			tmr = &dev->iommu_param->fault_param->timer;
+			WARN_ON(timer_pending(tmr));
+			mod_timer(tmr, exp);
+		}
+
 		list_add_tail(&evt_pending->list, &fparam->faults);
 		mutex_unlock(&fparam->lock);
 	}
@@ -1103,6 +1151,13 @@ int iommu_page_response(struct device *dev,
 		break;
 	}
 
+	/* stop response timer if no more pending request */
+	if (list_empty(&param->fault_param->faults) &&
+		timer_pending(&param->fault_param->timer)) {
+		pr_debug("no pending PRQ, stop timer\n");
+		del_timer(&param->fault_param->timer);
+	}
+
 done_unlock:
 	mutex_unlock(&param->fault_param->lock);
 	return ret;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index fdc355c..39d371b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -317,10 +317,12 @@ struct iommu_device {
  *
  * @fault: fault descriptor
  * @list: pending fault event list, used for tracking responses
+ * @expire: time limit in jiffies will wait for page response
  */
 struct iommu_fault_event {
 	struct iommu_fault fault;
 	struct list_head list;
+	u64 expire;
 };
 
 /**
@@ -329,11 +331,13 @@ struct iommu_fault_event {
  * @data: handler private data
  * @faults: holds the pending faults which needs response
  * @lock: protect pending faults list
+ * @timer: track page request pending time limit
  */
 struct iommu_fault_param {
 	iommu_dev_fault_handler_t handler;
 	void *data;
 	struct list_head faults;
+	struct timer_list timer;
 	struct mutex lock;
 };
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
