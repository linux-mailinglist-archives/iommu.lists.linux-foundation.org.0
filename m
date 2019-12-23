Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 205A4129A0F
	for <lists.iommu@lfdr.de>; Mon, 23 Dec 2019 19:59:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C8BAF20525;
	Mon, 23 Dec 2019 18:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oImr-TdanN8U; Mon, 23 Dec 2019 18:59:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CF362204AD;
	Mon, 23 Dec 2019 18:59:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C77C1C0881;
	Mon, 23 Dec 2019 18:59:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE3F6C0881;
 Mon, 23 Dec 2019 18:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CC71C8788D;
 Mon, 23 Dec 2019 18:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSpkU9Sf7iRU; Mon, 23 Dec 2019 18:59:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B316F8789B;
 Mon, 23 Dec 2019 18:59:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x7so9229646pgl.11;
 Mon, 23 Dec 2019 10:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dMVf+vh+cYX5uqjs+l++BphNgREG8uxW+2Ovm+/JNJw=;
 b=HqLoU5OvR8ugzzxNAKVEVtBkjiqSufaKIUZEDpKdXp94Y/bUt4KrKLTKl5UQqNAl44
 KA1fNRoJ6aNwieatce2GqNLQOnq3UaqeJtl909ctqCyPbdF0LXDmaJcS432q9CSkhn4B
 dtiCTNvUBMjcOk0W2u3xT65sebwLH0CmduWcb75OfItc8DLFy4cAVoitzIDAMhzcNtfg
 Io5nLgK9BvT4faeoz5v59U2R5s86MLJT3XvGKf64+RHwRrSqizeESPFrxInRHcYca0GM
 6LqgvwaDt95S1xY3LDJ6L2k9xpIofsqFoI/ZRs3ID25B6iWoEeKIDGA52xAh1bQzdw9z
 aAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dMVf+vh+cYX5uqjs+l++BphNgREG8uxW+2Ovm+/JNJw=;
 b=WabRJVWqL+w46riZx28Dt5RnptEE5zYr17RNHkTPuOqICBFxrmEVTGDESgZ9Nr02Uc
 GUq1Tvs1YQefgPkgb/lovF8zr4DWqrBp8wLaWabn3dTpWJdpY8UdRNkfXilK3bQhUlyX
 L6OGoFi6BnHgaitGVRi71hcwyJD0gOCGNnpvzR5birEsn3M0LYbNZDqbCfKWEiwguO04
 8qNY6RggNlKF42hCuL2+oixnZjyQuALhkib7Uuhvh4/TFarvBfkeDFf6rkB2TuZy+3MT
 MPagOXA3V/IdhDwVPB6HGy/8XYYUXgkZBYRPOarg4WfyWShiYWW+PDvpXmEhZ0aDNvoB
 Zbiw==
X-Gm-Message-State: APjAAAWpNvqquVyunTdJ6UcHqrVej2REtD2xPmttn9lzimCZpyxSIT3s
 4FAeafl3DdWr2Fu0EcQQN+I=
X-Google-Smtp-Source: APXvYqzDhJWagEWSF5CD+5+GERxPnQgzx1vAVm8NgEcWmvblC2Ftuyzdp3PuA5nDZwdfH/7PhfYRpw==
X-Received: by 2002:a62:3343:: with SMTP id z64mr32628043pfz.150.1577127565404; 
 Mon, 23 Dec 2019 10:59:25 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id u12sm3892956pfm.165.2019.12.23.10.59.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Dec 2019 10:59:25 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: m.szyprowski@samsung.com, joro@8bytes.org, kgene@kernel.org,
 krzk@kernel.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, heiko@sntech.de,
 mst@redhat.com, jasowang@redhat.com, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 2/6] iommu/exynos: convert to devm_platform_ioremap_resource
Date: Mon, 23 Dec 2019 18:59:14 +0000
Message-Id: <20191223185918.9877-3-tiny.windzz@gmail.com>
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

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 186ff5cc975c..42d8407267ef 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -571,14 +571,12 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	int irq, ret;
 	struct device *dev = &pdev->dev;
 	struct sysmmu_drvdata *data;
-	struct resource *res;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->sfrbase = devm_ioremap_resource(dev, res);
+	data->sfrbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->sfrbase))
 		return PTR_ERR(data->sfrbase);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
