Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A39B2749E1
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 22:15:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0EB0C86775;
	Tue, 22 Sep 2020 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdDuvohHt-nY; Tue, 22 Sep 2020 20:15:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BECB686772;
	Tue, 22 Sep 2020 20:15:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2B64C0051;
	Tue, 22 Sep 2020 20:15:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C400C0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0882985618
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJ3I_zMCkrCT for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 20:15:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E2AEF85764
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:42 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gf14so1979508pjb.5
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5Pl/gShAZb0/E2JovcDPP84JLbx5P6bNZYeVPmDHvck=;
 b=JFQENaiQcLicUVuwenrKWe4YCS0T+T+aviz0bNsG1mTtSHtbLtQkot/AaE+xwoMe+w
 7/6sBj6aAqFyWyvdbmwXIXbzk2DBEYNamlxqAWaqZ9qdh2G0WIxShO+BtOJu0rTvVpNJ
 xQmydJ17vwYGJK3TMkhfOkmgmSS/hAhddXDi+xITBLoKmJIart4bvVqP605l6HGShy2U
 CUwWzNTU/9W1d7sS3y05YwTr5FoyEcUFH5KOLnZVfyVUaTifMjNwitBtd1Un34OcszSo
 XyDCcYhf2hZiT2lRcQAObzYP5e4RVOE0CKVlEKxPw9LSk4fkB8t0C7kqamNVcoqY9xp/
 ciTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5Pl/gShAZb0/E2JovcDPP84JLbx5P6bNZYeVPmDHvck=;
 b=I315tegWF+O1HYuaO1OP7mFhumkAMx/XJFfRc88Rb40Jps1RIslQc1MwxEek1ze0tJ
 I10A0nU+V+BBxQLGKdYUgYN6nBcgRaHyf+ylrMCYMOdNWnKYi5L3u5ydylOCEmb/cPvB
 HibQdy/GJhEUatOTgrLLLw5CWM9lTG4iOaeDg+cxaU+kaamxUMw74vwqwKDiCBgr3r3e
 7HT3VhSy1QjMKPk3Iwg87BqFQRf2+Ah2Uea9fVUDrtI6YuFFqgko04VY0hxB6dluLGYd
 dYCl6zVPxB+a6bmyvrGQ2n5VWJqYu14mo07loD6955mRp+9mYgkHIIvbwG2f6l0H2nGx
 skcA==
X-Gm-Message-State: AOAM532vCK/AtHEQN3fvdSyHCuV213/y7QpkoZIMWm9NRtpCwep0oIRJ
 PeTHvrDUoswfyqy39md7YOEQMiAjugg=
X-Google-Smtp-Source: ABdhPJzptw8fyzjTK2OdS09lZj2gxOE+AI6qcaM1mEoc7T/s78cLn+1DuSDnip3uFwqBLtaXFQf1AQ==
X-Received: by 2002:a17:90b:4ac2:: with SMTP id
 mh2mr329438pjb.210.1600805742148; 
 Tue, 22 Sep 2020 13:15:42 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id e10sm15793028pgb.45.2020.09.22.13.15.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 13:15:41 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v10 6/7] iommu/uapi: Handle data and argsz filled by users
Date: Tue, 22 Sep 2020 13:17:01 -0700
Message-Id: <1600805822-1177-7-git-send-email-jacob.jun.pan@linux.intel.com>
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

IOMMU user APIs are responsible for processing user data. This patch
changes the interface such that user pointers can be passed into IOMMU
code directly. Separate kernel APIs without user pointers are introduced
for in-kernel users of the UAPI functionality.

IOMMU UAPI data has a user filled argsz field which indicates the data
length of the structure. User data is not trusted, argsz must be
validated based on the current kernel data size, mandatory data size,
and feature flags.

User data may also be extended, resulting in possible argsz increase.
Backward compatibility is ensured based on size and flags (or
the functional equivalent fields) checking.

This patch adds sanity checks in the IOMMU layer. In addition to argsz,
reserved/unused fields in padding, flags, and version are also checked.
Details are documented in Documentation/userspace-api/iommu.rst

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/iommu.c | 199 ++++++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/iommu.h |  28 ++++---
 2 files changed, 211 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4ae02291ccc2..5c1b7ae48aae 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1961,34 +1961,219 @@ int iommu_attach_device(struct iommu_domain *domain, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_attach_device);
 
