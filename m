Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB4137B40
	for <lists.iommu@lfdr.de>; Sat, 11 Jan 2020 03:49:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DA55884F2;
	Sat, 11 Jan 2020 02:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xo5kkuVUF+GQ; Sat, 11 Jan 2020 02:49:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A07BB884F1;
	Sat, 11 Jan 2020 02:49:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D8E2C0881;
	Sat, 11 Jan 2020 02:49:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0F04C0881
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jan 2020 02:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CC86187750
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jan 2020 02:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXMCbng1a0Kr for <iommu@lists.linux-foundation.org>;
 Sat, 11 Jan 2020 02:49:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B555684F4F
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jan 2020 02:49:50 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id d15so377281pjw.1
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 18:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hcSAoYdLNj9MMgqaeNw+M0fvYeZNRaUvtS5ssxx8ATU=;
 b=nhsSzLGNk3aWMI5jlxBbNYzM5unOUfQSBoPC4PUwMCcB5XfS09ABLRQtOgITOrsndh
 ShKvt3Y4bsgl3lrMO91PNdiET1RH8swx3+utJWE9rMpNK9gQZ9Jjn/oT/RFG+gsLFY1R
 qGM4mXemyUOOaWLiBuO9Iep0x1kdJMiioZS1Biw0J4ITTV4sC5TcXi25gY12kHPOW5vV
 W2yt/TldYj1PbcSwMX9oWt06yGecwfeP1Y1fyJDUlJN1qy0uVTqkR6GfdYMPfmU35RIt
 bW5RnHj5s8u3YagKonIGLRZ+cQop18Ube44ytQC0iNTWRUdtZCzZybnEVbVgSSUklzTC
 pVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hcSAoYdLNj9MMgqaeNw+M0fvYeZNRaUvtS5ssxx8ATU=;
 b=fdG3/0EpwnBKi0K0OlqzBUUKael+RexsFgJFgfSs5K5fqUTluWedujx6QojBwihBU6
 ooFMFhamG4rS6ZWqbhbAX0lRuYjBVG2X5BhoVVAvPEOXU0HfzohP9kgjxIt/yOYFjnId
 FHb9UyAD57V7eLeaW1bXxEp+Ei14VhT/n40IbG5kbo0+xBBEqi1xPbMtipMTLPgsXGmg
 LRK/u7cPEMnr3JE2fzy9CbD4omr3cwtwQxuPVrVCTo83jO1LxK2tpqRfLeFq2viszH89
 iI+3R92LKyBa7MaoaNOI317iaK0fic6xyniddnLAtEWwSDAWmpIUXXQOsyhWi/ICR/q4
 7SHw==
X-Gm-Message-State: APjAAAV4dRtV/psrTQitcqT/lzceyLi8b3YfOiS12DYSSHEokcsLa3GE
 l8BFWfNKH6yOvB9AphoTQV4Hqg==
X-Google-Smtp-Source: APXvYqxl+NpgeZgJMRF9I6pzwoVzKVF79ToQ4w5oBJ83RRrZt6vvyvXps1A7ah35Qt3tnSGwDjSr0Q==
X-Received: by 2002:a17:902:9a89:: with SMTP id
 w9mr2142961plp.19.1578710990088; 
 Fri, 10 Jan 2020 18:49:50 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.78])
 by smtp.gmail.com with ESMTPSA id r7sm4778472pfg.34.2020.01.10.18.49.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 10 Jan 2020 18:49:49 -0800 (PST)
From: Zhangfei Gao <zhangfei.gao@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 jonathan.cameron@huawei.com, dave.jiang@intel.com, grant.likely@arm.com,
 jean-philippe <jean-philippe@linaro.org>,
 Jerome Glisse <jglisse@redhat.com>, ilias.apalodimas@linaro.org,
 francois.ozog@linaro.org, kenneth-lee-2012@foxmail.com,
 Wangzhou <wangzhou1@hisilicon.com>,
 "haojian . zhuang" <haojian.zhuang@linaro.org>, guodong.xu@linaro.org
Subject: [PATCH v11 4/4] crypto: hisilicon - register zip engine to uacce
Date: Sat, 11 Jan 2020 10:48:39 +0800
Message-Id: <1578710919-12141-5-git-send-email-zhangfei.gao@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578710919-12141-1-git-send-email-zhangfei.gao@linaro.org>
References: <1578710919-12141-1-git-send-email-zhangfei.gao@linaro.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-accelerators@lists.ozlabs.org,
 linux-crypto@vger.kernel.org
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

