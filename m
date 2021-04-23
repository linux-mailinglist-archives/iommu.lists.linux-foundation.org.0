Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA0368FCF
	for <lists.iommu@lfdr.de>; Fri, 23 Apr 2021 11:52:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6BAC414D8;
	Fri, 23 Apr 2021 09:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pibFXjRoT9cX; Fri, 23 Apr 2021 09:52:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEF8A414FA;
	Fri, 23 Apr 2021 09:52:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4374C001B;
	Fri, 23 Apr 2021 09:52:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45624C000B;
 Fri, 23 Apr 2021 09:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3480D843ED;
 Fri, 23 Apr 2021 09:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cp-bEEJ59uTM; Fri, 23 Apr 2021 09:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B03843D4;
 Fri, 23 Apr 2021 09:52:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3D45152B;
 Fri, 23 Apr 2021 02:52:12 -0700 (PDT)
Received: from usa.arm.com (a074945.blr.arm.com [10.162.16.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C3533F774;
 Fri, 23 Apr 2021 02:52:08 -0700 (PDT)
From: Vivek Gautam <vivek.gautam@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 03/11] iommu/virtio: Handle incoming page faults
Date: Fri, 23 Apr 2021 15:21:39 +0530
Message-Id: <20210423095147.27922-4-vivek.gautam@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423095147.27922-1-vivek.gautam@arm.com>
References: <20210423095147.27922-1-vivek.gautam@arm.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 will.deacon@arm.com, Vivek Gautam <vivek.gautam@arm.com>, robin.murphy@arm.com
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

Redirect the incoming page faults to the registered fault handler
that can take the fault information such as, pasid, page request
group-id, address and pasid flags.

Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 drivers/iommu/virtio-iommu.c      | 80 ++++++++++++++++++++++++++++++-
 include/uapi/linux/virtio_iommu.h |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index c970f386f031..fd237cad1ce5 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -37,6 +37,13 @@
 /* Some architectures need an Address Space ID for each page table */
 DEFINE_XARRAY_ALLOC1(viommu_asid_xa);
 
+struct viommu_dev_pri_work {
+	struct work_struct		work;
+	struct viommu_dev		*dev;
+	struct virtio_iommu_fault	*vfault;
+	u32				endpoint;
+};
+
 struct viommu_dev {
 	struct iommu_device		iommu;
 	struct device			*dev;
@@ -49,6 +56,8 @@ struct viommu_dev {
 	struct list_head		requests;
 	void				*evts;
 	struct list_head		endpoints;
+	struct workqueue_struct		*pri_wq;
+	struct viommu_dev_pri_work	*pri_work;
 
 	/* Device configuration */
 	struct iommu_domain_geometry	geometry;
@@ -666,6 +675,58 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
 	return ret;
 }
 
+static void viommu_handle_ppr(struct work_struct *work)
+{
+	struct viommu_dev_pri_work *pwork =
+				container_of(work, struct viommu_dev_pri_work, work);
+	struct viommu_dev *viommu = pwork->dev;
+	struct virtio_iommu_fault *vfault = pwork->vfault;
+	struct viommu_endpoint *vdev;
+	struct viommu_ep_entry *ep;
+	struct iommu_fault_event fault_evt = {
+		.fault.type = IOMMU_FAULT_PAGE_REQ,
+	};
+	struct iommu_fault_page_request *prq = &fault_evt.fault.prm;
+
+	u32 flags	= le32_to_cpu(vfault->flags);
+	u32 prq_flags	= le32_to_cpu(vfault->pr_evt_flags);
+	u32 endpoint	= pwork->endpoint;
+
+	memset(prq, 0, sizeof(struct iommu_fault_page_request));
+	prq->addr = le64_to_cpu(vfault->address);
+
+	if (prq_flags & VIRTIO_IOMMU_FAULT_PRQ_F_LAST_PAGE)
+		prq->flags |= IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE;
+	if (prq_flags & VIRTIO_IOMMU_FAULT_PRQ_F_PASID_VALID) {
+		prq->flags |= IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
+		prq->pasid = le32_to_cpu(vfault->pasid);
+		prq->grpid = le32_to_cpu(vfault->grpid);
+	}
+
+	if (flags & VIRTIO_IOMMU_FAULT_F_READ)
+		prq->perm |= IOMMU_FAULT_PERM_READ;
+	if (flags & VIRTIO_IOMMU_FAULT_F_WRITE)
+		prq->perm |= IOMMU_FAULT_PERM_WRITE;
+	if (flags & VIRTIO_IOMMU_FAULT_F_EXEC)
+		prq->perm |= IOMMU_FAULT_PERM_EXEC;
+	if (flags & VIRTIO_IOMMU_FAULT_F_PRIV)
+		prq->perm |= IOMMU_FAULT_PERM_PRIV;
+
+	list_for_each_entry(ep, &viommu->endpoints, list) {
+		if (ep->eid == endpoint) {
+			vdev = ep->vdev;
+			break;
+		}
+	}
+
+	if ((prq_flags & VIRTIO_IOMMU_FAULT_PRQ_F_PASID_VALID) &&
+	    (prq_flags & VIRTIO_IOMMU_FAULT_PRQ_F_NEEDS_PASID))
+		prq->flags |= IOMMU_FAULT_PAGE_RESPONSE_NEEDS_PASID;
+
+	if (iommu_report_device_fault(vdev->dev, &fault_evt))
+		dev_err(vdev->dev, "Couldn't handle page request\n");
+}
+
 static int viommu_fault_handler(struct viommu_dev *viommu,
 				struct virtio_iommu_fault *fault)
 {
@@ -679,7 +740,13 @@ static int viommu_fault_handler(struct viommu_dev *viommu,
 	u32 pasid	= le32_to_cpu(fault->pasid);
 
 	if (type == VIRTIO_IOMMU_FAULT_F_PAGE_REQ) {
-		dev_info(viommu->dev, "Page request fault - unhandled\n");
+		dev_info_ratelimited(viommu->dev,
+				     "Page request fault from EP %u\n",
+				     endpoint);
+
+		viommu->pri_work->vfault = fault;
+		viommu->pri_work->endpoint = endpoint;
+		queue_work(viommu->pri_wq, &viommu->pri_work->work);
 		return 0;
 	}
 
@@ -1683,6 +1750,17 @@ static int viommu_probe(struct virtio_device *vdev)
 		goto err_free_vqs;
 	}
 
+	viommu->pri_work = kzalloc(sizeof(*viommu->pri_work), GFP_KERNEL);
+	if (!viommu->pri_work)
+		return -ENOMEM;
+
+	viommu->pri_work->dev = viommu;
+
+	INIT_WORK(&viommu->pri_work->work, viommu_handle_ppr);
+	viommu->pri_wq = create_singlethread_workqueue("viommu-pri-wq");
+	if (!viommu->pri_wq)
+		return -ENOMEM;
+
 	viommu->map_flags = VIRTIO_IOMMU_MAP_F_READ | VIRTIO_IOMMU_MAP_F_WRITE;
 	viommu->last_domain = ~0U;
 
diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
index accc3318ce46..53aa88e6b077 100644
--- a/include/uapi/linux/virtio_iommu.h
+++ b/include/uapi/linux/virtio_iommu.h
@@ -302,6 +302,7 @@ struct virtio_iommu_req_invalidate {
 #define VIRTIO_IOMMU_FAULT_F_READ		(1 << 0)
 #define VIRTIO_IOMMU_FAULT_F_WRITE		(1 << 1)
 #define VIRTIO_IOMMU_FAULT_F_EXEC		(1 << 2)
+#define VIRTIO_IOMMU_FAULT_F_PRIV		(1 << 3)
 #define VIRTIO_IOMMU_FAULT_F_ADDRESS		(1 << 8)
 
 #define VIRTIO_IOMMU_FAULT_F_DMA_UNRECOV	1
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
