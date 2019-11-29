Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C22B10D03B
	for <lists.iommu@lfdr.de>; Fri, 29 Nov 2019 01:49:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DD9087681;
	Fri, 29 Nov 2019 00:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvMZkyxD4Ux9; Fri, 29 Nov 2019 00:49:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1D59687A68;
	Fri, 29 Nov 2019 00:49:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 189D1C0881;
	Fri, 29 Nov 2019 00:49:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 509BCC0881
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 00:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49395884C3
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 00:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjnbjiHauq9d for <iommu@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 00:49:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 652958845E
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 00:49:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l22so1398073pff.9
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 16:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PR8QywMOUlein0EdyppPpotpplTPCMqHeye2o9IVQQA=;
 b=I7tupLbF49ytr8XzpyjD19m/9+prtks7AxK5bBuoDxbLOZwpFaMPntKGaxaBxfJFg1
 MbNqlvk5r8McxHt7kVTMRS9GT6+j1tQCo2vE8WGdvZWZi2cTZb7p4STKZTMPAAEZlnb2
 H9bX/+rMQOkhNdp3r8xgH+mLk1+YfLYCbm7ZbYgH93JaJQ7Ztqga9LRbsL4533ChT/2t
 NOl4rYi2+60tvDbxozB5pKBcBeYNXZuqSMp/y9JasWrs6Xhb7L9wSsgtULo8dAjqnlO+
 DBDmTaM/TMfqvfoAFC8gsKpFAwr8LMOzu9V0jbdNLEohcn+Vg9Ju4qhymgk028labXcU
 L+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PR8QywMOUlein0EdyppPpotpplTPCMqHeye2o9IVQQA=;
 b=C7F8DMxMiAMWZG0IeJKeydF2OV/Q8TqaB6TnDSoHNRhDg4chNDez3QRwjMHNihoe78
 SUSFBcQmHGJy4s4paZZTP6DrIkmW0DTI+3B2giuOxnbGIzZo/za3mKf2HBJYVEAb5E+u
 EktY2M76TSIRjSY4hV6HkXk6FvD91KgNzMOFA4E2TViIAWLz7kUInjHZk/Sz2Xp5Ef8z
 lgU/TCWVctly6cVi6xsRSjyOxSG4r3FWFvry1KvIhy8UrpSJVOx9DmjfMLcFfhWTxyVL
 n04BzYtVvgZahqrnkMROStkufDseHIGwbcFETNHU02lMiTJSeoFChws3swBgLsNIongQ
 yBcw==
X-Gm-Message-State: APjAAAWQc80gouvUhlNgJtTkcLDdH+ngdcS5u9pqFTf4J8axOUP3U6ZP
 aVd5ID/8MorI3i+vE9uWy23b3dFUdUk=
X-Google-Smtp-Source: APXvYqwhP6ctTo70BI7YPdC+6gWhQb8kGN1VNmnI+MJ+lI3k0QYaFCJPlXmgV+Sk7tqdVu0ct27dgg==
X-Received: by 2002:a63:115c:: with SMTP id 28mr13790143pgr.6.1574988559690;
 Thu, 28 Nov 2019 16:49:19 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id 64sm22418202pfe.147.2019.11.28.16.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 16:49:19 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [Patch v2 1/3] iommu: match the original algorithm
Date: Thu, 28 Nov 2019 16:48:53 -0800
Message-Id: <20191129004855.18506-2-xiyou.wangcong@gmail.com>
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

The IOVA cache algorithm implemented in IOMMU code does not
exactly match the original algorithm described in the paper.

Particularly, it doesn't need to free the loaded empty magazine
when trying to put it back to global depot. To make it work, we
have to pre-allocate magazines in the depot and only recycle them
when all of them are full.

Before this patch, rcache->depot[] contains either full or
freed entries, after this patch, it contains either full or
empty (but allocated) entries.

