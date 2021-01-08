Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A52EF454
	for <lists.iommu@lfdr.de>; Fri,  8 Jan 2021 16:02:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1FF10875AA;
	Fri,  8 Jan 2021 15:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ksFq1LwvnSQ; Fri,  8 Jan 2021 15:02:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F714875AC;
	Fri,  8 Jan 2021 15:02:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66723C013A;
	Fri,  8 Jan 2021 15:02:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4971AC013A
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3798A87317
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3DYUuD1fbu4 for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 15:02:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 10FD787277
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g185so8675274wmf.3
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jan 2021 07:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvwNHFhdLkaGBie88gzRCcyxfKIG/LYZ2PnvLPGSu2c=;
 b=ISNeho54rmu9ZyTuqnuYWjhj+2mILy1TMBGrvs7XzZBRVbUOjGi1bOIxR1vq9L5T/8
 hACv21cvz6C71l/cwPP5kPHWLxhGTpq32HVVUmyFMxuPuq5CR8U0R0Wo/te2LrbO7RBs
 W144EpMmuqZtpFpBJDVA0rFb+nydLeQLKFNQUvZxLKMfgAeaaBn73IPU+bdDMdLLrLmM
 ESlBzKA0NUJUQ5ZRZ814zmJdf0mjDHRnUXHD22TVzxEIFrd0rvhS3y02u9CyXLaLQ/kD
 AoZFQoQi8qql0RIgbg4vTAOQSj97X/8XrSet3WM6HG0qznl4idxYu7ZZyjBhX5oxfAhK
 kmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uvwNHFhdLkaGBie88gzRCcyxfKIG/LYZ2PnvLPGSu2c=;
 b=fQfyJF5mg+vAbS/5AmWQChWsp69VMD+f5ePVJGEWoK9O2BJPStyK6u6DdkEfeQQdct
 ntVB3iVeZW7RJInc3Sjb+MwRfP/seFTPFbP+UpOOnZAzuVp31l7LFTaww29Riw0uncAj
 NA3eSMoViij0s1KHf5MvdGdl6dd5eGC1QRdXOylnLvyIJpYC23RXKSu3yu+Tu56eaxkA
 sodWJfBzF0tMiTady1dPbeqK6uSS82zjBj3B57mjnGR0yQIuj8s8pt+f8I4YHPO3CmBC
 KwwNHtH+c0XFt7p4hK5Dbg2ITpkfuNIs1i7tWiV4ZhN7fwrz4uytJOR/yJbOpDxXIr5V
 fv8A==
X-Gm-Message-State: AOAM530cfxJautGTRn/SPItyfXoL7+EfD+nddoOCp3j8uQKMHkgQcipt
 f6U56V3MprcwFig6oLAFpfvplA==
X-Google-Smtp-Source: ABdhPJymvMLKfx6JMwWQypvMx10zrT/uAgWw60V8JEcHGqofEYBbCwP/8ch5rpewZaM7KRA+nDGSgA==
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr3504371wmg.152.1610118152176; 
 Fri, 08 Jan 2021 07:02:32 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id s13sm14258464wra.53.2021.01.08.07.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:02:31 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v9 03/10] iommu: Separate IOMMU_DEV_FEAT_IOPF from
 IOMMU_DEV_FEAT_SVA
Date: Fri,  8 Jan 2021 15:52:11 +0100
Message-Id: <20210108145217.2254447-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108145217.2254447-1-jean-philippe@linaro.org>
References: <20210108145217.2254447-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, vivek.gautam@arm.com,
 guohanjun@huawei.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-acpi@vger.kernel.org, zhangfei.gao@linaro.org, lenb@kernel.org,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 rjw@rjwysocki.net, iommu@lists.linux-foundation.org, sudeep.holla@arm.com,
 robin.murphy@arm.com, linux-accelerators@lists.ozlabs.org
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

Some devices manage I/O Page Faults (IOPF) themselves instead of relying
on PCIe PRI or Arm SMMU stall. Allow their drivers to enable SVA without
mandating IOMMU-managed IOPF. The other device drivers now need to first
enable IOMMU_DEV_FEAT_IOPF before enabling IOMMU_DEV_FEAT_SVA.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Will Deacon <will@kernel.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Zhou Wang <wangzhou1@hisilicon.com>
---
 include/linux/iommu.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 583c734b2e87..701b2eeb0dc5 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -156,10 +156,24 @@ struct iommu_resv_region {
 	enum iommu_resv_type	type;
 };
 
-/* Per device IOMMU features */
+/**
+ * enum iommu_dev_features - Per device IOMMU features
+ * @IOMMU_DEV_FEAT_AUX: Auxiliary domain feature
+ * @IOMMU_DEV_FEAT_SVA: Shared Virtual Addresses
+ * @IOMMU_DEV_FEAT_IOPF: I/O Page Faults such as PRI or Stall. Generally using
+ *			 %IOMMU_DEV_FEAT_SVA requires %IOMMU_DEV_FEAT_IOPF, but
+ *			 some devices manage I/O Page Faults themselves instead
+ *			 of relying on the IOMMU. When supported, this feature
+ *			 must be enabled before and disabled after
+ *			 %IOMMU_DEV_FEAT_SVA.
+ *
+ * Device drivers query whether a feature is supported using
+ * iommu_dev_has_feature(), and enable it using iommu_dev_enable_feature().
+ */
 enum iommu_dev_features {
-	IOMMU_DEV_FEAT_AUX,	/* Aux-domain feature */
-	IOMMU_DEV_FEAT_SVA,	/* Shared Virtual Addresses */
+	IOMMU_DEV_FEAT_AUX,
+	IOMMU_DEV_FEAT_SVA,
+	IOMMU_DEV_FEAT_IOPF,
 };
 
 #define IOMMU_PASID_INVALID	(-1U)
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
