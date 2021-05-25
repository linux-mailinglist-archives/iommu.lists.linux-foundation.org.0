Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 533E038FB6B
	for <lists.iommu@lfdr.de>; Tue, 25 May 2021 09:09:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8770400E4;
	Tue, 25 May 2021 07:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkPw4awn8ii9; Tue, 25 May 2021 07:09:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED75640189;
	Tue, 25 May 2021 07:09:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C82F8C0001;
	Tue, 25 May 2021 07:09:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 135B1C0001
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 07:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FF594016A
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 07:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LS9ZhGygCREh for <iommu@lists.linux-foundation.org>;
 Tue, 25 May 2021 07:09:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F82D400E4
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 07:09:18 +0000 (UTC)
IronPort-SDR: iFLhlEgeAzhNdEU4/dJ6afONlFG0Ig3Cnp2LSeLrCexT2OEvrTngnaWl7BTcoKXjkmNue7yvF0
 TbeMndfoZTEA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="181762723"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="181762723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 00:09:15 -0700
IronPort-SDR: iIczQ9IndJwmbqjdm5HijKU5CJYhyV8XEwn94htuR7VMBhW4FAw5eFMricF3xCntkpgrvvGho4
 +rss46TBw1IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546452789"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by fmsmga001.fm.intel.com with ESMTP; 25 May 2021 00:09:09 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/vt-d: Fix sysfs leak in alloc_iommu()
Date: Tue, 25 May 2021 15:08:02 +0800
Message-Id: <20210525070802.361755-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525070802.361755-1-baolu.lu@linux.intel.com>
References: <20210525070802.361755-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Rolf Eike Beer <eb@emlix.com>,
 stable@vger.kernel.org
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

From: Rolf Eike Beer <eb@emlix.com>

iommu_device_sysfs_add() is called before, so is has to be cleaned on subsequent
errors.

Fixes: 39ab9555c2411 ("iommu: Add sysfs bindings for struct iommu_device")
Cc: stable@vger.kernel.org # 4.11.x
Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/17411490.HIIP88n32C@mobilepool36.emlix.com
---
 drivers/iommu/intel/dmar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 1757ac1e1623..84057cb9596c 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1142,7 +1142,7 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
 
 		err = iommu_device_register(&iommu->iommu, &intel_iommu_ops, NULL);
 		if (err)
-			goto err_unmap;
+			goto err_sysfs;
 	}
 
 	drhd->iommu = iommu;
@@ -1150,6 +1150,8 @@ static int alloc_iommu(struct dmar_drhd_unit *drhd)
 
 	return 0;
 
+err_sysfs:
+	iommu_device_sysfs_remove(&iommu->iommu);
 err_unmap:
 	unmap_iommu(iommu);
 error_free_seq_id:
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