Register qm to uacce framework for user crypto driver

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 drivers/crypto/hisilicon/qm.c           | 236 +++++++++++++++++++++++++++++++-
 drivers/crypto/hisilicon/qm.h           |  11 ++
 drivers/crypto/hisilicon/zip/zip_main.c |  16 ++-
 include/uapi/misc/uacce/hisi_qm.h       |  23 ++++
 4 files changed, 278 insertions(+), 8 deletions(-)
 create mode 100644 include/uapi/misc/uacce/hisi_qm.h

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index d6e2497..e8b278e 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -9,6 +9,9 @@
 #include <linux/log2.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/uacce.h>
+#include <linux/uaccess.h>
+#include <uapi/misc/uacce/hisi_qm.h>
 #include "qm.h"
 
 /* eq/aeq irq enable */
@@ -465,9 +468,14 @@ static void qm_cq_head_update(struct hisi_qp *qp)
 
 static void qm_poll_qp(struct hisi_qp *qp, struct hisi_qm *qm)
 {
-	struct qm_cqe *cqe = qp->cqe + qp->qp_status.cq_head;
+	if (qp->event_cb) {
+		qp->event_cb(qp);
+		return;
+	}
 
 	if (qp->req_cb) {
+		struct qm_cqe *cqe = qp->cqe + qp->qp_status.cq_head;
+
 		while (QM_CQE_PHASE(cqe) == qp->qp_status.cqc_phase) {
 			dma_rmb();
 			qp->req_cb(qp, qp->sqe + qm->sqe_size *
@@ -1269,7 +1277,7 @@ static int qm_qp_ctx_cfg(struct hisi_qp *qp, int qp_id, int pasid)
  * @qp: The qp we want to start to run.
  * @arg: Accelerator specific argument.
  *
- * After this function, qp can receive request from user. Return qp_id if
+ * After this function, qp can receive request from user. Return 0 if
  * successful, Return -EBUSY if failed.
  */
 int hisi_qm_start_qp(struct hisi_qp *qp, unsigned long arg)
@@ -1314,7 +1322,7 @@ int hisi_qm_start_qp(struct hisi_qp *qp, unsigned long arg)
 
 	dev_dbg(dev, "queue %d started\n", qp_id);
 
-	return qp_id;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(hisi_qm_start_qp);
 
@@ -1440,6 +1448,213 @@ static void hisi_qm_cache_wb(struct hisi_qm *qm)
 	}
 }
 
+static void qm_qp_event_notifier(struct hisi_qp *qp)
+{
+	wake_up_interruptible(&qp->uacce_q->wait);
+}
+
+static int hisi_qm_get_available_instances(struct uacce_device *uacce)
+{
+	int i, ret;
+	struct hisi_qm *qm = uacce->priv;
+
+	read_lock(&qm->qps_lock);
+	for (i = 0, ret = 0; i < qm->qp_num; i++)
+		if (!qm->qp_array[i])
+			ret++;
+	read_unlock(&qm->qps_lock);
+
+	return ret;
+}
+
+static int hisi_qm_uacce_get_queue(struct uacce_device *uacce,
+				   unsigned long arg,
+				   struct uacce_queue *q)
+{
+	struct hisi_qm *qm = uacce->priv;
+	struct hisi_qp *qp;
+	u8 alg_type = 0;
+
+	qp = hisi_qm_create_qp(qm, alg_type);
+	if (IS_ERR(qp))
+		return PTR_ERR(qp);
+
+	q->priv = qp;
+	q->uacce = uacce;
+	qp->uacce_q = q;
+	qp->event_cb = qm_qp_event_notifier;
+	qp->pasid = arg;
+
+	return 0;
+}
+
+static void hisi_qm_uacce_put_queue(struct uacce_queue *q)
+{
+	struct hisi_qp *qp = q->priv;
+
+	hisi_qm_cache_wb(qp->qm);
+	hisi_qm_release_qp(qp);
+}
+
+/* map sq/cq/doorbell to user space */
+static int hisi_qm_uacce_mmap(struct uacce_queue *q,
+			      struct vm_area_struct *vma,
+			      struct uacce_qfile_region *qfr)
+{
+	struct hisi_qp *qp = q->priv;
+	struct hisi_qm *qm = qp->qm;
+	size_t sz = vma->vm_end - vma->vm_start;
+	struct pci_dev *pdev = qm->pdev;
+	struct device *dev = &pdev->dev;
+	unsigned long vm_pgoff;
+	int ret;
+
+	switch (qfr->type) {
+	case UACCE_QFRT_MMIO:
+		if (qm->ver == QM_HW_V2) {
+			if (sz > PAGE_SIZE * (QM_DOORBELL_PAGE_NR +
+			    QM_DOORBELL_SQ_CQ_BASE_V2 / PAGE_SIZE))
+				return -EINVAL;
+		} else {
+			if (sz > PAGE_SIZE * QM_DOORBELL_PAGE_NR)
+				return -EINVAL;
+		}
+
+		vma->vm_flags |= VM_IO;
+
+		return remap_pfn_range(vma, vma->vm_start,
+				       qm->phys_base >> PAGE_SHIFT,
+				       sz, pgprot_noncached(vma->vm_page_prot));
+	case UACCE_QFRT_DUS:
+		if (sz != qp->qdma.size)
+			return -EINVAL;
+
+		/*
+		 * dma_mmap_coherent() requires vm_pgoff as 0
+		 * restore vm_pfoff to initial value for mmap()
+		 */
+		vm_pgoff = vma->vm_pgoff;
+		vma->vm_pgoff = 0;
+		ret = dma_mmap_coherent(dev, vma, qp->qdma.va,
+					qp->qdma.dma, sz);
+		vma->vm_pgoff = vm_pgoff;
+		return ret;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int hisi_qm_uacce_start_queue(struct uacce_queue *q)
+{
+	struct hisi_qp *qp = q->priv;
+
+	return hisi_qm_start_qp(qp, qp->pasid);
+}
+
+static void hisi_qm_uacce_stop_queue(struct uacce_queue *q)
+{
+	hisi_qm_stop_qp(q->priv);
+}
+
+static int qm_set_sqctype(struct uacce_queue *q, u16 type)
+{
+	struct hisi_qm *qm = q->uacce->priv;
+	struct hisi_qp *qp = q->priv;
+
+	write_lock(&qm->qps_lock);
+	qp->alg_type = type;
+	write_unlock(&qm->qps_lock);
+
+	return 0;
+}
+
+static long hisi_qm_uacce_ioctl(struct uacce_queue *q, unsigned int cmd,
+				unsigned long arg)
+{
+	struct hisi_qp *qp = q->priv;
+	struct hisi_qp_ctx qp_ctx;
+
+	if (cmd == UACCE_CMD_QM_SET_QP_CTX) {
+		if (copy_from_user(&qp_ctx, (void __user *)arg,
+				   sizeof(struct hisi_qp_ctx)))
+			return -EFAULT;
+
+		if (qp_ctx.qc_type != 0 && qp_ctx.qc_type != 1)
+			return -EINVAL;
+
+		qm_set_sqctype(q, qp_ctx.qc_type);
+		qp_ctx.id = qp->qp_id;
+
+		if (copy_to_user((void __user *)arg, &qp_ctx,
+				 sizeof(struct hisi_qp_ctx)))
+			return -EFAULT;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct uacce_ops uacce_qm_ops = {
+	.get_available_instances = hisi_qm_get_available_instances,
+	.get_queue = hisi_qm_uacce_get_queue,
+	.put_queue = hisi_qm_uacce_put_queue,
+	.start_queue = hisi_qm_uacce_start_queue,
+	.stop_queue = hisi_qm_uacce_stop_queue,
+	.mmap = hisi_qm_uacce_mmap,
+	.ioctl = hisi_qm_uacce_ioctl,
+};
+
+static int qm_alloc_uacce(struct hisi_qm *qm)
+{
+	struct pci_dev *pdev = qm->pdev;
+	struct uacce_device *uacce;
+	unsigned long mmio_page_nr;
+	unsigned long dus_page_nr;
+	struct uacce_interface interface = {
+		.flags = UACCE_DEV_SVA,
+		.ops = &uacce_qm_ops,
+	};
+
+	strncpy(interface.name, pdev->driver->name, sizeof(interface.name));
+
+	uacce = uacce_alloc(&pdev->dev, &interface);
+	if (IS_ERR(uacce))
+		return PTR_ERR(uacce);
+
+	if (uacce->flags & UACCE_DEV_SVA) {
+		qm->use_sva = true;
+	} else {
+		/* only consider sva case */
+		uacce_remove(uacce);
+		return -EINVAL;
+	}
+
+	uacce->is_vf = pdev->is_virtfn;
+	uacce->priv = qm;
+	uacce->algs = qm->algs;
+
+	if (qm->ver == QM_HW_V1) {
+		mmio_page_nr = QM_DOORBELL_PAGE_NR;
+		uacce->api_ver = HISI_QM_API_VER_BASE;
+	} else {
+		mmio_page_nr = QM_DOORBELL_PAGE_NR +
+			QM_DOORBELL_SQ_CQ_BASE_V2 / PAGE_SIZE;
+		uacce->api_ver = HISI_QM_API_VER2_BASE;
+	}
+
+	dus_page_nr = (PAGE_SIZE - 1 + qm->sqe_size * QM_Q_DEPTH +
+		       sizeof(struct qm_cqe) * QM_Q_DEPTH) >> PAGE_SHIFT;
+
+	uacce->qf_pg_num[UACCE_QFRT_MMIO] = mmio_page_nr;
+	uacce->qf_pg_num[UACCE_QFRT_DUS]  = dus_page_nr;
+
+	qm->uacce = uacce;
+
+	return 0;
+}
+
 /**
  * hisi_qm_get_free_qp_num() - Get free number of qp in qm.
  * @qm: The qm which want to get free qp.
@@ -1482,10 +1697,14 @@ int hisi_qm_init(struct hisi_qm *qm)
 		return -EINVAL;
 	}
 
+	ret = qm_alloc_uacce(qm);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "fail to alloc uacce (%d)\n", ret);
+
 	ret = pci_enable_device_mem(pdev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to enable device mem!\n");
-		return ret;
+		goto err_remove_uacce;
 	}
 
 	ret = pci_request_mem_regions(pdev, qm->dev_name);
@@ -1494,8 +1713,9 @@ int hisi_qm_init(struct hisi_qm *qm)
 		goto err_disable_pcidev;
 	}
 
-	qm->io_base = ioremap(pci_resource_start(pdev, PCI_BAR_2),
-			      pci_resource_len(qm->pdev, PCI_BAR_2));
+	qm->phys_base = pci_resource_start(pdev, PCI_BAR_2);
+	qm->phys_size = pci_resource_len(qm->pdev, PCI_BAR_2);
+	qm->io_base = ioremap(qm->phys_base, qm->phys_size);
 	if (!qm->io_base) {
 		ret = -EIO;
 		goto err_release_mem_regions;
@@ -1538,6 +1758,8 @@ int hisi_qm_init(struct hisi_qm *qm)
 	pci_release_mem_regions(pdev);
 err_disable_pcidev:
 	pci_disable_device(pdev);
+err_remove_uacce:
+	uacce_remove(qm->uacce);
 
 	return ret;
 }
@@ -1554,6 +1776,8 @@ void hisi_qm_uninit(struct hisi_qm *qm)
 	struct pci_dev *pdev = qm->pdev;
 	struct device *dev = &pdev->dev;
 
+	uacce_remove(qm->uacce);
+
 	if (qm->use_dma_api && qm->qdma.va) {
 		hisi_qm_cache_wb(qm);
 		dma_free_coherent(dev, qm->qdma.size,
diff --git a/drivers/crypto/hisilicon/qm.h b/drivers/crypto/hisilicon/qm.h
index 078b8f1..c096f80 100644
--- a/drivers/crypto/hisilicon/qm.h
+++ b/drivers/crypto/hisilicon/qm.h
@@ -77,6 +77,9 @@
 
 #define HISI_ACC_SGL_SGE_NR_MAX		255
 
+/* page number for queue file region */
+#define QM_DOORBELL_PAGE_NR		1
+
 enum qp_state {
 	QP_STOP,
 };
@@ -162,7 +165,12 @@ struct hisi_qm {
 	u32 error_mask;
 	u32 msi_mask;
 
+	const char *algs;
 	bool use_dma_api;
+	bool use_sva;
+	resource_size_t phys_base;
+	resource_size_t phys_size;
+	struct uacce_device *uacce;
 };
 
 struct hisi_qp_status {
@@ -192,10 +200,13 @@ struct hisi_qp {
 	struct hisi_qp_ops *hw_ops;
 	void *qp_ctx;
 	void (*req_cb)(struct hisi_qp *qp, void *data);
+	void (*event_cb)(struct hisi_qp *qp);
 	struct work_struct work;
 	struct workqueue_struct *wq;
 
 	struct hisi_qm *qm;
+	u16 pasid;
+	struct uacce_queue *uacce_q;
 };
 
 int hisi_qm_init(struct hisi_qm *qm);
diff --git a/drivers/crypto/hisilicon/zip/zip_main.c b/drivers/crypto/hisilicon/zip/zip_main.c
index 853b97e..622f60b 100644
--- a/drivers/crypto/hisilicon/zip/zip_main.c
+++ b/drivers/crypto/hisilicon/zip/zip_main.c
@@ -11,6 +11,7 @@
 #include <linux/pci.h>
 #include <linux/seq_file.h>
 #include <linux/topology.h>
+#include <linux/uacce.h>
 #include "zip.h"
 
 #define PCI_DEVICE_ID_ZIP_PF		0xa250
@@ -351,8 +352,14 @@ static void hisi_zip_set_user_domain_and_cache(struct hisi_zip *hisi_zip)
 	writel(AXUSER_BASE, base + HZIP_BD_RUSER_32_63);
 	writel(AXUSER_BASE, base + HZIP_SGL_RUSER_32_63);
 	writel(AXUSER_BASE, base + HZIP_BD_WUSER_32_63);
-	writel(AXUSER_BASE, base + HZIP_DATA_RUSER_32_63);
-	writel(AXUSER_BASE, base + HZIP_DATA_WUSER_32_63);
+
+	if (hisi_zip->qm.use_sva) {
+		writel(AXUSER_BASE | AXUSER_SSV, base + HZIP_DATA_RUSER_32_63);
+		writel(AXUSER_BASE | AXUSER_SSV, base + HZIP_DATA_WUSER_32_63);
+	} else {
+		writel(AXUSER_BASE, base + HZIP_DATA_RUSER_32_63);
+		writel(AXUSER_BASE, base + HZIP_DATA_WUSER_32_63);
+	}
 
 	/* let's open all compression/decompression cores */
 	writel(DECOMP_CHECK_ENABLE | ALL_COMP_DECOMP_EN,
@@ -797,6 +804,7 @@ static int hisi_zip_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	qm->pdev = pdev;
 	qm->ver = rev_id;
 
+	qm->algs = "zlib\ngzip";
 	qm->sqe_size = HZIP_SQE_SIZE;
 	qm->dev_name = hisi_zip_name;
 	qm->fun_type = (pdev->device == PCI_DEVICE_ID_ZIP_PF) ? QM_HW_PF :
@@ -840,6 +848,10 @@ static int hisi_zip_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	hisi_zip_add_to_list(hisi_zip);
 
+	ret = uacce_register(qm->uacce);
+	if (ret)
+		goto err_qm_uninit;
+
 	if (qm->fun_type == QM_HW_PF && vfs_num > 0) {
 		ret = hisi_zip_sriov_enable(pdev, vfs_num);
 		if (ret < 0)
diff --git a/include/uapi/misc/uacce/hisi_qm.h b/include/uapi/misc/uacce/hisi_qm.h
new file mode 100644
index 0000000..6435f0b
--- /dev/null
+++ b/include/uapi/misc/uacce/hisi_qm.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+#ifndef _UAPI_HISI_QM_H
+#define _UAPI_HISI_QM_H
+
+#include <linux/types.h>
+
+/**
+ * struct hisi_qp_ctx - User data for hisi qp.
+ * @id: qp_index return to user space
+ * @qc_type: Accelerator algorithm type
+ */
+struct hisi_qp_ctx {
+	__u16 id;
+	__u16 qc_type;
+};
+
+#define HISI_QM_API_VER_BASE "hisi_qm_v1"
+#define HISI_QM_API_VER2_BASE "hisi_qm_v2"
+
+/* UACCE_CMD_QM_SET_QP_CTX: Set qp algorithm type */
+#define UACCE_CMD_QM_SET_QP_CTX	_IOWR('H', 10, struct hisi_qp_ctx)
+
+#endif
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
