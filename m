Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C027B5B0
	for <lists.iommu@lfdr.de>; Mon, 28 Sep 2020 21:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 520F086DF0;
	Mon, 28 Sep 2020 19:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V13Irq66HrPU; Mon, 28 Sep 2020 19:51:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE00A85C8F;
	Mon, 28 Sep 2020 19:51:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C56C5C0051;
	Mon, 28 Sep 2020 19:51:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C1CDC0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 388EA203A3
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w+YRTwlUUMwH for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 19:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 879A42048E
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:05 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601322664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iNKAwz7MdlqRrpBvwDfW+Xi4s3UXuDJ7jQBLRXyHSRk=;
 b=dzqruOhwFjP9xbjIq53ssHZsNiccSgOSUYvUjNv5RgQ8DVS8+85jqNuMxfNgDBNoyJUmrM
 XSJWCnIMzc5K3VewVQWKWBpAfFrABFKZiRrAUMCjpIstGlRTXKgB02CvMLzu2gFvpfltH7
 7ugBsvipmAWG6/nW3l280UVcAS1Kiz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-bmWu5N4PNQq4bQk8g_S4mw-1; Mon, 28 Sep 2020 15:50:58 -0400
X-MC-Unique: bmWu5N4PNQq4bQk8g_S4mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C86A7420EA;
 Mon, 28 Sep 2020 19:50:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F07E614F5;
 Mon, 28 Sep 2020 19:50:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 will.deacon@arm.com, robin.murphy@arm.com, dwmw2@infradead.org,
 alex.williamson@redhat.com
Subject: [RFC 0/3] iommu: Reserved regions for IOVAs beyond dma_mask and iommu
 aperture
Date: Mon, 28 Sep 2020 21:50:34 +0200
Message-Id: <20200928195037.22654-1-eric.auger@redhat.com>
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

VFIO currently exposes the usable IOVA regions through the
VFIO_IOMMU_GET_INFO ioctl / VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
capability. However it fails to take into account the dma_mask
of the devices within the container. The top limit currently is
defined by the iommu aperture.

So, for instance, if the IOMMU supports up to 48bits, it may give
the impression the max IOVA is 48b while a device may have a
dma_mask of 42b. So this API cannot really be used to compute
the max usable IOVA.

This patch removes the IOVA region beyond the dma_mask's.
As we start to expose this reserved region in the sysfs file
/sys/kernel/iommu_groups/<n>/reserved_regions, we also need to
handle the IOVA range beyond the IOMMU aperture to handle the case
where the dma_mask would have a higher number of bits than the iommu
max input address.

This is a change to the ABI as this reserved region was not yet
exposed in sysfs /sys/kernel/iommu_groups/<n>/reserved_regions or
through the VFIO ioctl. At VFIO level we increment the version of
the VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE capability to advertise
that change.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/dma_mask_rfc

Eric Auger (3):
  iommu: Fix merging in iommu_insert_resv_region
  iommu: Account for dma_mask and iommu aperture in IOVA reserved
    regions
  vfio/type1: Increase the version of
    VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE

 .../ABI/testing/sysfs-kernel-iommu_groups     |  7 ++++
 drivers/iommu/iommu.c                         | 41 ++++++++++++++++++-
 drivers/vfio/vfio_iommu_type1.c               |  2 +-
 3 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.21.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
