Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D118386E
	for <lists.iommu@lfdr.de>; Thu, 12 Mar 2020 19:20:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 576AB886D1;
	Thu, 12 Mar 2020 18:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JOP2hBtVOKb; Thu, 12 Mar 2020 18:20:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5F46F886B3;
	Thu, 12 Mar 2020 18:20:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41CC9C0177;
	Thu, 12 Mar 2020 18:20:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D29AEC0177
 for <iommu@lists.linux-foundation.org>; Thu, 12 Mar 2020 18:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BBBB888077
 for <iommu@lists.linux-foundation.org>; Thu, 12 Mar 2020 18:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGoJyuTuxwWX for <iommu@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 18:19:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id DC8ED88642
 for <iommu@lists.linux-foundation.org>; Thu, 12 Mar 2020 18:19:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 184A130E;
 Thu, 12 Mar 2020 11:19:58 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9F43F67D;
 Thu, 12 Mar 2020 11:19:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH] vfio: Ignore -ENODEV when getting MSI cookie
Date: Thu, 12 Mar 2020 18:19:50 +0000
Message-Id: <20200312181950.60664-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org
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

When we try to get an MSI cookie for a VFIO device, that can fail if
CONFIG_IOMMU_DMA is not set. In this case iommu_get_msi_cookie() returns
-ENODEV, and that should not be fatal.

Ignore that case and proceed with the initialisation.

This fixes VFIO with a platform device on the Calxeda Midway (no MSIs).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

not sure this is the right fix, or we should rather check if the
platform doesn't support MSIs at all (which doesn't seem to be easy
to do).
Or is this because arm-smmu.c always reserves an IOMMU_RESV_SW_MSI
region?

Also this seems to be long broken, actually since Eric introduced MSI
support in 4.10-rc3, but at least since the initialisation order was
fixed with f6810c15cf9.

Grateful for any insight.

Cheers,
Andre

 drivers/vfio/vfio_iommu_type1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index a177bf2c6683..467e217ef09a 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1786,7 +1786,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 
 	if (resv_msi) {
 		ret = iommu_get_msi_cookie(domain->domain, resv_msi_base);
-		if (ret)
+		if (ret && ret != -ENODEV)
 			goto out_detach;
 	}
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
