Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0A3A2620
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 10:03:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2293540556;
	Thu, 10 Jun 2021 08:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AaPB9DJAsWTt; Thu, 10 Jun 2021 08:03:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DE36F4053A;
	Thu, 10 Jun 2021 08:03:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BD54C000B;
	Thu, 10 Jun 2021 08:03:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2106CC002B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 08:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 574C760A45
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 08:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqxAQwzYlBCV for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:02:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA74C6076C
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 08:02:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5914151wmh.4
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o4eUQK2AFEVDf4pa1XuHff+3rIiA7+oIVY3xnoGa6wY=;
 b=XTDav+B8gT/1ifsCDS1Li2uacTSbnexp8r5J77P2gZpxWe7w8Ei6kIXPG7R8nvM+1S
 FuJ/ArwesV+mdX7IpHAratIh5TtjH1HcJPDnOzi14+7a1Krcc9R6t2hcpTOTM6M6ePRN
 xdrMr4Gqee3y9QyRiImYc7hTw03FrGXOz+8WpuUX/801y4iyuOk9wNyb6066qpPe3NVx
 MH/A8Kv/qBFaAm7chmPfrTohNNkMF4attVGnn72WPRHXJVHe2WlzBIi9keOFH/VvSyh2
 4Z/PTWZVP/LEHned/8zaNrORkp4OLYt1wXV7wV0fWBM3mHIPZPNd1pW3ipYsrQ3Wt6fa
 yrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4eUQK2AFEVDf4pa1XuHff+3rIiA7+oIVY3xnoGa6wY=;
 b=ODjM3Vrq8q8k4cXOHYPUgjncalA6DfWUHnY4GKioLvsOA3mDJAXo7WyiV87qYpQ47H
 JwnQj7BhMW5SL5LtdeAfkAZFdb6ReKptt+Bfyw1eUFyDOOykncD1JHVp8ZG859YjMuR+
 HXSA3Ibnqa4jnN/2Kfwu5MtD1UyLumxbQjKbXX2hWHGnZrbhgOTvs9IL2xeCL5V4C6Nv
 3Che0byHjqgNMKs7rMvrwgQzu2cBX90YHsPX0DQeB2V5UVKkoKDhpRV9ZSsfgU0+Layq
 i9eceyzVnprp6Ly9kb5JAz5cHsoJI4m5TjaVVk7Qr5WVmHGcKWwnTdxJ8EaLCL7CFCLV
 aJEQ==
X-Gm-Message-State: AOAM531DmCLsJ+hhQqHCvziXskXw9wdjfymEA/TAxqrscm0h7I3rmzWq
 K1j0G1lFNso7h8SPU1MPhL8QYA==
X-Google-Smtp-Source: ABdhPJx2koDYeA+siqnGagD7qMuftNsXW3jO8Xh3lYQXDR5aJEtWgMgDDbbclFK3Zh/WfkpajxAnjA==
X-Received: by 2002:a05:600c:3647:: with SMTP id
 y7mr13935102wmq.149.1623312173963; 
 Thu, 10 Jun 2021 01:02:53 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id o3sm2715059wrm.78.2021.06.10.01.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:02:53 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH v4 6/6] iommu/virtio: Enable x86 support
Date: Thu, 10 Jun 2021 09:51:33 +0200
Message-Id: <20210610075130.67517-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610075130.67517-1-jean-philippe@linaro.org>
References: <20210610075130.67517-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, catalin.marinas@arm.com,
 sudeep.holla@arm.com, robin.murphy@arm.com,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 guohanjun@huawei.com, will@kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
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

With the VIOT support in place, x86 platforms can now use the
virtio-iommu.

Because the other x86 IOMMU drivers aren't yet ready to use the
acpi_dma_setup() path, x86 doesn't implement arch_setup_dma_ops() at the
moment. Similarly to Vt-d and AMD IOMMU, call iommu_setup_dma_ops() from
probe_finalize().

Acked-by: Joerg Roedel <jroedel@suse.de>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/Kconfig        | 3 ++-
 drivers/iommu/dma-iommu.c    | 1 +
 drivers/iommu/virtio-iommu.c | 8 ++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index aff8a4830dd1..07b7c25cbed8 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -400,8 +400,9 @@ config HYPERV_IOMMU
 config VIRTIO_IOMMU
 	tristate "Virtio IOMMU driver"
 	depends on VIRTIO
-	depends on ARM64
+	depends on (ARM64 || X86)
 	select IOMMU_API
+	select IOMMU_DMA
 	select INTERVAL_TREE
 	select ACPI_VIOT if ACPI
 	help
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 175f8eaeb5b3..46ed43c400cf 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1332,6 +1332,7 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit)
 	 pr_warn("Failed to set up IOMMU for device %s; retaining platform DMA ops\n",
 		 dev_name(dev));
 }
+EXPORT_SYMBOL_GPL(iommu_setup_dma_ops);
 
 static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 		phys_addr_t msi_addr, struct iommu_domain *domain)
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 218fe8560e8d..77aee1207ced 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -1026,6 +1026,13 @@ static struct iommu_device *viommu_probe_device(struct device *dev)
 	return ERR_PTR(ret);
 }
 
+static void viommu_probe_finalize(struct device *dev)
+{
+#ifndef CONFIG_ARCH_HAS_SETUP_DMA_OPS
+	iommu_setup_dma_ops(dev, 0, U64_MAX);
+#endif
+}
+
 static void viommu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -1062,6 +1069,7 @@ static struct iommu_ops viommu_ops = {
 	.iova_to_phys		= viommu_iova_to_phys,
 	.iotlb_sync		= viommu_iotlb_sync,
 	.probe_device		= viommu_probe_device,
+	.probe_finalize		= viommu_probe_finalize,
 	.release_device		= viommu_release_device,
 	.device_group		= viommu_device_group,
 	.get_resv_regions	= viommu_get_resv_regions,
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
