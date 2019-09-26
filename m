Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 80459BF2F1
	for <lists.iommu@lfdr.de>; Thu, 26 Sep 2019 14:28:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 74C1A1271;
	Thu, 26 Sep 2019 12:28:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EEF931184
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:05:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 658398A
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:05:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n14so2150132wrw.9
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sOvGRsd/SK03y6L73WlYgpmOS4qwC0AiL1VcwW/j4sA=;
	b=KvyXExCFYgZX6hiDrHxGgq7np5TAMGddN73hQ6wryiTG4y5Mij4z/kcZIRTTRtzUd9
	uON0HxTM/e3O51l7EaEoTbN9wj57ajBfY6efnOeH8Fe2rGJGCp4wayoFCk/BsxPVxY+E
	LrYInqLWz2fuTBz4o/G44hswvp/36Mu9+85VkxdJPQEYrpycFYJtToFpSyXOy3AXKxpY
	HD+sJbHGN1Ms1yWN6kJt5V7OSVsl9xgFLhWUDCDF6vrbRdKnMYYjBjtzBQ1tYscj1NEo
	ww75zAnzZGKxFMKRCKW8rxTKHYhzZLqyne95j9OfyYqFTNV+RbWSyzh5FztrbqYZUfaB
	YVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sOvGRsd/SK03y6L73WlYgpmOS4qwC0AiL1VcwW/j4sA=;
	b=KSaa0PRse9AB6g3sSPKR5CexBN9QQvJjyFtZ7PFu+rIZBlrna3qmPY1jM4DU+AIwhf
	ouWDNu+Ay3Lk5ejPV014oV+aMqn/xyw7Vb7jL2iEytBTY6zb4cIh/KfrwK/+vzdmvkO0
	5YyQEz9aQs2/YYOltYfimDY5MlwFSPdGY60m9vMvY4BijdQcHmb68KkpQpv2D3mADmMM
	Un1I9bK5fmg3NRSFIapM+uvJbsBtFHFLYRinrqn2xRn8JUomlFXCOA004WTHJyb+h84c
	/FEOQg7ab+Gf26iwNGGO4hF4hCVff0lQ1kAqG/p0B5MFTauhLRlO775MOGOuanAkzHS7
	pJlQ==
X-Gm-Message-State: APjAAAVN1/69wCPbo5oi7HCF/Xb70dzGC6tcFiym+a9psCIIVAljxN49
	yZXXQb0MwWCmRDxsrwObiT0=
X-Google-Smtp-Source: APXvYqz4S+fUrzO5k8RXSgTfSI56EHZkCQoE681+xglSQMvATlcFp3o/C3o/mCebzXaw9AWE/XoHNA==
X-Received: by 2002:a5d:6451:: with SMTP id d17mr2985861wrw.260.1569499521912; 
	Thu, 26 Sep 2019 05:05:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
	by smtp.gmail.com with ESMTPSA id
	d193sm5289584wmd.0.2019.09.26.05.05.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Sep 2019 05:05:21 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/6] iommu/qcom: Properly reset the IOMMU context
Date: Thu, 26 Sep 2019 14:05:13 +0200
Message-Id: <20190926120516.4981-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926120516.4981-1-kholk11@gmail.com>
References: <20190926120516.4981-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Thu, 26 Sep 2019 12:28:08 +0000
Cc: marijns95@gmail.com, iommu@lists.linux-foundation.org, agross@kernel.org,
	AngeloGioacchino Del Regno <kholk11@gmail.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

To avoid context faults reset the context entirely on detach and
to ensure a fresh clean start also do a complete reset before
programming the context for domain initialization.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/qcom_iommu.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 8431fb97a50f..2f31da2e7add 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -198,6 +198,23 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void qcom_iommu_reset_ctx(struct qcom_iommu_ctx *ctx)
+{
+	iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_FSR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR1, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_PAR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_TCR2, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_TCR, 0);
+	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0, 0);
+	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
+
+	/* Should we issue a TLBSYNC there instead? */
+	mb();
+}
+
 static int qcom_iommu_init_domain(struct iommu_domain *domain,
 				  struct qcom_iommu_dev *qcom_iommu,
 				  struct iommu_fwspec *fwspec)
@@ -245,6 +262,8 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			ctx->secure_init = true;
 		}
 
+		qcom_iommu_reset_ctx(ctx);
+
 		/* TCR */
 		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
 				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
@@ -390,8 +409,8 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
 
-		/* Disable the context bank: */
-		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+		/* Disable and reset the context bank */
+		qcom_iommu_reset_ctx(ctx);
 
 		ctx->domain = NULL;
 	}
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
