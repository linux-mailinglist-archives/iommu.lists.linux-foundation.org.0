Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C0189AE3
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 12:43:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AC95220519;
	Wed, 18 Mar 2020 11:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWa46ivhBvK9; Wed, 18 Mar 2020 11:43:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E4761204EB;
	Wed, 18 Mar 2020 11:43:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1EE1C013E;
	Wed, 18 Mar 2020 11:43:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4587C013E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 11:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9CB2420423
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 11:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ai81Gj6bK+t for <iommu@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 11:43:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 59B93204F9
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 11:43:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c187so1614984wme.1
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tihxae3ctJ82yIrNxdQcRKXCIEaAHrNLh7qsOR9KH5I=;
 b=MNcbRoIOmrjcPkLW+5sCwPL6lKht5sKVogEb4aJyX29lLs3dhYI2wulqv89cO82uSs
 SL+K4CIUR3Gt9ID2i7aqy3+OiCW/AhddXVfZi5MRemedGsZtI7CtMA6BGQKKeFB5KGBS
 6X6o5GkUkSMi+vQaf2wwQLBUzHctOJTpsC6af6MMP5KWvZp7I5DdG0oYqKptc6eJQNS1
 Vs9CCZAC7MxhyssAHf5KW2GeSpdZ/YwQiZZujp9VW+Sbc2UFJxX/V0fCj1p4FGqizRJE
 E8NZ+7s0eF0/4KzLW/sNgOZN1dVdvHT3pepmkfmk7RqMd5cn0B/yJdi5r8E4sNUq9kZu
 kXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tihxae3ctJ82yIrNxdQcRKXCIEaAHrNLh7qsOR9KH5I=;
 b=GN7iP/rV49ee8tgvWOSknDI+54yQpZspaQpcMwOjGZIDz9mRziWEIMnvPBMPeJDfAV
 5rJenBxA0slJ6WB3DJ/WTpev7gEfkQoAqEkLX99FCwUFUGX39HaPnC3YFHBV1zCPEHFw
 J2cvhTWFtQbg53Jbgo/K89Dzy1bkfj+uAdWhNlj5Y2rLa0b3s9WmTXgro7D3rs1Xv9aK
 tceMvNn1rLF2i11CkszeOOmaPzSL0nkxFaXms1TT2Cg00KFpokTsvVDYzcV3Dks6LrGn
 fROZ3oHyQ/RWI7MFBWTx56PPaKKt/QkcDEabSJHyGeQgEY12NkCx8zyqYkwCgngYx3T6
 McDg==
X-Gm-Message-State: ANhLgQ1GvmQmi2CS51DXyaHiLViX+Hm/fc6shqIdGpDHvtgPvFyImVco
 omRzY/7wtvuwTlRlX16qDTcV17qiEk4=
X-Google-Smtp-Source: ADFU+vs0Ok4/7JQbzt91P1Z6jgT/gg9PvatfoUXed5yTvL2EWnnRcNW88+Uydju9PwEG0O9FLkPPLQ==
X-Received: by 2002:a1c:2404:: with SMTP id k4mr4648742wmk.87.1584531788397;
 Wed, 18 Mar 2020 04:43:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k133sm3808038wma.11.2020.03.18.04.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 04:43:07 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
Subject: [PATCH] iommu/virtio: Reject IOMMU page granule larger than PAGE_SIZE
Date: Wed, 18 Mar 2020 12:40:48 +0100
Message-Id: <20200318114047.1518048-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: robin.murphy@arm.com, Bharat Bhushan <bbhushan2@marvell.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
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

We don't currently support IOMMUs with a page granule larger than the
system page size. The IOVA allocator has a BUG_ON() in this case, and
VFIO has a WARN_ON().

It might be possible to remove these obstacles if necessary. If the host
uses 64kB pages and the guest uses 4kB, then a device driver calling
alloc_page() followed by dma_map_page() will create a 64kB mapping for a
4kB physical page, allowing the endpoint to access the neighbouring 60kB
of memory. This problem could be worked around with bounce buffers.

For the moment, rather than triggering the IOVA BUG_ON() on mismatched
page sizes, abort the virtio-iommu probe with an error message.

Reported-by: Bharat Bhushan <bbhushan2@marvell.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/virtio-iommu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 6d4e3c2a2ddb..80d5d8f621ab 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -998,6 +998,7 @@ static int viommu_probe(struct virtio_device *vdev)
 	struct device *parent_dev = vdev->dev.parent;
 	struct viommu_dev *viommu = NULL;
 	struct device *dev = &vdev->dev;
+	unsigned long viommu_page_size;
 	u64 input_start = 0;
 	u64 input_end = -1UL;
 	int ret;
@@ -1028,6 +1029,14 @@ static int viommu_probe(struct virtio_device *vdev)
 		goto err_free_vqs;
 	}
 
+	viommu_page_size = 1UL << __ffs(viommu->pgsize_bitmap);
+	if (viommu_page_size > PAGE_SIZE) {
+		dev_err(dev, "granule 0x%lx larger than system page size 0x%lx\n",
+			viommu_page_size, PAGE_SIZE);
+		ret = -EINVAL;
+		goto err_free_vqs;
+	}
+
 	viommu->map_flags = VIRTIO_IOMMU_MAP_F_READ | VIRTIO_IOMMU_MAP_F_WRITE;
 	viommu->last_domain = ~0U;
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
