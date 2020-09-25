Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62961278E83
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 18:31:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 222FA86E45;
	Fri, 25 Sep 2020 16:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkEHqoKRkzjs; Fri, 25 Sep 2020 16:31:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE04D86E49;
	Fri, 25 Sep 2020 16:31:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8048C0890;
	Fri, 25 Sep 2020 16:31:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34877C0859
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 30ABE20474
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVZQaduNKtzj for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 16:31:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 841B72E180
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:31:00 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l126so3690938pfd.5
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LSyf3SkDlCwf2HoUFoGuJC/iHiB7H7zbzGxUquhsjX0=;
 b=HirDKlAAMkGWAf1STePQ3QJkiXE7V9lvnoCP3iKzdgGsUoBllA+XVwfogsD72X/f6h
 7tHN/hkzs2cLjFIzKmEPanSPvZ2t3YJH/3rvDov3wOBWR2k69SXrXvxRmNrVS1IYYbhp
 PhwDqdm8DvSQMik89etcIj/It/09Eeeb7so1j5kwhHKaVrC16JU1gHrkiFn714ORh4z6
 Jw8FV0PrmuWiwEfa1rbGXbtj2blhu9zM4dt8cmPoZrupMxIil0PR/6t6tu3imK6nQyok
 WffmfeK6nNklQFrw/D6mmY+tSAuE7V21z3rdmI2PwjbZPKAM0oC1D8FPgnlvSKwp/CIW
 NljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LSyf3SkDlCwf2HoUFoGuJC/iHiB7H7zbzGxUquhsjX0=;
 b=PPICuTSfe5jJkbgAT6y10WMZSJGtLEdWsGGqdA/J7jKPWuRWNhMql6x3Q2P/QwUwAg
 ttcXOVkJf+88+Mq93C1/MaC7SoOMmAPx5N5cWTZIUF+JAFBAyyMT88BmHH5Zx9knJ5XD
 s/70PY03bI2bJkee//UFi5Pk62iCCFbOXgCgDn1KaJq+wfqGrXixlS1Xg2r27nMKPo2M
 HS+IZqOJQobTOxSOWyQvTGKGxvabfODTnesfcYWPbQ6qrj6IVGnEWTp6Usp+iBdDHzYb
 13tcolt8p0+2rzQWKkIBsgIvoedXaTScACEJOtQUXxBLpdlYl/O4pasmfGEPeY2X56DV
 4LzA==
X-Gm-Message-State: AOAM530RP2YAB2Io88znQMUwafoQS8gmPN43mT29VEpVzE9sqPe0a1UT
 0tDSGMHL9gB/eulqZXE/VHBMq4i7edY=
X-Google-Smtp-Source: ABdhPJxES9mSmYCxxF5wPNlQxp4xWTu4A0olsptxBPLuXZRW3kV2wcYDnUuS+TVtd9iO4SCXfUdkzQ==
X-Received: by 2002:a17:902:bd07:b029:d1:f42c:454f with SMTP id
 p7-20020a170902bd07b02900d1f42c454fmr229733pls.54.1601051459865; 
 Fri, 25 Sep 2020 09:30:59 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id j19sm3197039pfe.108.2020.09.25.09.30.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Sep 2020 09:30:59 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v12 6/6] iommu/vt-d: Check UAPI data processed by IOMMU core
Date: Fri, 25 Sep 2020 09:32:47 -0700
Message-Id: <1601051567-54787-7-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601051567-54787-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1601051567-54787-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 linux-api@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Yi Sun <yi.y.sun@intel.com>, Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Wu Hao <hao.wu@intel.com>
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

IOMMU generic layer already does sanity checks on UAPI data for version
match and argsz range based on generic information.

This patch adjusts the following data checking responsibilities:
- removes the redundant version check from VT-d driver
- removes the check for vendor specific data size
- adds check for the use of reserved/undefined flags

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel/iommu.c |  3 +--
 drivers/iommu/intel/svm.c   | 11 +++++++++--
 include/uapi/linux/iommu.h  |  1 +
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 461f3a6864d4..18ed3b3c70d7 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5408,8 +5408,7 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
 	int ret = 0;
 	u64 size = 0;
 
-	if (!inv_info || !dmar_domain ||
-	    inv_info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
+	if (!inv_info || !dmar_domain)
 		return -EINVAL;
 
 	if (!dev || !dev_is_pci(dev))
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 99353d6468fa..0cb9a15f1112 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -284,8 +284,15 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 	if (WARN_ON(!iommu) || !data)
 		return -EINVAL;
 
-	if (data->version != IOMMU_GPASID_BIND_VERSION_1 ||
-	    data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
+	if (data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
+		return -EINVAL;
+
+	/* IOMMU core ensures argsz is more than the start of the union */
+	if (data->argsz < offsetofend(struct iommu_gpasid_bind_data, vendor.vtd))
+		return -EINVAL;
+
+	/* Make sure no undefined flags are used in vendor data */
+	if (data->vendor.vtd.flags & ~(IOMMU_SVA_VTD_GPASID_LAST - 1))
 		return -EINVAL;
 
 	if (!dev_is_pci(dev))
diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index 66d4ca40b40f..e1d9e75f2c94 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -288,6 +288,7 @@ struct iommu_gpasid_bind_data_vtd {
 #define IOMMU_SVA_VTD_GPASID_PWT	(1 << 3) /* page-level write through */
 #define IOMMU_SVA_VTD_GPASID_EMTE	(1 << 4) /* extended mem type enable */
 #define IOMMU_SVA_VTD_GPASID_CD		(1 << 5) /* PASID-level cache disable */
+#define IOMMU_SVA_VTD_GPASID_LAST	(1 << 6)
 	__u64 flags;
 	__u32 pat;
 	__u32 emt;
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
