Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 411484BD855
	for <lists.iommu@lfdr.de>; Mon, 21 Feb 2022 09:44:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F6BC60D69;
	Mon, 21 Feb 2022 08:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujJ0-9ZYhzeo; Mon, 21 Feb 2022 08:44:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 68C2460DB2;
	Mon, 21 Feb 2022 08:44:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CDF2C0036;
	Mon, 21 Feb 2022 08:44:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8B8BC0011
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 08:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95864600C6
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 08:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_OCU0pxlpuJ for <iommu@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 08:44:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DBBB600B5
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 08:44:20 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K2G636Bk2zdZSG;
 Mon, 21 Feb 2022 16:43:07 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 16:44:17 +0800
To: <gregkh@linuxfoundation.org>, <helgaas@kernel.org>,
 <alexander.shishkin@linux.intel.com>, <lorenzo.pieralisi@arm.com>,
 <will@kernel.org>, <mark.rutland@arm.com>, <mathieu.poirier@linaro.org>,
 <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <leo.yan@linaro.org>,
 <jonathan.cameron@huawei.com>, <daniel.thompson@linaro.org>,
 <joro@8bytes.org>, <john.garry@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <robin.murphy@arm.com>,
 <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <coresight@lists.linaro.org>, <linux-pci@vger.kernel.org>,
 <linux-perf-users@vger.kernel.org>, <iommu@lists.linux-foundation.org>
Subject: [PATCH v4 4/8] hisi_ptt: Add support for dynamically updating the
 filter list
Date: Mon, 21 Feb 2022 16:43:03 +0800
Message-ID: <20220221084307.33712-5-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220221084307.33712-1-yangyicong@hisilicon.com>
References: <20220221084307.33712-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: prime.zeng@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 zhangshaokun@hisilicon.com, liuqi115@huawei.com
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
From: Yicong Yang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The PCIe devices supported by the PTT trace can be removed/rescanned
by hotplug or through sysfs.  Add support for dynamically updating
the available filter list by registering a PCI bus notifier block.
Then user can always get latest information about available tracing
filters and driver can block the invalid filters of which related
devices no longer exist in the system.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/hwtracing/ptt/hisi_ptt.c | 138 ++++++++++++++++++++++++++++---
 drivers/hwtracing/ptt/hisi_ptt.h |  34 ++++++++
 2 files changed, 160 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/ptt/hisi_ptt.c b/drivers/hwtracing/ptt/hisi_ptt.c
index c2b6f8aa9f1e..50193a331faa 100644
--- a/drivers/hwtracing/ptt/hisi_ptt.c
+++ b/drivers/hwtracing/ptt/hisi_ptt.c
@@ -269,25 +269,118 @@ static int hisi_ptt_register_irq(struct hisi_ptt *hisi_ptt)
 	return 0;
 }
 
