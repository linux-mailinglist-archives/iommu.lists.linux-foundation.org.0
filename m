Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6712CD21
	for <lists.iommu@lfdr.de>; Mon, 30 Dec 2019 06:57:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7390584E1A;
	Mon, 30 Dec 2019 05:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tmhpDB1N4gy; Mon, 30 Dec 2019 05:57:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0128784439;
	Mon, 30 Dec 2019 05:57:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAFBEC077D;
	Mon, 30 Dec 2019 05:57:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7166DC077D
 for <iommu@lists.linux-foundation.org>; Mon, 30 Dec 2019 05:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 59610848F0
 for <iommu@lists.linux-foundation.org>; Mon, 30 Dec 2019 05:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8VivVZ9+BE5 for <iommu@lists.linux-foundation.org>;
 Mon, 30 Dec 2019 05:57:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B3A32814C9
 for <iommu@lists.linux-foundation.org>; Mon, 30 Dec 2019 05:57:25 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a6so13488675plm.3
 for <iommu@lists.linux-foundation.org>; Sun, 29 Dec 2019 21:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dYzDa2WqHwUT+3MkcVhYul9GkntVB+kwzpl6/aw1YO8=;
 b=pwsqqy8RTmYUfATQQ3ynUWUNaSRuSJ7FgWqfZoJRKsLp1HwHnL9X4P8CuRAkYms9zz
 5fZiHT5L97QBu6tyaMILE3XzOKWtLK+/zYN522G6i3WSLOGUJhmp/427IsCQyrHBpLc3
 bFmUSegPUQDMJGoDtBozdaOYuqwL0BHWjbFy3CAOQ9z3h9EZ2Ct8IeevoQE7qz3P2tqP
 oLR+5FpK04SSflnyGB5AoKVpp7qqAHkSJ66pud+zrGchMUBXmfP8KFei95w0SYc9ItlO
 g4Wnant9Gjpdn2+KNVJourdQ4AsfmBNQkzqizUjsrMgWr6Nrxac2Kz0p5bPW0iQr3dz7
 /baA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dYzDa2WqHwUT+3MkcVhYul9GkntVB+kwzpl6/aw1YO8=;
 b=WcStnjYSyL/3+oUPhcoGD8EE2FX9ocnLJNrgXYvfD9MrW9AOrzYIJyvO5fVNoAzhrE
 k4hMrm2OcL922EP5XQqhXARA06GbI6sroiGShZLmjF2nkTcTIT538KY4Y0A8DVQVT0PL
 rAO7RtKXoT9kvCYnx+LU6AIuBDjGxKNeJsAIEbsYRf1vduRa+czrTcG7wguG8LmB9hnA
 vGOudVcEK6H47YNiwQcr0zonMFBBy1iInH0n2NeBu3zupD0bGgbkpaJR/JusPYNSXQNd
 Xgmyq36HQVhJknxo3r01UaERzrHErW3YvlPgRPETNbbXB/66Yx+KZA/RYyGC1U7L2YyS
 Kjdw==
X-Gm-Message-State: APjAAAUpnsOdSfo7S5/MbGXzfoNhoOMIDcbmorAe+VUb3HwNmoIL1F+b
 DETIZoqmuPo8Jp9oKxxJwto=
X-Google-Smtp-Source: APXvYqyf2XVz14nN4sNJiYy/n/zkoWFcA9pZ5EpIIQPzSJzcKiW7jSpixSvKvy3H+JwYCdFCjgpFUA==
X-Received: by 2002:a17:902:8646:: with SMTP id
 y6mr66004759plt.191.1577685445244; 
 Sun, 29 Dec 2019 21:57:25 -0800 (PST)
Received: from AHUANG12-1LT7M0.lenovo.com
 (218-164-16-162.dynamic-ip.hinet.net. [218.164.16.162])
 by smtp.googlemail.com with ESMTPSA id n1sm49531269pfd.47.2019.12.29.21.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 21:57:24 -0800 (PST)
From: Adrian Huang <adrianhuang0701@gmail.com>
X-Google-Original-From: Adrian Huang <ahuang12@lenovo.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/amd: Fix typos for PPR macros
Date: Mon, 30 Dec 2019 13:56:54 +0800
Message-Id: <20191230055654.16029-1-ahuang12@lenovo.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

From: Adrian Huang <ahuang12@lenovo.com>

The bit 13 and bit 14 of the IOMMU control register are
PPRLogEn and PPRIntEn. They are related to PPR (Peripheral Page
Request) instead of 'PPF'. Fix them accrodingly.

Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
---
 drivers/iommu/amd_iommu_init.c  | 4 ++--
 drivers/iommu/amd_iommu_types.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index ba7ee4aa04f9..6e82aa606e2b 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -716,7 +716,7 @@ static void iommu_enable_ppr_log(struct amd_iommu *iommu)
 	writel(0x00, iommu->mmio_base + MMIO_PPR_HEAD_OFFSET);
 	writel(0x00, iommu->mmio_base + MMIO_PPR_TAIL_OFFSET);
 
-	iommu_feature_enable(iommu, CONTROL_PPFLOG_EN);
+	iommu_feature_enable(iommu, CONTROL_PPRLOG_EN);
 	iommu_feature_enable(iommu, CONTROL_PPR_EN);
 }
 
@@ -2035,7 +2035,7 @@ static int iommu_init_msi(struct amd_iommu *iommu)
 	iommu_feature_enable(iommu, CONTROL_EVT_INT_EN);
 
 	if (iommu->ppr_log != NULL)
-		iommu_feature_enable(iommu, CONTROL_PPFINT_EN);
+		iommu_feature_enable(iommu, CONTROL_PPRINT_EN);
 
 	iommu_ga_log_enable(iommu);
 
diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
index 798e1533a147..500f0b78879d 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -147,8 +147,8 @@
 #define CONTROL_COHERENT_EN     0x0aULL
 #define CONTROL_ISOC_EN         0x0bULL
 #define CONTROL_CMDBUF_EN       0x0cULL
-#define CONTROL_PPFLOG_EN       0x0dULL
-#define CONTROL_PPFINT_EN       0x0eULL
+#define CONTROL_PPRLOG_EN       0x0dULL
+#define CONTROL_PPRINT_EN       0x0eULL
 #define CONTROL_PPR_EN          0x0fULL
 #define CONTROL_GT_EN           0x10ULL
 #define CONTROL_GA_EN           0x11ULL
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
