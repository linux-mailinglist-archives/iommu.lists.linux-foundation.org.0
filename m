Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BF53E44B
	for <lists.iommu@lfdr.de>; Mon,  6 Jun 2022 13:57:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279284171B;
	Mon,  6 Jun 2022 11:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBm4jZVHKJpe; Mon,  6 Jun 2022 11:57:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 72DC041733;
	Mon,  6 Jun 2022 11:57:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ABFAC0088;
	Mon,  6 Jun 2022 11:57:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D166C002D
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 11:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1991408B8
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 11:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmDF3mgVIOU8 for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 11:57:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C996400DB
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 11:57:05 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LGsMg1W7JzRhl2;
 Mon,  6 Jun 2022 19:53:51 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 6 Jun 2022 19:57:01 +0800
To: <gregkh@linuxfoundation.org>, <alexander.shishkin@linux.intel.com>,
 <leo.yan@linaro.org>, <james.clark@arm.com>, <will@kernel.org>,
 <robin.murphy@arm.com>, <acme@kernel.org>, <jonathan.cameron@huawei.com>,
 <john.garry@huawei.com>
Subject: [PATCH v9 3/8] hwtracing: hisi_ptt: Add tune function support for
 HiSilicon PCIe Tune and Trace device
Date: Mon, 6 Jun 2022 19:55:50 +0800
Message-ID: <20220606115555.41103-4-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220606115555.41103-1-yangyicong@hisilicon.com>
References: <20220606115555.41103-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, zhangshaokun@hisilicon.com, prime.zeng@huawei.com,
 mathieu.poirier@linaro.org, suzuki.poulose@arm.com, peterz@infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 linux-perf-users@vger.kernel.org, iommu@lists.linux-foundation.org,
 mingo@redhat.com, helgaas@kernel.org, yangyicong@hisilicon.com,
 liuqi115@huawei.com, linux-arm-kernel@lists.infradead.org
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

Add tune function for the HiSilicon Tune and Trace device. The interface
of tune is exposed through sysfs attributes of PTT PMU device.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: John Garry <john.garry@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/hwtracing/ptt/hisi_ptt.c | 136 +++++++++++++++++++++++++++++++
 drivers/hwtracing/ptt/hisi_ptt.h |  23 ++++++
 2 files changed, 159 insertions(+)

diff --git a/drivers/hwtracing/ptt/hisi_ptt.c b/drivers/hwtracing/ptt/hisi_ptt.c
index e317be2e1311..3ffc7cc80ad0 100644
--- a/drivers/hwtracing/ptt/hisi_ptt.c
+++ b/drivers/hwtracing/ptt/hisi_ptt.c
@@ -25,6 +25,140 @@
 /* Dynamic CPU hotplug state used by PTT */
 static enum cpuhp_state hisi_ptt_pmu_online;
 
