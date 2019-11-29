Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7E10D03A
	for <lists.iommu@lfdr.de>; Fri, 29 Nov 2019 01:49:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2187884C3;
	Fri, 29 Nov 2019 00:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jUdkkyEMkzo; Fri, 29 Nov 2019 00:49:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 414BB8845E;
	Fri, 29 Nov 2019 00:49:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38E05C0881;
	Fri, 29 Nov 2019 00:49:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06369C0881
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 00:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E305E8845E
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 00:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmas5AgkRTcd for <iommu@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 00:49:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35322884B9
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 00:49:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id l22so1398086pff.9
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 16:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5zqGpmnTc6SxNeb5w/Q1Y9kq3jWnzDuFhNnFCBX/qU=;
 b=pxhxNTnnkSAXUci2pIu0+EV0WX14xp63D61nJdMYEhol8f3vQLhGpbS56tdfJLxLAd
 Z3an68S0UbHmAp88r8befGd/JiO0fYYOQcRgFIqs2V68FWJ42MomZvbP+Q6XaGPsYvsk
 UlUxzYRSv4zgIZc8LwLaI1eczRSlnQbbese4rzlHLxmnl5cSGSIs0+n3Ik+K8Otf44J8
 3JI+Ecqw9GuPi4gPDry+j2z/Icq9vhL5ErsK5iPmSpi9iHz6v2/5VIS26R57kiPYQmXj
 3WpeAd5n03RsAr6eQBNy754eT/yyQ9J0APR1duwu4q3vp/UL3ZL4/j/z9r/gnWg9b39H
 SkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5zqGpmnTc6SxNeb5w/Q1Y9kq3jWnzDuFhNnFCBX/qU=;
 b=H3QBdmaWxU55zSqok/nIo5t/q8zQ8X1vNZX/QbZQfc1dXp8UhA1mTZEAGdYCVEGM7q
 VEedfY1sqBTLSU1bwkDEE3wOU/M5r5elAshwWWFsglLkvfU9P10iUqG2/H394GlUQEuo
 72hNEtcJU+fFM6j0LpsJukJn7zZ63ARfHOmDIQ/8TGnNIAPCIgzjzF1irKCKl0w23MYZ
 sRoyfjIZafAsFQ43/Qx1+M3aWzc751toQf7GtBhas3OW3QURV9SIYMZvRE4yRrvbD5jY
 p6yxMi8ZwXZ7fuzOpqDNnXIFHVQIWmmzVGz+2E/Zs4yENcKxW2bgulu2NPjZ734je2dm
 fRKw==
X-Gm-Message-State: APjAAAUHfnTMPXd8u/ewadJsgx5q4loM8uNVsIHLrwKEVGd95RYKvv50
 T1nSDypXQGFLLuiz7G5XZYG9gjSBrMI=
X-Google-Smtp-Source: APXvYqwA0F6jKEcoyaP+Gbo67KhumBWjnESPPjQgXKURaT8QeqLrAp9F0H265OL4vWrTkcVAc+cxnQ==
X-Received: by 2002:a63:c406:: with SMTP id h6mr14263803pgd.213.1574988560678; 
 Thu, 28 Nov 2019 16:49:20 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id 64sm22418202pfe.147.2019.11.28.16.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 16:49:20 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [Patch v2 2/3] iommu: optimize iova_magazine_free_pfns()
Date: Thu, 28 Nov 2019 16:48:54 -0800
Message-Id: <20191129004855.18506-3-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
References: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
MIME-Version: 1.0
Cc: Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org
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

If the maganize is empty, iova_magazine_free_pfns() should
be a nop, however it misses the case of mag->size==0. So we
should just call iova_magazine_empty().

This should reduce the contention on iovad->iova_rbtree_lock
a little bit.

Cc: Joerg Roedel <joro@8bytes.org>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/iommu/iova.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index cb473ddce4cf..184d4c0e20b5 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -797,13 +797,23 @@ static void iova_magazine_free(struct iova_magazine *mag)
 	kfree(mag);
 }
 
+static bool iova_magazine_full(struct iova_magazine *mag)
+{
+	return (mag && mag->size == IOVA_MAG_SIZE);
+}
+
+static bool iova_magazine_empty(struct iova_magazine *mag)
+{
+	return (!mag || mag->size == 0);
+}
+
 static void
 iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
 {
 	unsigned long flags;
 	int i;
 
-	if (!mag)
+	if (iova_magazine_empty(mag))
 		return;
 
 	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
@@ -820,16 +830,6 @@ iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
 	mag->size = 0;
 }
 
-static bool iova_magazine_full(struct iova_magazine *mag)
-{
-	return (mag && mag->size == IOVA_MAG_SIZE);
-}
-
-static bool iova_magazine_empty(struct iova_magazine *mag)
-{
-	return (!mag || mag->size == 0);
-}
-
 static unsigned long iova_magazine_pop(struct iova_magazine *mag,
 				       unsigned long limit_pfn)
 {
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
