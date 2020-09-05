Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E225EA1E
	for <lists.iommu@lfdr.de>; Sat,  5 Sep 2020 22:04:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2E8D921507;
	Sat,  5 Sep 2020 20:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAO-OOLfWOar; Sat,  5 Sep 2020 20:04:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC3E921080;
	Sat,  5 Sep 2020 20:04:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E30F5C07FF;
	Sat,  5 Sep 2020 20:04:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5240CC0051
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 20:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3C33D875CE
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 20:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSmK8oF3jXOw for <iommu@lists.linux-foundation.org>;
 Sat,  5 Sep 2020 20:04:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AC1878750A
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 20:04:42 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 5so6083565pgl.4
 for <iommu@lists.linux-foundation.org>; Sat, 05 Sep 2020 13:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FYkuDdKfZnq0C2m032hzkvhRzd15B2Kmt9oLbZcU5c=;
 b=qWKY2JQJVIVP82B9PMT8o59t7UeJfDP0M57e6PEpnRmQiAkv/XDHDzfJtUGRAze7RY
 /gRRSsZgAylliFIJJb6VwFZLX92OBNhK/DmDNfw76YOXqt2wDltCb1b3MTRzT8oOl+OB
 +wNYpspgkedR91cUN7PYaCBfYvrcIG4eZ3W7ERMOmV2ApLfirq4mOjbIAtQObKqP8Hwn
 SLQ48WQfxNJLWGL9nJitbWQIjxK5+LfXA/4mipexRl6KN3jO+km1G+JR7m4+jChO9QSX
 2dbGZr0uNkhOAKQZ49OIsK4eqZKtGdN4b2JcyG8CUUOaX6SNWvIHzrpLOdzMChj19k0d
 +qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FYkuDdKfZnq0C2m032hzkvhRzd15B2Kmt9oLbZcU5c=;
 b=BcEXMBo4ojbIl2MX+8wQ4Im7edEsWiCJ55hKq3Cqxu2t6Zetst0b0rgRejSz+sQob6
 PILiPU0hh6H4D8sIcpu1LNgFevCkfdZDtj0fyVxZY5yd0b6lgevRgEMI3jKIOVnP+8S+
 /9PZtKKtQ45XtEmcvEPuTQyz5Z1Iycokcd9PWm70LmR8t6gYtJAoFgXN40dks4ai5Uk+
 IrexqKDKNFFIdOJjFkJtS7jyllp6iU+Q5VjdO/hEOKTErP33kk9TQ9RWsvtDfAHRWS0V
 y8aJYMzz/HhrTXL4vCXUHrszCYbD1buPriSnMoxe0p2+b4p0vG1Ik3XUZ0qVbsYN21ja
 rndA==
X-Gm-Message-State: AOAM530afuHzzdpWnQh5XWLPqcvjUBtRGgqpWngjIimiZ7GhAV1vENFc
 Jjwjpimd2kjpxpft/PO4NeZqO/YyY5G5d8OrYQU=
X-Google-Smtp-Source: ABdhPJwddwGkqZ5LMMfsLeNsMODFf+8mNE/mLvdKlIbjFrKEoaXKpLuP5A0CfAvslNYsBpWAkipirw==
X-Received: by 2002:a63:4a1a:: with SMTP id x26mr7795439pga.295.1599336281558; 
 Sat, 05 Sep 2020 13:04:41 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 m13sm834177pjl.45.2020.09.05.13.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:04:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 12/20] iommu/arm-smmu: Pass io-pgtable config to
 implementation specific function
Date: Sat,  5 Sep 2020 13:04:18 -0700
Message-Id: <20200905200454.240929-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
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

From: Jordan Crouse <jcrouse@codeaurora.org>

Construct the io-pgtable config before calling the implementation specific
init_context function and pass it so the implementation specific function
can get a chance to change it before the io-pgtable is created.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  3 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 11 ++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index f4ff124a1967..a9861dcd0884 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -68,7 +68,8 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int cavium_init_context(struct arm_smmu_domain *smmu_domain)
+static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
 {
 	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
 					      struct cavium_smmu, smmu);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 09c42af9f31e..37d8d49299b4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -795,11 +795,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		cfg->asid = cfg->cbndx;
 
 	smmu_domain->smmu = smmu;
-	if (smmu->impl && smmu->impl->init_context) {
-		ret = smmu->impl->init_context(smmu_domain);
-		if (ret)
-			goto out_unlock;
-	}
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
@@ -810,6 +805,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
+	if (smmu->impl && smmu->impl->init_context) {
+		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
+		if (ret)
+			goto out_clear_smmu;
+	}
+
 	if (smmu_domain->non_strict)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index d890a4a968e8..83294516ac08 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -386,7 +386,8 @@ struct arm_smmu_impl {
 			    u64 val);
 	int (*cfg_probe)(struct arm_smmu_device *smmu);
 	int (*reset)(struct arm_smmu_device *smmu);
-	int (*init_context)(struct arm_smmu_domain *smmu_domain);
+	int (*init_context)(struct arm_smmu_domain *smmu_domain,
+			struct io_pgtable_cfg *cfg);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
