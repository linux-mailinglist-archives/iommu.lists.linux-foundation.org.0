Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE81D9E68
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 20:01:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD78087FBF;
	Tue, 19 May 2020 18:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3+IEQXc5zyAb; Tue, 19 May 2020 18:01:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14FA387F9B;
	Tue, 19 May 2020 18:01:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0D46C0176;
	Tue, 19 May 2020 18:01:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B3A0C0176
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A5DB221B5
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cZRiIQE7ZKR for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 18:01:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id ACB21220FB
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l18so404474wrn.6
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GyR/0Ui23R5AHEgwKIBkr1oNL8Gb0ETBbsB9Bvf72kY=;
 b=v3uSYjcTrWI5/qXsAKPtQitwafYDySNKobI2mT1/dgOS6rzcfLNMmKF8Zt+y0lAIG+
 7NlQH+xDT61+aKM9dVrX/ST+T5q9rAVx5upfWAkNFK1yIBfi0CAVIN2p765NEfOSC08U
 sFwBSa6m6vidPtQ10csw1xhsYdtx+Clr66gxG7w/lPymxvLly5LhE7Um5QY8fQhUpWaJ
 xdgGAMGjYoX5ObjkOmVHefDcNQj8HEkXT7/nacUbxTsEOjESUGfhUPoGor1ifWuorzlX
 L6qNerDYVI4QEctFS67Z/P9rCH1XE1xvD8PSxU2aJEL1im0fmYXq7/33gxfnNONbYidw
 T/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GyR/0Ui23R5AHEgwKIBkr1oNL8Gb0ETBbsB9Bvf72kY=;
 b=ecXhL/R1KX/cb0Blhv12XCBggIfLKTDwz50zS0kxHk7NpsNXnOrt4vNMksYHEwQF2S
 y/wSKy/DPda7EJeUMHvgznyc9mz107L5LWqAGS1e39sNnGy8qLwtxULlQIPxhoHfbd1H
 rd4n1Qq8iXyj/gW1nzv2NMsK5VfGrJnXUqlWk0oM9ozqLxulf1ohVGzhbi7cYeNHCi/p
 2yo+QPok+5MtMbdBAdh8wtk8qV+rpsdpn663losS/2hAe0xOR5HXP9Ju5/L+UsABmsnW
 Tj55Il2YcLeZ6FNvcf+AHQhZ/Kc6Kk+Ik6S7VYB4i7qah4qSPKQHMjLH5ogiRrOPj0rJ
 9aWQ==
X-Gm-Message-State: AOAM530Q68i/eNrrii2pshx7JQtCrSIaMpFBrq/gvVx/Fxngnt/OGI/i
 RVkuzuOsd1qQoFmlaS0ufNOXOYxincvZSQ==
X-Google-Smtp-Source: ABdhPJyPXdWabIumTknX9KHGpAfZMDP+D+8kcHDQrtNtnJy5wEFWx5RISo0BU/ne7okq5g9/m6U84w==
X-Received: by 2002:a5d:694d:: with SMTP id r13mr112031wrw.238.1589911302937; 
 Tue, 19 May 2020 11:01:42 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id 1sm510496wmz.13.2020.05.19.11.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 11:01:42 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v7 01/24] mm: Add a PASID field to mm_struct
Date: Tue, 19 May 2020 19:54:39 +0200
Message-Id: <20200519175502.2504091-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519175502.2504091-1-jean-philippe@linaro.org>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, kevin.tian@intel.com, jgg@ziepe.ca,
 catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhangfei.gao@linaro.org, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 felix.kuehling@amd.com, will@kernel.org, christian.koenig@amd.com
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

Some devices can tag their DMA requests with a 20-bit Process Address
Space ID (PASID), allowing them to access multiple address spaces. In
combination with recoverable I/O page faults (for example PCIe PRI),
PASID allows the IOMMU to share page tables with the MMU.

To make sure that a single PASID is allocated for each address space, as
required by Intel ENQCMD, store the PASID in the mm_struct. The IOMMU
driver is in charge of serializing modifications to the PASID field.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/linux/mm_types.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 4aba6c0c2ba8..8db647275817 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -534,6 +534,10 @@ struct mm_struct {
 		atomic_long_t hugetlb_usage;
 #endif
 		struct work_struct async_put_work;
+#ifdef CONFIG_IOMMU_SUPPORT
+		/* Address space ID used by device DMA */
+		unsigned int pasid;
+#endif
 	} __randomize_layout;
 
 	/*
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
