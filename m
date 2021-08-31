Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7863FC5B5
	for <lists.iommu@lfdr.de>; Tue, 31 Aug 2021 12:37:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D657660A39;
	Tue, 31 Aug 2021 10:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbnID72pAOeo; Tue, 31 Aug 2021 10:37:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EECA660BCE;
	Tue, 31 Aug 2021 10:37:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAE92C000E;
	Tue, 31 Aug 2021 10:37:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1844C000E
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3767400D0
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hFNgwngo6op for <iommu@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 10:37:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8414400C6
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 10:37:08 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id n18so16191095pgm.12
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VYKP4BtY52G/QfxOL4ci9LsSwqIuUiAxga6ojIUWhM=;
 b=GRqzs++JfJ/YbVycJKzsl230H9LBdcktSOMS0CRM7Z9csGboLrEDaTHS5mpZ9R6W/Q
 h0yUebb0vnRiVhQovGlWZ4qHObLreAQwGxubBzLmX2VpvriR9tTYILs/hWcaIMuq02Ju
 yxmfLSeC0NhVfNEgU1etpXijn0DhnNH9psTW5aD6mhU5ZMkXucGvNU4iy5HTuVHhQQ37
 vN7Cdj/LUB/OZgH70gNMN0CSQQC2g5vU52gKzZiimqROPIjpuhS+RRG+BNYAm0p/s9Dg
 dpiWnWnDnoLVFJ4avE1AGnTW5nXyqjeVKRFFFQW+l5X6R3F25kk7ys29KnpYZo3mRaip
 ZtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VYKP4BtY52G/QfxOL4ci9LsSwqIuUiAxga6ojIUWhM=;
 b=ePmdLWK42xZsibt197Ck2tGl5MUNHNss2fbw5z+ttBC0Hdkuouk3o/KFVKw2iSnnCz
 zTqHnptYfmoZj5dDPNgp7rD4v00UtvNcJnMh9I5VQnouBjsKq+4WDV5rY84JaQzhviPh
 S6KzENWxrHsDCnUsRnlgsAvD8WCLciYUZeGmfcgJrg2K3IbOS1F1rG9VZktjnVg3lKGr
 ejN5QSqii5IrurCKPsV5o4YGZZ2BNjgCZ2uzxG7cvQv2kssrhJlgV12kYoU0Q0FOc8Xr
 XkRsAz9oOEOsnS956r2y/fjE3doE6YD8eZZO4lUl+K0yCl5PUDtEFTN36bB9Oal3+q/r
 cT5A==
X-Gm-Message-State: AOAM532U4pOmo/+vH+VBs0Kqwd16GPSqJMnO7r+AAMrx1Vgf0d1z4GCu
 OAQB7fgvtWlLBKnw8G3ckmIb
X-Google-Smtp-Source: ABdhPJzpvfEiCfyYs8u6SCKIdTO4CD049HKvMqgA1U1TZMFAFKWKT3f3sGm3+cCwAkY6T6H/ysn9yQ==
X-Received: by 2002:a65:44c3:: with SMTP id g3mr26055726pgs.233.1630406228042; 
 Tue, 31 Aug 2021 03:37:08 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id p24sm16129455pfh.136.2021.08.31.03.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 03:37:07 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com,
 robin.murphy@arm.com, will@kernel.org, john.garry@huawei.com
Subject: [PATCH v13 01/13] iova: Export alloc_iova_fast() and free_iova_fast()
Date: Tue, 31 Aug 2021 18:36:22 +0800
Message-Id: <20210831103634.33-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831103634.33-1-xieyongji@bytedance.com>
References: <20210831103634.33-1-xieyongji@bytedance.com>
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

Export alloc_iova_fast() and free_iova_fast() so that
some modules can make use of the per-CPU cache to get
rid of rbtree spinlock in alloc_iova() and free_iova()
during IOVA allocation.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/iova.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index b6cf5f16123b..3941ed6bb99b 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -521,6 +521,7 @@ alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
 
 	return new_iova->pfn_lo;
 }
+EXPORT_SYMBOL_GPL(alloc_iova_fast);
 
 /**
  * free_iova_fast - free iova pfn range into rcache
@@ -538,6 +539,7 @@ free_iova_fast(struct iova_domain *iovad, unsigned long pfn, unsigned long size)
 
 	free_iova(iovad, pfn);
 }
+EXPORT_SYMBOL_GPL(free_iova_fast);
 
 #define fq_ring_for_each(i, fq) \
 	for ((i) = (fq)->head; (i) != (fq)->tail; (i) = ((i) + 1) % IOVA_FQ_SIZE)
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
