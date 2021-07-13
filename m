Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 806ED3C6C52
	for <lists.iommu@lfdr.de>; Tue, 13 Jul 2021 10:47:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34932401C7;
	Tue, 13 Jul 2021 08:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1eDfk6QSAhf; Tue, 13 Jul 2021 08:47:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 697FC404A3;
	Tue, 13 Jul 2021 08:47:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09E7CC001A;
	Tue, 13 Jul 2021 08:47:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17B34C000E
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E68026088E
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQXrtVpp1kts for <iommu@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 08:47:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E59660886
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:38 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d12so18952749pfj.2
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tdSO+YXsywfBhdOnOREu62bNqEWlUHvrtNpQOS7MuZo=;
 b=hiimUl4DgO1Of4XGPXpdICPYnPm7+QvGfh85ne+O9YqLV4HwNaz1/3GVCexKIIR9bK
 79qC2iFIA2pLQ1nFnXPut8k1vrxiwBlzw8SE6x4BYAMbkEs5Gxh0ltQDnZC1DuhOWaXy
 Y2aq3utptKdeOlIEcc73zmkwyC0gwKsapg8k19yhxOLFoyCxe7DHgO2gP5VdDTqtHx6A
 mJhAVdE2NVFsWzib8FCLBIYmov6tjYXcaVAbydRQY1/65AASv7O0PG98TXYj+Gu12TPn
 VjG1m9HmS0VsQdytCx6vQRcAJNoY4lM6llfjwo4MI5ukWs2uwYJovIc1U/KU7Zz4NCOC
 WkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tdSO+YXsywfBhdOnOREu62bNqEWlUHvrtNpQOS7MuZo=;
 b=pbCeuJhcU4yLKKoB9r2+xxECh05BbvuEUbmgZeJnZFKuuSf8dj9a0R9WPV6OWzGELe
 34qbErP9Cv8jvsFvbtZyrvcUN7Cw+RXA2JzvfLqNx8vba34My/TzdeF81d+9IOpC00eN
 vJFEAwupW1sv6Lus3+3c/1QXbqbf/if8GA31NEeul9rNcmU5vEa/5gqERX0DXfIa8tW0
 yU+Qwqkx3hdnuGeKHlDaoGyVNMns7uhCFj/iG/XfDBN4qzOcbuDNtOnBRsYh4Duqf9hX
 xLzGrsoYypZmxgdu5pcyX7h2uvbQ4usPQCc+WzTkc3OKU8l2oTC1SUXQzmHDU41TxPF4
 OFuQ==
X-Gm-Message-State: AOAM530hkGnpbOrFlxt6NGEEHH2WDSIj1zox5fNE1ON+Gx4SxCZ++3rU
 ntpqPc2NgMCDRhSPzTPTfTpD
X-Google-Smtp-Source: ABdhPJzmFohN6vUcKF8KLIan4JZVjJ6TYDpkl96NawoSdWhjfLM6wpCarQvAfJbCfQIvaaP5xnDdBw==
X-Received: by 2002:a05:6a00:2:b029:32e:3ef0:770a with SMTP id
 h2-20020a056a000002b029032e3ef0770amr810552pfk.8.1626166057836; 
 Tue, 13 Jul 2021 01:47:37 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id u7sm21390626pgl.30.2021.07.13.01.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 01:47:37 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com
Subject: [PATCH v9 04/17] vdpa: Fail the vdpa_reset() if fail to set device
 status to zero
Date: Tue, 13 Jul 2021 16:46:43 +0800
Message-Id: <20210713084656.232-5-xieyongji@bytedance.com>
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

Re-read the device status to ensure it's set to zero during
resetting. Otherwise, fail the vdpa_reset() after timeout.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 include/linux/vdpa.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index f822490db584..198c30e84b5d 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/vhost_iotlb.h>
+#include <linux/delay.h>
 
 /**
  * struct vdpa_calllback - vDPA callback definition.
@@ -340,12 +341,24 @@ static inline struct device *vdpa_get_dma_dev(struct vdpa_device *vdev)
 	return vdev->dma_dev;
 }
 
-static inline void vdpa_reset(struct vdpa_device *vdev)
+#define VDPA_RESET_TIMEOUT_MS 1000
+
+static inline int vdpa_reset(struct vdpa_device *vdev)
 {
 	const struct vdpa_config_ops *ops = vdev->config;
+	int timeout = 0;
 
 	vdev->features_valid = false;
 	ops->set_status(vdev, 0);
+	while (ops->get_status(vdev)) {
+		timeout += 20;
+		if (timeout > VDPA_RESET_TIMEOUT_MS)
+			return -EIO;
+
+		msleep(20);
+	}
+
+	return 0;
 }
 
 static inline int vdpa_set_features(struct vdpa_device *vdev, u64 features)
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
