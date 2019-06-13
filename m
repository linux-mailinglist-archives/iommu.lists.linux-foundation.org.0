Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AB69B442EC
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 18:27:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C894BF02;
	Thu, 13 Jun 2019 16:27:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BADA2EFD
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 16:27:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5BC30775
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 16:27:10 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 81so12146772pfy.13
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=v6vzilPAtj2ODZwSW8fHlBGBIGUDcN2J3Si9o5NBA3E=;
	b=kAXXgwoguPvU4cAuhcaUgbXJuBSrc4pXZ01mFgLMVTiAUcb3NIkvnGdriEvuRYpcS4
	KCkN0/7AHFbsRxOm8x2szfUod289BCzSUB2ccFOtOVvhKdOyGMzy87Zl4dSeFroG+guL
	esu84wiMoP6w/H+9AVYLyYbjuEGjHZzfZcq2VaqLVuBVPuF438x9B/V4m6ISqtGWYOQM
	8j/Kz0duNoACz0A3QT+4bKsgCn6EYE+p503sKJ0P7oLkeyri1jHoyoEfTeT7CCHRCAYz
	W6zqItpX7twXVXqsYxk+Veh+fw38UvbAkJGCbeVSGbdwoGav2hPr0WylW6UZnDsmRVLn
	tv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v6vzilPAtj2ODZwSW8fHlBGBIGUDcN2J3Si9o5NBA3E=;
	b=mxtzTufdGNlOYbd8je19vivyjl72FQVtW9XoQjzsCF16yROGCm5EVHuSQ+djfEeTsd
	Go7zwaD2vtHCjbWvOnIHDk7SGUkTgZEfHx01FCNsOiPKNLq2dC3JeWUEvvt4PVYgj0ty
	/Xou46tYMPaBl7xlzld2Guyunc487cDAO1VYg7xBH3o02HKltRH1uyky56G0fShoDg2V
	zwur0woOBuMf/c/2S10ewk3u9hFi1vGMQfa8iIhuMM3CR4nrq5vVu6PEz3YN+gJm1hRe
	P0s3DPzP876Xu8VaQ3gSxHi5wSTm17SUGnbaPX8SuWnPr+MQR6CKFjQTrTyJWYkuWloZ
	bT4Q==
X-Gm-Message-State: APjAAAV0Q3AJfInhqQopsMWlh0hBTuXXkQGzA9MYIkEftiQRCRN0zaoj
	FGUwS30Mns6FrzLAecBaASY=
X-Google-Smtp-Source: APXvYqzPxG4x6iJ3bSwjicFDgP/gbJZePtynT5+d9Kai+1QhkL96mw1oCJcSqEHcntuvftQRVXyDCg==
X-Received: by 2002:a17:90a:db52:: with SMTP id
	u18mr6471125pjx.107.1560443229896; 
	Thu, 13 Jun 2019 09:27:09 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
	by smtp.gmail.com with ESMTPSA id z186sm185768pfz.7.2019.06.13.09.27.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Jun 2019 09:27:09 -0700 (PDT)
From: Yangtao Li <tiny.windzz@gmail.com>
To: joro@8bytes.org, m.szyprowski@samsung.com, kgene@kernel.org,
	krzk@kernel.org, will.deacon@arm.com, robin.murphy@arm.com,
	agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
	heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com
Subject: [PATCH 01/10] iommu/exynos: convert to SPDX license tags
Date: Thu, 13 Jun 2019 12:26:54 -0400
Message-Id: <20190613162703.986-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Updates license to use SPDX-License-Identifier.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 05c6bc099d62..938a33d2f89d 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2011,2016 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifdef CONFIG_EXYNOS_IOMMU_DEBUG
-- 
2.17.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
