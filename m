Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0453B3354
	for <lists.iommu@lfdr.de>; Thu, 24 Jun 2021 17:59:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D59B83C99;
	Thu, 24 Jun 2021 15:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BG_1DcPEQcIa; Thu, 24 Jun 2021 15:59:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0DCE28248F;
	Thu, 24 Jun 2021 15:59:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E01A4C000E;
	Thu, 24 Jun 2021 15:59:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19AC8C000E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 15:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB49B42279
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 15:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wIfVJ4WOE2Ti for <iommu@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 15:57:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 967924226A
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 15:57:28 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id k5so3753988pjj.1
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfRvKXXPDGozL9xpkc2RXgCWY6OxEYfQN41+lxoFnvY=;
 b=kEshnj7M08k1T5XsbOYdzjZbq7nVnmjng6eJnfjl4lHMzaAZWk6m94BUgoAkO9vE9h
 LGUHt/CR+GHi3cdJm3u8om1RbudjT01C0RCIVYBXBb3iKIFLf6Hz/aFd03GLLTot9C9q
 is4g5Rc9w98QwWpmpTahpJ12S/0U2a21x3Eus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfRvKXXPDGozL9xpkc2RXgCWY6OxEYfQN41+lxoFnvY=;
 b=TQQXMCyUfD6lyIbkta0ZL0yI3esM4MBGtQvqf3JE74QAs/b0hjPNvO5z37IyvSzJPD
 nyp/8BBwWSZZzD2+PXoTe1uc/CvfgJZeJprjsDr8rBb7xdZtZDx5fzGSPsRukerZvGZV
 TlVSYfhgX9QSq6Wyl/z4QCGzl/Q6YdENUvEu8X4RAKxtBZfjxFB/6qowkwC3jai8rSCy
 MLOKJ6eZ+kpI4AXqxrhygzDEy7WAX4TbKnk+GB886v38VJeoZAmT1Gi0DPJM+Anl8oBd
 hyHMa/aHNXVtlF7bpPUqKim/H2yLIUMotRgZo2II3f/RK6PeqW3P6btrOfzyW/7zX+8U
 IebQ==
X-Gm-Message-State: AOAM530qSiC94F3kgCQYM3tBaZKOC/FuZLrfkn0OmFfJD05gygppRXiC
 T29ePBVweWYjBXQ2AWuNDSjpAQ==
X-Google-Smtp-Source: ABdhPJzInUpAy17snFNN0CGcBB/ghyLU73coTfwG0l77wDEHQQH9RWDi8n5UN9ZkYoU3wlPKMD5xpQ==
X-Received: by 2002:a17:90b:2282:: with SMTP id
 kx2mr5939882pjb.60.1624550248050; 
 Thu, 24 Jun 2021 08:57:28 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id n6sm2862924pgt.7.2021.06.24.08.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:57:27 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v15 12/12] of: Add plumbing for restricted DMA pool
Date: Thu, 24 Jun 2021 23:55:26 +0800
Message-Id: <20210624155526.2775863-13-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
MIME-Version: 1.0
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 quic_qiancai@quicinc.com, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, thomas.lendacky@amd.com,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
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

If a device is not behind an IOMMU, we look up the device node and set
up the restricted DMA when the restricted-dma-pool is presented.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
---
 drivers/of/address.c    | 33 +++++++++++++++++++++++++++++++++
 drivers/of/device.c     |  3 +++
 drivers/of/of_private.h |  6 ++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 73ddf2540f3f..cdf700fba5c4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -8,6 +8,7 @@
 #include <linux/logic_pio.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pci.h>
 #include <linux/pci_regs.h>
 #include <linux/sizes.h>
@@ -1022,6 +1023,38 @@ int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
 	of_node_put(node);
 	return ret;
 }
+
+int of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
+{
+	struct device_node *node, *of_node = dev->of_node;
+	int count, i;
+
+	count = of_property_count_elems_of_size(of_node, "memory-region",
+						sizeof(u32));
+	/*
+	 * If dev->of_node doesn't exist or doesn't contain memory-region, try
+	 * the OF node having DMA configuration.
+	 */
+	if (count <= 0) {
+		of_node = np;
+		count = of_property_count_elems_of_size(
+			of_node, "memory-region", sizeof(u32));
+	}
+
+	for (i = 0; i < count; i++) {
+		node = of_parse_phandle(of_node, "memory-region", i);
+		/*
+		 * There might be multiple memory regions, but only one
+		 * restricted-dma-pool region is allowed.
+		 */
+		if (of_device_is_compatible(node, "restricted-dma-pool") &&
+		    of_device_is_available(node))
+			return of_reserved_mem_device_init_by_idx(dev, of_node,
+								  i);
+	}
+
+	return 0;
+}
 #endif /* CONFIG_HAS_DMA */
 
 /**
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 6cb86de404f1..e68316836a7a 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 
 	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
 
+	if (!iommu)
+		return of_dma_set_restricted_buffer(dev, np);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_dma_configure_id);
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index d9e6a324de0a..25cebbed5f02 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -161,12 +161,18 @@ struct bus_dma_region;
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
 int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map);
+int of_dma_set_restricted_buffer(struct device *dev, struct device_node *np);
 #else
 static inline int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map)
 {
 	return -ENODEV;
 }
+static inline int of_dma_set_restricted_buffer(struct device *dev,
+					       struct device_node *np)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* _LINUX_OF_PRIVATE_H */
-- 
2.32.0.288.g62a8d224e6-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
