Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BB9442FC
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 18:28:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 66203F2B;
	Thu, 13 Jun 2019 16:27:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EBBF4F21
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 16:27:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC5EC775
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 16:27:39 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r7so6280368pfl.3
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/p2hCYDhKAJ230l1zBzHnYZFs3VHjVr39XvOIKP4Pys=;
	b=VEgX2ZhFSzG3BImEi4GH9MUQbh4LnQqPx0JppfXi7XYfJJvmRAB0Db/QKVQQl8qM10
	SoKlDlc0SaxSrTEDHUtMYjOT11a0Lj5yq8ULKEndaWGWOkhNMNutP6XCaT2Ffliy6EBJ
	5jQ1g8Pajofj88UF7QvL1nK1FAEH7NLyg8e9QWEleD0lUPmjBavBQJY0q78qlAGQNurb
	9dqruWp+dSmlVS3sT1CIfM6Oi8H7XanvMOQZ6mbabOL0lGwx8q36/3mrMkLEV/gxHbiY
	un+NlmZxMI15zJRk9HnXmJzI1lKBdlQNldk07QrTBkVVnjybOiiPxyeHYi4kTRL37lCi
	W8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/p2hCYDhKAJ230l1zBzHnYZFs3VHjVr39XvOIKP4Pys=;
	b=GwvxzZwJcN2UjNxT4Xlc5xXMvpPCbxKkoMmGvpYMokncwVre6FYyFghH0pzSnSPX3R
	N9JZ+5WG4HzYg+ibfsrYWdJY1513ZFVBKpNK7jfmyHWgfLEuO0kB9CUB8fQPG4AE8H5p
	9NOIA7YF7EffCr7jGLQK36iw0c48m2znT+32eSE0y5JjRcOd1ovJwpjq8hEcRRulFPYZ
	9/b3DrOSlQrgyB0saxa/bYXe7JulnP0OBh/uSuWDUaVDVx17ADYF2z5krask8ilBFf7X
	jTyX/QzjsUP3Bpf4sr+mS3uWB4wwrxONFc56CaAFcHnHqpvjkM+fkSPSG+CF7IF4kuew
	lB8w==
X-Gm-Message-State: APjAAAVTRYyuPmk0Px7VveNqBu+aiSGYX9PqpI2uUHCSxq34IoEHqC1r
	KOAqiuiRbO0loJX1DCdULCM=
X-Google-Smtp-Source: APXvYqwn2Bb5s9dHHXGu4kP/PrmweWqq9r8gaJuQTaAylLqdC9JMoO2D+zXiDQevAsqwN3NWgk6q+A==
X-Received: by 2002:a65:60d2:: with SMTP id r18mr31309788pgv.217.1560443259298;
	Thu, 13 Jun 2019 09:27:39 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
	by smtp.gmail.com with ESMTPSA id j2sm310930pgq.13.2019.06.13.09.27.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Jun 2019 09:27:38 -0700 (PDT)
From: Yangtao Li <tiny.windzz@gmail.com>
To: joro@8bytes.org, m.szyprowski@samsung.com, kgene@kernel.org,
	krzk@kernel.org, will.deacon@arm.com, robin.murphy@arm.com,
	agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
	heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com
Subject: [PATCH 10/10] iommu/tegra-smmu: convert to SPDX license tags
Date: Thu, 13 Jun 2019 12:27:03 -0400
Message-Id: <20190613162703.986-10-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190613162703.986-1-tiny.windzz@gmail.com>
References: <20190613162703.986-1-tiny.windzz@gmail.com>
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
 drivers/iommu/tegra-smmu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 463ee08f7d3a..9a50ca4ec65c 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1,9 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2011-2014 NVIDIA CORPORATION.  All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/bitops.h>
-- 
2.17.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
