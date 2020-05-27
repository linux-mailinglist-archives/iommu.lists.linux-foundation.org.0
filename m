Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD61E3915
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 08:25:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96233866F2;
	Wed, 27 May 2020 06:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ovby0V70-erV; Wed, 27 May 2020 06:25:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C53618638F;
	Wed, 27 May 2020 06:25:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B716CC016F;
	Wed, 27 May 2020 06:25:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73074C016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 06:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6AEB987C02
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 06:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gryNfcGpDbl for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 06:25:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7B22087475
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 06:25:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590560704; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jh63g7zVfWyaLq4vPu9kEFHYtKDWPkdQ7ls9thvyg1Y=;
 b=tSDe5jZky4rAreP/5oS0idzpqlBt4ReN66xKVAUgFmuLRH4Yd/6PMKzPPVRqEbhneONH7OYV
 DYiutjoQNxRB/4rt2igdzjji3b80N6PL4gRWGvSKr6Rq3TQJadPEv4lIGp0dXnRwcUhoV+i5
 HD6oB8YoA0wqQdl6OKQRblrOeCw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ece07bf76fccbb4c8503b6a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 06:25:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 82486C433C6; Wed, 27 May 2020 06:25:02 +0000 (UTC)
Received: from vjitta-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: vjitta)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 03CC2C433C9;
 Wed, 27 May 2020 06:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03CC2C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=vjitta@codeaurora.org
From: vjitta@codeaurora.org
To: joro@8bytes.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/iova: Free global iova rcache on iova alloc failure
Date: Wed, 27 May 2020 11:54:39 +0530
Message-Id: <1590560679-11927-1-git-send-email-vjitta@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: vjitta@codeaurora.org, vinmenon@codeaurora.org, kernel-team@android.com
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

From: Vijayanand Jitta <vjitta@codeaurora.org>

When ever an iova alloc request fails we free the iova
ranges present in the percpu iova rcaches and then retry
but the global iova rcache is not freed as a result we
could still see iova alloc failure even after retry as
global rcache is still holding the iova's which can cause
fragmentation. So, free the global iova rcache as well
and then go for the retry.

Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
---
 drivers/iommu/iova.c | 22 ++++++++++++++++++++++
 include/linux/iova.h |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 0e6a953..5ae0328 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -431,6 +431,7 @@ struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn)
 		flush_rcache = false;
 		for_each_online_cpu(cpu)
 			free_cpu_cached_iovas(cpu, iovad);
+		free_global_cached_iovas(iovad);
 		goto retry;
 	}
 
@@ -1044,5 +1045,26 @@ void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad)
 	}
 }
 
+/*
+ * free all the IOVA ranges of global cache
+ */
+void free_global_cached_iovas(struct iova_domain *iovad)
+{
+	struct iova_rcache *rcache;
+	int i, j;
+
+	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
+		rcache = &iovad->rcaches[i];
+		spin_lock(&rcache->lock);
+		for (j = 0; j < rcache->depot_size; ++j) {
+			iova_magazine_free_pfns(rcache->depot[j], iovad);
+			iova_magazine_free(rcache->depot[j]);
+			rcache->depot[j] = NULL;
+		}
+		rcache->depot_size = 0;
+		spin_unlock(&rcache->lock);
+	}
+}
+
 MODULE_AUTHOR("Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/iova.h b/include/linux/iova.h
index a0637ab..a905726 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -163,6 +163,7 @@ int init_iova_flush_queue(struct iova_domain *iovad,
 struct iova *split_and_remove_iova(struct iova_domain *iovad,
 	struct iova *iova, unsigned long pfn_lo, unsigned long pfn_hi);
 void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad);
+void free_global_cached_iovas(struct iova_domain *iovad);
 #else
 static inline int iova_cache_get(void)
 {
@@ -270,6 +271,11 @@ static inline void free_cpu_cached_iovas(unsigned int cpu,
 					 struct iova_domain *iovad)
 {
 }
+
+static inline void free_global_cached_iovas(struct iova_domain *iovad)
+{
+}
+
 #endif
 
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
