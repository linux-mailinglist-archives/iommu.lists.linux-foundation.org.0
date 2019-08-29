Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0CAA180A
	for <lists.iommu@lfdr.de>; Thu, 29 Aug 2019 13:18:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C17B846E7;
	Thu, 29 Aug 2019 11:18:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6C9CD4692;
	Thu, 29 Aug 2019 11:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C4D80EC;
	Thu, 29 Aug 2019 11:18:05 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id h13so3611223edq.10;
	Thu, 29 Aug 2019 04:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cjixq+s7ZD6fFiV9g8QRBxU/OWNAVY/P4LPyIACEzEM=;
	b=djC2H5JFeHWERoQFSNo6K1Buv/HAY/zdTZ/Vy9BLHhv70G1BP5aEHIemdlQWFvLK0t
	3RSHU3+QDvVjBRH6rmndTQFisShBSy2rXVQU/0CyVBy93HiUWngryqj8oTbKIdj6Vnpz
	sNXUippKE5z0M2ZtM+fW6KuMBLAdoZNiZD6qsjd/JWY1vRPgY0j28/rH0E6Idert9w7d
	sS2fZojsKu+F+CaN8iGeU4WiMl20abUTFNRMZ2XUCm9qApaELu6NPAdSB6YiqFtgC0ZA
	1lVSgZoDWeqEdOzemcXFc9s7dX1wZPrqyNfi+GQQTYnagocsIo/CfeeTtfPlcX3yRrKD
	+5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cjixq+s7ZD6fFiV9g8QRBxU/OWNAVY/P4LPyIACEzEM=;
	b=ReRfj+EjmxgpEvKDs8+SH+xET3azyVqWdicjn2UDW/VqQdfDlUR9hrNnYVw8nJCZ4D
	9wMXOTm0csPJAJYfBVIHTIiPBOURrcoNQhQjwKwtfgpl37h1Wjp13BrE1oLcjjOugjBM
	5uf0Rtq5fQ9fO6UacHcON+jSyZmWojwtcul0MA/yuMeOnvsfyVf89hyfMZVZgw2h9xPL
	LSibTmra5Idf7LNQa6zuGX1cgu2mPpkdULxZ5Tzp482wzkhCJbqymFU/3DI0xuWrqTd5
	0kY/VomASFRQaeAGaCQ+qukqtLsb0mVyuKwDZOdA19fbHTt9QVDPpVsQKqr640TmIaoD
	2qDg==
X-Gm-Message-State: APjAAAUpNAY8s6j3cxiNFIaGpJnX5Qt5Hv7YYAJ4CXGKw2fqmz7v2ynF
	MgVpjzcPZ+PP2W1GEprH3gQ=
X-Google-Smtp-Source: APXvYqwZIsELufro/apZKANBvYbuav5XunBjAgaDShMq6vd+vYkJ2aickX4Wp+WCq2PXzJ9kM5tq1A==
X-Received: by 2002:a50:9401:: with SMTP id p1mr8952979eda.189.1567077483603; 
	Thu, 29 Aug 2019 04:18:03 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
	by smtp.gmail.com with ESMTPSA id y9sm388439eds.49.2019.08.29.04.18.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 04:18:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 5/5] iommu: virt: Use iommu_put_resv_regions_simple()
Date: Thu, 29 Aug 2019 13:17:52 +0200
Message-Id: <20190829111752.17513-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829111752.17513-1-thierry.reding@gmail.com>
References: <20190829111752.17513-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Thierry Reding <treding@nvidia.com>

Use the new standard function instead of open-coding it.

Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/virtio-iommu.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 3ea9d7682999..bc3c7ab7f996 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -838,14 +838,6 @@ static void viommu_get_resv_regions(struct device *dev, struct list_head *head)
 	iommu_dma_get_resv_regions(dev, head);
 }
 
-static void viommu_put_resv_regions(struct device *dev, struct list_head *head)
-{
-	struct iommu_resv_region *entry, *next;
-
-	list_for_each_entry_safe(entry, next, head, list)
-		kfree(entry);
-}
-
 static struct iommu_ops viommu_ops;
 static struct virtio_driver virtio_iommu_drv;
 
@@ -915,7 +907,7 @@ static int viommu_add_device(struct device *dev)
 err_unlink_dev:
 	iommu_device_unlink(&viommu->iommu, dev);
 err_free_dev:
-	viommu_put_resv_regions(dev, &vdev->resv_regions);
+	iommu_put_resv_regions_simple(dev, &vdev->resv_regions);
 	kfree(vdev);
 
 	return ret;
@@ -933,7 +925,7 @@ static void viommu_remove_device(struct device *dev)
 
 	iommu_group_remove_device(dev);
 	iommu_device_unlink(&vdev->viommu->iommu, dev);
-	viommu_put_resv_regions(dev, &vdev->resv_regions);
+	iommu_put_resv_regions_simple(dev, &vdev->resv_regions);
 	kfree(vdev);
 }
 
@@ -962,7 +954,7 @@ static struct iommu_ops viommu_ops = {
 	.remove_device		= viommu_remove_device,
 	.device_group		= viommu_device_group,
 	.get_resv_regions	= viommu_get_resv_regions,
-	.put_resv_regions	= viommu_put_resv_regions,
+	.put_resv_regions	= iommu_put_resv_regions_simple,
 	.of_xlate		= viommu_of_xlate,
 };
 
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
