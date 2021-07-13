Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F693C6C4C
	for <lists.iommu@lfdr.de>; Tue, 13 Jul 2021 10:47:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1616D82893;
	Tue, 13 Jul 2021 08:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PzJ0B3SQSoS4; Tue, 13 Jul 2021 08:47:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BC664826FB;
	Tue, 13 Jul 2021 08:47:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97859C000E;
	Tue, 13 Jul 2021 08:47:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C183C0022
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 603A740460
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpNbpRgiXfXs for <iommu@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 08:47:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C28DE40459
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:47:34 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id j199so18931849pfd.7
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fyDF3ItsKMeO1MjqIrqgJilMt7mYKDPvv5TK6RowgtE=;
 b=p1KNnydZcTiuyWle/nJtM7wFkNnRwelSBfv+CpsCxOYkJn5kWph/w1ljqkJz9zrEg5
 L2pkcNggfl3Q9RjS5qhSOgAu/suoOWBFYsfmw4VoJ3cVZCGQWXC/t3LZ5InMM8XR5LRl
 xHGxHb49eUsoBIewF2f127m9Zr6vQ1nNrE7ANg6C6KNKlJI6o8pJl/1YyAaWFPkOV3/r
 EsJv5vTsWLrxteRhSjRM/MuUUYUEpmJLfFEjWeF53QSvgsRiNQPzhkLCqrfes/TWccji
 zCW/mpIwd16XGKv0iCcj7quuKncnXS6vKRI09sMPi97p5ey6v9LWBy67FlYZ5GtM1LSk
 RZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fyDF3ItsKMeO1MjqIrqgJilMt7mYKDPvv5TK6RowgtE=;
 b=GQkComPioSee1Xoxds9wYWpvJr2XbuA8SrIubzuBH4C6tRapaXVZ/rvfGazd760xKH
 aR1Kd4hIjcBiP6S8TWJcehrQatt258Y8q/dkEohaUvCp4DPxYmatZubAAlD97J4AF4Is
 ADyaHCT1YPwJlQcET2Gz5Llpeeq5lbkkb+l7aLpEri/IN6agdIDJqGVKE95qJZ2CQ1nT
 A2LsOeXgJBnxxheyE0/NfY1nEPx96OXztXhNiCmHaJct8lsLTYE4ZE+SpO1lUU7d+JoD
 oraZtDHy644XbwICTrzmRD5OP81gC4EUUNIhTctlGe9TgwjprTCTgUlbtGe3mSQogs9V
 yiMw==
X-Gm-Message-State: AOAM531hmogEahn8q25ZpbRUhmZtWR/iv/qDpxrirz8jqQrV++iNJ1oU
 u5nA+IxVyDrNAsNfFh+ymt4J
X-Google-Smtp-Source: ABdhPJx6Qc5AYiRax5JttuV19B9UsF3u1wzbj3hvEI32kFSkxmH/vgaDI62s1sThuuzVSR58tJkLXA==
X-Received: by 2002:a62:f947:0:b029:2e9:c502:7939 with SMTP id
 g7-20020a62f9470000b02902e9c5027939mr3616720pfm.34.1626166053934; 
 Tue, 13 Jul 2021 01:47:33 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id n6sm12746734pgb.60.2021.07.13.01.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 01:47:33 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com
Subject: [PATCH v9 03/17] vdpa: Fix code indentation
Date: Tue, 13 Jul 2021 16:46:42 +0800
Message-Id: <20210713084656.232-4-xieyongji@bytedance.com>
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

Use tabs to indent the code instead of spaces.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 include/linux/vdpa.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 7c49bc5a2b71..f822490db584 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -342,25 +342,25 @@ static inline struct device *vdpa_get_dma_dev(struct vdpa_device *vdev)
 
 static inline void vdpa_reset(struct vdpa_device *vdev)
 {
-        const struct vdpa_config_ops *ops = vdev->config;
+	const struct vdpa_config_ops *ops = vdev->config;
 
 	vdev->features_valid = false;
-        ops->set_status(vdev, 0);
+	ops->set_status(vdev, 0);
 }
 
 static inline int vdpa_set_features(struct vdpa_device *vdev, u64 features)
 {
-        const struct vdpa_config_ops *ops = vdev->config;
+	const struct vdpa_config_ops *ops = vdev->config;
 
 	vdev->features_valid = true;
-        return ops->set_features(vdev, features);
+	return ops->set_features(vdev, features);
 }
 
 
 static inline void vdpa_get_config(struct vdpa_device *vdev, unsigned offset,
 				   void *buf, unsigned int len)
 {
-        const struct vdpa_config_ops *ops = vdev->config;
+	const struct vdpa_config_ops *ops = vdev->config;
 
 	/*
 	 * Config accesses aren't supposed to trigger before features are set.
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
