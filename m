Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB75452E2C
	for <lists.iommu@lfdr.de>; Tue, 16 Nov 2021 10:39:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C54FD80E55;
	Tue, 16 Nov 2021 09:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EncEqkeBJgrI; Tue, 16 Nov 2021 09:39:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A46FE80C72;
	Tue, 16 Nov 2021 09:39:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCAC1C001E;
	Tue, 16 Nov 2021 09:39:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DBDCC0012
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 09:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 604DC4021E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 09:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gw7GsxEO3Sgj for <iommu@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 09:09:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5682401DB
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 09:09:13 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HtgD81gkYz1DJCy;
 Tue, 16 Nov 2021 17:06:48 +0800 (CST)
Received: from dggema772-chm.china.huawei.com (10.1.198.214) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 17:09:09 +0800
Received: from localhost.localdomain (10.67.165.2) by
 dggema772-chm.china.huawei.com (10.1.198.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Tue, 16 Nov 2021 17:09:09 +0800
To: <gregkh@linuxfoundation.org>, <helgaas@kernel.org>,
 <alexander.shishkin@linux.intel.com>, <lorenzo.pieralisi@arm.com>,
 <will@kernel.org>, <mark.rutland@arm.com>, <mathieu.poirier@linaro.org>,
 <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <leo.yan@linaro.org>,
 <jonathan.cameron@huawei.com>, <daniel.thompson@linaro.org>,
 <joro@8bytes.org>, <john.garry@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
 <linux-pci@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v2 3/6] hwtracing: Add tune function support for HiSilicon
 PCIe Tune and Trace device
Date: Tue, 16 Nov 2021 17:06:22 +0800
Message-ID: <20211116090625.53702-4-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211116090625.53702-1-yangyicong@hisilicon.com>
References: <20211116090625.53702-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.165.2]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema772-chm.china.huawei.com (10.1.198.214)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 16 Nov 2021 09:39:26 +0000
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

Add tune function for the HiSilicon Tune and Trace device. The interface
of tune is exposed through sysfs attributes of PTT PMU device.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/hwtracing/hisilicon/hisi_ptt.c | 167 +++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/drivers/hwtracing/hisilicon/hisi_ptt.c b/drivers/hwtracing/hisilicon/hisi_ptt.c
index e11e9b6cc2a8..a1e1fb766376 100644
--- a/drivers/hwtracing/hisilicon/hisi_ptt.c
+++ b/drivers/hwtracing/hisilicon/hisi_ptt.c
@@ -24,6 +24,11 @@
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
+#define HISI_PTT_TUNING_CTRL		0x0000
+#define   HISI_PTT_TUNING_CTRL_CODE	GENMASK(15, 0)
+#define   HISI_PTT_TUNING_CTRL_SUB	GENMASK(23, 16)
+#define HISI_PTT_TUNING_DATA		0x0004
+#define   HISI_PTT_TUNING_DATA_VAL_MASK	GENMASK(15, 0)
 #define HISI_PTT_TRACE_ADDR_SIZE	0x0800
 #define HISI_PTT_TRACE_ADDR_BASE_LO_0	0x0810
 #define HISI_PTT_TRACE_ADDR_BASE_HI_0	0x0814
@@ -39,6 +44,8 @@
 #define HISI_PTT_TRACE_INT_STAT		0x0890
 #define   HISI_PTT_TRACE_INT_STAT_MASK	GENMASK(3, 0)
 #define HISI_PTT_TRACE_INT_MASK		0x0894
+#define HISI_PTT_TUNING_INT_STAT	0x0898
+#define   HISI_PTT_TUNING_INT_STAT_MASK	BIT(0)
 #define HISI_PTT_TRACE_WR_STS		0x08a0
 #define   HISI_PTT_TRACE_WR_STS_WRITE	GENMASK(27, 0)
 #define   HISI_PTT_TRACE_WR_STS_BUFFER	GENMASK(29, 28)
@@ -71,6 +78,12 @@ enum hisi_ptt_trace_status {
 	HISI_PTT_TRACE_STATUS_ON,
 };
 
+struct hisi_ptt_tune_desc {
+	struct hisi_ptt *hisi_ptt;
+	const char *name;
+	u32 event_code;
+};
+
 struct hisi_ptt_dma_buflet {
 	struct list_head list;
 	unsigned int size;
@@ -177,6 +190,159 @@ static inline struct hisi_ptt *to_hisi_ptt(struct pmu *pmu)
 	return container_of(pmu, struct hisi_ptt, hisi_ptt_pmu);
 }
 
+static int hisi_ptt_wait_tuning_finish(struct hisi_ptt *hisi_ptt)
+{
+	u32 val;
+
+	return readl_poll_timeout(hisi_ptt->iobase + HISI_PTT_TUNING_INT_STAT,
+				  val, !(val & HISI_PTT_TUNING_INT_STAT_MASK),
+				  HISI_PTT_WAIT_POLL_INTERVAL_US,
+				  HISI_PTT_WAIT_TIMEOUT_US);
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
+	if (hisi_ptt_wait_tuning_finish(hisi_ptt))
+		return -ETIMEDOUT;
+
+	reg = readl(hisi_ptt->iobase + HISI_PTT_TUNING_DATA);
+	reg &= HISI_PTT_TUNING_DATA_VAL_MASK;
+	*data = (u16)reg;
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
+	reg = data;
+	writel(reg, hisi_ptt->iobase + HISI_PTT_TUNING_DATA);
+
+	if (hisi_ptt_wait_tuning_finish(hisi_ptt))
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
@@ -677,6 +843,7 @@ static struct attribute_group hisi_ptt_pmu_filter_group = {
 static const struct attribute_group *hisi_ptt_pmu_groups[] = {
 	&hisi_ptt_pmu_format_group,
 	&hisi_ptt_pmu_filter_group,
+	&hisi_ptt_tune_group,
 	NULL
 };
 
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
