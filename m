Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8C7266A67
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 23:56:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 875B38745B;
	Fri, 11 Sep 2020 21:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUmep1wM5F45; Fri, 11 Sep 2020 21:56:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C6AB87466;
	Fri, 11 Sep 2020 21:56:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2C77C0859;
	Fri, 11 Sep 2020 21:56:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC598C0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 21:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D55D687466
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 21:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3iRKY0BaUDG for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 21:56:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 03F5187465
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 21:56:11 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id mm21so2352602pjb.4
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 14:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FfUXWWqx4cqNXXt5EY8o6jZtoACfMPOHAkeL+nG0nLI=;
 b=M9c9cpcOTriraBeGVD0L44z8T7iovTmc7GfDi51tJSUUohbR6doa1N8kc5HvhwTJHV
 Tp4Xxx2OxcZt4mE7UWXzWqaxUxFZoJ8b0DTIk+b5Z6qS25qoBngJI8VzY9kGazPqvGb0
 wT/bx73Nfnq7xYxvUG9tEQvM614OAxYcOy0rmuWNMjnLcJmUdrarVDfCBlp5+48jt5F3
 Lu44cYCXeDXWf2XVT2qo+WH51FT32bLWM0ucq7KvzYQoxF9mkKTNKd2mgu2BVfXRwQeA
 yRgBai4wBDSx1zaei02e5ykE8zoY9mcKrXyfKs5OjRRgfNqp4REaqE5RP+grXiBpEiWi
 xzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FfUXWWqx4cqNXXt5EY8o6jZtoACfMPOHAkeL+nG0nLI=;
 b=h1uazJDQJzjNrb8gShU/tmnBrkjLH4VMesThsqqgx6EQ9xyguiV0uFi0i4OBT9J+r8
 llEgYwkWnFx8pdW2gB+vxQOJGjdvQQtIGSJaF7cB9YO9hVL1pjthXnimP9bgkdvRM40F
 EOiyyJMiWLYeCZUpaLQ5Xjevp3Vvfg/yGYJxeoKJTjvW94cMQg6RXrl2OglF0QD83Fnc
 axUNZ8eabrtpjoi4iM0ZRuYu/vShWyK9ltlhlyERlUPNWMlgmhfSjJiRJY6MghtW232i
 fcIeAn2evTlPYKEifLTjGcqMWbhgytw7exOvYJrtvjq2bNBqf42nQzhMZ8mQs25l6s0P
 SGvA==
X-Gm-Message-State: AOAM5306V/y8qcOtKh/LR2UQSKd279Da+yq8TXbij0/EAUZety3bMSJn
 lkgCfflbqS17vVfyXDnuSfg8Txh/4Do=
X-Google-Smtp-Source: ABdhPJwmlK92M6fOcS/u0j8EYjUggKjel2zlw8APVsrNZIfOrBuKW6614COgHfMo5xYNUB/gh/Lf+g==
X-Received: by 2002:a17:90a:c781:: with SMTP id
 gn1mr3916986pjb.151.1599861370416; 
 Fri, 11 Sep 2020 14:56:10 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id e62sm3171586pfh.76.2020.09.11.14.56.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 14:56:09 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v9 3/7] iommu/uapi: Introduce enum type for PASID data format
Date: Fri, 11 Sep 2020 14:57:52 -0700
Message-Id: <1599861476-53416-4-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599861476-53416-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1599861476-53416-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
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
