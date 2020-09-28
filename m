Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CE27B71D
	for <lists.iommu@lfdr.de>; Mon, 28 Sep 2020 23:36:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DF5AE20553;
	Mon, 28 Sep 2020 21:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8gsyI5VWIqs0; Mon, 28 Sep 2020 21:36:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1722A20774;
	Mon, 28 Sep 2020 21:36:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7FA1C016F;
	Mon, 28 Sep 2020 21:36:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C80DEC0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C3E6386645
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbbejhQeOBT8 for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 21:36:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E72CF865C7
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:36:46 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id u3so1461500pjr.3
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 14:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MYpPSnzf7wFktbr//qjM+H85a7ND2QWunvW4sMQhPic=;
 b=AfhNiBZ3y4VLME6QMDWrRmWV6D4N6WoKulskg8+Hrocu+cv0d0NLb4OXqVxwzIkr/7
 pd5i1gzeBDkeODVVTgQNpvPkQ8ikTJ79ZQOfxFmiMVQ6wvu8TQu4o75WJSfb4L49ulLH
 sGjvR6/aG1JYxM5TPP+CijNnOpHji/WaOmkHBymvbOS0URoaPbNJpyAJpAVKoposvmmY
 1L8TXy5odOjYXXtdMxrP6YFBg+mKYz9KS3B31N9+qMavi41EN8Hn8IdImjIomU+qrHnG
 D1edMXAVTreqh0qIZG1ciQuUavQdmh4ZyE0uI6pKRUQg/mSu9adzHIIvaAU0eB46reiX
 ohcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MYpPSnzf7wFktbr//qjM+H85a7ND2QWunvW4sMQhPic=;
 b=JckHXS9cyZNBhY0XxpTyvRNnfdmnJDca0SnmvihZetOGqfCIPZxjr3Hj7I7wafTyuv
 tsrx3DFUGOoCLbjTtcg8RePenCdNyqq93Gta0PxVxi64aFql8vUSLYVdDGsL4hSp9txW
 yAPiF3bkEFyTaTPlBfB/MsMBZYo1lBRC/6EWe4ZDmXkOQIFAtUftkWEOdf6DoqvXdO4/
 FYDHamPUxDnwVDhYHgrzW61N5fYKe2SWohWlPH4cqR/UmN8xuiJEXSLkd18o+nPafWcH
 X+f2b0i6U6Krv9Gm+BN5psZvd9iYdv1aPmgWWlE4JsT6rvYiKJ69kCo9g3kY8i8NjD0d
 7log==
X-Gm-Message-State: AOAM531hIkhYM2ole6MZ3cO8RJa9FmZIc7861rXdeaM3+/C5BxMqsE09
 3yJviyHvfDwkg6e4TMDRrhoiVgta61E=
X-Google-Smtp-Source: ABdhPJzehtrtRBhg3lZdaKSsz3aa9JDa/K5e4NsmahiEFn3owyozG9YtLr3acyFytGVwmpNMAlpzww==
X-Received: by 2002:a17:90a:6a0e:: with SMTP id
 t14mr1014463pjj.97.1601329006297; 
 Mon, 28 Sep 2020 14:36:46 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id l11sm2220864pjf.17.2020.09.28.14.36.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Sep 2020 14:36:45 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 02/14] iommu/ioasid: Rename ioasid_set_data()
Date: Mon, 28 Sep 2020 14:38:29 -0700
Message-Id: <1601329121-36979-3-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601329121-36979-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1601329121-36979-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, linux-api@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Yi Sun <yi.y.sun@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, Wu Hao <hao.wu@intel.com>
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

Rename ioasid_set_data() to ioasid_attach_data() to avoid confusion with
struct ioasid_set. ioasid_set is a group of IOASIDs that share a common
token.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel/svm.c | 6 +++---
 drivers/iommu/ioasid.c    | 6 +++---
 include/linux/ioasid.h    | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 0cb9a15f1112..2c5645f0737a 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -346,7 +346,7 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 			svm->gpasid = data->gpasid;
 			svm->flags |= SVM_FLAG_GUEST_PASID;
 		}
-		ioasid_set_data(data->hpasid, svm);
+		ioasid_attach_data(data->hpasid, svm);
 		INIT_LIST_HEAD_RCU(&svm->devs);
 		mmput(svm->mm);
 	}
@@ -398,7 +398,7 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 	list_add_rcu(&sdev->list, &svm->devs);
  out:
 	if (!IS_ERR_OR_NULL(svm) && list_empty(&svm->devs)) {
-		ioasid_set_data(data->hpasid, NULL);
+		ioasid_attach_data(data->hpasid, NULL);
 		kfree(svm);
 	}
 
@@ -441,7 +441,7 @@ int intel_svm_unbind_gpasid(struct device *dev, int pasid)
 				 * the unbind, IOMMU driver will get notified
 				 * and perform cleanup.
 				 */
-				ioasid_set_data(pasid, NULL);
+				ioasid_attach_data(pasid, NULL);
 				kfree(svm);
 			}
 		}
diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
index 0f8dd377aada..5f63af07acd5 100644
--- a/drivers/iommu/ioasid.c
+++ b/drivers/iommu/ioasid.c
@@ -258,14 +258,14 @@ void ioasid_unregister_allocator(struct ioasid_allocator_ops *ops)
 EXPORT_SYMBOL_GPL(ioasid_unregister_allocator);
 
 /**
- * ioasid_set_data - Set private data for an allocated ioasid
+ * ioasid_attach_data - Set private data for an allocated ioasid
  * @ioasid: the ID to set data
  * @data:   the private data
  *
  * For IOASID that is already allocated, private data can be set
  * via this API. Future lookup can be done via ioasid_find.
  */
-int ioasid_set_data(ioasid_t ioasid, void *data)
+int ioasid_attach_data(ioasid_t ioasid, void *data)
 {
 	struct ioasid_data *ioasid_data;
 	int ret = 0;
@@ -287,7 +287,7 @@ int ioasid_set_data(ioasid_t ioasid, void *data)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(ioasid_set_data);
+EXPORT_SYMBOL_GPL(ioasid_attach_data);
 
 /**
  * ioasid_alloc - Allocate an IOASID
diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
index 6f000d7a0ddc..9c44947a68c8 100644
--- a/include/linux/ioasid.h
+++ b/include/linux/ioasid.h
@@ -39,7 +39,7 @@ void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
 		  bool (*getter)(void *));
 int ioasid_register_allocator(struct ioasid_allocator_ops *allocator);
 void ioasid_unregister_allocator(struct ioasid_allocator_ops *allocator);
-int ioasid_set_data(ioasid_t ioasid, void *data);
+int ioasid_attach_data(ioasid_t ioasid, void *data);
 
 #else /* !CONFIG_IOASID */
 static inline ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min,
@@ -67,7 +67,7 @@ static inline void ioasid_unregister_allocator(struct ioasid_allocator_ops *allo
 {
 }
 
-static inline int ioasid_set_data(ioasid_t ioasid, void *data)
+static inline int ioasid_attach_data(ioasid_t ioasid, void *data)
 {
 	return -ENOTSUPP;
 }
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
