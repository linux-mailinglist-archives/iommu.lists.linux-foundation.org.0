Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 642CE34C075
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF1040335;
	Mon, 29 Mar 2021 00:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32Pg_jy0yGgV; Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 366E94032D;
	Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D76B8C0017;
	Mon, 29 Mar 2021 00:10:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D161FC000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2D89605BE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ng2Gxi178G6h for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:57:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18C63605A7
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:23 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id x27so5715699qvd.2
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=88PkT7hzmP9uvlnh5Rsb8g3TAFEqqGGj/lMcm5Asd2s=;
 b=nhwORjtTIVMJ/bsMdgqNd8uoq6Cs7JgZ8YX00vhjlbEVgF9lqTcrqqFaLOyxT8TLmh
 j6eMqWWGzth2rPMVS5X9Py/JgSls2R8a2uGKjK3d5fC2UATp6PvzmH8o1b0Mwf8b65lN
 G7gn7A7icEPgpkHDfLnDY7hh3mIJWxLbFHLnxEqNn3Fu2pc/RESJ5ASbqfbzt/i7hEtx
 3vCsh8h26Ppie6GrkT09TmUYmLAv9ciFcoOuelozIQy08XsWgtc/dxh4NJROi75XMo0Z
 FyLuydql2Ggr5IOC0fjXSjXU0gxU7nIxd+O7/qC10kapvV2kBr9ZwJXc62om9niJbwtV
 rKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=88PkT7hzmP9uvlnh5Rsb8g3TAFEqqGGj/lMcm5Asd2s=;
 b=hR7QpcvjniH+kY+/vHyz4wvlVnUZtrY4bpcLZ75QL2zGebC9E1gWNTLogWP6mmU/lQ
 h2pEJ/EK8tGj3hWXTyfx5u1Tm8E6zp5B5JIG4K4EgudQQYjbK5V+rLSAJZRmHpIKL5ji
 0ebLuZVRciXbl/lHBFTg1vUSjH1Gcdn/EcsTeXL0KbLwyZDpqTqidkEvAATEXfMgujw1
 W7p9nsrkz8Xao1yJe96WgTagttQkWFodlHTwIIlFqI2AEPBEbFokyw++KKs9gEyLS91P
 ZeUkDLw+Na36pjlW0r+W28oeU5ouC8zmLUAZgZlE7qZGLeQeI+4fw5NhLRJNtHHjdc+o
 nEjQ==
X-Gm-Message-State: AOAM5329bfkOYvRU3bKiH2PbXHgz8fV9lfvi1yJtRsWz7JxMmzWojHeN
 XjeQHBscXkJitCH71/6Uug0=
X-Google-Smtp-Source: ABdhPJzeNlXwPF2gtbpUnH5nSpOqRgSvlEoS3IIvNxtfx5u/w6b4BkxwheKjinYT+tl9BHqoU9Rugg==
X-Received: by 2002:a0c:df02:: with SMTP id g2mr22814769qvl.40.1616975842037; 
 Sun, 28 Mar 2021 16:57:22 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:21 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 17/30] ste_dma40_ll.h: Fix a typo
Date: Mon, 29 Mar 2021 05:23:13 +0530
Message-Id: <90dd5516285c43fb91103905b72d522ae4bf7a58.1616971780.git.unixbhaskar@gmail.com>
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

s/directy/directly/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/ste_dma40_ll.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40_ll.h b/drivers/dma/ste_dma40_ll.h
index c504e855eb02..2e30e9a94a1e 100644
--- a/drivers/dma/ste_dma40_ll.h
+++ b/drivers/dma/ste_dma40_ll.h
@@ -369,7 +369,7 @@ struct d40_phy_lli_bidir {
  * @lcsp02: Either maps to register lcsp0 if src or lcsp2 if dst.
  * @lcsp13: Either maps to register lcsp1 if src or lcsp3 if dst.
  *
- * This struct must be 8 bytes aligned since it will be accessed directy by
+ * This struct must be 8 bytes aligned since it will be accessed directly by
  * the DMA. Never add any none hw mapped registers to this struct.
  */

--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
