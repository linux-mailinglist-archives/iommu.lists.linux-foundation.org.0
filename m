Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA0129A0C
	for <lists.iommu@lfdr.de>; Mon, 23 Dec 2019 19:59:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5D107204F3;
	Mon, 23 Dec 2019 18:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voP9pDkgqpoA; Mon, 23 Dec 2019 18:59:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 87FEC204F2;
	Mon, 23 Dec 2019 18:59:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FADEC0881;
	Mon, 23 Dec 2019 18:59:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BBA2C0881;
 Mon, 23 Dec 2019 18:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 674AE2048E;
 Mon, 23 Dec 2019 18:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBAGz6gkz7rK; Mon, 23 Dec 2019 18:59:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id A669520489;
 Mon, 23 Dec 2019 18:59:23 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id n59so150420pjb.1;
 Mon, 23 Dec 2019 10:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t2pcE/zB/zRFa+D+0DGOcMCSuy9rY9vAk3qxszJwLvo=;
 b=H87+VOrxrVlOydWiSP/CZqoU2QHdFei/jyBu887pLm+G9l7owgyTBs5Yc2xPwbf+cF
 2A/Z2a957FZNCq5ePoWmbgsjUXO3HoS2RterAFvRDcnuiWFq56AITBhwSig4wDQpcjod
 4UmZ3oPM57B75+90Uv4tfswd7l2D+miZNLWKs0PV7rIN2f9huUDrTjekZev4ZwKgAUda
 6IdAK5hLSt1s2wgiIbrUOfWBdEzP2VVYq8u8Y8LmWMrBcEdnkb/nE9GJJn6AL9IGTi9Y
 9UVTNDE1xGhL2hu+PsmhLP30C51H8vCllgDS25vuLUF3UF2qxiMgSIeF5F2AfFw97/ZA
 GdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t2pcE/zB/zRFa+D+0DGOcMCSuy9rY9vAk3qxszJwLvo=;
 b=kVZiTrtzFHWIKmtOby97Ta5LngfdnVwWEfsXxyJmG5InOBhbi7k0dlF6xllB+MmNLU
 zLJKnFlmfWPOeDdfgsUePFDFF5o5YfzRStIbIfDrI9GB+8PnMTg2kUm7ssuU1ID8r9HE
 51BVrqq4ivNJL2DCx8LgKIIzSeji7HFxArre1z6QfKDR+6eL64yBA5GAYELIl4Qu/yXW
 bi4Oye/A3ZVw35SDnqhKI45gIP6c6oBgp97/KOGzAiWXVylZ/PIZOh0Wp6MosQEy3O7M
 GLYbt/sGRMrQ4wPQJzJr28044GyizECLH8zk8szDW69XiqHZH1bAvh6RAxkCARSUZhDv
 1b2g==
X-Gm-Message-State: APjAAAWg60T5P2aH57/+jjpFBA20xU75aiiY8p0fN05Dd29jDwS1gIUa
 Pt4eJ+E1EipX4shsi2MPo5A=
X-Google-Smtp-Source: APXvYqxwTeofmvSQXzsVzn9vv5ovtl+Qlq7vr/WZrlMMh2w/A1BzAZFQoZorn2f8/xm484BESZek6A==
X-Received: by 2002:a17:902:7b91:: with SMTP id
 w17mr31189741pll.94.1577127563256; 
 Mon, 23 Dec 2019 10:59:23 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id v8sm24823853pff.151.2019.12.23.10.59.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Dec 2019 10:59:22 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: m.szyprowski@samsung.com, joro@8bytes.org, kgene@kernel.org,
 krzk@kernel.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, heiko@sntech.de,
 mst@redhat.com, jasowang@redhat.com, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH] virtio-mmio: convert to devm_platform_ioremap_resource
Date: Mon, 23 Dec 2019 18:59:13 +0000
Message-Id: <20191223185918.9877-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223185918.9877-1-tiny.windzz@gmail.com>
References: <20191223185918.9877-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Use devm_platform_ioremap_resource() to simplify code, which
contains platform_get_resource, devm_request_mem_region and
devm_ioremap.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/virtio/virtio_mmio.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index e09edb5c5e06..97d5725fd9a2 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -531,18 +531,9 @@ static void virtio_mmio_release_dev(struct device *_d)
 static int virtio_mmio_probe(struct platform_device *pdev)
 {
 	struct virtio_mmio_device *vm_dev;
-	struct resource *mem;
 	unsigned long magic;
 	int rc;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem)
-		return -EINVAL;
-
-	if (!devm_request_mem_region(&pdev->dev, mem->start,
-			resource_size(mem), pdev->name))
-		return -EBUSY;
-
 	vm_dev = devm_kzalloc(&pdev->dev, sizeof(*vm_dev), GFP_KERNEL);
 	if (!vm_dev)
 		return -ENOMEM;
@@ -554,9 +545,9 @@ static int virtio_mmio_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&vm_dev->virtqueues);
 	spin_lock_init(&vm_dev->lock);
 
-	vm_dev->base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
-	if (vm_dev->base == NULL)
-		return -EFAULT;
+	vm_dev->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vm_dev->base))
+		return PTR_ERR(vm_dev->base);
 
 	/* Check magic value */
 	magic = readl(vm_dev->base + VIRTIO_MMIO_MAGIC_VALUE);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
