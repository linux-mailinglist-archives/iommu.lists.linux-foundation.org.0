Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A030E45F
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 21:57:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C8D8D23115;
	Wed,  3 Feb 2021 20:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Z19rxt+NZFi; Wed,  3 Feb 2021 20:57:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DD70F204A2;
	Wed,  3 Feb 2021 20:57:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBA3AC013A;
	Wed,  3 Feb 2021 20:57:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6719C013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B3F0687164
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ns3QNi3TQIII for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 20:57:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C6F4871C4
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:29 +0000 (UTC)
IronPort-SDR: R51TYc3gQ/cQAs7gkbac/Y536zCgweG5+VyTkhityQT6+/RQunSrYVvB/eEOQkNR1/UTecuW3w
 fMoo7FHq7lEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160875295"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="160875295"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 12:57:29 -0800
IronPort-SDR: vEsPwWDwRp/bB9vfE/RdJnwAKAqrjj0TGiGqfUE3tQfYHLLcWnbKyzD3O+7yTc1u8ecIHu2bMA
 A95QSLTBqfIg==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="372510552"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Feb 2021 12:57:28 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [PATCH 03/12] platform-msi: Provide default irq_chip:: Ack
Date: Wed,  3 Feb 2021 12:56:36 -0800
Message-Id: <1612385805-3412-4-git-send-email-megha.dey@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612385805-3412-1-git-send-email-megha.dey@intel.com>
References: <1612385805-3412-1-git-send-email-megha.dey@intel.com>
Cc: alex.williamson@redhat.com, kevin.tian@intel.com, tony.luck@intel.com,
 dave.jiang@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 ravi.v.shankar@intel.com, maz@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jgg@mellanox.com, megha.dey@intel.com, linux-pci@vger.kernel.org,
 bhelgaas@google.com, dan.j.williams@intel.com, dwmw@amazon.co.uk
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

From: Thomas Gleixner <tglx@linutronix.de>

For the upcoming device MSI support it's required to have a default
irq_chip::ack implementation (irq_chip_ack_parent) so the drivers do not
need to care.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Megha Dey <megha.dey@intel.com>
---
 drivers/base/platform-msi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 2c1e2e0..9d9ccfc 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -101,6 +101,8 @@ static void platform_msi_update_chip_ops(struct msi_domain_info *info)
 		chip->irq_mask = irq_chip_mask_parent;
 	if (!chip->irq_unmask)
 		chip->irq_unmask = irq_chip_unmask_parent;
+	if (!chip->irq_ack)
+		chip->irq_ack = irq_chip_ack_parent;
 	if (!chip->irq_eoi)
 		chip->irq_eoi = irq_chip_eoi_parent;
 	if (!chip->irq_set_affinity)
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
