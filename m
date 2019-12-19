Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CAE12670A
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 17:31:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B1DB623492;
	Thu, 19 Dec 2019 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpCCZ-1OL6FG; Thu, 19 Dec 2019 16:31:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BC62C2344A;
	Thu, 19 Dec 2019 16:31:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB0D0C077D;
	Thu, 19 Dec 2019 16:31:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A6EAC1AE8
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 16:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 54B2788713
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucXcVdO+o8Ae for <iommu@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 16:31:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8F4DB886FE
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 16:31:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so6643940wrr.1
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 08:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0nQT4ayYi2icUCghAPJFv/Sszvlp8khOsvgAay7NA80=;
 b=npHKtHQyMJP1HB7cti1f6qmoeI+DJKFn7XvDJJvdFOvDZnGuyq626gmPPg1VW/g+vf
 NqHOB4YW3LtpAFxkZLtWK59MIggQeBHMnf2FU4aoFn2biHVyVWj0iduHkMNtN+Cw2QKl
 3GzgzVR/AU8hNb4bXoVdj3ptMWKCW30ACKJ3zUu58boNWddLRmDvOzJlIlY5xbZoskN5
 NreU0QK4KXWGIqcGeZD3D1pGnvnWQRzTZfOi+0GHu41hGDI1yGc6L4u2Cpc68atX6ZYW
 BASd0KfcX6CjN1z5HsyiO9BpOuElbJpjkF8aVQmcH6L1OGUKS7nE3VlxwSQerqKeYRZZ
 jh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0nQT4ayYi2icUCghAPJFv/Sszvlp8khOsvgAay7NA80=;
 b=UXyxe9yxa0Yls6VNSeEaYdk9PDNhEo6BSoKn38TIwhegGd3jtJZS54JzO3b7SAMtha
 GRQzOpEPzXnKY7pKgwKwViX4iDk7jx1axEfN0B6wdNNYjRJ31oGRzqd/lZWnvh49eq2t
 uSVIO7TWPRywO3NDGVpkAa5kps48KiZ+DEFdUCnXGg/kU0+4ly1Rdm2pN/ISnhlkUggv
 O8p6CcFCcuyHnxs6dzZcopEo4H9IY4LKIYvfYN4eFA899dLWm1oCVes04D3LaRo52fZV
 TXByFQNv+R9MOac8J9xrwvsnqk4co9aAgM+Sl+ylgpPz3vdM2NGbAg9qtCRkAuRK3PKW
 jGWA==
X-Gm-Message-State: APjAAAUVOVI89F78dc5C/kx0WhGdfg4A3d/XnJTI7eb42e4A/7+yoGyx
 FhPww1OKBnYeHOTgBQuBi9LLwQ==
X-Google-Smtp-Source: APXvYqySYIruAf+8UBV8yIOQEKLEyMW/IQr33V3GJnSu1IpDHvzkWr5tRTKgSPhwJDgoXMZbxqfv3Q==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr10010531wrw.327.1576773090913; 
 Thu, 19 Dec 2019 08:31:30 -0800 (PST)
Received: from localhost.localdomain (adsl-84-227-176-239.adslplus.ch.
 [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id u22sm7092068wru.30.2019.12.19.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 08:31:30 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: [PATCH v4 09/13] iommu/arm-smmu-v3: Prepare for handling
 arm_smmu_write_ctx_desc() failure
Date: Thu, 19 Dec 2019 17:30:29 +0100
Message-Id: <20191219163033.2608177-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219163033.2608177-1-jean-philippe@linaro.org>
References: <20191219163033.2608177-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, robin.murphy@arm.com, guohanjun@huawei.com,
 rjw@rjwysocki.net, robh+dt@kernel.org, sudeep.holla@arm.com,
 bhelgaas@google.com, zhangfei.gao@linaro.org, will@kernel.org, lenb@kernel.org
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

Second-level context descriptor tables will be allocated lazily in
arm_smmu_write_ctx_desc(). Help with handling allocation failure by
moving the CD write into arm_smmu_domain_finalise_s1().

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index e147087198ef..b825a5639afc 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2301,8 +2301,15 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
 	cfg->cd.tcr	= pgtbl_cfg->arm_lpae_s1_cfg.tcr;
 	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair;
+
+	ret = arm_smmu_write_ctx_desc(smmu_domain, 0, &cfg->cd);
+	if (ret)
+		goto out_free_tables;
+
 	return 0;
 
+out_free_tables:
+	arm_smmu_free_cd_tables(smmu_domain);
 out_free_asid:
 	arm_smmu_bitmap_free(smmu->asid_map, asid);
 	return ret;
@@ -2569,10 +2576,6 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	if (smmu_domain->stage != ARM_SMMU_DOMAIN_BYPASS)
 		master->ats_enabled = arm_smmu_ats_supported(master);
 
-	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
-		arm_smmu_write_ctx_desc(smmu_domain, 0,
-					&smmu_domain->s1_cfg.cd);
-
 	arm_smmu_install_ste_for_dev(master);
 
 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
