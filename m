Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE556302413
	for <lists.iommu@lfdr.de>; Mon, 25 Jan 2021 12:08:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4DCDE8744B;
	Mon, 25 Jan 2021 11:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSFYo5jfHm7f; Mon, 25 Jan 2021 11:08:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF98087452;
	Mon, 25 Jan 2021 11:08:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD39EC0FA7;
	Mon, 25 Jan 2021 11:08:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49F4EC013A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 006C58744A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZ1urwLzj5h2 for <iommu@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 11:08:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 43DE287452
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:47 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q7so11856846wre.13
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 03:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uiSdj3ahcV4jfiq23D9UAVEBduTBnIEfUfM+Rzx87y0=;
 b=o1trokFtSTCfvkocLi895coCTyzkTkfVye5g5jBBpjAgejVTdH5D1p5iBs5mtxk5kx
 mn6KNV0w7qjzSiXB1pheQswkz5HrDXxVo3wDWV5rM/ULRbJ1r3psOC3kaJ/pE4BmTo36
 HPLBwStDbURpW834zKOhjGc51y2kENbOdl5bZvNk+Hz9cjGYWNACLOU7IA/iXFH3SHIP
 yiu6DtXmE6rzyuRYBY2OIUHos1ZOqe0LMFDLcDopc70vRuGNN8t4ia4kUd7an+ncEQwD
 dvpm1J7Ho4IXV8x4cXbBE8WbeXlwGKe2KLODyr6dUadfFvfEr8JoTpffCM0YnSwz9oK3
 Rmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uiSdj3ahcV4jfiq23D9UAVEBduTBnIEfUfM+Rzx87y0=;
 b=nDOZH3NXUDv9ij6po7+91X17kqV3k1JbY3ZySuDGsQYQCq+Sqigmb5gi6PQxpADdc0
 WA8dNWcm3p2AKybpITwOmHjwHbU52a4A8OwNcSPLz5TCi3uSDH6QKhdVqkxlYu2JPSLP
 J1C6OUqIanlvraAUvEVamg6YFOV5y6BUQA2KoKfgndc6GAaRFqB1ac6Dj6SVErjgpYmG
 uky6MnFvNBRt/lYxiiwZix8HMUPISJxcVXd5EsbePFqvp+ln7LipJYzuf1Uz+rkJfHVQ
 Fb1krAJFwvW6rzq7+Ubeyokao33I7+hiN4bmVRyLNMHman9WZlXGuoFD9aCpqi4q8PQ7
 s7lQ==
X-Gm-Message-State: AOAM533qB6U1SnFan/IAuTO/kdQjtGsGVGV6Npid45WA2ULlriE29S63
 FLeh1c1gkpmPNox8cqrruXJkfA==
X-Google-Smtp-Source: ABdhPJwwlQQTzJJVFrK3jv6EdbzkxepXZyhe6MIPrsPL57ZER4N2Q2U1BVzXSW+FFTj3InzYFSgEFQ==
X-Received: by 2002:adf:e807:: with SMTP id o7mr334734wrm.308.1611572925581;
 Mon, 25 Jan 2021 03:08:45 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u6sm16636014wro.75.2021.01.25.03.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 03:08:45 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v11 03/10] iommu: Separate IOMMU_DEV_FEAT_IOPF from
 IOMMU_DEV_FEAT_SVA
Date: Mon, 25 Jan 2021 12:06:44 +0100
Message-Id: <20210125110650.3232195-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125110650.3232195-1-jean-philippe@linaro.org>
References: <20210125110650.3232195-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, vivek.gautam@arm.com,
 guohanjun@huawei.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-acpi@vger.kernel.org, zhangfei.gao@linaro.org, lenb@kernel.org,
 devicetree@vger.kernel.org, kevin.tian@intel.com,
 Arnd Bergmann <arnd@arndb.de>, robh+dt@kernel.org,
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
enable IOMMU_DEV_FEAT_IOPF before enabling IOMMU_DEV_FEAT_SVA. Enabling
IOMMU_DEV_FEAT_IOPF on its own doesn't have any effect visible to the
device driver, it is used in combination with other features.

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
index b7ea11fc1a93..00348e4c3c26 100644
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
+ * @IOMMU_DEV_FEAT_IOPF: I/O Page Faults such as PRI or Stall. Generally
+ *			 enabling %IOMMU_DEV_FEAT_SVA requires
+ *			 %IOMMU_DEV_FEAT_IOPF, but some devices manage I/O Page
+ *			 Faults themselves instead of relying on the IOMMU. When
+ *			 supported, this feature must be enabled before and
+ *			 disabled after %IOMMU_DEV_FEAT_SVA.
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
2.30.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
