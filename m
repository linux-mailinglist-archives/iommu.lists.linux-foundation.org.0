Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 971FE3A221C
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 04:04:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DB7140225;
	Thu, 10 Jun 2021 02:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2B3ynbY8nqBo; Thu, 10 Jun 2021 02:04:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2FA3A40381;
	Thu, 10 Jun 2021 02:04:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05B62C0022;
	Thu, 10 Jun 2021 02:04:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42FE8C0022
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F141405A2
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umCzxvRrXrI6 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 02:04:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AEB940594
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:18 +0000 (UTC)
IronPort-SDR: yZDcIeUSy7zO2WCVesLWKpfy31Mqz5S561iLnPJJCUuR0EAm3OaPVzklAhVjY8TNqFFs2bK/n9
 oyjiFY2cJaJA==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="202184380"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="202184380"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 19:04:06 -0700
IronPort-SDR: clboMwH5uqlzExgTyJ36FhjcdBeY1U+ymWnjZjdhgmVwP/tDswhbI3lbz0OJZXAxwoSVxFJSqH
 H3xJc0xGOA+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="402500583"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2021 19:04:03 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 22/23] iommu/vt-d: Define counter explicitly as unsigned int
Date: Thu, 10 Jun 2021 10:01:14 +0800
Message-Id: <20210610020115.1637656-23-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
References: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Aditya Srivastava <yashsri421@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 iommu@lists.linux-foundation.org, Colin Ian King <colin.king@canonical.com>,
 Will Deacon <will@kernel.org>
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

From: Parav Pandit <parav@nvidia.com>

Avoid below checkpatch warning.

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
+       unsigned        iommu_refcnt[DMAR_UNITS_SUPPORTED];

Fixes: 29a27719abaa ("iommu/vt-d: Replace iommu_bmp with a refcount")
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210530075053.264218-1-parav@nvidia.com
---
 include/linux/intel-iommu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 574b932dfe86..d0fa0b31994d 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -537,7 +537,7 @@ struct context_entry {
 struct dmar_domain {
 	int	nid;			/* node id */
 
-	unsigned	iommu_refcnt[DMAR_UNITS_SUPPORTED];
+	unsigned int iommu_refcnt[DMAR_UNITS_SUPPORTED];
 					/* Refcount of devices per iommu */
 
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
