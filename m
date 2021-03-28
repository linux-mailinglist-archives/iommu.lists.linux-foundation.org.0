Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975334C078
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29102839E9;
	Mon, 29 Mar 2021 00:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VWPPigcMJZe; Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE76283A0C;
	Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56BA9C0016;
	Mon, 29 Mar 2021 00:10:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70DE2C000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54057400C8
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFS4CvrHVHhP for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:57:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC3FC400B9
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:32 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 7so10924196qka.7
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRQ66svHtz0NbMeMT9Zx0iC/2wAaIP+Km/fepuW/VfI=;
 b=lhF2PkYeKxZ0OGzjM1bBzGIAbKjSfHQkFcs2C27Ecdb0THCTBERC5T8aj/+CORXigi
 n616eugbkVpcCcWOibNxul8RyH5dqWEqKKkgEPag7IAtO1wIHraKQFrl6zJF1poQ+l/b
 l4gr6oRHPIYD9JSm8bV8I4eaJ/HWeZreeqN1heEG18VeXYvPGT7mIxrkvRUKeCBCctG6
 kwu9TfPac45671YXZgPWyFX6uZIgmzX1lHqm9rWuWRszCfTaoym5DsDyvHsArK4pope4
 2V++RpddLlJAODW8ec9vU7dCOvdwVpIAwPI0KLCpB4FbC0QCvF/clKntX08Z9XocOVxl
 t/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRQ66svHtz0NbMeMT9Zx0iC/2wAaIP+Km/fepuW/VfI=;
 b=Ico5gfXmEVdddKgyHnPx/f+ZvnL72TSkL+Wc8SOiY0PBYf88hyevkOrn1UEso9k9ng
 uoVNmolxkgwXKNVheFbwaZulSircQHWuT3pMGs3c9yZ9Til4whHM+Z/4pq76I8ew0fip
 Qk0FcYHfxNn9LhOoAVCD169x59pltjNXKKTu6VSolFVljvoc4vSGf7Y1J1Z9yUVLZnOa
 vzgkZvtYrOTyKtEBNVnWkHwumXu7HHTUYC2PmeT5XhUG+LDnypZkwPt1Y1rZUWtgqUKx
 lRVm22+IMYlZpBhIeF3WQ5u4ki5RqSHqhYABTVjPaJG1SUw2LtB3WbC3p1lb9r2g5dVd
 D5OQ==
X-Gm-Message-State: AOAM531dzVa4HybiN0gO/DBEGNoAeDyx0SGjZIXV7DunpturCuJl8cvV
 EMWK7qNTLESJYJPbGEjpg8g=
X-Google-Smtp-Source: ABdhPJz562Hr6JC/eu+femI5ulDAe6zWcMiureMKHuCOy+N3i/aJwFXT/YJj4Ol1H2CmKTh/PKph0g==
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr23223111qkm.355.1616975851673; 
 Sun, 28 Mar 2021 16:57:31 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:31 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 19/30] xgene-dma.c: Few spello fixes
Date: Mon, 29 Mar 2021 05:23:15 +0530
Message-Id: <4703d96a617c2244e2753d579790edbbb49382ab.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Mar 2021 00:10:51 +0000
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
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

s/definations/definitions/   ....two different places.
s/Configue/Configure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/xgene-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 3589b4ef50b8..9b0010b6e033 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -23,7 +23,7 @@

 #include "dmaengine.h"

-/* X-Gene DMA ring csr registers and bit definations */
+/* X-Gene DMA ring csr registers and bit definitions */
 #define XGENE_DMA_RING_CONFIG			0x04
 #define XGENE_DMA_RING_ENABLE			BIT(31)
 #define XGENE_DMA_RING_ID			0x08
@@ -102,7 +102,7 @@
 #define XGENE_DMA_BLK_MEM_RDY_VAL		0xFFFFFFFF
 #define XGENE_DMA_RING_CMD_SM_OFFSET		0x8000

-/* X-Gene SoC EFUSE csr register and bit defination */
+/* X-Gene SoC EFUSE csr register and bit definition */
 #define XGENE_SOC_JTAG1_SHADOW			0x18
 #define XGENE_DMA_PQ_DISABLE_MASK		BIT(13)

@@ -1741,7 +1741,7 @@ static int xgene_dma_probe(struct platform_device *pdev)
 	/* Initialize DMA channels software state */
 	xgene_dma_init_channels(pdma);

-	/* Configue DMA rings */
+	/* Configure DMA rings */
 	ret = xgene_dma_init_rings(pdma);
 	if (ret)
 		goto err_clk_enable;
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
