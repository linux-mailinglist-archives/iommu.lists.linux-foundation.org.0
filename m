Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C4580389EC1
	for <lists.iommu@lfdr.de>; Thu, 20 May 2021 09:19:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4E640479;
	Thu, 20 May 2021 07:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XV2x1VLMKi29; Thu, 20 May 2021 07:19:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400374048B;
	Thu, 20 May 2021 07:19:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B814C0001;
	Thu, 20 May 2021 07:19:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CEBEC0001
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 07:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 136F8400AB
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 07:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCJ2dib_Ivli for <iommu@lists.linux-foundation.org>;
 Thu, 20 May 2021 07:19:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 906E740491
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 07:19:16 +0000 (UTC)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fm1Hv5Vy3zkYFt;
 Thu, 20 May 2021 15:16:27 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 15:19:14 +0800
Received: from huawei.com (10.174.28.241) by dggpemm500004.china.huawei.com
 (7.185.36.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 20 May
 2021 15:19:13 +0800
From: Bixuan Cui <cuibixuan@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>
Subject: [PATCH -next 1/3] iommu/arm-smmu-v3: fix missing a blank line after
 declarations
Date: Thu, 20 May 2021 16:42:18 +0800
Message-ID: <20210520084220.51684-2-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520084220.51684-1-cuibixuan@huawei.com>
References: <20210520084220.51684-1-cuibixuan@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.28.241]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, cuibixuan@huawei.com,
 linux-arm-kernel@lists.infradead.org
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

Fixes checkpatch warnings in arm-smmu-v3.c:
WARNING: Missing a blank line after declarations

Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 54b2f27b81d4..4f184119c26d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -151,6 +151,7 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
 static void queue_inc_cons(struct arm_smmu_ll_queue *q)
 {
 	u32 cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
+
 	q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
 }
 
@@ -176,6 +177,7 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
 static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
 {
 	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
+
 	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
 }
 
@@ -1895,6 +1897,7 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
 		mutex_unlock(&arm_smmu_asid_lock);
 	} else {
 		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
+
 		if (cfg->vmid)
 			arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
 	}
@@ -2724,6 +2727,7 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 static void arm_smmu_cmdq_free_bitmap(void *data)
 {
 	unsigned long *bitmap = data;
+
 	bitmap_free(bitmap);
 }
 
@@ -2939,6 +2943,7 @@ static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
 static void arm_smmu_free_msis(void *data)
 {
 	struct device *dev = data;
+
 	platform_msi_domain_free_irqs(dev);
 }
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
