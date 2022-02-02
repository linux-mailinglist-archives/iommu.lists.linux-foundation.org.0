Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB554A6AD6
	for <lists.iommu@lfdr.de>; Wed,  2 Feb 2022 05:18:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D561F4011C;
	Wed,  2 Feb 2022 04:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMkMhCLq3ClA; Wed,  2 Feb 2022 04:18:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A902B40019;
	Wed,  2 Feb 2022 04:18:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 781FDC0073;
	Wed,  2 Feb 2022 04:18:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 852E7C000B
 for <iommu@lists.linux-foundation.org>; Wed,  2 Feb 2022 02:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C991403C8
 for <iommu@lists.linux-foundation.org>; Wed,  2 Feb 2022 02:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7stbmZCpF7am for <iommu@lists.linux-foundation.org>;
 Wed,  2 Feb 2022 02:37:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3110F40227
 for <iommu@lists.linux-foundation.org>; Wed,  2 Feb 2022 02:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643769465; x=1675305465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zFUncUbhfnvgaEbErIgawnk2kmhFomWqXowKdIic5EE=;
 b=le6jx2gpvSwjsDrTGkMDdNEX4/oYW8ZfJtmyVVlxSYchm/pdP7G2UMDx
 3jpR9VBrgcuLhg26imQz9lAO50naqPiX/U8/aYMwpHChkCEXCt6M3tC8l
 oXGbV0tAwdhBadihvkgOh5Qry4jw+nExd9B/KC9UpmE25hUre3oR8LjQo
 FfLfiWKuMoh2HqodEqRILCcjV/Se/IOuxgvhMQsIbChb7lFFoWBNgRGXE
 RVzsRS5/M0uvVu2vBQlqeSa2NydxIg/f+iWafj53WQ9yXrDpqXNmkT6dY
 PPOM5KlBT01Il3OiOiZhy7ILvqYcMu8N1B6pqiNYGGxItoCZxsN2P3HqF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="248059024"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="248059024"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 18:37:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="583267957"
Received: from agabodun-lnx.jf.intel.com ([10.165.21.226])
 by fmsmga008.fm.intel.com with ESMTP; 01 Feb 2022 18:37:43 -0800
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
To: akeem.g.abodunrin@intel.com, matthew.d.roper@intel.com,
 baolu.lu@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH] iommu/vt-d: Remove comment reference to iommu_dev_has_feature
Date: Tue,  1 Feb 2022 18:37:43 -0800
Message-Id: <20220202023743.28135-1-akeem.g.abodunrin@intel.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Feb 2022 04:18:49 +0000
Cc: iommu@lists.linux-foundation.org
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

iommu_dev_has_feature() api has been removed by the commit 262948f8ba573
("iommu: Delete iommu_dev_has_feature()") - So this patch removes comment
about the api to avoid any confusion.

Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index de0c57a567c8..bea054f2bd4d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -153,8 +153,7 @@ struct iommu_resv_region {
  *			 supported, this feature must be enabled before and
  *			 disabled after %IOMMU_DEV_FEAT_SVA.
  *
- * Device drivers query whether a feature is supported using
- * iommu_dev_has_feature(), and enable it using iommu_dev_enable_feature().
+ * Device drivers enable the feature via iommu_dev_enable_feature().
  */
 enum iommu_dev_features {
 	IOMMU_DEV_FEAT_AUX,
-- 
2.21.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
