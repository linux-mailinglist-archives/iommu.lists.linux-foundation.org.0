Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EAD34C074
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE6A5839DD;
	Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA85EN-7H_h7; Mon, 29 Mar 2021 00:10:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E9048392C;
	Mon, 29 Mar 2021 00:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 261C4C0019;
	Mon, 29 Mar 2021 00:10:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E542EC000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C74DB838DE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55DIAWdbAvq9 for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:57:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 286F98387D
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:08 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id g15so10929676qkl.4
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ZQIptdaKO+NG6KGHA5S2pjM0OS7naQnCt9zgnNYCE0=;
 b=Gm9tUcw1/+mThRDpyyzzMTwMHDKH9vZpafertqfrSZ5YO9KbE3sAww3oZ8XGMiAhRt
 kgtAGKj9dtXo99Szxu7K4JpbuKgBBIZREfyljwoHuiTIM5ZAd/CKQ0umxuj//O71kbxD
 Eorzfcnc99sIfIq6B+POBj5vgl6pz1tdC7ugns0aQrf9x/NJct0viJIWVNhC6Y2Bw3k5
 +zV83HR64ZTrH1sIkOEbsmWYi035hsyGGF+Rxz5h3YrJ34Fc/SSZo4abf7eLvn47HyCZ
 1VehmmjVpqRm3naf7dKNpOzu4sq3YMJBnKtBt196sX4MubPgCqv7idERRFBCAhH7OBQ+
 GtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ZQIptdaKO+NG6KGHA5S2pjM0OS7naQnCt9zgnNYCE0=;
 b=tyOjjB/4lq/9OwphctYWOx2/OU8DB4g6aTu6nu7uQL1xQdnRZkyKMg7DFCn4YABeFv
 JzdnWBQjbiMcRZW6Gfva1mkJa9QQvATmlWUO/2iR2SMg6tG1hnsKRJG1aIN26I7KaO/A
 Tz+dlY3TodZOJZBFDu/h7RR31haWfNa7GcTBIgk3F15hZ1EIIQrihPayrgB/xO11+i9U
 zmIixUdqC01cz6U1klKslTcH5j2+K65MQ1MuJptJNhL9FeOIjv+QcMInGKmEY4gOk2s/
 kF7KTQusd0x3YXEJwFj3RGFPjob77MbbhvFDSYP/2+swrrpBxKBMhDrc+sQkUZkNeaDk
 YUUA==
X-Gm-Message-State: AOAM5322vUTRSEJODf7AZCkFm16n3Rjrs4vRXihxXKCGcPp1hsvU7Ura
 bNcHF7oVSvgcm3qVOf6XlNY=
X-Google-Smtp-Source: ABdhPJwgPDn63+t8WI0ESglt0cdz3qRSIBNoBZJfy0KnIfKji8LoJbUHTl3eZXAtTJ+tyoAIdpJzMw==
X-Received: by 2002:a05:620a:cf4:: with SMTP id
 c20mr22556318qkj.134.1616975827140; 
 Sun, 28 Mar 2021 16:57:07 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:06 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 14/30] Revert "s3c24xx-dma.c: Fix a typo"
Date: Mon, 29 Mar 2021 05:23:10 +0530
Message-Id: <1d989f71fbebd15de633c187d88cb3be3a0f2723.1616971780.git.unixbhaskar@gmail.com>
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

s/transferred/transfered/

This reverts commit a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.
---
 drivers/dma/s3c24xx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index c98ae73cdcc3..8e14c72d03f0 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -156,7 +156,7 @@ struct s3c24xx_sg {
  * struct s3c24xx_txd - wrapper for struct dma_async_tx_descriptor
  * @vd: virtual DMA descriptor
  * @dsg_list: list of children sg's
- * @at: sg currently being transferred
+ * @at: sg currently being transfered
  * @width: transfer width
  * @disrcc: value for source control register
  * @didstc: value for destination control register
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
