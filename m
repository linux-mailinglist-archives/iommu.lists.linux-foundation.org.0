Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F34762B41F3
	for <lists.iommu@lfdr.de>; Mon, 16 Nov 2020 12:02:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 93EA92041E;
	Mon, 16 Nov 2020 11:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-9ztT3ud+cK; Mon, 16 Nov 2020 11:02:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6205620450;
	Mon, 16 Nov 2020 11:02:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C069C0800;
	Mon, 16 Nov 2020 11:02:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6EE3C07FF
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 11:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B3444870C7
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 11:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRo0JJiSD6Cy for <iommu@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 11:02:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B0DD08709A
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605524526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmbuhlBWdwHlZfAVsKlpQ0WOdHdaSuGlj9nwPeqJPOk=;
 b=KbHxuEbjdR4K8IiIfzxRe9S5xyHUWz7A7owD8fJMPMVWxflYs3tgrGuwMkOtWbljzXt9VP
 nyvhpU2W703asm1inRDS77XUqByoQ0ewdjlS7dbB39HVnktN1Y5X2e5+gRO4U90SfmqNt3
 q28PToRNXklgadLR0Wp69WLOJi9Jqcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-GOnVQDIPPpqvbmxjkTl2YA-1; Mon, 16 Nov 2020 06:02:05 -0500
X-MC-Unique: GOnVQDIPPpqvbmxjkTl2YA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA2F6414F;
 Mon, 16 Nov 2020 11:02:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E505C5FE;
 Mon, 16 Nov 2020 11:01:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 joro@8bytes.org, maz@kernel.org, robin.murphy@arm.com,
 alex.williamson@redhat.com
Subject: [PATCH v11 11/13] vfio: Document nested stage control
Date: Mon, 16 Nov 2020 12:00:28 +0100
Message-Id: <20201116110030.32335-12-eric.auger@redhat.com>
In-Reply-To: <20201116110030.32335-1-eric.auger@redhat.com>
References: <20201116110030.32335-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: jean-philippe@linaro.org, vivek.gautam@arm.com, zhangfei.gao@linaro.org
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

The VFIO API was enhanced to support nested stage control: a bunch of
new iotcls, one DMA FAULT region and an associated specific IRQ.

Let's document the process to follow to set up nested mode.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
s/VFIO_REGION_INFO_CAP_PRODUCER_FAULT/VFIO_REGION_INFO_CAP_DMA_FAULT

v8 -> v9:
- new names for SET_MSI_BINDING and SET_PASID_TABLE
- new layout for the DMA FAULT memory region and specific IRQ

v2 -> v3:
- document the new fault API

v1 -> v2:
- use the new ioctl names
- add doc related to fault handling
---
 Documentation/driver-api/vfio.rst | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
index f1a4d3c3ba0b..14e41324237d 100644
--- a/Documentation/driver-api/vfio.rst
+++ b/Documentation/driver-api/vfio.rst
@@ -239,6 +239,83 @@ group and can access them as follows::
 	/* Gratuitous device reset and go... */
 	ioctl(device, VFIO_DEVICE_RESET);
 
+IOMMU Dual Stage Control
+------------------------
+
+Some IOMMUs support 2 stages/levels of translation. "Stage" corresponds to
+the ARM terminology while "level" corresponds to Intel's VTD terminology. In
+the following text we use either without distinction.
+
+This is useful when the guest is exposed with a virtual IOMMU and some
+devices are assigned to the guest through VFIO. Then the guest OS can use
+stage 1 (IOVA -> GPA), while the hypervisor uses stage 2 for VM isolation
+(GPA -> HPA).
+
+The guest gets ownership of the stage 1 page tables and also owns stage 1
+configuration structures. The hypervisor owns the root configuration structure
+(for security reason), including stage 2 configuration. This works as long
+configuration structures and page table format are compatible between the
+virtual IOMMU and the physical IOMMU.
+
+Assuming the HW supports it, this nested mode is selected by choosing the
+VFIO_TYPE1_NESTING_IOMMU type through:
+
+ioctl(container, VFIO_SET_IOMMU, VFIO_TYPE1_NESTING_IOMMU);
+
+This forces the hypervisor to use the stage 2, leaving stage 1 available for
+guest usage.
+
+Once groups are attached to the container, the guest stage 1 translation
+configuration data can be passed to VFIO by using
+
+ioctl(container, VFIO_IOMMU_SET_PASID_TABLE, &pasid_table_info);
+
+This allows to combine the guest stage 1 configuration structure along with
+the hypervisor stage 2 configuration structure. Stage 1 configuration
+structures are dependent on the IOMMU type.
+
+As the stage 1 translation is fully delegated to the HW, translation faults
+encountered during the translation process need to be propagated up to
+the virtualizer and re-injected into the guest.
+
+The userspace must be prepared to receive faults. The VFIO-PCI device
+exposes one dedicated DMA FAULT region: it contains a ring buffer and
+its header that allows to manage the head/tail indices. The region is
+identified by the following index/subindex:
+- VFIO_REGION_TYPE_NESTED/VFIO_REGION_SUBTYPE_NESTED_DMA_FAULT
+
+The DMA FAULT region exposes a VFIO_REGION_INFO_CAP_DMA_FAULT
+region capability that allows the userspace to retrieve the ABI version
+of the fault records filled by the host.
+
+On top of that region, the userspace can be notified whenever a fault
+occurs at the physical level. It can use the VFIO_IRQ_TYPE_NESTED/
+VFIO_IRQ_SUBTYPE_DMA_FAULT specific IRQ to attach the eventfd to be
+signalled.
+
+The ring buffer containing the fault records can be mmapped. When
+the userspace consumes a fault in the queue, it should increment
+the consumer index to allow new fault records to replace the used ones.
+
+The queue size and the entry size can be retrieved in the header.
+The tail index should never overshoot the producer index as in any
+other circular buffer scheme. Also it must be less than the queue size
+otherwise the change fails.
+
+When the guest invalidates stage 1 related caches, invalidations must be
+forwarded to the host through
+ioctl(container, VFIO_IOMMU_CACHE_INVALIDATE, &inv_data);
+Those invalidations can happen at various granularity levels, page, context, ...
+
+The ARM SMMU specification introduces another challenge: MSIs are translated by
+both the virtual SMMU and the physical SMMU. To build a nested mapping for the
+IOVA programmed into the assigned device, the guest needs to pass its IOVA/MSI
+doorbell GPA binding to the host. Then the hypervisor can build a nested stage 2
+binding eventually translating into the physical MSI doorbell.
+
+This is achieved by calling
+ioctl(container, VFIO_IOMMU_SET_MSI_BINDING, &guest_binding);
+
 VFIO User API
 -------------------------------------------------------------------------------
 
-- 
2.21.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