-static int hisi_ptt_init_filters(struct pci_dev *pdev, void *data)
+static void hisi_ptt_update_filters(struct work_struct *work)
 {
+	struct delayed_work *delayed_work = to_delayed_work(work);
+	struct hisi_ptt_filter_update_info info;
 	struct hisi_ptt_filter_desc *filter;
-	struct hisi_ptt *hisi_ptt = data;
 	struct list_head *target_list;
+	struct hisi_ptt *hisi_ptt;
 
-	target_list = pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT ?
-		      &hisi_ptt->port_filters : &hisi_ptt->req_filters;
+	hisi_ptt = container_of(delayed_work, struct hisi_ptt, work);
 
-	filter = kzalloc(sizeof(*filter), GFP_KERNEL);
-	if (!filter)
-		return -ENOMEM;
+	if (!mutex_trylock(&hisi_ptt->mutex)) {
+		schedule_delayed_work(&hisi_ptt->work, HISI_PTT_WORK_DELAY_MS);
+		return;
+	}
 
-	filter->pdev = pdev;
-	list_add_tail(&filter->list, target_list);
+	while (kfifo_get(&hisi_ptt->filter_update_kfifo, &info)) {
+		bool is_port = pci_pcie_type(info.pdev) == PCI_EXP_TYPE_ROOT_PORT;
+		u16 val = hisi_ptt_get_filter_val(info.pdev);
+
+		target_list = is_port ? &hisi_ptt->port_filters : &hisi_ptt->req_filters;
+
+		if (info.is_add) {
+			filter = kzalloc(sizeof(*filter), GFP_KERNEL);
+			if (!filter)
+				continue;
+
+			filter->pdev = info.pdev;
+			list_add_tail(&filter->list, target_list);
+		} else {
+			list_for_each_entry(filter, target_list, list)
+				if (hisi_ptt_get_filter_val(filter->pdev) == val) {
+					list_del(&filter->list);
+					kfree(filter);
+					break;
+				}
+		}
 
-	/* Update the available port mask */
-	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT)
-		hisi_ptt->port_mask |= hisi_ptt_get_filter_val(pdev);
+		/* Update the available port mask */
+		if (!is_port)
+			continue;
+
+		if (info.is_add)
+			hisi_ptt->port_mask |= val;
+		else
+			hisi_ptt->port_mask &= ~val;
+	}
+
+	mutex_unlock(&hisi_ptt->mutex);
+}
+
+static void hisi_ptt_update_fifo_in(struct hisi_ptt *hisi_ptt,
+				    struct hisi_ptt_filter_update_info *info)
+{
+	struct pci_dev *root_port = pcie_find_root_port(info->pdev);
+	u32 port_devid;
+
+	if (!root_port)
+		return;
+
+	port_devid = PCI_DEVID(root_port->bus->number, root_port->devfn);
+	if (port_devid < hisi_ptt->lower ||
+	    port_devid > hisi_ptt->upper)
+		return;
+
+	if (kfifo_in_spinlocked(&hisi_ptt->filter_update_kfifo, info, 1,
+				&hisi_ptt->filter_update_lock))
+		schedule_delayed_work(&hisi_ptt->work, 0);
+	else
+		pci_warn(hisi_ptt->pdev,
+			 "filter update fifo overflow for target %s\n",
+			 pci_name(info->pdev));
+}
+
+/*
+ * A PCI bus notifier is used here for dynamically updating the filter
+ * list.
+ */
+static int hisi_ptt_notifier_call(struct notifier_block *nb, unsigned long action,
+				  void *data)
+{
+	struct hisi_ptt *hisi_ptt = container_of(nb, struct hisi_ptt, hisi_ptt_nb);
+	struct hisi_ptt_filter_update_info info;
+	struct device *dev = data;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	info.pdev = pdev;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		info.is_add = true;
+		break;
+	case BUS_NOTIFY_DEL_DEVICE:
+		info.is_add = false;
+		break;
+	default:
+		return 0;
+	}
+
+	hisi_ptt_update_fifo_in(hisi_ptt, &info);
+
+	return 0;
+}
+
+static int hisi_ptt_init_filters(struct pci_dev *pdev, void *data)
+{
+	struct hisi_ptt_filter_update_info info = {
+		.pdev = pdev,
+		.is_add = true,
+	};
+	struct hisi_ptt *hisi_ptt = data;
+
+	hisi_ptt_update_fifo_in(hisi_ptt, &info);
 
 	return 0;
 }
@@ -313,6 +406,9 @@ static void hisi_ptt_init_ctrls(struct hisi_ptt *hisi_ptt)
 	struct pci_bus *bus;
 	u32 reg;
 
+	INIT_DELAYED_WORK(&hisi_ptt->work, hisi_ptt_update_filters);
+	spin_lock_init(&hisi_ptt->filter_update_lock);
+	INIT_KFIFO(hisi_ptt->filter_update_kfifo);
 	INIT_LIST_HEAD(&hisi_ptt->port_filters);
 	INIT_LIST_HEAD(&hisi_ptt->req_filters);
 
@@ -329,6 +425,13 @@ static void hisi_ptt_init_ctrls(struct hisi_ptt *hisi_ptt)
 	hisi_ptt->upper = FIELD_GET(HISI_PTT_DEVICE_RANGE_UPPER, reg);
 	hisi_ptt->lower = FIELD_GET(HISI_PTT_DEVICE_RANGE_LOWER, reg);
 
+	/*
+	 * No need to fail if the bus is NULL here as the device
+	 * maybe hotplugged after the PTT driver probe, in which
+	 * case we can detect the event and update the list as
+	 * we register a bus notifier for dynamically updating
+	 * the filter list.
+	 */
 	bus = pci_find_bus(pci_domain_nr(pdev->bus), PCI_BUS_NUM(hisi_ptt->upper));
 	if (bus)
 		pci_walk_bus(bus, hisi_ptt_init_filters, hisi_ptt);
@@ -832,6 +935,12 @@ static int hisi_ptt_probe(struct pci_dev *pdev,
 		return ret;
 	}
 
