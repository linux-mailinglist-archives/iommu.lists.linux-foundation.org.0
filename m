Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7430856CD88
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:38:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DE81813D2;
	Sun, 10 Jul 2022 06:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DE81813D2
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BLK9n9uE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjDUF5KVm6RP; Sun, 10 Jul 2022 06:37:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D70B682AF5;
	Sun, 10 Jul 2022 06:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70B682AF5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDFE6C0080;
	Sun, 10 Jul 2022 06:37:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CB2BC002D
 for <iommu@lists.linux-foundation.org>; Sat,  9 Jul 2022 08:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 631898462D
 for <iommu@lists.linux-foundation.org>; Sat,  9 Jul 2022 08:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 631898462D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aF13jFbv6nx for <iommu@lists.linux-foundation.org>;
 Sat,  9 Jul 2022 08:30:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 252AA8462C
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 252AA8462C
 for <iommu@lists.linux-foundation.org>; Sat,  9 Jul 2022 08:30:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8B1760EBC;
 Sat,  9 Jul 2022 08:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE760C3411C;
 Sat,  9 Jul 2022 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1657355434;
 bh=n3sOzYysVnmVB5AZFY0EVa9mIiJAanqfVEZ/sLo/n0c=;
 h=Subject:To:Cc:From:Date:From;
 b=BLK9n9uEH7FPwfULPYQx/u3dbDXbBJw9yxLvcJCZQ6BRQgvAoE8cqwUIdCaJIOJi1
 k651K3CfvqcGMpoGf9zTlgthrRD3oWP4OasmcER7Ebo4kQ2+JUh4oX0iVDAh7bHrb7
 B1YmIXKuIhVv/bO3RkY9hQIx72ASURbu9VkfMZbk=
Subject: Patch "MAINTAINERS: Remove iommu@lists.linux-foundation.org" has been
 added to the 5.18-stable tree
To: gregkh@linuxfoundation.org, iommu@lists.linux-foundation.org,
 iommu@lists.linux.dev, jroedel@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sat, 09 Jul 2022 10:29:32 +0200
Message-ID: <16573553724258@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: stable-commits@vger.kernel.org
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


This is a note to let you know that I've just added the patch titled

    MAINTAINERS: Remove iommu@lists.linux-foundation.org

to the 5.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     maintainers-remove-iommu-lists.linux-foundation.org.patch
and it can be found in the queue-5.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c51b8f85c4157eb91c2f4ab34b0c52fea642e77c Mon Sep 17 00:00:00 2001
From: Joerg Roedel <jroedel@suse.de>
Date: Wed, 6 Jul 2022 12:33:31 +0200
Subject: MAINTAINERS: Remove iommu@lists.linux-foundation.org

From: Joerg Roedel <jroedel@suse.de>

commit c51b8f85c4157eb91c2f4ab34b0c52fea642e77c upstream.

The IOMMU mailing list has moved to iommu@lists.linux.dev
and the old list should bounce by now. Remove it from the
MAINTAINERS file.

Cc: stable@vger.kernel.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Link: https://lore.kernel.org/r/20220706103331.10215-1-joro@8bytes.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 MAINTAINERS |   11 -----------
 1 file changed, 11 deletions(-)

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -426,7 +426,6 @@ F:	drivers/acpi/*thermal*
 ACPI VIOT DRIVER
 M:	Jean-Philippe Brucker <jean-philippe@linaro.org>
 L:	linux-acpi@vger.kernel.org
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 S:	Maintained
 F:	drivers/acpi/viot.c
@@ -960,7 +959,6 @@ F:	drivers/video/fbdev/geode/
 AMD IOMMU (AMD-VI)
 M:	Joerg Roedel <joro@8bytes.org>
 R:	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
@@ -5899,7 +5897,6 @@ DMA MAPPING HELPERS
 M:	Christoph Hellwig <hch@lst.de>
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Robin Murphy <robin.murphy@arm.com>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 S:	Supported
 W:	http://git.infradead.org/users/hch/dma-mapping.git
@@ -5912,7 +5909,6 @@ F:	kernel/dma/
 
 DMA MAPPING BENCHMARK
 M:	Xiang Chen <chenxiang66@hisilicon.com>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 F:	kernel/dma/map_benchmark.c
 F:	tools/testing/selftests/dma/
@@ -7479,7 +7475,6 @@ F:	drivers/gpu/drm/exynos/exynos_dp*
 
 EXYNOS SYSMMU (IOMMU) driver
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 S:	Maintained
 F:	drivers/iommu/exynos-iommu.c
@@ -9879,7 +9874,6 @@ F:	drivers/hid/intel-ish-hid/
 INTEL IOMMU (VT-d)
 M:	David Woodhouse <dwmw2@infradead.org>
 M:	Lu Baolu <baolu.lu@linux.intel.com>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
@@ -10258,7 +10252,6 @@ F:	include/linux/iomap.h
 IOMMU DRIVERS
 M:	Joerg Roedel <joro@8bytes.org>
 M:	Will Deacon <will@kernel.org>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
@@ -12375,7 +12368,6 @@ F:	drivers/i2c/busses/i2c-mt65xx.c
 
 MEDIATEK IOMMU DRIVER
 M:	Yong Wu <yong.wu@mediatek.com>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
@@ -16361,7 +16353,6 @@ F:	drivers/i2c/busses/i2c-qcom-cci.c
 
 QUALCOMM IOMMU
 M:	Rob Clark <robdclark@gmail.com>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -18947,7 +18938,6 @@ F:	arch/x86/boot/video*
 
 SWIOTLB SUBSYSTEM
 M:	Christoph Hellwig <hch@infradead.org>
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 S:	Supported
 W:	http://git.infradead.org/users/hch/dma-mapping.git
@@ -21618,7 +21608,6 @@ XEN SWIOTLB SUBSYSTEM
 M:	Juergen Gross <jgross@suse.com>
 M:	Stefano Stabellini <sstabellini@kernel.org>
 L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
-L:	iommu@lists.linux-foundation.org
 L:	iommu@lists.linux.dev
 S:	Supported
 F:	arch/x86/xen/*swiotlb*


Patches currently in stable-queue which might be from jroedel@suse.de are

queue-5.18/iommu-vt-d-fix-rid2pasid-setup-teardown-failure.patch
queue-5.18/iommu-vt-d-fix-pci-bus-rescan-device-hot-add.patch
queue-5.18/maintainers-remove-iommu-lists.linux-foundation.org.patch
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
