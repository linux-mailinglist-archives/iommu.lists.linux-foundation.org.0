Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376A1E4B22
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 18:56:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4040787E5F;
	Wed, 27 May 2020 16:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imw6cioy89kz; Wed, 27 May 2020 16:56:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB70887FDD;
	Wed, 27 May 2020 16:56:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A88FAC016F;
	Wed, 27 May 2020 16:56:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF94AC016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 16:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C7A1C87DA2
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 16:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJK+9f972gCY for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 16:56:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CB5B187F63
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 16:56:23 +0000 (UTC)
IronPort-SDR: SDWyUHZfZHJa3gZSE4//qAVoudrmsUGE9fdZfH8RoYRbDTW188m/fpFNE+CHIrnh7j/Ar57hfQ
 MzFynK1Wx+cg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 09:56:23 -0700
IronPort-SDR: +fxzajnotclfoyaC6dDc/CwJPCUD8o/zmAlac5GDz+x+/VtC6DOnvJo1lK77l1hxjuI1oWM8oz
 iLWPPAlA2Aew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; d="scan'208";a="302522306"
Received: from jderrick-mobl.amr.corp.intel.com ([10.209.128.69])
 by orsmga008.jf.intel.com with ESMTP; 27 May 2020 09:56:23 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: <iommu@lists.linux-foundation.org>
Subject: [PATCH v1 3/3] iommu/vt-d: Remove real DMA lookup in find_domain
Date: Wed, 27 May 2020 10:56:17 -0600
Message-Id: <20200527165617.297470-4-jonathan.derrick@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200527165617.297470-1-jonathan.derrick@intel.com>
References: <20200527165617.297470-1-jonathan.derrick@intel.com>
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
 Jon Derrick <jonathan.derrick@intel.com>
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

By removing the real DMA indirection in find_domain(), we can allow
sub-devices of a real DMA device to have their own valid
device_domain_info. The dmar lookup and context entry removal paths have
been fixed to account for sub-devices.

Fixes: 2b0140c69637 ("iommu/vt-d: Use pci_real_dma_dev() for mapping")
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207575
Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 drivers/iommu/intel-iommu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 6d39b9b..5767882 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2436,9 +2436,6 @@ struct dmar_domain *find_domain(struct device *dev)
 	if (unlikely(attach_deferred(dev) || iommu_dummy(dev)))
 		return NULL;
 
-	if (dev_is_pci(dev))
-		dev = &pci_real_dma_dev(to_pci_dev(dev))->dev;
-
 	/* No lock here, assumes no domain exit in normal case */
 	info = get_domain_info(dev);
 	if (likely(info))
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
