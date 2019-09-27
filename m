Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFADC01E2
	for <lists.iommu@lfdr.de>; Fri, 27 Sep 2019 11:10:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1C72F1295;
	Fri, 27 Sep 2019 09:09:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 057D2126B
	for <iommu@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:09:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 70B9F8B8
	for <iommu@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:09:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i1so1839302wro.4
	for <iommu@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sOvGRsd/SK03y6L73WlYgpmOS4qwC0AiL1VcwW/j4sA=;
	b=hxcwnRY5g2OErPiFxaUbfpFJ9ctrTXDnVSdUZMnMZvpc8R8xWk4a6yuR39Opn2wQSe
	Rdlzb8HPdc3gRHtaj+NqJs9bZk7WBwaP5kKacF96siA2aUlxGCuP9r56DBAJ2jrtGfnq
	uMWLNMWhB9oiZ25tBNsb1hHy9N50w+aROulTz2StTEQvQf6ggFVqPDYBfaoGW+sUXkwo
	a9JbjuwTjG9MOGK0aY0zKqc94aTWRf3YmlUjkJTj8M+R+fOQFTZRQ2a8ROcvv3KAElDB
	8e+goYRjmYZ8F3BjxfwDz7te5jw5nLahiFImgHPchtnkRJ/gpYCmqHQi7IT5zZqBk4xE
	AdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sOvGRsd/SK03y6L73WlYgpmOS4qwC0AiL1VcwW/j4sA=;
	b=ewGtjJPMA7O2BcQOSasjyvjUy6iIv+dG8EnB4p7V9MjHJxkLaJkT87EoDRp8vqUtKF
	j0IBd7rBdKhe+kXMs+9J4PRi3WBUKUNmHPglmXFAlEmEAGwLi7VZG9NosZFAmCQQZHpg
	y2aQQmApyQYow/xKfdqkbLleQkGM38ejc5DS5iTMQ4MyQMor8gGd7K+JisObGSVxe4Fx
	J5eD53INdCrQQ4HHEeP54UwLtTdTZCxY15rbLgiCGUcX00QaVO3TMy6wejn+U0ta4Cpk
	GhcqTX5UN+Z2dTVPKPsC651hRseTdrLW083PouqEp1h9DQqG82g1vIuKHJexqkiJ9AYc
	zgow==
X-Gm-Message-State: APjAAAWQGahjPYHsdv4aZbWfO3f2wb2kqPYAxWcUaeBex9VrIcYlT5wA
	s8KAmoe0L0n4EP9qcfKaAts=
X-Google-Smtp-Source: APXvYqwB//2FykcH09Wh56p9ftThgdopQyr4u9pGWP1pbEIfcWkZ3VzhVpLpY4C7MADtO6X9CgEkBQ==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr2071587wro.83.1569575394957; 
	Fri, 27 Sep 2019 02:09:54 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
	by smtp.gmail.com with ESMTPSA id
	b62sm6037791wmc.13.2019.09.27.02.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Sep 2019 02:09:53 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/6] iommu/qcom: Properly reset the IOMMU context
Date: Fri, 27 Sep 2019 11:09:44 +0200
Message-Id: <20190927090947.11175-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927090947.11175-1-kholk11@gmail.com>
References: <20190927090947.11175-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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
