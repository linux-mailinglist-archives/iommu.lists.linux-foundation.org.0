Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E411DDCE
	for <lists.iommu@lfdr.de>; Fri, 13 Dec 2019 06:37:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B9A418701D;
	Fri, 13 Dec 2019 05:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lx5J_1LXsOeU; Fri, 13 Dec 2019 05:37:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B95B187008;
	Fri, 13 Dec 2019 05:37:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D120C0881;
	Fri, 13 Dec 2019 05:37:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5CB4C0881
 for <iommu@lists.linux-foundation.org>; Fri, 13 Dec 2019 05:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CFF5A8701D
 for <iommu@lists.linux-foundation.org>; Fri, 13 Dec 2019 05:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id snQxrw5OqxSB for <iommu@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 05:37:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0FFD187008
 for <iommu@lists.linux-foundation.org>; Fri, 13 Dec 2019 05:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576215420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KrRJhXbPmYzxHbKKDmxeVwb2dFiex77QA0exnu3ANOQ=;
 b=A6GUdha23OVzOapwDxqyRadSSDFBCjPDBmfvTycWBl4fBTw69tauBIl3Jb0yTCYURhrTvo
 Z8e2FUWWIYLaO4nUnnaR8oJLeLNuPv3RH4MeXaT4TJ6KUx3eQqKeYUSx2JZ6P/kceI3J+f
 hpHp4DkOVjLxXuCNB0yKTSSajS1QRoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-KmzpGEOENaKFrOMYeuCQ3w-1; Fri, 13 Dec 2019 00:36:58 -0500
X-MC-Unique: KmzpGEOENaKFrOMYeuCQ3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27A361800D63;
 Fri, 13 Dec 2019 05:36:57 +0000 (UTC)
Received: from cantor.redhat.com (ovpn-116-67.phx2.redhat.com [10.3.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 073F646E77;
 Fri, 13 Dec 2019 05:36:49 +0000 (UTC)
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/vt-d: Allocate reserved region for ISA with correct
 permission
Date: Thu, 12 Dec 2019 22:36:42 -0700
Message-Id: <20191213053642.5696-1-jsnitsel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
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

Currently the reserved region for ISA is allocated with no
permissions. If a dma domain is being used, mapping this region will
fail. Set the permissions to DMA_PTE_READ|DMA_PTE_WRITE.

Cc: Joerg Roedel <jroedel@suse.de>
Cc: Lu Baolu <baolu.lu@linux.intel.com> 
Cc: iommu@lists.linux-foundation.org
Cc: stable@vger.kernel.org # v5.3+
Fixes: d850c2ee5fe2 ("iommu/vt-d: Expose ISA direct mapping region via iommu_get_resv_regions")
Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
---
 drivers/iommu/intel-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0c8d81f56a30..998529cebcf2 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5736,7 +5736,7 @@ static void intel_iommu_get_resv_regions(struct device *device,
 		struct pci_dev *pdev = to_pci_dev(device);
 
 		if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA) {
-			reg = iommu_alloc_resv_region(0, 1UL << 24, 0,
+			reg = iommu_alloc_resv_region(0, 1UL << 24, prot,
 						      IOMMU_RESV_DIRECT);
 			if (reg)
 				list_add_tail(&reg->list, head);
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
