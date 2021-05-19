Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC6388499
	for <lists.iommu@lfdr.de>; Wed, 19 May 2021 03:51:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25F1640106;
	Wed, 19 May 2021 01:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wMqlKlqraZC; Wed, 19 May 2021 01:51:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2ED9E400FF;
	Wed, 19 May 2021 01:51:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0A98C0001;
	Wed, 19 May 2021 01:51:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F3A4C0001
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC0AD60647
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onJqvUr-OFUM for <iommu@lists.linux-foundation.org>;
 Wed, 19 May 2021 01:51:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 321C46065C
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:29 +0000 (UTC)
IronPort-SDR: NkqIQHb1oB78/4gXsFqW5NY4pbeigZ29JbONp16xaQ60st92QZ43f4Wx1KGLGdW2wX7AbaB1Rl
 1Hh2ZuWp9Lcw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="197774682"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="197774682"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 18:51:28 -0700
IronPort-SDR: MCAmAT/GgBXD5s4uiJ0epVeDBNQQSF2Dk2fL+K0ovgjBOns4QWtDMxVXECSOrnVZJFQj81d7tc
 7v2wsBJJ0fpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="542260514"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 18 May 2021 18:51:27 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/2] iommu/vt-d: Check for allocation failure in
 aux_detach_device()
Date: Wed, 19 May 2021 09:50:26 +0800
Message-Id: <20210519015027.108468-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519015027.108468-1-baolu.lu@linux.intel.com>
References: <20210519015027.108468-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>
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

From: Dan Carpenter <dan.carpenter@oracle.com>

In current kernels small allocations never fail, but checking for
allocation failure is the correct thing to do.

Fixes: 18abda7a2d55 ("iommu/vt-d: Fix general protection fault in aux_detach_device()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/YJuobKuSn81dOPLd@mwanda
---
 drivers/iommu/intel/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 708f430af1c4..9a7b79b5af18 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4606,6 +4606,8 @@ static int auxiliary_link_device(struct dmar_domain *domain,
 
 	if (!sinfo) {
 		sinfo = kzalloc(sizeof(*sinfo), GFP_ATOMIC);
+		if (!sinfo)
+			return -ENOMEM;
 		sinfo->domain = domain;
 		sinfo->pdev = dev;
 		list_add(&sinfo->link_phys, &info->subdevices);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
