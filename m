Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D97933C6C66
	for <lists.iommu@lfdr.de>; Tue, 13 Jul 2021 10:48:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6FC8316F;
	Tue, 13 Jul 2021 08:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLW7Yad_x0fP; Tue, 13 Jul 2021 08:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A3AE8838F0;
	Tue, 13 Jul 2021 08:48:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 762E7C000E;
	Tue, 13 Jul 2021 08:48:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D34EC000E
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C358282884
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0usSM3ybHq5 for <iommu@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 08:48:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 474B583843
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:48:08 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id y17so20976715pgf.12
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkBBc1IawD+Ffhgxr5n+Z15KbqmeeJxiazdLqHh1xrc=;
 b=yszZshd37Q1r8rl2w4Lwrj6YFf82n3z6RFM2/AVb64c2vPdKXY1wme59FfefIDnkgr
 ZeHW2AajsEfK2rxQLc6OuYZkgjbUBXJA+gcejIcjQVScRmmzU//ovNfFgpCztM6evjZb
 /n+WP+ydd3YlkZ8SQbNriexfCms41b+6n5JyrSnt1kqA40n300sAvayGKIsgDO660Dag
 xPMXs0Ybb8+DJM4LihYMuZRid7CateX2g6ffuDfJjjN9xcWY2pbOZU1RjT72UvyZtG7E
 Iu7G8pek5Vi+CTDYAPuzeMfjRbD3yyHp8cITHLj2FoMlmhTbDWiVkQDUq3fyefNyyPld
 e0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkBBc1IawD+Ffhgxr5n+Z15KbqmeeJxiazdLqHh1xrc=;
 b=uKa3/qOrkiQ/kwb9O8PfOupr7DlQ49NTkAhdlmiOCWYd5EC62RBPiOHdhADWD0NtQd
 Qin8WUGWinYWGn23P2irpFlRrS160umeBPvmfel00DCmUZLBvHInXnTWnjhp2G28Wye8
 XvynVOhe4zUlE9UqjudToSVlziwSWBTLNlwvc+BQHMpyAI1YR5qyUjYFjPMAqsF5dmJs
 vZZos3uRhDLLH2GfCqNNO8LEdfQ4IX1TwXT81fAriCMDU/9pQ6V3+mbyOrDaPQAlc8Dy
 idwISmSiKvL1dor/39DK/OWx43d8lh1Nrw/z44y+949A+NDW1PT+H2I7+4GuJVq/lkVz
 sohA==
X-Gm-Message-State: AOAM533gb915cbgOjIj5pzPDsSHWiVZ1oaO3LkWCN2sTieQwJ8OsgBRC
 tc/FsoAlqObiLRttvNrfilR7
X-Google-Smtp-Source: ABdhPJzZdDWqJmTNf93gwkTO/YfKFCx5ihMhJT+DOlHvR2RbC+0OzE+HpikVZnSzaRW2shba6Z0k9A==
X-Received: by 2002:aa7:8704:0:b029:328:c7ca:fe33 with SMTP id
 b4-20020aa787040000b0290328c7cafe33mr3425253pfo.12.1626166087820; 
 Tue, 13 Jul 2021 01:48:07 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id bf18sm4475167pjb.46.2021.07.13.01.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 01:48:07 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com
Subject: [PATCH v9 12/17] vdpa: Add an opaque pointer for
 vdpa_config_ops.dma_map()
Date: Tue, 13 Jul 2021 16:46:51 +0800
Message-Id: <20210713084656.232-13-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713084656.232-1-xieyongji@bytedance.com>
References: <20210713084656.232-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 songmuchun@bytedance.com, linux-fsdevel@vger.kernel.org
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

Add an opaque pointer for DMA mapping.

Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 6 +++---
 drivers/vhost/vdpa.c             | 2 +-
 include/linux/vdpa.h             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 72167963421b..f456f4baf86d 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -542,14 +542,14 @@ static int vdpasim_set_map(struct vdpa_device *vdpa,
 }
 
 static int vdpasim_dma_map(struct vdpa_device *vdpa, u64 iova, u64 size,
-			   u64 pa, u32 perm)
+			   u64 pa, u32 perm, void *opaque)
 {
 	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
 	int ret;
 
 	spin_lock(&vdpasim->iommu_lock);
-	ret = vhost_iotlb_add_range(vdpasim->iommu, iova, iova + size - 1, pa,
-				    perm);
+	ret = vhost_iotlb_add_range_ctx(vdpasim->iommu, iova, iova + size - 1,
+					pa, perm, opaque);
 	spin_unlock(&vdpasim->iommu_lock);
 
 	return ret;
diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 8615756306ec..f60a513dac7c 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -578,7 +578,7 @@ static int vhost_vdpa_map(struct vhost_vdpa *v,
 		return r;
 
 	if (ops->dma_map) {
-		r = ops->dma_map(vdpa, iova, size, pa, perm);
+		r = ops->dma_map(vdpa, iova, size, pa, perm, NULL);
 	} else if (ops->set_map) {
 		if (!v->in_batch)
 			r = ops->set_map(vdpa, dev->iotlb);
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 198c30e84b5d..4903e67c690b 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -268,7 +268,7 @@ struct vdpa_config_ops {
 	/* DMA ops */
 	int (*set_map)(struct vdpa_device *vdev, struct vhost_iotlb *iotlb);
 	int (*dma_map)(struct vdpa_device *vdev, u64 iova, u64 size,
-		       u64 pa, u32 perm);
+		       u64 pa, u32 perm, void *opaque);
 	int (*dma_unmap)(struct vdpa_device *vdev, u64 iova, u64 size);
 
 	/* Free device resources */
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
