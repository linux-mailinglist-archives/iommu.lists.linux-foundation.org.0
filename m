Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C274D12C3
	for <lists.iommu@lfdr.de>; Tue,  8 Mar 2022 09:50:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA37641740;
	Tue,  8 Mar 2022 08:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92LbC-CdSkNW; Tue,  8 Mar 2022 08:50:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C41F141743;
	Tue,  8 Mar 2022 08:50:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9C34C000B;
	Tue,  8 Mar 2022 08:50:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65451C000B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 08:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42A3984176
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 08:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qp7gAaeslj_n for <iommu@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 08:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40B7484148
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 08:50:43 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KCTSK0ZhCzbc8B;
 Tue,  8 Mar 2022 16:45:53 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 16:50:40 +0800
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
Subject: [PATCH v5 5/8] hisi_ptt: Add tune function support for HiSilicon PCIe
 Tune and Trace device
Date: Tue, 8 Mar 2022 16:49:27 +0800
Message-ID: <20220308084930.5142-6-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220308084930.5142-1-yangyicong@hisilicon.com>
References: <20220308084930.5142-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: song.bao.hua@hisilicon.com, prime.zeng@huawei.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, zhangshaokun@hisilicon.com, liuqi115@huawei.com
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
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/hwtracing/ptt/hisi_ptt.c | 154 +++++++++++++++++++++++++++++++
 drivers/hwtracing/ptt/hisi_ptt.h |  20 ++++
 2 files changed, 174 insertions(+)

diff --git a/drivers/hwtracing/ptt/hisi_ptt.c b/drivers/hwtracing/ptt/hisi_ptt.c
index 953d36dfcc89..37d1784fa129 100644
--- a/drivers/hwtracing/ptt/hisi_ptt.c
+++ b/drivers/hwtracing/ptt/hisi_ptt.c
@@ -21,6 +21,159 @@
 
 #include "hisi_ptt.h"
 
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
+static int hisi_ptt_tune_data_get(struct hisi_ptt *hisi_ptt,
+				  u32 event, u16 *data)
+{
+	u32 reg;
+
+	reg = readl(hisi_ptt->iobase + HISI_PTT_TUNING_CTRL);
+	reg &= ~(HISI_PTT_TUNING_CTRL_CODE | HISI_PTT_TUNING_CTRL_SUB);
+	reg |= FIELD_PREP(HISI_PTT_TUNING_CTRL_CODE | HISI_PTT_TUNING_CTRL_SUB,
+			  event);
+	writel(reg, hisi_ptt->iobase + HISI_PTT_TUNING_CTRL);
+
+	/* Write all 1 to indicates it's the read process */
+	writel(~0UL, hisi_ptt->iobase + HISI_PTT_TUNING_DATA);
+
+	if (!hisi_ptt_wait_tuning_finish(hisi_ptt))
+		return -ETIMEDOUT;
+
+	reg = readl(hisi_ptt->iobase + HISI_PTT_TUNING_DATA);
+	reg &= HISI_PTT_TUNING_DATA_VAL_MASK;
+	*data = FIELD_GET(HISI_PTT_TUNING_DATA_VAL_MASK, reg);
+
+	return 0;
+}
+
+static int hisi_ptt_tune_data_set(struct hisi_ptt *hisi_ptt,
+				  u32 event, u16 data)
+{
+	u32 reg;
+
+	reg = readl(hisi_ptt->iobase + HISI_PTT_TUNING_CTRL);
+	reg &= ~(HISI_PTT_TUNING_CTRL_CODE | HISI_PTT_TUNING_CTRL_SUB);
+	reg |= FIELD_PREP(HISI_PTT_TUNING_CTRL_CODE | HISI_PTT_TUNING_CTRL_SUB,
+			  event);
+	writel(reg, hisi_ptt->iobase + HISI_PTT_TUNING_CTRL);
+
+	writel(FIELD_PREP(HISI_PTT_TUNING_DATA_VAL_MASK, data),
+	       hisi_ptt->iobase + HISI_PTT_TUNING_DATA);
+
+	if (!hisi_ptt_wait_tuning_finish(hisi_ptt))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static ssize_t hisi_ptt_tune_attr_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	struct hisi_ptt *hisi_ptt = to_hisi_ptt(dev_get_drvdata(dev));
+	struct dev_ext_attribute *ext_attr;
+	struct hisi_ptt_tune_desc *desc;
+	int ret;
+	u16 val;
+
+	ext_attr = container_of(attr, struct dev_ext_attribute, attr);
+	desc = ext_attr->var;
+
+	if (!mutex_trylock(&hisi_ptt->mutex))
+		return -EBUSY;
+
+	ret = hisi_ptt_tune_data_get(hisi_ptt, desc->event_code, &val);
+
+	mutex_unlock(&hisi_ptt->mutex);
+	return ret ? ret : sysfs_emit(buf, "%u\n", val);
+}
+
+static ssize_t hisi_ptt_tune_attr_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct hisi_ptt *hisi_ptt = to_hisi_ptt(dev_get_drvdata(dev));
+	struct dev_ext_attribute *ext_attr;
+	struct hisi_ptt_tune_desc *desc;
+	int ret;
+	u16 val;
+
+	ext_attr = container_of(attr, struct dev_ext_attribute, attr);
+	desc = ext_attr->var;
+
+	if (kstrtou16(buf, 10, &val))
+		return -EINVAL;
+
+	if (!mutex_trylock(&hisi_ptt->mutex))
+		return -EBUSY;
+
+	ret = hisi_ptt_tune_data_set(hisi_ptt, desc->event_code, val);
+
+	mutex_unlock(&hisi_ptt->mutex);
+	return ret ? ret : count;
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
+	.attrs	= hisi_ptt_tune_attrs,
+	.name	= "tune",
+};
+
 static u16 hisi_ptt_get_filter_val(struct pci_dev *pdev)
 {
 	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT)
