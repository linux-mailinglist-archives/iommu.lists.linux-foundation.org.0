Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E561D4B60
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 12:48:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F60087BDC;
	Fri, 15 May 2020 10:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXuJneRbfJ3B; Fri, 15 May 2020 10:48:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5BF6987CBB;
	Fri, 15 May 2020 10:48:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49FEAC0178;
	Fri, 15 May 2020 10:48:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF7F9C016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AB4A7894B1
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylo38LfbANLj for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 10:48:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BA80E89497
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:48:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u16so2122785wmc.5
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MQtP8fzJz2WKoMPMUWscfluDC7EhkHyxwXwDt+F/8Xo=;
 b=PXoZE6nGzWzeAjrZVC4Q8qDDJTcc+HjmAowWP2rxhAIl1x1saIXWkTrkuPyrwa3NHP
 yrSv8e2Hjy2yjlQ/runzqAADNByuuHASzKQn8JA/1UhZgEWKA+p+jj27buLk3nW/ROpD
 BPr61cO2ih0JqRMJtrloloi8lbgPItEok935Uw5/8hRNcmgMeRL6CftHv+yKS3l+s4WU
 iESxSPLqBjOeOA1KNZ7Y8/xjV9pWdJuANUQ8ZqvPc6wo+18lh8W3H7PofN1Gy/QF9Qth
 9hzcKT3MJdHAOaU/4IZQhzr/TKH/vkQjAFAtWKUVxBt4zMkvFJDnNIrBHa8WoNQEbB+/
 SUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MQtP8fzJz2WKoMPMUWscfluDC7EhkHyxwXwDt+F/8Xo=;
 b=ldy494mEikpcshk21j+dQG1JJwH9j+KSZ2EXs7LvCfLp/Agnaj0Ell/1O1FMh5aiWp
 daaMQg/7IPsbuIVwz+2DLYtRYAx8Ws7M7bGdogpAunc8t+KDdO9KL8aPhxRx4QHHMRxu
 QyWNnaqgJaWZrYab4fWTvWznfUqzeHxrkBp/b4NA/psMPuomCQjFvUlM7seQvu+SvoLj
 aMTwsC0+NhdDzVB+LVfSxeoKsWIi2OrKH2sFi5uVwCovYCgF+krD7Cr+I3WV1hpWD7EN
 mjBFzNnJ8v/ePqy3U4eZqiwHTwsWOAzjrDWKfBNjwa2wsJB1CYy75y7KIv4oI/RhfjAe
 wtxQ==
X-Gm-Message-State: AOAM532h8cnxZxLbhaSbevRBGXegxs8K6V4ZQ62LdJ0Q0qF711RUbRO6
 jpMoP73UkKgf9VFXnE6JAnEW4w==
X-Google-Smtp-Source: ABdhPJxehzJSSp1pQ/plR94V1b9IyYmarD9UuBiSu3T4yL++xWMNQCc3xOjcNEKwI82yKNouA7z5hw==
X-Received: by 2002:a1c:7e4f:: with SMTP id z76mr3410526wmc.177.1589539714209; 
 Fri, 15 May 2020 03:48:34 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id h27sm3510392wrc.46.2020.05.15.03.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 03:48:33 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, joro@8bytes.org, bhelgaas@google.com
Subject: [PATCH 4/4] iommu/vt-d: Use pci_ats_supported()
Date: Fri, 15 May 2020 12:44:02 +0200
Message-Id: <20200515104359.1178606-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515104359.1178606-1-jean-philippe@linaro.org>
References: <20200515104359.1178606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ashok.raj@intel.com,
 will@kernel.org, alex.williamson@redhat.com, robin.murphy@arm.com,
 dwmw2@infradead.org
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

The pci_ats_supported() helper checks if a device supports ATS and is
allowed to use it. By checking the ATS capability it also integrates the
pci_ats_disabled() check from pci_ats_init(). Simplify the vt-d checks.

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/intel-iommu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0182cff2c7ac75..ed21ce6d123810 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -1454,8 +1454,7 @@ static void iommu_enable_dev_iotlb(struct device_domain_info *info)
 	    !pci_reset_pri(pdev) && !pci_enable_pri(pdev, 32))
 		info->pri_enabled = 1;
 #endif
-	if (!pdev->untrusted && info->ats_supported &&
-	    pci_ats_page_aligned(pdev) &&
+	if (info->ats_supported && pci_ats_page_aligned(pdev) &&
 	    !pci_enable_ats(pdev, VTD_PAGE_SHIFT)) {
 		info->ats_enabled = 1;
 		domain_update_iotlb(info->domain);
@@ -2611,10 +2610,8 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 	if (dev && dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(info->dev);
 
-		if (!pdev->untrusted &&
-		    !pci_ats_disabled() &&
-		    ecap_dev_iotlb_support(iommu->ecap) &&
-		    pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ATS) &&
+		if (ecap_dev_iotlb_support(iommu->ecap) &&
+		    pci_ats_supported(pdev) &&
 		    dmar_find_matched_atsr_unit(pdev))
 			info->ats_supported = 1;
 
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
