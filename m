Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE5C8F565
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 22:10:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 890C91253;
	Thu, 15 Aug 2019 20:09:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CB3DF1205
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 20:09:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 73B0167F
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 20:09:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2019 13:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="188596207"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2019 13:09:42 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v5 04/19] iommu: Use device fault trace event
Date: Thu, 15 Aug 2019 13:13:10 -0700
Message-Id: <1565900005-62508-5-git-send-email-jacob.jun.pan@linux.intel.com>
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

From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

For performance and debugging purposes, these trace events help
analyzing device faults that interact with IOMMU subsystem.
E.g.
IOMMU:0000:00:0a.0 type=2 reason=0 addr=0x00000000007ff000 pasid=1
group=1 last=0 prot=1

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
[JPB: removed invalidate event, that will be added later]
Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/iommu.c        | 2 ++
 include/trace/events/iommu.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8f2c7d5..feada31 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1098,6 +1098,7 @@ int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
 		mutex_unlock(&fparam->lock);
 		kfree(evt_pending);
 	}
+	trace_dev_fault(dev, &evt->fault);
 done_unlock:
 	mutex_unlock(&param->lock);
 	return ret;
@@ -1146,6 +1147,7 @@ int iommu_page_response(struct device *dev,
 		msg->flags = pasid_valid ? IOMMU_PAGE_RESP_PASID_VALID : 0;
 
 		ret = domain->ops->page_response(dev, evt, msg);
+		trace_dev_page_response(dev, msg);
 		list_del(&evt->list);
 		kfree(evt);
 		break;
diff --git a/include/trace/events/iommu.h b/include/trace/events/iommu.h
index 767b92c..7a7801b 100644
--- a/include/trace/events/iommu.h
+++ b/include/trace/events/iommu.h
@@ -219,7 +219,7 @@ TRACE_EVENT(dev_fault,
 
 TRACE_EVENT(dev_page_response,
 
-	TP_PROTO(struct device *dev,  struct iommu_fault_page_response *msg),
+	TP_PROTO(struct device *dev,  struct iommu_page_response *msg),
 
 	TP_ARGS(dev, msg),
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
