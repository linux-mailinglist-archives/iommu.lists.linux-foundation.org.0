Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 40549368FDA
	for <lists.iommu@lfdr.de>; Fri, 23 Apr 2021 11:52:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46E960A56;
	Fri, 23 Apr 2021 09:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rz0n3EELKIF6; Fri, 23 Apr 2021 09:52:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3BFE60674;
	Fri, 23 Apr 2021 09:52:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0963C000B;
	Fri, 23 Apr 2021 09:52:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42C44C000B;
 Fri, 23 Apr 2021 09:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30C27607E5;
 Fri, 23 Apr 2021 09:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIvbvthU4es7; Fri, 23 Apr 2021 09:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 775D360674;
 Fri, 23 Apr 2021 09:52:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 009CB1682;
 Fri, 23 Apr 2021 02:52:45 -0700 (PDT)
Received: from usa.arm.com (a074945.blr.arm.com [10.162.16.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD2393F774;
 Fri, 23 Apr 2021 02:52:40 -0700 (PDT)
From: Vivek Gautam <vivek.gautam@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 10/11] uapi/virtio-iommu: Add a new request type to
 send page response
Date: Fri, 23 Apr 2021 15:21:46 +0530
Message-Id: <20210423095147.27922-11-vivek.gautam@arm.com>
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

Once the page faults are handled, the response has to be sent to
virtio-iommu backend, from where it can be sent to the host to
prepare the response to a generated io page fault by the device.
Add a new virt-queue request type to handle this.

Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 include/uapi/linux/virtio_iommu.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
index c12d9b6a7243..1b174b98663a 100644
--- a/include/uapi/linux/virtio_iommu.h
+++ b/include/uapi/linux/virtio_iommu.h
@@ -48,6 +48,7 @@ struct virtio_iommu_config {
 #define VIRTIO_IOMMU_T_PROBE			0x05
 #define VIRTIO_IOMMU_T_ATTACH_TABLE		0x06
 #define VIRTIO_IOMMU_T_INVALIDATE		0x07
+#define VIRTIO_IOMMU_T_PAGE_RESP		0x08
 
 /* Status types */
 #define VIRTIO_IOMMU_S_OK			0x00
@@ -70,6 +71,23 @@ struct virtio_iommu_req_tail {
 	__u8					reserved[3];
 };
 
+struct virtio_iommu_req_page_resp {
+	struct virtio_iommu_req_head		head;
+	__le32					domain;
+	__le32					endpoint;
+#define VIRTIO_IOMMU_PAGE_RESP_PASID_VALID	(1 << 0)
+	__le32					flags;
+	__le32					pasid;
+	__le32					grpid;
+#define VIRTIO_IOMMU_PAGE_RESP_SUCCESS		(0x0)
+#define VIRTIO_IOMMU_PAGE_RESP_INVALID		(0x1)
+#define VIRTIO_IOMMU_PAGE_RESP_FAILURE		(0x2)
+	__le16					resp_code;
+	__u8					pasid_valid;
+	__u8					reserved[9];
+	struct virtio_iommu_req_tail		tail;
+};
+
 struct virtio_iommu_req_attach {
 	struct virtio_iommu_req_head		head;
 	__le32					domain;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