Cc: Joerg Roedel <joro@8bytes.org>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/iommu/iova.c | 45 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 41c605b0058f..cb473ddce4cf 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -862,12 +862,16 @@ static void init_iova_rcaches(struct iova_domain *iovad)
 	struct iova_cpu_rcache *cpu_rcache;
 	struct iova_rcache *rcache;
 	unsigned int cpu;
-	int i;
+	int i, j;
 
 	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
 		rcache = &iovad->rcaches[i];
 		spin_lock_init(&rcache->lock);
 		rcache->depot_size = 0;
+		for (j = 0; j < MAX_GLOBAL_MAGS; ++j) {
+			rcache->depot[j] = iova_magazine_alloc(GFP_KERNEL);
+			WARN_ON(!rcache->depot[j]);
+		}
 		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache), cache_line_size());
 		if (WARN_ON(!rcache->cpu_rcaches))
 			continue;
@@ -900,24 +904,30 @@ static bool __iova_rcache_insert(struct iova_domain *iovad,
 
 	if (!iova_magazine_full(cpu_rcache->loaded)) {
 		can_insert = true;
-	} else if (!iova_magazine_full(cpu_rcache->prev)) {
+	} else if (iova_magazine_empty(cpu_rcache->prev)) {
 		swap(cpu_rcache->prev, cpu_rcache->loaded);
 		can_insert = true;
 	} else {
-		struct iova_magazine *new_mag = iova_magazine_alloc(GFP_ATOMIC);
+		spin_lock(&rcache->lock);
+		if (rcache->depot_size < MAX_GLOBAL_MAGS) {
+			swap(rcache->depot[rcache->depot_size], cpu_rcache->prev);
+			swap(cpu_rcache->prev, cpu_rcache->loaded);
+			rcache->depot_size++;
+			can_insert = true;
+		} else {
+			mag_to_free = cpu_rcache->loaded;
+		}
+		spin_unlock(&rcache->lock);
+
+		if (mag_to_free) {
+			struct iova_magazine *new_mag = iova_magazine_alloc(GFP_ATOMIC);
 
-		if (new_mag) {
-			spin_lock(&rcache->lock);
-			if (rcache->depot_size < MAX_GLOBAL_MAGS) {
-				rcache->depot[rcache->depot_size++] =
-						cpu_rcache->loaded;
+			if (new_mag) {
+				cpu_rcache->loaded = new_mag;
+				can_insert = true;
 			} else {
-				mag_to_free = cpu_rcache->loaded;
+				mag_to_free = NULL;
 			}
-			spin_unlock(&rcache->lock);
-
-			cpu_rcache->loaded = new_mag;
-			can_insert = true;
 		}
 	}
 
@@ -963,14 +973,15 @@ static unsigned long __iova_rcache_get(struct iova_rcache *rcache,
 
 	if (!iova_magazine_empty(cpu_rcache->loaded)) {
 		has_pfn = true;
-	} else if (!iova_magazine_empty(cpu_rcache->prev)) {
+	} else if (iova_magazine_full(cpu_rcache->prev)) {
 		swap(cpu_rcache->prev, cpu_rcache->loaded);
 		has_pfn = true;
 	} else {
 		spin_lock(&rcache->lock);
 		if (rcache->depot_size > 0) {
-			iova_magazine_free(cpu_rcache->loaded);
-			cpu_rcache->loaded = rcache->depot[--rcache->depot_size];
+			swap(rcache->depot[rcache->depot_size - 1], cpu_rcache->prev);
+			swap(cpu_rcache->prev, cpu_rcache->loaded);
+			rcache->depot_size--;
 			has_pfn = true;
 		}
 		spin_unlock(&rcache->lock);
@@ -1019,7 +1030,7 @@ static void free_iova_rcaches(struct iova_domain *iovad)
 			iova_magazine_free(cpu_rcache->prev);
 		}
 		free_percpu(rcache->cpu_rcaches);
-		for (j = 0; j < rcache->depot_size; ++j)
+		for (j = 0; j < MAX_GLOBAL_MAGS; ++j)
 			iova_magazine_free(rcache->depot[j]);
 	}
 }
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
