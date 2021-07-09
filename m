Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A82363C230E
	for <lists.iommu@lfdr.de>; Fri,  9 Jul 2021 13:43:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2218860780;
	Fri,  9 Jul 2021 11:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WgNw3YYiMFFb; Fri,  9 Jul 2021 11:43:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5374D60776;
	Fri,  9 Jul 2021 11:43:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4849C001A;
	Fri,  9 Jul 2021 11:43:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6178EC000E;
 Fri,  9 Jul 2021 11:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5162183BDF;
 Fri,  9 Jul 2021 11:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHBAgY98LTm1; Fri,  9 Jul 2021 11:43:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93E2A83D17;
 Fri,  9 Jul 2021 11:43:50 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso6094252wmj.4; 
 Fri, 09 Jul 2021 04:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T6Fu2Yt38r79jvQRn5HVAAOYCNYVH5pxX3ZmV1lqXNs=;
 b=RSUZ4V8+UQKegs22HEKy9IvhxRJyVX+i4Z+1gL108fmuQY2tQIBoWsEbXa/8S0Sx7A
 RY/ZZDOSjgTuBf00ym9HddysBoZDZ0LM0yfJi44z0bLMngnOdHG0ZRjTicGdpdSOL8C8
 rAM+bJMRHKguqrdoFwy5w6rAOcti0q+Mxan6fkU0ZHDkvHb7Z/yNfDTnU9vhoKRc3493
 3nbH8cJOAHVcRH45ARlUpi6ANO2XO0UJZwrJY1tPBks8eGQUIrgRvOnvDW+YMmDsDMwD
 lI2jhYSglFevn0qy0dqH80ZBEJVWyXLP/8LrugJs17GZyQOVgyAQ7b7bqQdDPpDu0fQN
 5s4w==
X-Gm-Message-State: AOAM53045BDYnIKJeMdjfRDceTgBmO6LPFYkm6gBQFf73DmWGayHU9Mm
 P5Aq19Qfr6fba7NhhVEluIs=
X-Google-Smtp-Source: ABdhPJxD+GhXob854wyMk3JbdK4brmN177VhO/jZd11t0KFNcb7l7nzKryHBkM0YiTVPFMJAKUpekw==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr11598095wmq.153.1625831028683; 
 Fri, 09 Jul 2021 04:43:48 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z12sm4896849wrs.39.2021.07.09.04.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 04:43:48 -0700 (PDT)
From: Wei Liu <wei.liu@kernel.org>
To: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>
Subject: [RFC v1 4/8] intel/vt-d: export intel_iommu_get_resv_regions
Date: Fri,  9 Jul 2021 11:43:35 +0000
Message-Id: <20210709114339.3467637-5-wei.liu@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709114339.3467637-1-wei.liu@kernel.org>
References: <20210709114339.3467637-1-wei.liu@kernel.org>
MIME-Version: 1.0
Cc: Wei Liu <wei.liu@kernel.org>, pasha.tatashin@soleen.com,
 Will Deacon <will@kernel.org>, kumarpraveen@linux.microsoft.com,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>,
 "open list:INTEL IOMMU VT-d" <iommu@lists.linux-foundation.org>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>
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

When Microsoft Hypervisor runs on Intel platforms it needs to know the
reserved regions to program devices correctly. There is no reason to
duplicate intel_iommu_get_resv_regions. Export it.

Signed-off-by: Wei Liu <wei.liu@kernel.org>
---
 drivers/iommu/intel/iommu.c | 5 +++--
 include/linux/intel-iommu.h | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index a4294d310b93..01973bc20080 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5176,8 +5176,8 @@ static void intel_iommu_probe_finalize(struct device *dev)
 		set_dma_ops(dev, NULL);
 }
 
-static void intel_iommu_get_resv_regions(struct device *device,
-					 struct list_head *head)
+void intel_iommu_get_resv_regions(struct device *device,
+				 struct list_head *head)
 {
 	int prot = DMA_PTE_READ | DMA_PTE_WRITE;
 	struct iommu_resv_region *reg;
@@ -5232,6 +5232,7 @@ static void intel_iommu_get_resv_regions(struct device *device,
 		return;
 	list_add_tail(&reg->list, head);
 }
+EXPORT_SYMBOL_GPL(intel_iommu_get_resv_regions);
 
 int intel_iommu_enable_pasid(struct intel_iommu *iommu, struct device *dev)
 {
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 03faf20a6817..f91869f765bc 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -814,6 +814,8 @@ extern int iommu_calculate_max_sagaw(struct intel_iommu *iommu);
 extern int dmar_disabled;
 extern int intel_iommu_enabled;
 extern int intel_iommu_gfx_mapped;
+extern void intel_iommu_get_resv_regions(struct device *device,
+				 struct list_head *head);
 #else
 static inline int iommu_calculate_agaw(struct intel_iommu *iommu)
 {
@@ -825,6 +827,8 @@ static inline int iommu_calculate_max_sagaw(struct intel_iommu *iommu)
 }
 #define dmar_disabled	(1)
 #define intel_iommu_enabled (0)
+static inline void intel_iommu_get_resv_regions(struct device *device,
+				 struct list_head *head) {}
 #endif
 
 #endif
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
