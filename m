Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58334C070
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0275839A4;
	Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymer96omF7e0; Mon, 29 Mar 2021 00:10:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34A3D8390F;
	Mon, 29 Mar 2021 00:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5BA3C0023;
	Mon, 29 Mar 2021 00:10:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFFE7C000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE9EC838DE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrSoByb2HWbJ for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:57:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3091B8387D
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:03 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id c3so4547391qvz.7
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FMNLSlxwy2hAf90gVAHPhiZXHLhbd5qd+n04so3vi0M=;
 b=S8oWEVWMQA7uyNstiZ8vX8xPHLZ0pxra5NLEFFZff7GHfczcuqdPPb1f9FK0XzIuvO
 UzPWul+6fG0QPP5gDQ9IaF5Yimdyc8s/NTyczspVuP9t6SHX6y9UJJ349vESDcVPS68s
 QG5EZ5U5urbmsi3oZ/Xw4TctbB7C20H3xQqhBrA3M1pIYkme4Az2wgoemWBDm4zIM2zF
 S8l8tp27O4LScLIVSPnMu2Tfen8wh0ESoi1br6sQSJgBhywsNStX9yRrFEgJENv3xygU
 JXHw47iftiDyBqQKWUlu3oja/xrWp3CtSbiiUCvlFQoi58veqOhE8AgD5AdpIpuoEvAz
 yjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FMNLSlxwy2hAf90gVAHPhiZXHLhbd5qd+n04so3vi0M=;
 b=mkwmOuikK3H7cYtea13A2bZPba1ly8iVXu+GcrprNXfnXxqNFZgYBrhGkwCCXWUPk/
 YUnk2DDXp8IWdMfa9pTzEtmOtVxSip7xzcs5vG3Ppbvafyd2r8i8rjycJah7urBtG5yK
 Pex8u0hwedbTxb8OdilgzxoUs4OyUcv7EoIbVqSBievVPN5ii8UhMC+jC8UOzHDDNd+N
 FOY2lyYoBJbkYy8fKnfqEGnBkBS6aHyJStorbym1knwoRgeiFVYIwnx8Rmv5en+Rn7lT
 6wsAX0pbgKTisA7k9b2BpkDaJKWquk+jI6RKaEceMq8+GMu75SY2u1+LoRrY6CeTSMt/
 cZmA==
X-Gm-Message-State: AOAM531IVwacLWmHViXBUeqEPZDTT7l8LvLIr/EXuL97vERlU1lMBgMB
 vG4AXQVKb2MVL7T+bX/sAV0=
X-Google-Smtp-Source: ABdhPJwu7RyqQ3LrL1DwSFaqoUhxFcpLYWZSK3o023jDzT66goaZiw5ZvrOEYhVFXl/O/Q9wP43hfA==
X-Received: by 2002:ad4:55ef:: with SMTP id bu15mr22954074qvb.46.1616975822090; 
 Sun, 28 Mar 2021 16:57:02 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:01 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 13/30] s3c24xx-dma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:09 +0530
Message-Id: <a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.1616971780.git.unixbhaskar@gmail.com>
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

s/transfered/transferred/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/s3c24xx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 8e14c72d03f0..c98ae73cdcc3 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -156,7 +156,7 @@ struct s3c24xx_sg {
  * struct s3c24xx_txd - wrapper for struct dma_async_tx_descriptor
  * @vd: virtual DMA descriptor
  * @dsg_list: list of children sg's
- * @at: sg currently being transfered
+ * @at: sg currently being transferred
  * @width: transfer width
  * @disrcc: value for source control register
  * @didstc: value for destination control register
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
