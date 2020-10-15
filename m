Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D9B28EEFD
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 11:03:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F9D387BF5;
	Thu, 15 Oct 2020 09:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kfw8vCDFp+AH; Thu, 15 Oct 2020 09:03:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA18887BF1;
	Thu, 15 Oct 2020 09:03:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 823B8C0051;
	Thu, 15 Oct 2020 09:03:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CFC2C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 09:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 89C8887A34
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 09:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fy4Mbq9uTWzg for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 09:03:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 198EB878E1
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 09:03:01 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id dt13so2452717ejb.12
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c3Jqalpf0P5zErHtqk4l6C16sl+wqSCxxuGIVGQs7DQ=;
 b=mr1fJQxpFk6abhFRMQtgpsgRIQwMBR0j7QGlRlhj7KuzeWmJXU0YbdwETZLcnmq+9J
 lX5tzFr26YXz+yCzdPD6gtShQO0epQctYygRlnqtbdAgPRH8xfeAzwyQlCoe1hpYpRhc
 xwphAD4uJCzd4cGQ9hB74QqliOtQ4Dy33Ekxq5HL+w8+cXhQna7Krm+UnUXseQr3T5nZ
 Q9GQCPSXjkNDB4KiLJteBzG5Q7d7aONk/oIVn5iY78oX+F0saxAuvq+7/MqKH8US4DNJ
 MLB4yYSQepenvMw4TLWdd6eJh2iPKDdmg3iM9wSgX0XPJTl02z0qzfIgeJiRo1E0htjz
 jmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c3Jqalpf0P5zErHtqk4l6C16sl+wqSCxxuGIVGQs7DQ=;
 b=CxkShZXqF3hYuYWYkeK4BMEZck64ecP2sESdH1x8NXCPSfUE4pXfFWxvfhwXUk2K7g
 aBJOJNwKWpk50jIXSkf7K68GbnUL+lycaS+GtSvRSpRbtk3d/afwkU1gbwbBUkKjX/vi
 xmn5MlMPgxfWvKn2d1HpXI+uqiguNFvZ8v350IOEI0blWE0sv/QVwyA60hgx9WmjukgE
 cy1Q0Uoi0ZQDizgyY+ObWal32MAsClagt2DcFe5IQGFFmOSaBTqbypIcKncLbwuOHxTp
 5tHzAU/2TpE9cO9mrVz0uo0CcIfaGKKrKaxuQ8HSSWnKeh9rtpwYejcgOdMfOTp5JWUU
 yYKw==
X-Gm-Message-State: AOAM531Ez55rXw+SvXuI8fxRMAQp1IEZQHSY6NRFa7bxocdnTEGsf4Ln
 CV+cJ3rZi63I7Pt76gjs7fxlHg==
X-Google-Smtp-Source: ABdhPJxvp3P0VbmCOj0Sd9J3gE3rGotPaup8wTuhiDlW0LHaF7KYjyTBGnMO/Laaf51govZhXOzDLw==
X-Received: by 2002:a17:906:340b:: with SMTP id
 c11mr3325221ejb.213.1602752579395; 
 Thu, 15 Oct 2020 02:02:59 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id d12sm1103078ejt.105.2020.10.15.02.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 02:02:58 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org,
 zhangfei.gao@linaro.org, wangzhou1@hisilicon.com
Subject: [RFC PATCH 1/2] iommu: Add flags to sva_unbind()
Date: Thu, 15 Oct 2020 11:00:28 +0200
Message-Id: <20201015090028.1278108-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015090028.1278108-1-jean-philippe@linaro.org>
References: <20201015090028.1278108-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 ashok.raj@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-pci@vger.kernel.org, linux-accelerators@lists.ozlabs.org
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

Provide a way for device drivers to tell IOMMU drivers about the device
state and the cleanup work to be done, when unbinding. No functional
change.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/linux/intel-iommu.h | 2 +-
 include/linux/iommu.h       | 7 ++++---
 drivers/iommu/intel/svm.c   | 7 ++++---
 drivers/iommu/iommu.c       | 5 +++--
 drivers/misc/uacce/uacce.c  | 4 ++--
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index fbf5b3e7707e..5b66b23d591d 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -747,7 +747,7 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 int intel_svm_unbind_gpasid(struct device *dev, u32 pasid);
 struct iommu_sva *intel_svm_bind(struct device *dev, struct mm_struct *mm,
 				 void *drvdata);
