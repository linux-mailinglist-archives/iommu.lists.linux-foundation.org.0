Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D742749E8
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 22:16:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DE506228E3;
	Tue, 22 Sep 2020 20:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSy3u8YaAWgi; Tue, 22 Sep 2020 20:15:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4B3D122B25;
	Tue, 22 Sep 2020 20:15:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 309CFC0051;
	Tue, 22 Sep 2020 20:15:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC183C0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9F0A9229A3
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njW+XudTbuC8 for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 20:15:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 6051A228B0
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 20:15:39 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g29so12903778pgl.2
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FfUXWWqx4cqNXXt5EY8o6jZtoACfMPOHAkeL+nG0nLI=;
 b=jppJmmBa70FWfRV8f9gYuwFAJDXAkKEaCluGfIfrHOxo7lgzWD0z7t9lzqv4ENmM+G
 YDTGJDtr9YF+1NZoF0oPw7PhPZYi7si+pxCD7R39twN+tq6aHEY+VsCugnmFUYNy0Rw9
 FEqwzIj/DUOnRqHTSdGpiXCeY9R+ZLZdwBm3ShGjlheG6DDrDB4SH4Uk8uXScHLiB+Oy
 H54bW1+yJedEsV/rBWjxUqGMKGGHBQSJaGQUPJMKR4D7WgovI9tgK6L5T7bEg/+OB17F
 tTfVSKcdT14QZKm+yXi9xTqsHChLn8VLJVV4Vmw7t/CrXmmYxN5+5u1tFZNdVbk55XJG
 FZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FfUXWWqx4cqNXXt5EY8o6jZtoACfMPOHAkeL+nG0nLI=;
 b=L23+Q/cuOuC6ZVWTnzyeLpcxDl3wC44L1rhSWUCuVG7SnC8puZoIvh58FBf3ik4tGx
 BgfOLBoMr/yKZA6rpD+keeVPau6QA0Vpmu/eszCakGP+upB9S+mSUG4ffBNzk61MjufL
 CsKhiC/4ihkvE7zFfa9grcUsrjc2wSSoJQpLSHLgDWw4x78nuWdLuj7ahvV9BNw6l1UP
 WehROiku+xeOSsW39cBpNRwPvtIFGKhxqvbTN//N/HAj01pSJwgbGNiSjZDeNzdsY1h4
 YToLBSjCIpDPfeVDFrlqAgOiXq2IPEudThos6WfAeHO1q7eOYIn5RDktErcQEBi7VT8p
 3TDg==
X-Gm-Message-State: AOAM530lQ4qBfJ8pk2V8npCuIURMnaeSNPeV4nsT9znPv2UJaAYnU5RF
 zHdZBNfjV/R+X45LDq44yvIuxMCj2pw=
X-Google-Smtp-Source: ABdhPJzMoBu9OeQ6SW9fMRtvPed1Kz2CO6V9DKGBaflMqncnfkbwWlIOsGiPWjCxZ/YAwsNir4KeIQ==
X-Received: by 2002:a17:902:9695:b029:d1:e598:4007 with SMTP id
 n21-20020a1709029695b02900d1e5984007mr6309913plp.65.1600805738786; 
 Tue, 22 Sep 2020 13:15:38 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id e10sm15793028pgb.45.2020.09.22.13.15.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 13:15:38 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v10 3/7] iommu/uapi: Introduce enum type for PASID data format
Date: Tue, 22 Sep 2020 13:16:58 -0700
Message-Id: <1600805822-1177-4-git-send-email-jacob.jun.pan@linux.intel.com>
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

There can be multiple vendor-specific PASID data formats used in UAPI
structures. This patch adds enum type with a last entry which makes
range checking much easier.

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 include/uapi/linux/iommu.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index b42acc8fe007..7cc6ee6c41f7 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -298,11 +298,16 @@ struct iommu_gpasid_bind_data_vtd {
 					 IOMMU_SVA_VTD_GPASID_PCD |  \
 					 IOMMU_SVA_VTD_GPASID_PWT)
 
+enum iommu_pasid_data_format {
+	IOMMU_PASID_FORMAT_INTEL_VTD = 1,
+	IOMMU_PASID_FORMAT_LAST,
+};
+
 /**
  * struct iommu_gpasid_bind_data - Information about device and guest PASID binding
  * @argsz:	User filled size of this data
  * @version:	Version of this data structure
- * @format:	PASID table entry format
+ * @format:	PASID table entry format of enum iommu_pasid_data_format type
  * @flags:	Additional information on guest bind request
  * @gpgd:	Guest page directory base of the guest mm to bind
  * @hpasid:	Process address space ID used for the guest mm in host IOMMU
@@ -321,7 +326,6 @@ struct iommu_gpasid_bind_data {
 	__u32 argsz;
 #define IOMMU_GPASID_BIND_VERSION_1	1
 	__u32 version;
-#define IOMMU_PASID_FORMAT_INTEL_VTD	1
 	__u32 format;
 	__u32 addr_width;
 #define IOMMU_SVA_GPASID_VAL	(1 << 0) /* guest PASID valid */
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
