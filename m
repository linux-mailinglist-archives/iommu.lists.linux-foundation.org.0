Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C032749F1
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 22:16:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 958D220410;
	Tue, 22 Sep 2020 20:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4BojfMGNagN; Tue, 22 Sep 2020 20:16:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C22B228CA;
	Tue, 22 Sep 2020 20:16:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 864DEC0051;
	Tue, 22 Sep 2020 20:16:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C09CC0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D266C228CA
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEUldh7SJowP for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 20:15:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 9894720788
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:41 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z18so13514076pfg.0
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cd/kUvj/qKVGHAwJBYWnGQx2hf0aCQ0hRurRYYSX7es=;
 b=DmxsWTMr9JQwOMCRjH4NkW8Vc+twqFrimTjOwCsvJ19HMzd2zqj4VaMMV1Ki6VSDka
 o6DZMQvC67E8CqASOYDxKakAP0PuB2NR3mYW8c1IBj9+RNW3E2Da1sXhSINqHL7sZ8Zr
 yzZMmBQ48jEmppFiAsMYxMSRrr+o7sQ/nXIcNMx8gpNBehwcrvrdXwkCVxnKwUa+JyQO
 nI72TjEI4OPK1jgDg9JpCGmLBAsLUK+gjsYXEk2Uncv98ymrsZm4BExSIZv3SHKJ/Yh1
 1HlEI20pVWThfwp7u5fTyQIivuPVmnHsVg725Gf9nbWiv8jVpGSw0aF+LMAZq/hYytXw
 SUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cd/kUvj/qKVGHAwJBYWnGQx2hf0aCQ0hRurRYYSX7es=;
 b=E7ld3SBGUsRJsAgvvYv4ELzuOK7s/jm89rvlYx1IMd09Puqlix3McRM6guYfV41BI9
 ARj10AuNFPMW5QhZoB99SrvmIwUa62ITZ6eij32VW6EtmX8NtSqeQ2Pk0xykDoV/+vZ0
 Elus+AFAa0plrDkyD2EXfenmJ8G0tVBZxvGE7wEzt0WElm8y2tBiMZGndmNaVppZxn09
 COx1s8emns0zXy9Diy3TpijenBRXhSzPzFvAlP2P4VeIt8kIBcoCLAkaaAG8f4Xso+Io
 /CzYi2y11/GSbsZdvnsur8zCqjY5GC9QnjvsJefwTvm6G8lY9LjfcYDkwAjFyVfC9O56
 zARw==
X-Gm-Message-State: AOAM532AUE9nPENSdf4SVrjYLikvwB/K039iwLt57LL8er9t/b3x5QDS
 KS6uX7UMDrkae0W3rLBVtNGj0dPOOTg=
X-Google-Smtp-Source: ABdhPJwNWa/S5R+aMSsTSCER+jsCCjjBR+PbH06DD7lV8yKrWLaFS9RNIq4NMFtqLkfr0JwWylrYcw==
X-Received: by 2002:a17:902:ba88:b029:d1:e5e7:bde1 with SMTP id
 k8-20020a170902ba88b02900d1e5e7bde1mr6495442pls.65.1600805740941; 
 Tue, 22 Sep 2020 13:15:40 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id e10sm15793028pgb.45.2020.09.22.13.15.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 13:15:40 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v10 5/7] iommu/uapi: Rename uapi functions
Date: Tue, 22 Sep 2020 13:17:00 -0700
Message-Id: <1600805822-1177-6-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600805822-1177-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1600805822-1177-1-git-send-email-jacob.jun.pan@linux.intel.com>
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

User APIs such as iommu_sva_unbind_gpasid() may also be used by the
kernel. Since we introduced user pointer to the UAPI functions,
in-kernel callers cannot share the same APIs. In-kernel callers are also
trusted, there is no need to validate the data.