-void intel_svm_unbind(struct iommu_sva *handle);
+void intel_svm_unbind(struct iommu_sva *handle, unsigned long flags);
 u32 intel_svm_get_pasid(struct iommu_sva *handle);
 int intel_svm_page_response(struct device *dev, struct iommu_fault_event *evt,
 			    struct iommu_page_response *msg);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b95a6f8db6ff..26c1358a2a37 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -285,7 +285,7 @@ struct iommu_ops {
 
 	struct iommu_sva *(*sva_bind)(struct device *dev, struct mm_struct *mm,
 				      void *drvdata);
-	void (*sva_unbind)(struct iommu_sva *handle);
+	void (*sva_unbind)(struct iommu_sva *handle, unsigned long flags);
 	u32 (*sva_get_pasid)(struct iommu_sva *handle);
 
 	int (*page_response)(struct device *dev,
@@ -636,7 +636,7 @@ int iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev);
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm,
 					void *drvdata);
-void iommu_sva_unbind_device(struct iommu_sva *handle);
+void iommu_sva_unbind_device(struct iommu_sva *handle, unsigned long flags);
 u32 iommu_sva_get_pasid(struct iommu_sva *handle);
 
 #else /* CONFIG_IOMMU_API */
@@ -1026,7 +1026,8 @@ iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
 	return NULL;
 }
 
-static inline void iommu_sva_unbind_device(struct iommu_sva *handle)
+static inline void iommu_sva_unbind_device(struct iommu_sva *handle,
+					   unsigned long flags)
 {
 }
 
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index f1861fa3d0e4..700b05612af9 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -651,7 +651,8 @@ intel_svm_bind_mm(struct device *dev, unsigned int flags,
 }
 
 /* Caller must hold pasid_mutex */
-static int intel_svm_unbind_mm(struct device *dev, u32 pasid)
+static int intel_svm_unbind_mm(struct device *dev, u32 pasid,
+			       unsigned long flags)
 {
 	struct intel_svm_dev *sdev;
 	struct intel_iommu *iommu;
@@ -1091,13 +1092,13 @@ intel_svm_bind(struct device *dev, struct mm_struct *mm, void *drvdata)
 	return sva;
 }
 
-void intel_svm_unbind(struct iommu_sva *sva)
+void intel_svm_unbind(struct iommu_sva *sva, unsigned long flags)
 {
 	struct intel_svm_dev *sdev;
 
 	mutex_lock(&pasid_mutex);
 	sdev = to_intel_svm_dev(sva);
-	intel_svm_unbind_mm(sdev->dev, sdev->pasid);
+	intel_svm_unbind_mm(sdev->dev, sdev->pasid, flags);
 	mutex_unlock(&pasid_mutex);
 }
 
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8c470f451a32..741c463095a8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2991,6 +2991,7 @@ EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
 /**
  * iommu_sva_unbind_device() - Remove a bond created with iommu_sva_bind_device
  * @handle: the handle returned by iommu_sva_bind_device()
+ * @flags: IOMMU_UNBIND_* flags
  *
  * Put reference to a bond between device and address space. The device should
  * not be issuing any more transaction for this PASID. All outstanding page
@@ -2998,7 +2999,7 @@ EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
  *
  * Returns 0 on success, or an error value
  */
-void iommu_sva_unbind_device(struct iommu_sva *handle)
+void iommu_sva_unbind_device(struct iommu_sva *handle, unsigned long flags)
 {
 	struct iommu_group *group;
 	struct device *dev = handle->dev;
@@ -3012,7 +3013,7 @@ void iommu_sva_unbind_device(struct iommu_sva *handle)
 		return;
 
 	mutex_lock(&group->mutex);
-	ops->sva_unbind(handle);
+	ops->sva_unbind(handle, flags);
 	mutex_unlock(&group->mutex);
 
 	iommu_group_put(group);
diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
index 56dd98ab5a81..0800566a6656 100644
--- a/drivers/misc/uacce/uacce.c
+++ b/drivers/misc/uacce/uacce.c
@@ -105,7 +105,7 @@ static int uacce_bind_queue(struct uacce_device *uacce, struct uacce_queue *q)
 
 	pasid = iommu_sva_get_pasid(handle);
 	if (pasid == IOMMU_PASID_INVALID) {
-		iommu_sva_unbind_device(handle);
+		iommu_sva_unbind_device(handle, 0);
 		return -ENODEV;
 	}
 
@@ -118,7 +118,7 @@ static void uacce_unbind_queue(struct uacce_queue *q)
 {
 	if (!q->handle)
 		return;
-	iommu_sva_unbind_device(q->handle);
+	iommu_sva_unbind_device(q->handle, 0);
 	q->handle = NULL;
 }
 
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
