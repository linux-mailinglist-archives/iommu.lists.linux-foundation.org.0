Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A75033DD3F
	for <lists.iommu@lfdr.de>; Tue, 16 Mar 2021 20:19:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 518F44EC9D;
	Tue, 16 Mar 2021 19:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OpHqnk0HrnI; Tue, 16 Mar 2021 19:19:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 260B04EC9C;
	Tue, 16 Mar 2021 19:19:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46416C0019;
	Tue, 16 Mar 2021 19:19:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16E60C000A
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 19:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A1E760586
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 19:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Th-NnGjZ5gr for <iommu@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 19:18:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7582A606A2
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 19:18:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id g20so148499wmk.3
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 12:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t5nF/sXmMcwkw/ixJn1wgxDWeReE+TQab+n6/wXS1U0=;
 b=oaMK9nYnTAZy6ym3HYBmsqWuTVnMYutZ/U+My/vKZTXWBNQa3kUp/CciNiv42oBJY0
 sz/3nwTqT77ad0BK6/aNftjxGpd+x5BnQ08enNqXaOj6sYNydPxIwAdUYSmBMMdHknaJ
 3lTnRODxiPkto6n3IX3caXRjSWSazO2ZyYuFTmm2Z8jGfNqMpX2X4pzRd4+2GzuiV3at
 le5h53LvdTcx4ZjtnQNcJlulO36rZ/2LAjIsCcNWdtBEiPFwHj30zOJ9APBb0G7Xy2g9
 V3t8uyrFrYicbRxD3jwfVfuIs4jbNaFzW7lHPH02gBcOy9b2DQZMVtEbZKfz0FBvkYvI
 3hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5nF/sXmMcwkw/ixJn1wgxDWeReE+TQab+n6/wXS1U0=;
 b=eZkdqPnZE5pEeVUDuhbVPjkIuONJdUhNGCs9Cz3T3t+HhC42pPd90AlvJAcqOs1hj7
 7e09STpqBECQGqhzPufqn4gj2m0uFIMvtcMzF4GFZU9b8QKZ9MiA/KsdJ/GpJWTANZtd
 LQbDSPltDVXYmHoZx2RNxY+aTo5z5Ax1FkYV5++l1dKCY1gHUr7m71nJycAmwZOjjx5I
 yXF6xk0xfu4mC5j31PPT4HhKJaODpQHmdWHi8R1cAwgkuotYRvyvm8BF9z+xmrEqNO3f
 a8kLjIa1+/Rs+iv9Wo3xbx9Y8Vmn9X/yWHTwzjNcCqmkysx5WWm59imfVbdql5l64w4B
 FdPA==
X-Gm-Message-State: AOAM530oH+Tiau18uCPEU9q6Vru74bOD39H+F/tQHKuGAwRhj8mPKonu
 Kt7yCT9NU0MTgAvM4OUhu5gEWA==
X-Google-Smtp-Source: ABdhPJwrnc/yoYhLqyVbf/ctwV9VfvVZmgZLZUJT5ACgoolGvh6o3uWH6IcGtVOst4Ix4VaYd5EPVQ==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr308127wmq.183.1615922335734; 
 Tue, 16 Mar 2021 12:18:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id p12sm22690438wrx.28.2021.03.16.12.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 12:18:55 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH 3/3] iommu/virtio: Enable x86 support
Date: Tue, 16 Mar 2021 20:16:54 +0100
Message-Id: <20210316191652.3401335-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316191652.3401335-1-jean-philippe@linaro.org>
References: <20210316191652.3401335-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, robin.murphy@arm.com,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com, will@kernel.org
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

The arm64 Kconfig selects IOMMU_DMA, while x86 IOMMU drivers select it
themselves.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 2819b5c8ec30..ccca83ef2f06 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -400,8 +400,9 @@ config HYPERV_IOMMU
 config VIRTIO_IOMMU
 	tristate "Virtio IOMMU driver"
 	depends on VIRTIO
-	depends on ARM64
+	depends on (ARM64 || X86)
 	select IOMMU_API
+	select IOMMU_DMA if X86
 	select INTERVAL_TREE
 	select ACPI_VIOT if ACPI
 	help
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
