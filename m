Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9DE1DB845
	for <lists.iommu@lfdr.de>; Wed, 20 May 2020 17:32:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F8D086D3C;
	Wed, 20 May 2020 15:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8T5ZoJaE4Fd; Wed, 20 May 2020 15:32:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9674686E23;
	Wed, 20 May 2020 15:32:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 695ADC0176;
	Wed, 20 May 2020 15:32:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BDBBC0176
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 15:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6A7BD88904
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 15:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id it7O2yHtPRXd for <iommu@lists.linux-foundation.org>;
 Wed, 20 May 2020 15:32:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6062E88907
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 15:32:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u1so2929632wmn.3
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eyFn3P2XuGvmapYpvmXsfPpBpNlu7lMJiAWRzcy1I5I=;
 b=NvU+y8H/jAu6fTaZt01RqQqQcfHxhpgoN7+p0ux0i2Oq8yrHojsDIuAB1TDQoB7+iq
 ItCOMqP2wSggzqlVIvwuENI+1I2x5hp/8KvEOK36fICyUOgEwdk1sU//8q4oFoHeszEL
 BjRnMOgCnxRQZfH1h/SzPX0XXFn0xr9ecwlyA3hfQ3L1x2hVGSIVAuixez9uag+O1VRD
 8S3YP14a5TWEbLnBlF1XfAlBGpRgTaQFWpOUGdRaSTHZZpZIUudxfyNrbORahZXopfyb
 4eORiSCbkfAw18940CBJ5bBrPzAuTN+maYvUXW9TdE5VklVvU4/z8GEpTB+189e5Em1Q
 8TaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyFn3P2XuGvmapYpvmXsfPpBpNlu7lMJiAWRzcy1I5I=;
 b=Iq7kzY3ZfW8RIFOBT2qU0c5C6ChDgapRdvQFmfmaahtH5TxgiryKbMsmjvwDP9DS8T
 CkTNYl1Z0Kgb5b/OLn1khKR6v28X2UK2YXkDHbo4VhH9YP0p1nY1iMoLAxxoQlgjxUF7
 iSF9YI5YtuSVn4Vw6EdO5Krtxat6roKT4yKkIu2iGTZyDFzPzlvtk53Yjv/03nsBwGiF
 tCwWxZ0jlvfhq1KKWGH3HZwPi+QyehdmFLGIqiexg3BLdrVWDPKHd/KB6C2/uzEdk9ap
 6uFN44yipzEs58gBEDO5Uc37jtI9iMUgU0I8iaUUCVjQdTf8bYeYFb98x1YoRkXtiXfH
 s7CA==
X-Gm-Message-State: AOAM532k+Q7XCtOg6eVAZeCCFYVNAQe7jsFTGGgqQOFuYyvJYlq0qu+h
 AcHFRNQqsIL557D/39sVLZr2kg==
X-Google-Smtp-Source: ABdhPJwbawWEUkv2F66a8ndXGjiaJL6hn5qsqFZxdvvcUCO97AbeEjdJDdTC3ZxjJG51qbTRERgXqA==
X-Received: by 2002:a1c:9ac3:: with SMTP id c186mr5149217wme.150.1589988770732; 
 Wed, 20 May 2020 08:32:50 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id 5sm3395840wmd.19.2020.05.20.08.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 08:32:50 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, joro@8bytes.org, bhelgaas@google.com
Subject: [PATCH v2 4/4] iommu/vt-d: Use pci_ats_supported()
Date: Wed, 20 May 2020 17:22:03 +0200
Message-Id: <20200520152201.3309416-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520152201.3309416-1-jean-philippe@linaro.org>
References: <20200520152201.3309416-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ashok.raj@intel.com,
 will@kernel.org, hch@infradead.org, alex.williamson@redhat.com,
 robin.murphy@arm.com, dwmw2@infradead.org
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
index 0182cff2c7ac..ed21ce6d1238 100644
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