@@ -536,6 +689,7 @@ static struct attribute_group hisi_ptt_pmu_filter_group = {
 static const struct attribute_group *hisi_ptt_pmu_groups[] = {
 	&hisi_ptt_pmu_format_group,
 	&hisi_ptt_pmu_filter_group,
+	&hisi_ptt_tune_group,
 	NULL
 };
 
diff --git a/drivers/hwtracing/ptt/hisi_ptt.h b/drivers/hwtracing/ptt/hisi_ptt.h
index 53805f6c9bc2..d88c326e9289 100644
--- a/drivers/hwtracing/ptt/hisi_ptt.h
+++ b/drivers/hwtracing/ptt/hisi_ptt.h
@@ -25,6 +25,11 @@
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
@@ -40,6 +45,8 @@
 #define HISI_PTT_TRACE_INT_STAT		0x0890
 #define   HISI_PTT_TRACE_INT_STAT_MASK	GENMASK(3, 0)
 #define HISI_PTT_TRACE_INT_MASK		0x0894
+#define HISI_PTT_TUNING_INT_STAT	0x0898
+#define   HISI_PTT_TUNING_INT_STAT_MASK	BIT(0)
 #define HISI_PTT_TRACE_WR_STS		0x08a0
 #define   HISI_PTT_TRACE_WR_STS_WRITE	GENMASK(27, 0)
 #define   HISI_PTT_TRACE_WR_STS_BUFFER	GENMASK(29, 28)
@@ -68,11 +75,24 @@
 /* Wait time for DMA hardware to reset */
 #define HISI_PTT_RESET_WAIT_MS		1000UL
 /* Poll timeout and interval for waiting hardware work to finish */
+#define HISI_PTT_WAIT_TUNE_TIMEOUT_US	1000000UL
 #define HISI_PTT_WAIT_TRACE_TIMEOUT_US	100UL
 #define HISI_PTT_WAIT_POLL_INTERVAL_US	10UL
 
 #define HISI_PCIE_CORE_PORT_ID(devfn)	(PCI_FUNC(devfn) << 1)
 
+/**
+ * struct hisi_ptt_tune_desc - describe tune event for PTT tune
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
  * struct hisi_ptt_dma_buffer - describe a single trace buffer of PTT trace.
  *                              The detail of the data format is described
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