+	/* Register the bus notifier for dynamically updating the filter list */
+	hisi_ptt->hisi_ptt_nb.notifier_call = hisi_ptt_notifier_call;
+	ret = bus_register_notifier(&pci_bus_type, &hisi_ptt->hisi_ptt_nb);
+	if (ret)
+		pci_warn(pdev, "failed to register filter update notifier, ret = %d", ret);
+
 	return 0;
 }
 
@@ -839,6 +948,11 @@ void hisi_ptt_remove(struct pci_dev *pdev)
 {
 	struct hisi_ptt *hisi_ptt = pci_get_drvdata(pdev);
 
+	bus_unregister_notifier(&pci_bus_type, &hisi_ptt->hisi_ptt_nb);
+
+	/* Cancel any work that has been queued */
+	cancel_delayed_work_sync(&hisi_ptt->work);
+
 	if (hisi_ptt->trace_ctrl.status == HISI_PTT_TRACE_STATUS_ON)
 		hisi_ptt_trace_end(hisi_ptt);
 
diff --git a/drivers/hwtracing/ptt/hisi_ptt.h b/drivers/hwtracing/ptt/hisi_ptt.h
index ea012ae74c6b..b8f2d520443c 100644
--- a/drivers/hwtracing/ptt/hisi_ptt.h
+++ b/drivers/hwtracing/ptt/hisi_ptt.h
@@ -10,11 +10,15 @@
 #define _HISI_PTT_H
 
 #include <linux/bits.h>
+#include <linux/kfifo.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/perf_event.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define DRV_NAME "hisi_ptt"
 
@@ -57,6 +61,12 @@
 /* Wait time for hardware DMA to reset */
 #define HISI_PTT_RESET_TIMEOUT_US	10UL
 #define HISI_PTT_RESET_POLL_INTERVAL_US	1UL
+/* FIFO size for dynamically updating the PTT trace filter list. */
+#define HISI_PTT_FILTER_UPDATE_FIFO_SIZE	16
+/* Delay time for filter updating work */
+#define HISI_PTT_WORK_DELAY_MS		100UL
+/* Wait time for DMA hardware to reset */
+#define HISI_PTT_RESET_WAIT_MS		1000UL
 /* Poll timeout and interval for waiting hardware work to finish */
 #define HISI_PTT_WAIT_TIMEOUT_US	100UL
 #define HISI_PTT_WAIT_POLL_INTERVAL_US	10UL
@@ -117,6 +127,15 @@ struct hisi_ptt_filter_desc {
 	struct pci_dev *pdev;
 };
 
+/**
+ * struct hisi_ptt_filter_update_info - information for PTT filter updating
+ * @pdev:       the PCI device to update in the filter list
+ * @is_add:     adding to the filter or not
+ */
+struct hisi_ptt_filter_update_info {
+	struct pci_dev *pdev;
+	bool is_add;
+};
 
 /**
  * struct hisi_ptt_pmu_buf - descriptor of the AUX buffer of PTT trace
@@ -144,9 +163,13 @@ struct hisi_ptt_pmu_buf {
  * @port_filters: the filter list of root ports
  * @req_filters:  the filter list of requester ID
  * @port_mask:    port mask of the managed root ports
+ * @work:         delayed work for filter updating
+ * @filter_update_lock: spinlock to protect the filter update fifo
+ * @filter_update_fifo: fifo of the filters waiting to update the filter list
  */
 struct hisi_ptt {
 	struct hisi_ptt_trace_ctrl trace_ctrl;
+	struct notifier_block hisi_ptt_nb;
 	struct pmu hisi_ptt_pmu;
 	void __iomem *iobase;
 	struct pci_dev *pdev;
@@ -164,6 +187,17 @@ struct hisi_ptt {
 	struct list_head port_filters;
 	struct list_head req_filters;
 	u16 port_mask;
+
+	/*
+	 * We use a delayed work here to avoid indefinitely waiting for
+	 * the hisi_ptt->mutex which protecting the filter list. The
+	 * work will be delayed only if the mutex can not be held,
+	 * otherwise no delay will be applied.
+	 */
+	struct delayed_work work;
+	spinlock_t filter_update_lock;
+	DECLARE_KFIFO(filter_update_kfifo, struct hisi_ptt_filter_update_info,
+		      HISI_PTT_FILTER_UPDATE_FIFO_SIZE);
 };
 
 #define to_hisi_ptt(pmu) container_of(pmu, struct hisi_ptt, hisi_ptt_pmu)
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
