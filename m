Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFC3997EB
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 04:11:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9245B60B1D;
	Thu,  3 Jun 2021 02:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rf2ccmI0aU9v; Thu,  3 Jun 2021 02:10:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A7EA60B00;
	Thu,  3 Jun 2021 02:10:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87C72C0001;
	Thu,  3 Jun 2021 02:10:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87C58C0001;
 Thu,  3 Jun 2021 00:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3213983D4C;
 Thu,  3 Jun 2021 00:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oS5dBcBkURbf; Thu,  3 Jun 2021 00:41:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 681B183D47;
 Thu,  3 Jun 2021 00:41:47 +0000 (UTC)
IronPort-SDR: UkuYdFlA2AIUjHMr5anYBfmsb8rYb4sU7TAtqC9T/0PUBulQHAhNswLoknMVGpvu37Q6X2Vb+P
 MCXgSsRuaHXw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="191281569"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="191281569"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 17:41:44 -0700
IronPort-SDR: rlyoqNWWeXyvXoVbNuuUK3XZ1Fd5UUASA5LehE5YNWmgGQqO1lOphbl/vq+xhP/7KFutiwdzVk
 eB9TI4QJcAnw==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="549686677"
Received: from tassilo.jf.intel.com ([10.54.74.11])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 17:41:44 -0700
From: Andi Kleen <ak@linux.intel.com>
To: mst@redhat.com
Subject: [PATCH v1 3/8] virtio: Harden split buffer detachment
Date: Wed,  2 Jun 2021 17:41:28 -0700
Message-Id: <20210603004133.4079390-4-ak@linux.intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210603004133.4079390-1-ak@linux.intel.com>
References: <20210603004133.4079390-1-ak@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Jun 2021 02:10:48 +0000
Cc: Andi Kleen <ak@linux.intel.com>, jasowang@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, jpoimboe@redhat.com, robin.murphy@arm.com,
 hch@lst.de
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Harden the split buffer detachment path by adding boundary checking. Note
that when this fails we may fail to unmap some swiotlb mapping, which could
result in a leak and a DOS. But that's acceptable because an malicious host
can DOS us anyways.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 drivers/virtio/virtio_ring.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index d37ff5a0ff58..1e9aa1e95e1b 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -651,12 +651,19 @@ static bool virtqueue_kick_prepare_split(struct virtqueue *_vq)
 	return needs_kick;
 }
 
-static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
-			     void **ctx)
+static int detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
+			    void **ctx)
 {
 	unsigned int i, j;
 	__virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
 
+	/* We'll leak DMA mappings when this happens, but nothing
+	 * can be done about that. In the worst case the host
+	 * could DOS us, but it can of course do that anyways.
+	 */
+	if (!inside_split_ring(vq, head))
+		return -EIO;
+
 	/* Clear data ptr. */
 	vq->split.desc_state[head].data = NULL;
 
@@ -666,6 +673,8 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
 	while (vq->split.vring.desc[i].flags & nextflag) {
 		vring_unmap_one_split(vq, &vq->split.vring.desc[i]);
 		i = virtio16_to_cpu(vq->vq.vdev, vq->split.vring.desc[i].next);
+		if (!inside_split_ring(vq, i))
+			return -EIO;
 		vq->vq.num_free++;
 	}
 
@@ -684,7 +693,7 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
 
 		/* Free the indirect table, if any, now that it's unmapped. */
 		if (!indir_desc)
-			return;
+			return 0;
 
 		len = virtio32_to_cpu(vq->vq.vdev,
 				vq->split.vring.desc[head].len);
@@ -701,6 +710,7 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
 	} else if (ctx) {
 		*ctx = vq->split.desc_state[head].indir_desc;
 	}
+	return 0;
 }
 
 static inline bool more_used_split(const struct vring_virtqueue *vq)
@@ -717,6 +727,7 @@ static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
 	void *ret;
 	unsigned int i;
 	u16 last_used;
+	int err;
 
 	START_USE(vq);
 
@@ -751,7 +762,12 @@ static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
 
 	/* detach_buf_split clears data, so grab it now. */
 	ret = vq->split.desc_state[i].data;
-	detach_buf_split(vq, i, ctx);
+	err = detach_buf_split(vq, i, ctx);
+	if (err) {
+		END_USE(vq);
+		return NULL;
+	}
+
 	vq->last_used_idx++;
 	/* If we expect an interrupt for the next entry, tell host
 	 * by writing event index and flush out the write before
@@ -863,6 +879,7 @@ static void *virtqueue_detach_unused_buf_split(struct virtqueue *_vq)
 		/* detach_buf_split clears data, so grab it now. */
 		buf = vq->split.desc_state[i].data;
 		detach_buf_split(vq, i, NULL);
+		/* Don't need to check for error because nothing is returned */
 		vq->split.avail_idx_shadow--;
 		vq->split.vring.avail->idx = cpu_to_virtio16(_vq->vdev,
 				vq->split.avail_idx_shadow);
-- 
2.25.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
