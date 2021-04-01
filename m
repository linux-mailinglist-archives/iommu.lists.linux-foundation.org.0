Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA335164E
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 17:48:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56AA284AB5;
	Thu,  1 Apr 2021 15:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGqwArDfOyUy; Thu,  1 Apr 2021 15:48:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C92C84A9A;
	Thu,  1 Apr 2021 15:48:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38B10C000A;
	Thu,  1 Apr 2021 15:48:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B104C000D
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 15:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 470DB4059B
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 15:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hEDIGS87HKN for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 15:48:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 547A440596
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 15:48:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b9so2287307wrt.8
 for <iommu@lists.linux-foundation.org>; Thu, 01 Apr 2021 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUWtTRDLrHxGgocdCnYzpMC09q0TV2vzmGZT++QRllg=;
 b=iglZ+Ee6thHgb0bhSj83X5eaiV9O2aLtAksg9FEqCkLGGs18RszyBaVuM1/s8cdLcC
 IC6YDWk+v/FZKsUaiwqmmv146BYVIt0m70lItcr2N0SuGaAkzdNF3M0tRz+11Qokz7l1
 lskzXakxl9mU3PS1s7L4BTyQ0eK93mtQnY+okmAo1IBlpkX6MrRL5ciIT6uPpZOEsdD7
 PCYWlLuq1ic0CY7/r/lsDmNH5/RrrfsKoLfLEEgEJuPQWWhMYaCZQy43ZW4xaUV9U5L9
 l8OeftUntEw+OtfNSMz85YRfPFW3x1uIs2+8p5Y2Nn2nZOTnnwMJIelLUA576ha6F+yf
 17tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sUWtTRDLrHxGgocdCnYzpMC09q0TV2vzmGZT++QRllg=;
 b=sq7I0maUsk/yBnqie6VEr1wLxc82DMnWQGf2RTp4oCIyt5m8oL3lhUviPIm2q1wlCc
 9yCAkugosTYG4xdj9WyhyWP1ZzZYwuVvIjXE6oMNIGb8mDqocj4BsVcJ5TeiarO+lbDu
 HFApxljRiSz6BZLdbyIZYI8p9AVLw/sww4l8oXUHzFntIjnF6fyyaenSNNRX+hBEAYoH
 E0vcYZxwQNu0zqo3IKxAxtpBxBPQkTfwS3kaI/GDRwwt94TjGD0iITRRd7T4X5rZOfAY
 JBTskdFMoXYC4s6qErhmhlTmXQqKotaLMKO3gPhz5mCZto5/rZvrp7l0EoFPZ2cK9LXi
 vEyQ==
X-Gm-Message-State: AOAM531WJaoSlqyy2wy69/o83js2joRZA2jE20yuIlItijabLl3ipsgZ
 dYGeLywlEXN0eFrQzqEIQwwXPw==
X-Google-Smtp-Source: ABdhPJz1Rfdsjw9gzRYBDHIMKFUYkmB2ZhwgBz9419vLWB1onBeKqnNMtOUXwIBAc9XzC92qWWLxhQ==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr10862243wrt.111.1617292097577; 
 Thu, 01 Apr 2021 08:48:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y8sm8722505wmi.46.2021.04.01.08.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:48:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v14 04/10] iommu/vt-d: Support IOMMU_DEV_FEAT_IOPF
Date: Thu,  1 Apr 2021 17:47:13 +0200
Message-Id: <20210401154718.307519-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401154718.307519-1-jean-philippe@linaro.org>
References: <20210401154718.307519-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: vivek.gautam@arm.com, guohanjun@huawei.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-acpi@vger.kernel.org,
 zhangfei.gao@linaro.org, lenb@kernel.org, devicetree@vger.kernel.org,
 kevin.tian@intel.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, robin.murphy@arm.com,
 linux-accelerators@lists.ozlabs.org
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

Allow drivers to query and enable IOMMU_DEV_FEAT_IOPF, which amounts to
checking whether PRI is enabled.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index ee0932307d64..c5c5fd444779 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5343,6 +5343,8 @@ static int siov_find_pci_dvsec(struct pci_dev *pdev)
 static bool
 intel_iommu_dev_has_feat(struct device *dev, enum iommu_dev_features feat)
 {
+	struct device_domain_info *info = get_domain_info(dev);
+
 	if (feat == IOMMU_DEV_FEAT_AUX) {
 		int ret;
 
@@ -5357,13 +5359,13 @@ intel_iommu_dev_has_feat(struct device *dev, enum iommu_dev_features feat)
 		return !!siov_find_pci_dvsec(to_pci_dev(dev));
 	}
 
-	if (feat == IOMMU_DEV_FEAT_SVA) {
-		struct device_domain_info *info = get_domain_info(dev);
+	if (feat == IOMMU_DEV_FEAT_IOPF)
+		return info && info->pri_supported;
 
+	if (feat == IOMMU_DEV_FEAT_SVA)
 		return info && (info->iommu->flags & VTD_FLAG_SVM_CAPABLE) &&
 			info->pasid_supported && info->pri_supported &&
 			info->ats_supported;
-	}
 
 	return false;
 }
@@ -5374,6 +5376,9 @@ intel_iommu_dev_enable_feat(struct device *dev, enum iommu_dev_features feat)
 	if (feat == IOMMU_DEV_FEAT_AUX)
 		return intel_iommu_enable_auxd(dev);
 
+	if (feat == IOMMU_DEV_FEAT_IOPF)
+		return intel_iommu_dev_has_feat(dev, feat) ? 0 : -ENODEV;
+
 	if (feat == IOMMU_DEV_FEAT_SVA) {
 		struct device_domain_info *info = get_domain_info(dev);
 
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