We plan to have two flavors of the same API functions, one called
through ioctls, carrying a user pointer and one called directly with
valid IOMMU UAPI structs. To differentiate both, let's rename existing
functions with an iommu_uapi_ prefix.

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/iommu.c | 18 +++++++++---------
 include/linux/iommu.h | 31 ++++++++++++++++---------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 609bd25bf154..4ae02291ccc2 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1961,35 +1961,35 @@ int iommu_attach_device(struct iommu_domain *domain, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_attach_device);
 
-int iommu_cache_invalidate(struct iommu_domain *domain, struct device *dev,
-			   struct iommu_cache_invalidate_info *inv_info)
+int iommu_uapi_cache_invalidate(struct iommu_domain *domain, struct device *dev,
+				struct iommu_cache_invalidate_info *inv_info)
 {
 	if (unlikely(!domain->ops->cache_invalidate))
 		return -ENODEV;
 
 	return domain->ops->cache_invalidate(domain, dev, inv_info);
 }
-EXPORT_SYMBOL_GPL(iommu_cache_invalidate);
+EXPORT_SYMBOL_GPL(iommu_uapi_cache_invalidate);
 
-int iommu_sva_bind_gpasid(struct iommu_domain *domain,
-			   struct device *dev, struct iommu_gpasid_bind_data *data)
+int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
+			       struct device *dev, struct iommu_gpasid_bind_data *data)
 {
 	if (unlikely(!domain->ops->sva_bind_gpasid))
 		return -ENODEV;
 
 	return domain->ops->sva_bind_gpasid(domain, dev, data);
 }
-EXPORT_SYMBOL_GPL(iommu_sva_bind_gpasid);
+EXPORT_SYMBOL_GPL(iommu_uapi_sva_bind_gpasid);
 
-int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
-			     ioasid_t pasid)
+int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
+				 ioasid_t pasid)
 {
 	if (unlikely(!domain->ops->sva_unbind_gpasid))
 		return -ENODEV;
 
 	return domain->ops->sva_unbind_gpasid(dev, pasid);
 }
-EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
+EXPORT_SYMBOL_GPL(iommu_uapi_sva_unbind_gpasid);
 
 static void __iommu_detach_device(struct iommu_domain *domain,
 				  struct device *dev)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index fee209efb756..710d5d2691eb 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -424,13 +424,13 @@ extern int iommu_attach_device(struct iommu_domain *domain,
 			       struct device *dev);
 extern void iommu_detach_device(struct iommu_domain *domain,
 				struct device *dev);
-extern int iommu_cache_invalidate(struct iommu_domain *domain,
-				  struct device *dev,
-				  struct iommu_cache_invalidate_info *inv_info);
-extern int iommu_sva_bind_gpasid(struct iommu_domain *domain,
-		struct device *dev, struct iommu_gpasid_bind_data *data);
-extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
-				struct device *dev, ioasid_t pasid);
+extern int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
+				       struct device *dev,
+				       struct iommu_cache_invalidate_info *inv_info);
+extern int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
+				      struct device *dev, struct iommu_gpasid_bind_data *data);
+extern int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
+					struct device *dev, ioasid_t pasid);
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
@@ -1032,21 +1032,22 @@ static inline int iommu_sva_get_pasid(struct iommu_sva *handle)
 	return IOMMU_PASID_INVALID;
 }
 
-static inline int
-iommu_cache_invalidate(struct iommu_domain *domain,
-		       struct device *dev,
-		       struct iommu_cache_invalidate_info *inv_info)
+static inline int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
+					      struct device *dev,
+					      struct iommu_cache_invalidate_info *inv_info)
 {
 	return -ENODEV;
 }
-static inline int iommu_sva_bind_gpasid(struct iommu_domain *domain,
-				struct device *dev, struct iommu_gpasid_bind_data *data)
+
+static inline int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
+					     struct device *dev,
+					     struct iommu_gpasid_bind_data *data)
 {
 	return -ENODEV;
 }
 
-static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
-					   struct device *dev, int pasid)
+static inline int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
+					       struct device *dev, int pasid)
 {
 	return -ENODEV;
 }
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
