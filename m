Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906C4B3FD7
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 03:58:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8029402AA;
	Mon, 14 Feb 2022 02:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUmpgyEQY7RH; Mon, 14 Feb 2022 02:58:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D86B1402A4;
	Mon, 14 Feb 2022 02:58:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A94DAC000B;
	Mon, 14 Feb 2022 02:58:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE2E7C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 02:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBED24048D
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 02:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfgTO8ReEtoN for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 02:58:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00F1C4012A
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 02:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644807521; x=1676343521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JZUGngNJYQNkQxgdzwA+7te07Ku/U9yElxaQVFZPW0=;
 b=bgOBLOyP1/DJP0FT7yt5fFzQuQ501szH3HPBYxrHhSQy0gnbX1ZzSbgx
 UEiTgcOlbGb5MhI8wCYJKomxUaBbMEpooQGikhjAhX9YGUtjX4ce83Le+
 4Bia57DS1gdO7tLssIEr0uTGiJc3hJvHs1sgkW4i/RQoKymcNFmgH8AFx
 YdMX3jnn+df8G0IoKDGAdSDPPG7e2kagyByskqeEuJo2TDc8ztiQR/apu
 66rZPd8x8ScWlY6H74gfKh63ed28MVquYgodm87z0v8z+qzFPVPDxTVpJ
 2zq+1hJEVyc2B7hQI2xdusvz9dbl1bWSy8iN0tEu1aXbspao1QuSve1Kw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="230637519"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="230637519"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 18:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="501514913"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga002.jf.intel.com with ESMTP; 13 Feb 2022 18:58:37 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Liu Yi L <yi.l.liu@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: [PATCH v2 02/11] iommu/vt-d: Remove finding domain in
 dmar_insert_one_dev_info()
Date: Mon, 14 Feb 2022 10:56:55 +0800
Message-Id: <20220214025704.3184654-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214025704.3184654-1-baolu.lu@linux.intel.com>
References: <20220214025704.3184654-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

The Intel IOMMU driver has already converted to use default domain
framework in iommu core. There's no need to find a domain for the
device in the domain attaching path. Cleanup that code.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/intel/iommu.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index e3b04d5d87b0..b3075933864e 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2554,7 +2554,6 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 						    struct device *dev,
 						    struct dmar_domain *domain)
 {
-	struct dmar_domain *found = NULL;
 	struct device_domain_info *info;
 	unsigned long flags;
 	int ret;
@@ -2605,26 +2604,6 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 	}
 
 	spin_lock_irqsave(&device_domain_lock, flags);
-	if (dev)
-		found = find_domain(dev);
-
-	if (!found) {
-		struct device_domain_info *info2;
-		info2 = dmar_search_domain_by_dev_info(info->segment, info->bus,
-						       info->devfn);
-		if (info2) {
-			found      = info2->domain;
-			info2->dev = dev;
-		}
-	}
-
-	if (found) {
-		spin_unlock_irqrestore(&device_domain_lock, flags);
-		free_devinfo_mem(info);
-		/* Caller must free the original domain */
-		return found;
-	}
-
 	spin_lock(&iommu->lock);
 	ret = domain_attach_iommu(domain, iommu);
 	spin_unlock(&iommu->lock);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
