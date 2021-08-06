Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B109D3E28B4
	for <lists.iommu@lfdr.de>; Fri,  6 Aug 2021 12:35:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E4FA82F32;
	Fri,  6 Aug 2021 10:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QC34bZqutfi9; Fri,  6 Aug 2021 10:35:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7A00D82505;
	Fri,  6 Aug 2021 10:35:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63927C000E;
	Fri,  6 Aug 2021 10:35:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52E9FC000E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4218082E95
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oyrg7PvP1osk for <iommu@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 10:35:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE7E082505
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:35:30 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id ca5so15927273pjb.5
 for <iommu@lists.linux-foundation.org>; Fri, 06 Aug 2021 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NBP1mI1eJEmFrRBUj3/dx1CqWPqkwlbz29Jcl4m2xAk=;
 b=JdKNJSBvRopa3Urrf3WhX/uKXIwQujM9Ti8EciOTg67ZJ1j0meWMTB7/EibJ6XLLqC
 dD+TEpkqMPtcqpcMHgpUGRGGUky93D3Yq8qYpfiQjSzT/wXJfKOP6ZkUmJDGlj3cxO4t
 zJEiyJGmpXj/MnrRj0JdCX6l4yFXHk/TOLsgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NBP1mI1eJEmFrRBUj3/dx1CqWPqkwlbz29Jcl4m2xAk=;
 b=pBhfASH8zx/0Tc2F70JqEspCp4WFGv3ng+8UdT0lMgrI/QhK02uLQop6hpEAwiB58z
 y7BBFCELQ+/UKlnZTOhdJ38APf4wrffwFwnUihpENBV1AD0M/+WqWS7P2cbA0F2EeN8R
 BskOfB+f5u7NwHcO5L2ncpOilMP5iWEZW9o2LfBBc5P/9fja4teCgEnBte8y/6R8Q/wv
 zDsDh9k8dJS5RlqIKT/OwB9ivpavVyl2SPPV/oN3ZfHpCKzAn0KTAR2J4ajv1vbZ9NQQ
 WDwUop4pMs5P8qlh+31UivdoEJ5B1Vi7ltEIiTSK0rgZ0uwOP6G+RZUhykoQWafMl3WI
 yBFw==
X-Gm-Message-State: AOAM531iiyGfVouGPO05pkVnUvmyes3NmnhhtxIcOg6nOXI5sdvYQqzb
 g62t5NrLFAew8BU62IZOP/9RCw==
X-Google-Smtp-Source: ABdhPJyYJf8IZc/UBHsRMF484qyLGnbbn2jXQbe+CyHk6yZx9o4TB97jhd9dHES8sNQ5E1cwkJ1NBg==
X-Received: by 2002:a17:90a:d190:: with SMTP id
 fu16mr20709870pjb.157.1628246130284; 
 Fri, 06 Aug 2021 03:35:30 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:6f20:cf00:347a:afc2])
 by smtp.gmail.com with UTF8SMTPSA id 6sm12821707pjk.1.2021.08.06.03.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 03:35:30 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 9/9] drm/i915: use DMA_ATTR_PERSISTENT_STREAMING flag
Date: Fri,  6 Aug 2021 19:34:23 +0900
Message-Id: <20210806103423.3341285-10-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
In-Reply-To: <20210806103423.3341285-1-stevensd@google.com>
References: <20210806103423.3341285-1-stevensd@google.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org, David Stevens <stevensd@chromium.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
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

From: David Stevens <stevensd@chromium.org>

Use the new DMA_ATTR_PERSISTENT_STREAMING for long lived dma mappings
which directly handle CPU cache coherency instead of using dma_sync_*.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 4 +++-
 drivers/gpu/drm/i915/i915_gem_gtt.c        | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 616c3a2f1baf..df982cfb4f34 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -48,7 +48,9 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 		src = sg_next(src);
 	}
 
-	ret = dma_map_sgtable(attachment->dev, st, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	ret = dma_map_sgtable(attachment->dev, st, dir,
+			      DMA_ATTR_SKIP_CPU_SYNC |
+			      DMA_ATTR_PERSISTENT_STREAMING);
 	if (ret)
 		goto err_free_sg;
 
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 36489be4896b..f27a849631f7 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -33,7 +33,8 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 				     PCI_DMA_BIDIRECTIONAL,
 				     DMA_ATTR_SKIP_CPU_SYNC |
 				     DMA_ATTR_NO_KERNEL_MAPPING |
-				     DMA_ATTR_NO_WARN))
+				     DMA_ATTR_NO_WARN |
+				     DMA_ATTR_PERSISTENT_STREAMING))
 			return 0;
 
 		/*
-- 
2.32.0.605.g8dce9f2422-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
