Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC703A2208
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 04:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C7CF40170;
	Thu, 10 Jun 2021 02:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UX8v0aXxaKe9; Thu, 10 Jun 2021 02:03:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A3E454038F;
	Thu, 10 Jun 2021 02:03:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 851A5C000B;
	Thu, 10 Jun 2021 02:03:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C427C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B8C383218
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQi32mc0KISD for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 02:03:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEF97831AC
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:06 +0000 (UTC)
IronPort-SDR: oGeO+DXNsv4KtcOHh3LicKnS8JgU7rOxszCdR19OAm30R42RfmeoR5FPxmRTcz0HsuIZg8utW4
 HBQkqA4mLelQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="202184166"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="202184166"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 19:03:06 -0700
IronPort-SDR: ZPQcP3zMcBv4W58SqafiORZKu0hzCNNC33oOmbfU7W8bGpLIfpNJYRYBdDfJXhd0KSnuFbyYKS
 8067Y9En6HVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="402500291"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2021 19:03:03 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 04/23] iommu/vt-d: Select PCI_ATS explicitly
Date: Thu, 10 Jun 2021 10:00:56 +0800
Message-Id: <20210610020115.1637656-5-baolu.lu@linux.intel.com>
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

The Intel VT-d implementation supports device TLB management. Select
PCI_ATS explicitly so that the pci_ats helpers are always available.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Acked-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/20210512065313.3441309-1-baolu.lu@linux.intel.com
---
 drivers/iommu/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/intel/Kconfig b/drivers/iommu/intel/Kconfig
index 28a3d1596c76..7e5b240b801d 100644
--- a/drivers/iommu/intel/Kconfig
+++ b/drivers/iommu/intel/Kconfig
@@ -14,6 +14,7 @@ config INTEL_IOMMU
 	select SWIOTLB
 	select IOASID
 	select IOMMU_DMA
+	select PCI_ATS
 	help
 	  DMA remapping (DMAR) devices support enables independent address
 	  translations for Direct Memory Access (DMA) from devices.
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
