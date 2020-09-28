Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D20D927B5B4
	for <lists.iommu@lfdr.de>; Mon, 28 Sep 2020 21:51:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25F358583F;
	Mon, 28 Sep 2020 19:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXZOKWlaBkvm; Mon, 28 Sep 2020 19:51:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5EAC9858B3;
	Mon, 28 Sep 2020 19:51:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B255C0051;
	Mon, 28 Sep 2020 19:51:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81B3EC0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 716C385C62
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eb1lwUgOldV7 for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 19:51:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A5DE385C45
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:09 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601322668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3C3HwQ8qYd4WkWvfVg6zz1+L4DLHgUkRm8dpfDfGjxA=;
 b=bcL3iyxsCsF1z3D3tzzZZ+ezpVWcgp8D8LQ9A4iT352kwGNFtmmMHUz9HOyLoyQqXI+HjW
 shJIB3wHvPTMLT3r4A8Kq1UPfmXX7BLNLOvCHNyQE2AJv44C0FMqI13MxVvW+xTjQqIVVK
 7u0iFF0CEFmN9IfqZd3q2H4k2TaVqUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-rrV75QiSNjqjOBgS8Zbt0A-1; Mon, 28 Sep 2020 15:51:06 -0400
X-MC-Unique: rrV75QiSNjqjOBgS8Zbt0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA1EE107466F;
 Mon, 28 Sep 2020 19:51:04 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D82C614F5;
 Mon, 28 Sep 2020 19:51:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 will.deacon@arm.com, robin.murphy@arm.com, dwmw2@infradead.org,
 alex.williamson@redhat.com
Subject: [RFC 3/3] vfio/type1: Increase the version of
 VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
Date: Mon, 28 Sep 2020 21:50:37 +0200
Message-Id: <20200928195037.22654-4-eric.auger@redhat.com>
In-Reply-To: <20200928195037.22654-1-eric.auger@redhat.com>
References: <20200928195037.22654-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: jean-philippe.brucker@arm.com
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

Now the IOVA regions beyond the dma_mask and the vfio aperture are
removed from the usable IOVA ranges, the API becomes reliable to
compute the max IOVA. Let's advertise this by using a new version
for the capability.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/vfio/vfio_iommu_type1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 5fbf0c1f7433..af4596123954 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2541,7 +2541,7 @@ static int vfio_iommu_iova_add_cap(struct vfio_info_cap *caps,
 	struct vfio_iommu_type1_info_cap_iova_range *iova_cap;
 
 	header = vfio_info_cap_add(caps, size,
-				   VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE, 1);
+				   VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE, 2);
 	if (IS_ERR(header))
 		return PTR_ERR(header);
 
-- 
2.21.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
