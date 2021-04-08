Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F09358E82
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 22:34:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 726144185C;
	Thu,  8 Apr 2021 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dRvbhC9Hm78U; Thu,  8 Apr 2021 20:34:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71ED2419A5;
	Thu,  8 Apr 2021 20:34:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07E5CC000E;
	Thu,  8 Apr 2021 20:34:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D3C8C000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 20:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E34C4607B3
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 20:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHtxPJ94BayO for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 20:16:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20202607B1
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 20:16:28 +0000 (UTC)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lUb4k-0005db-7R
 for iommu@lists.linux-foundation.org; Thu, 08 Apr 2021 20:16:26 +0000
Received: by mail-wr1-f69.google.com with SMTP id t2so1468109wrr.1
 for <iommu@lists.linux-foundation.org>; Thu, 08 Apr 2021 13:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jMABrCg2yQSz0NJfTRJiCfa17aCfiZuFRJh5dj2jnZI=;
 b=k1DjYa7NiNQA4CQ9F+vJZCHer0ldhHzwikiaoxf55fdIzOWIPaY/HpNqqS3KFFGlsu
 yjWU8scz/h5VCwyyJ1TaofDY4CUN+m6myoG+XEFTt4AOPiQo7iS1wpk0ePWnWcdvsfN3
 gBujXlpC2/kxMQS0KALonyaw8BCRa9DyAV10Wcedypn17r0/JTOV4Q6aKPIzJQ6QHgAR
 ZanPDu+xh3AtDaEwZRo/aCozny8WnXIjnzu/HHJbnFr8rVTogl8Y+HQx4gVwO3M/8Vk1
 9anGoz0QYnu4R+JOxpEMvWkSreKTXc7otlV9s17PNyC2vyG42GTgh860VGtXFU9qmq7J
 QhRg==
X-Gm-Message-State: AOAM530K1pQfs53gGX5xqqvm+0gPrM4pwWNGDsaupjHVkdJZgF+/u8BB
 AKwMe044XT2HRirTtPlQo9h5SgJQLz7s8VCINjAWGW7V2rIxuiEXPKf7iANbD8wf1Y3DP6jB4gR
 +ptbJ2tkIjwqTzL67GICkfTvzxHCfEUThdE/2EzsaFB1UYhQ=
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr14429549wrr.140.1617912985381; 
 Thu, 08 Apr 2021 13:16:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIwIaAo5oCPu118XWrKhGbQi+Nic/eanTaCnDGq7QIZYT+he+8z9GdaAve8WhKurUn3nUuoA==
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr14429534wrr.140.1617912985197; 
 Thu, 08 Apr 2021 13:16:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id o62sm22690337wmo.3.2021.04.08.13.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 13:16:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: exynos: remove unneeded local variable initialization
Date: Thu,  8 Apr 2021 22:16:22 +0200
Message-Id: <20210408201622.78009-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 08 Apr 2021 20:34:27 +0000
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

The initialization of 'fault_addr' local variable is not needed as it is
shortly after overwritten.

Addresses-Coverity: Unused value
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/iommu/exynos-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index de324b4eedfe..8fa9a591fb96 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -407,7 +407,7 @@ static irqreturn_t exynos_sysmmu_irq(int irq, void *dev_id)
 	struct sysmmu_drvdata *data = dev_id;
 	const struct sysmmu_fault_info *finfo;
 	unsigned int i, n, itype;
-	sysmmu_iova_t fault_addr = -1;
+	sysmmu_iova_t fault_addr;
 	unsigned short reg_status, reg_clear;
 	int ret = -ENOSYS;
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
