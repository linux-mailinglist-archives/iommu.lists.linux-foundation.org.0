Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D66C239A617
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 18:45:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6358B4054D;
	Thu,  3 Jun 2021 16:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Oqo_lOlV2hg; Thu,  3 Jun 2021 16:45:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CA7B40553;
	Thu,  3 Jun 2021 16:45:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 366F8C0024;
	Thu,  3 Jun 2021 16:45:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16009C0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 16:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC4F24054D
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 16:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBWW34v_E_n6 for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 16:45:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA69540550
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 16:45:11 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id g20so10298442ejt.0
 for <iommu@lists.linux-foundation.org>; Thu, 03 Jun 2021 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q3vxZtPVoclQabdKu022J8j0BPxOTzbzHvAOrHFrxRM=;
 b=nCy2Pei61aDfzvs4928hmMwnDYIIH7Kyz5O4fr0CjUBTvkobQ3sXNehrHbmJOvSMc8
 TnNE9862hQ+u83Y/Trx7opcN+acqRhmQVlvUXcUbL4cKLEyeU/3nA+TpEs88aE1MHKPm
 c2AN/K9D9DtBkL542gzuygAFllKXCdefULBJbV5VUjx+XrVSjE7inUpzGlhwWJ2yA39H
 Hr4eDcBdVJMAPqnt4/oM5GTR78xq2TyEos1UQJQT1qgTBNWlpvwDsGdPrbFiauKOkp55
 brhxP1ndXoybpApJ9PjVeSJxy5GKn468gLR7SmwH7ojvESVMXkWj3566fmjbXP6dQgRS
 +Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q3vxZtPVoclQabdKu022J8j0BPxOTzbzHvAOrHFrxRM=;
 b=W1iysB8O7xSb4aqNhfzHtCZ+atpLSF2tLSozNDfoPvRp5+BK67e7EarHfjj1OT1Utx
 8diRHA+PgIsegJ6ltkHoI44cQjFtl42E3vIGlierdj3Zb3giqqoEST1+MA0vFldymZyw
 36okEgoo1jrz/fsMYYsxEOdFkVwV1tGDCj78Hq3ms6DJLuNdYg4OX8VkzI8eSq5vmdK+
 +XtqlQT10/c44gr8076Dge2VMcSUOGJbyUwtZouVrwQKTmJHPFoV/sU9A2Hkpk6gnu6Z
 C9pJNTQN/31822U6ZOEqrXgcfA0xL9EK986+8aDhmHRJMr5KtAQ0niAozfjOYNO9fDjC
 9MSA==
X-Gm-Message-State: AOAM531003hECU9k0mZyoyurGMsN7HO6IQD01KAj8wrUMWG4yHbp7GQl
 5wNJmW2V8iHeROyJTd4WFbs=
X-Google-Smtp-Source: ABdhPJwZKsVDgQ4s+syaQdJ937cW3DiuFbKhKlpbFpj+N4SV2wqKmmbAD8UlzoPKh6HdVcjfz+X/9w==
X-Received: by 2002:a17:906:a017:: with SMTP id
 p23mr280153ejy.460.1622738710108; 
 Thu, 03 Jun 2021 09:45:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p10sm1455596edy.86.2021.06.03.09.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:45:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 5/9] iommu/arm-smmu: tegra: Implement SID override
 programming
Date: Thu,  3 Jun 2021 18:46:28 +0200
Message-Id: <20210603164632.1000458-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Jon Hunter <jonathanh@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

From: Thierry Reding <treding@nvidia.com>

The secure firmware keeps some SID override registers set as passthrough
in order to allow devices such as the display controller to operate with
no knowledge of SMMU translations until an operating system driver takes
over. This is needed in order to seamlessly transition from the firmware
framebuffer to the OS framebuffer.

Upon successfully attaching a device to the SMMU and in the process
creating identity mappings for memory regions that are being accessed,
the Tegra implementation will call into the memory controller driver to
program the override SIDs appropriately.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- move .probe_finalize initialization to this patch

 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 33 ++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 23889090eb01..01e9b50b10a1 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include <soc/tegra/mc.h>
+
 #include "arm-smmu.h"
 
 /*
@@ -15,10 +17,17 @@
  * interleaved IOVA accesses across them and translates accesses from
  * non-isochronous HW devices.
  * Third one is used for translating accesses from isochronous HW devices.
+ *
+ * In addition, the SMMU driver needs to coordinate with the memory controller
+ * driver to ensure that the right SID override is programmed for any given
+ * memory client. This is necessary to allow for use-case such as seamlessly
+ * handing over the display controller configuration from the firmware to the
+ * kernel.
+ *
  * This implementation supports programming of the two instances that must
- * be programmed identically.
- * The third instance usage is through standard arm-smmu driver itself and
- * is out of scope of this implementation.
+ * be programmed identically and takes care of invoking the memory controller
+ * driver for SID override programming after devices have been attached to an
+ * SMMU instance.
  */
 #define MAX_SMMU_INSTANCES 2
 
@@ -26,6 +35,7 @@ struct nvidia_smmu {
 	struct arm_smmu_device smmu;
 	void __iomem *bases[MAX_SMMU_INSTANCES];
 	unsigned int num_instances;
+	struct tegra_mc *mc;
 };
 
 static inline struct nvidia_smmu *to_nvidia_smmu(struct arm_smmu_device *smmu)
@@ -237,6 +247,17 @@ static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
 	return ret;
 }
 
+static void nvidia_smmu_probe_finalize(struct arm_smmu_device *smmu, struct device *dev)
+{
+	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
+	int err;
+
+	err = tegra_mc_probe_device(nvidia->mc, dev);
+	if (err < 0)
+		dev_err(smmu->dev, "memory controller probe failed for %s: %d\n",
+			dev_name(dev), err);
+}
+
 static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.read_reg = nvidia_smmu_read_reg,
 	.write_reg = nvidia_smmu_write_reg,
@@ -246,9 +267,11 @@ static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.tlb_sync = nvidia_smmu_tlb_sync,
 	.global_fault = nvidia_smmu_global_fault,
 	.context_fault = nvidia_smmu_context_fault,
+	.probe_finalize = nvidia_smmu_probe_finalize,
 };
 
 static const struct arm_smmu_impl nvidia_smmu_single_impl = {
+	.probe_finalize = nvidia_smmu_probe_finalize,
 };
 
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
@@ -263,6 +286,10 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (!nvidia_smmu)
 		return ERR_PTR(-ENOMEM);
 
+	nvidia_smmu->mc = devm_tegra_memory_controller_get(dev);
+	if (IS_ERR(nvidia_smmu->mc))
+		return ERR_CAST(nvidia_smmu->mc);
+
 	/* Instance 0 is ioremapped by arm-smmu.c. */
 	nvidia_smmu->bases[0] = smmu->base;
 	nvidia_smmu->num_instances++;
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