+/*
+ * Check flags and other user provided data for valid combinations. We also
+ * make sure no reserved fields or unused flags are set. This is to ensure
+ * not breaking userspace in the future when these fields or flags are used.
+ */
+static int iommu_check_cache_invl_data(struct iommu_cache_invalidate_info *info)
+{
+	u32 mask;
+	int i;
+
+	if (info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
+		return -EINVAL;
+
+	mask = (1 << IOMMU_CACHE_INV_TYPE_NR) - 1;
+	if (info->cache & ~mask)
+		return -EINVAL;
+
+	if (info->granularity >= IOMMU_INV_GRANU_NR)
+		return -EINVAL;
+
+	switch (info->granularity) {
+	case IOMMU_INV_GRANU_ADDR:
+		if (info->cache & IOMMU_CACHE_INV_TYPE_PASID)
+			return -EINVAL;
+
+		mask = IOMMU_INV_ADDR_FLAGS_PASID |
+			IOMMU_INV_ADDR_FLAGS_ARCHID |
+			IOMMU_INV_ADDR_FLAGS_LEAF;
+
+		if (info->granu.addr_info.flags & ~mask)
+			return -EINVAL;
+		break;
+	case IOMMU_INV_GRANU_PASID:
+		mask = IOMMU_INV_PASID_FLAGS_PASID |
+			IOMMU_INV_PASID_FLAGS_ARCHID;
+		if (info->granu.pasid_info.flags & ~mask)
+			return -EINVAL;
+
+		break;
+	case IOMMU_INV_GRANU_DOMAIN:
+		if (info->cache & IOMMU_CACHE_INV_TYPE_DEV_IOTLB)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Check reserved padding fields */
+	for (i = 0; i < sizeof(info->padding); i++) {
+		if (info->padding[i])
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int iommu_uapi_cache_invalidate(struct iommu_domain *domain, struct device *dev,
-				struct iommu_cache_invalidate_info *inv_info)
+				void __user *uinfo)
 {
+	struct iommu_cache_invalidate_info inv_info = { 0 };
+	u32 minsz;
+	int ret = 0;
+
 	if (unlikely(!domain->ops->cache_invalidate))
 		return -ENODEV;
 
-	return domain->ops->cache_invalidate(domain, dev, inv_info);
+	/*
+	 * No new spaces can be added before the variable sized union, the
+	 * minimum size is the offset to the union.
+	 */
+	minsz = offsetof(struct iommu_cache_invalidate_info, granu);
+
+	/* Copy minsz from user to get flags and argsz */
+	if (copy_from_user(&inv_info, uinfo, minsz))
+		return -EFAULT;
+
+	/* Fields before variable size union is mandatory */
+	if (inv_info.argsz < minsz)
+		return -EINVAL;
+
+	/* PASID and address granu require additional info beyond minsz */
+	if (inv_info.argsz == minsz &&
+	    ((inv_info.granularity == IOMMU_INV_GRANU_PASID) ||
+		    (inv_info.granularity == IOMMU_INV_GRANU_ADDR)))
+		return -EINVAL;
+
+	if (inv_info.granularity == IOMMU_INV_GRANU_PASID &&
+	    inv_info.argsz < offsetofend(struct iommu_cache_invalidate_info, granu.pasid_info))
+		return -EINVAL;
+
+	if (inv_info.granularity == IOMMU_INV_GRANU_ADDR &&
+	    inv_info.argsz < offsetofend(struct iommu_cache_invalidate_info, granu.addr_info))
+		return -EINVAL;
+
+	/*
+	 * User might be using a newer UAPI header which has a larger data
+	 * size, we shall support the existing flags within the current
+	 * size. Copy the remaining user data _after_ minsz but not more
+	 * than the current kernel supported size.
+	 */
+	if (copy_from_user((void *)&inv_info + minsz, uinfo + minsz,
+			   min_t(u32, inv_info.argsz, sizeof(inv_info)) - minsz))
+		return -EFAULT;
+
+	/* Now the argsz is validated, check the content */
+	ret = iommu_check_cache_invl_data(&inv_info);
+	if (ret)
+		return ret;
+
+	return domain->ops->cache_invalidate(domain, dev, &inv_info);
 }
 EXPORT_SYMBOL_GPL(iommu_uapi_cache_invalidate);
 
-int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
-			       struct device *dev, struct iommu_gpasid_bind_data *data)
+static int iommu_check_bind_data(struct iommu_gpasid_bind_data *data)
+{
+	u32 mask;
+	int i;
+
+	if (data->version != IOMMU_GPASID_BIND_VERSION_1)
+		return -EINVAL;
+
+	/* Check the range of supported formats */
+	if (data->format >= IOMMU_PASID_FORMAT_LAST)
+		return -EINVAL;
+
+	/* Check all flags */
+	mask = IOMMU_SVA_GPASID_VAL;
+	if (data->flags & ~mask)
+		return -EINVAL;
+
+	/* Check reserved padding fields */
+	for (i = 0; i < sizeof(data->padding); i++) {
+		if (data->padding[i])
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int iommu_sva_prepare_bind_data(void __user *udata,
+				       struct iommu_gpasid_bind_data *data)
 {
+	u32 minsz;
+
+	/*
+	 * No new spaces can be added before the variable sized union, the
+	 * minimum size is the offset to the union.
+	 */
+	minsz = offsetof(struct iommu_gpasid_bind_data, vendor);
+
+	/* Copy minsz from user to get flags and argsz */
+	if (copy_from_user(data, udata, minsz))
+		return -EFAULT;
+
+	/* Fields before variable size union is mandatory */
+	if (data->argsz < minsz)
+		return -EINVAL;
+	/*
+	 * User might be using a newer UAPI header, we shall let IOMMU vendor
+	 * driver decide on what size it needs. Since the guest PASID bind data
+	 * can be vendor specific, larger argsz could be the result of extension
+	 * for one vendor but it should not affect another vendor.
+	 * Copy the remaining user data _after_ minsz
+	 */
+	if (copy_from_user((void *)data + minsz, udata + minsz,
+			   min_t(u32, data->argsz, sizeof(*data)) - minsz))
+		return -EFAULT;
+
+	return iommu_check_bind_data(data);
+}
+
+int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain, struct device *dev,
+			       void __user *udata)
+{
+	struct iommu_gpasid_bind_data data = { 0 };
+	int ret;
+
 	if (unlikely(!domain->ops->sva_bind_gpasid))
 		return -ENODEV;
 
-	return domain->ops->sva_bind_gpasid(domain, dev, data);
+	ret = iommu_sva_prepare_bind_data(udata, &data);
+	if (ret)
+		return ret;
+
+	return domain->ops->sva_bind_gpasid(domain, dev, &data);
 }
 EXPORT_SYMBOL_GPL(iommu_uapi_sva_bind_gpasid);
 
-int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
-				 ioasid_t pasid)
+int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
+			     ioasid_t pasid)
 {
 	if (unlikely(!domain->ops->sva_unbind_gpasid))
 		return -ENODEV;
 
 	return domain->ops->sva_unbind_gpasid(dev, pasid);
 }
+EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
+
+int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
+				 void __user *udata)
+{
+	struct iommu_gpasid_bind_data data = { 0 };
+	int ret;
+
+	if (unlikely(!domain->ops->sva_bind_gpasid))
+		return -ENODEV;
+
+	ret = iommu_sva_prepare_bind_data(udata, &data);
+	if (ret)
+		return ret;
+
+	return iommu_sva_unbind_gpasid(domain, dev, data.hpasid);
+}
 EXPORT_SYMBOL_GPL(iommu_uapi_sva_unbind_gpasid);
 
 static void __iommu_detach_device(struct iommu_domain *domain,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 710d5d2691eb..3ca3a40fc80f 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -426,11 +426,14 @@ extern void iommu_detach_device(struct iommu_domain *domain,
 				struct device *dev);
 extern int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
 				       struct device *dev,
-				       struct iommu_cache_invalidate_info *inv_info);
+				       void __user *uinfo);
+
 extern int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
-				      struct device *dev, struct iommu_gpasid_bind_data *data);
+				      struct device *dev, void __user *udata);
 extern int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
-					struct device *dev, ioasid_t pasid);
+					struct device *dev, void __user *udata);
+extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
+				   struct device *dev, ioasid_t pasid);
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
@@ -1032,22 +1035,29 @@ static inline int iommu_sva_get_pasid(struct iommu_sva *handle)
 	return IOMMU_PASID_INVALID;
 }
 
-static inline int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
-					      struct device *dev,
-					      struct iommu_cache_invalidate_info *inv_info)
+static inline int
+iommu_uapi_cache_invalidate(struct iommu_domain *domain,
+			    struct device *dev,
+			    struct iommu_cache_invalidate_info *inv_info)
 {
 	return -ENODEV;
 }
 
 static inline int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
-					     struct device *dev,
-					     struct iommu_gpasid_bind_data *data)
+					     struct device *dev, void __user *udata)
 {
 	return -ENODEV;
 }
 
 static inline int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
-					       struct device *dev, int pasid)
+					       struct device *dev, void __user *udata)
+{
+	return -ENODEV;
+}
+
+static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
+					  struct device *dev,
+					  ioasid_t pasid)
 {
 	return -ENODEV;
 }
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