+static bool hisi_ptt_wait_tuning_finish(struct hisi_ptt *hisi_ptt)
+{
+	u32 val;
+
+	return !readl_poll_timeout(hisi_ptt->iobase + HISI_PTT_TUNING_INT_STAT,
+				  val, !(val & HISI_PTT_TUNING_INT_STAT_MASK),
+				  HISI_PTT_WAIT_POLL_INTERVAL_US,
+				  HISI_PTT_WAIT_TUNE_TIMEOUT_US);
+}
+
+static ssize_t hisi_ptt_tune_attr_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	struct hisi_ptt *hisi_ptt = to_hisi_ptt(dev_get_drvdata(dev));
+	struct dev_ext_attribute *ext_attr;
+	struct hisi_ptt_tune_desc *desc;
+	u32 reg;
+	u16 val;
+
+	ext_attr = container_of(attr, struct dev_ext_attribute, attr);
+	desc = ext_attr->var;
+
+	mutex_lock(&hisi_ptt->tune_lock);
+
+	reg = readl(hisi_ptt->iobase + HISI_PTT_TUNING_CTRL);
+	reg &= ~(HISI_PTT_TUNING_CTRL_CODE | HISI_PTT_TUNING_CTRL_SUB);
+	reg |= FIELD_PREP(HISI_PTT_TUNING_CTRL_CODE | HISI_PTT_TUNING_CTRL_SUB,
+			  desc->event_code);
+	writel(reg, hisi_ptt->iobase + HISI_PTT_TUNING_CTRL);
+
+	/* Write all 1 to indicates it's the read process */
+	writel(~0U, hisi_ptt->iobase + HISI_PTT_TUNING_DATA);
+
+	if (!hisi_ptt_wait_tuning_finish(hisi_ptt)) {
+		mutex_unlock(&hisi_ptt->tune_lock);
+		return -ETIMEDOUT;
+	}
+
+	reg = readl(hisi_ptt->iobase + HISI_PTT_TUNING_DATA);
+	reg &= HISI_PTT_TUNING_DATA_VAL_MASK;
+	val = FIELD_GET(HISI_PTT_TUNING_DATA_VAL_MASK, reg);
+
+	mutex_unlock(&hisi_ptt->tune_lock);
+	return sysfs_emit(buf, "%u\n", val);
+}
+
+static ssize_t hisi_ptt_tune_attr_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct hisi_ptt *hisi_ptt = to_hisi_ptt(dev_get_drvdata(dev));
+	struct dev_ext_attribute *ext_attr;
+	struct hisi_ptt_tune_desc *desc;
+	u32 reg;
+	u16 val;
+
+	ext_attr = container_of(attr, struct dev_ext_attribute, attr);
+	desc = ext_attr->var;
+
+	if (kstrtou16(buf, 10, &val))
+		return -EINVAL;
+
+	mutex_lock(&hisi_ptt->tune_lock);
+
+	reg = readl(hisi_ptt->iobase + HISI_PTT_TUNING_CTRL);
+	reg &= ~(HISI_PTT_TUNING_CTRL_CODE | HISI_PTT_TUNING_CTRL_SUB);
+	reg |= FIELD_PREP(HISI_PTT_TUNING_CTRL_CODE | HISI_PTT_TUNING_CTRL_SUB,
+			  desc->event_code);
+	writel(reg, hisi_ptt->iobase + HISI_PTT_TUNING_CTRL);
+	writel(FIELD_PREP(HISI_PTT_TUNING_DATA_VAL_MASK, val),
+	       hisi_ptt->iobase + HISI_PTT_TUNING_DATA);
+
+	if (!hisi_ptt_wait_tuning_finish(hisi_ptt)) {
+		mutex_unlock(&hisi_ptt->tune_lock);
+		return -ETIMEDOUT;
+	}
+
+	mutex_unlock(&hisi_ptt->tune_lock);
+	return count;
+}
+
+#define HISI_PTT_TUNE_ATTR(_name, _val, _show, _store)			\
+	static struct hisi_ptt_tune_desc _name##_desc = {		\
+		.name = #_name,						\
+		.event_code = _val,					\
+	};								\
+	static struct dev_ext_attribute hisi_ptt_##_name##_attr = {	\
+		.attr	= __ATTR(_name, 0600, _show, _store),		\
+		.var	= &_name##_desc,				\
+	}
+
+#define HISI_PTT_TUNE_ATTR_COMMON(_name, _val)		\
+	HISI_PTT_TUNE_ATTR(_name, _val,			\
+			   hisi_ptt_tune_attr_show,	\
+			   hisi_ptt_tune_attr_store)
+
+/*
+ * The value of the tuning event are composed of two parts: main event code in bit[0,15] and
+ * subevent code in bit[16,23]. For example, qox_tx_cpl is a subevent of 'Tx path QoS control'
+ * which for tuning the weight of Tx completion TLPs. See hisi_ptt.rst documentation for
+ * more information.
+ */
+#define HISI_PTT_TUNE_QOS_TX_CPL				(0x4 | (3 << 16))
+#define HISI_PTT_TUNE_QOS_TX_NP					(0x4 | (4 << 16))
+#define HISI_PTT_TUNE_QOS_TX_P					(0x4 | (5 << 16))
+#define HISI_PTT_TUNE_TX_PATH_IOB_RX_REQ_ALLOC_BUF_LEVEL	(0x5 | (6 << 16))
+#define HISI_PTT_TUNE_TX_PATH_TX_REQ_ALLOC_BUF_LEVEL		(0x5 | (7 << 16))
+
+HISI_PTT_TUNE_ATTR_COMMON(qos_tx_cpl,
+			  HISI_PTT_TUNE_QOS_TX_CPL);
+HISI_PTT_TUNE_ATTR_COMMON(qos_tx_np,
+			  HISI_PTT_TUNE_QOS_TX_NP);
+HISI_PTT_TUNE_ATTR_COMMON(qos_tx_p,
+			  HISI_PTT_TUNE_QOS_TX_P);
+HISI_PTT_TUNE_ATTR_COMMON(tx_path_iob_rx_req_alloc_buf_level,
+			  HISI_PTT_TUNE_TX_PATH_IOB_RX_REQ_ALLOC_BUF_LEVEL);
+HISI_PTT_TUNE_ATTR_COMMON(tx_path_tx_req_alloc_buf_level,
+			  HISI_PTT_TUNE_TX_PATH_TX_REQ_ALLOC_BUF_LEVEL);
+
+static struct attribute *hisi_ptt_tune_attrs[] = {
+	&hisi_ptt_qos_tx_cpl_attr.attr.attr,
+	&hisi_ptt_qos_tx_np_attr.attr.attr,
+	&hisi_ptt_qos_tx_p_attr.attr.attr,
+	&hisi_ptt_tx_path_iob_rx_req_alloc_buf_level_attr.attr.attr,
+	&hisi_ptt_tx_path_tx_req_alloc_buf_level_attr.attr.attr,
+	NULL,
+};
+
+static struct attribute_group hisi_ptt_tune_group = {
+	.name	= "tune",
+	.attrs	= hisi_ptt_tune_attrs,
+};
+
 static u16 hisi_ptt_get_filter_val(u16 devid, bool is_port)
 {
 	if (is_port)
@@ -449,6 +583,7 @@ static const struct attribute_group *hisi_ptt_pmu_groups[] = {
 	&hisi_ptt_cpumask_attr_group,
 	&hisi_ptt_pmu_format_group,
 	&hisi_ptt_pmu_filter_group,
+	&hisi_ptt_tune_group,
 	NULL
 };
 
@@ -774,6 +909,7 @@ static int hisi_ptt_register_pmu(struct hisi_ptt *hisi_ptt)
 	if (ret)
 		return ret;
 
+	mutex_init(&hisi_ptt->tune_lock);
 	spin_lock_init(&hisi_ptt->pmu_lock);
 
 	hisi_ptt->hisi_ptt_pmu = (struct pmu) {
diff --git a/drivers/hwtracing/ptt/hisi_ptt.h b/drivers/hwtracing/ptt/hisi_ptt.h
index 43b2fe77a770..da24174521c6 100644
--- a/drivers/hwtracing/ptt/hisi_ptt.h
+++ b/drivers/hwtracing/ptt/hisi_ptt.h
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/cpumask.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/perf_event.h>
 #include <linux/spinlock.h>
@@ -22,6 +23,11 @@
 /*
  * The definition of the device registers and register fields.
  */
+#define HISI_PTT_TUNING_CTRL		0x0000
+#define   HISI_PTT_TUNING_CTRL_CODE	GENMASK(15, 0)
+#define   HISI_PTT_TUNING_CTRL_SUB	GENMASK(23, 16)
+#define HISI_PTT_TUNING_DATA		0x0004
+#define   HISI_PTT_TUNING_DATA_VAL_MASK	GENMASK(15, 0)
 #define HISI_PTT_TRACE_ADDR_SIZE	0x0800
 #define HISI_PTT_TRACE_ADDR_BASE_LO_0	0x0810
 #define HISI_PTT_TRACE_ADDR_BASE_HI_0	0x0814
@@ -37,6 +43,8 @@
 #define HISI_PTT_TRACE_INT_STAT		0x0890
 #define   HISI_PTT_TRACE_INT_STAT_MASK	GENMASK(3, 0)
 #define HISI_PTT_TRACE_INT_MASK		0x0894
+#define HISI_PTT_TUNING_INT_STAT	0x0898
+#define   HISI_PTT_TUNING_INT_STAT_MASK	BIT(0)
 #define HISI_PTT_TRACE_WR_STS		0x08a0
 #define   HISI_PTT_TRACE_WR_STS_WRITE	GENMASK(27, 0)
 #define   HISI_PTT_TRACE_WR_STS_BUFFER	GENMASK(29, 28)
@@ -59,6 +67,7 @@
 #define HISI_PTT_RESET_TIMEOUT_US	10UL
 #define HISI_PTT_RESET_POLL_INTERVAL_US	1UL
 /* Poll timeout and interval for waiting hardware work to finish */
+#define HISI_PTT_WAIT_TUNE_TIMEOUT_US	1000000UL
 #define HISI_PTT_WAIT_TRACE_TIMEOUT_US	100UL
 #define HISI_PTT_WAIT_POLL_INTERVAL_US	10UL
 
@@ -71,6 +80,18 @@
 #define HISI_PTT_PMU_TYPE_MASK		GENMASK(31, 24)
 #define HISI_PTT_PMU_FORMAT_MASK	GENMASK(35, 32)
 
+/**
+ * struct hisi_ptt_tune_desc - Describe tune event for PTT tune
+ * @hisi_ptt:   PTT device this tune event belongs to
+ * @name:       name of this event
+ * @event_code: code of the event
+ */
+struct hisi_ptt_tune_desc {
+	struct hisi_ptt *hisi_ptt;
+	const char *name;
+	u32 event_code;
+};
+
 /**
  * struct hisi_ptt_dma_buffer - Describe a single trace buffer of PTT trace.
  *                              The detail of the data format is described
@@ -143,6 +164,7 @@ struct hisi_ptt_pmu_buf {
  * @hisi_ptt_pmu: the pum device of trace
  * @iobase:       base IO address of the device
  * @pdev:         pci_dev of this PTT device
+ * @tune_lock:    lock to serialize the tune process
  * @pmu_lock:     lock to serialize the perf process
  * @upper_bdf:    the upper BDF range of the PCI devices managed by this PTT device
  * @lower_bdf:    the lower BDF range of the PCI devices managed by this PTT device
@@ -156,6 +178,7 @@ struct hisi_ptt {
 	struct pmu hisi_ptt_pmu;
 	void __iomem *iobase;
 	struct pci_dev *pdev;
+	struct mutex tune_lock;
 	spinlock_t pmu_lock;
 	u32 upper_bdf;
 	u32 lower_bdf;
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
