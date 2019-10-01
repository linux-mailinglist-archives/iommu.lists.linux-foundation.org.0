Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 792CAC39A2
	for <lists.iommu@lfdr.de>; Tue,  1 Oct 2019 17:57:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 03A2E1A70;
	Tue,  1 Oct 2019 15:57:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 37D9E1A27
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 15:56:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BC9F3A3
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 15:56:52 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r17so2864021wme.0
	for <iommu@lists.linux-foundation.org>;
	Tue, 01 Oct 2019 08:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xSQ3Gd/I78crTYWoKFJLF2LHykp/l0XNK/1ec4ayqbI=;
	b=V1vQ89R/Kqditgwc5pKk80fE3GZCa1M2VMFrKsoiHVsSFzdubkBC1dSY7cp+F+4CnG
	yx4S5GcUUx4RCfC/He6n3wJO/TBKg+4Fbfw+DYfxdIXNIsjTMb79xbXGBsY1CApbJ73e
	B7fL9Kmxgv7T9BrBuHV8WHnFMhdEanjkFF9lvqpzD+6vEXsVCEWZ6UAmnL/448APy6/s
	o2EurwEEHTBGAhKdcpAZaJ5NFX5zZ/pSY7CH5Q5XOJPr6k0Tgkl41hrpBRkMD3Z5AxWv
	bOYrdDUvbswO1RIwb4KyP7VVipZyURCrTj6MBgh/g2AmvzD6QFiy0ImJORliolT+hx8j
	+RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xSQ3Gd/I78crTYWoKFJLF2LHykp/l0XNK/1ec4ayqbI=;
	b=PRf4pm7s0ZFIjvQKSu5UCnBksF6v9Q7rx8qnUiezCvInI5UCegrEVWpI3V1erM6mc+
	lX8nQUiIIIPYjVAmBTgqElclboB/yAF5xkO+6/vO1ag9XMr+rXYuKAsQ3O20K2eODmEj
	C5um2SXSacoi53WmpJSOISFYgFZqL0tWFrH+FnC3Cj1G5+osTPrUGSG0z2PYDMql2WkB
	czQQiiMDSm1b/4n1rhCXHBmYBDMYy1hMc2uORkdNwCQV8wVfkFuUugOgjDRdvoEMs1Io
	AJkNUbJXuvByuLxVTd/MTcu6rYflB2aPiIIKpDJthE9t3TOQ1qK626lWRTk8G0AYB+bz
	2S2Q==
X-Gm-Message-State: APjAAAVaaWeJSxwMA7Fi+yhOl/0Qp8IQWjCkuktO7N3HgpDDkTbMIHD2
	jpxb1CGE+eGnLOmhkd8R5A4=
X-Google-Smtp-Source: APXvYqwzXz9dBSJ6C4W1d7sa97hjPnTKpVydssMEIdV2ySVhM7Ui5kvvVHIhHD6bkb2OOpa+uWFoqA==
X-Received: by 2002:a05:600c:24d1:: with SMTP id
	17mr4341973wmu.104.1569945411253; 
	Tue, 01 Oct 2019 08:56:51 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
	by smtp.gmail.com with ESMTPSA id
	h63sm6209136wmf.15.2019.10.01.08.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Oct 2019 08:56:50 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/7] iommu/qcom: Write TCR before TTBRs to fix ASID access
	behavior
Date: Tue,  1 Oct 2019 17:56:37 +0200
Message-Id: <20191001155641.37117-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155641.37117-1-kholk11@gmail.com>
References: <20191001155641.37117-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: marijns95@gmail.com, iommu@lists.linux-foundation.org, agross@kernel.org,
	kholk11@gmail.com
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

As also stated in the arm-smmu driver, we must write the TCR before
writing the TTBRs, since the TCR determines the access behavior of
some fields.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/qcom_iommu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 504ca69adc5a..c8957ec83b92 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -267,6 +267,13 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			ctx->secure_init = true;
 		}
 
+		/* TCR */
+		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
+				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
+				FIELD_PREP(TCR2_SEP, TCR2_SEP_UPSTREAM));
+		iommu_writel(ctx, ARM_SMMU_CB_TCR,
+				pgtbl_cfg.arm_lpae_s1_cfg.tcr);
+
 		/* TTBRs */
 		iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
 				pgtbl_cfg.arm_lpae_s1_cfg.ttbr[0] |
@@ -275,13 +282,6 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 				pgtbl_cfg.arm_lpae_s1_cfg.ttbr[1] |
 				FIELD_PREP(TTBRn_ASID, ctx->asid));
 
-		/* TCR */
-		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
-				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
-				FIELD_PREP(TCR2_SEP, TCR2_SEP_UPSTREAM));
-		iommu_writel(ctx, ARM_SMMU_CB_TCR,
-				pgtbl_cfg.arm_lpae_s1_cfg.tcr);
-
 		/* MAIRs (stage-1 only) */
 		iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0,
 				pgtbl_cfg.arm_lpae_s1_cfg.mair[0]);
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
