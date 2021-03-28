Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6607834C080
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3587983947;
	Mon, 29 Mar 2021 00:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYxP2jTFUKae; Mon, 29 Mar 2021 00:11:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7D8183A63;
	Mon, 29 Mar 2021 00:11:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F3AEC0021;
	Mon, 29 Mar 2021 00:10:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ED46C000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AE8C838DE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxf9HkjTjhoQ for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:58:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C289D8387D
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:22 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id i9so10936520qka.2
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OzLTjr1QMwsBd8ul22IMj5qh7q/mkchMq8nJkxCkqyY=;
 b=r9e3a2wKOgpXCJCo+aWL5/d9M1nteMw5u0JfcT5v+U1WeLlFsUdTJtF08TixWpxMKN
 YOD1u3JG8FP2VSPHIxLAz8eyeTW7mKistUjRXRPuJmpwD4BMio2K3MX1BHXh30tgr+HS
 WkzGAULz8HC3J2TiK1vBwO2PBVjrMfhok856SYM9QI5K2u/kKIUyC6gGKYdErlSpXQ4X
 n5ywUcSi2xtng/Z0W39xMqETvdlLlYlXLhEnBKsLgR7MX8S21rvncu5XNVqEvqtPGWsi
 BDbqqdTj0jxa+LbMW45UGa5pH81aWPydRGGHPaGxa/5YSoAfD3YkO5GRqeKV5jDkYTwr
 0RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OzLTjr1QMwsBd8ul22IMj5qh7q/mkchMq8nJkxCkqyY=;
 b=afp58iombzcyp31OkdofM4v+8lWWTNHGNfWJc0LViyN/XM0KRp2JTdvikRIRqh7AlM
 ZaiKqchfdnVATJXLEeuM5A0I0fXqqge5riBsABsT9hxUPLX/3SyWqR7n9B83oXP+hb/K
 Qtd/0ZrmgC90ds7DJ2CmHiSj7T5fv9oQIjfef55+BnY7U/sGVyue8SbJ8Ng4Dm5Po+dU
 bw4AyLIgR8yTIu4aAZ3Gfyh5T5/SVVsfxLtHZyO1WeupYJi3r5ZEQ62KmX0OkzC0qXUZ
 L3KtKjb+GmxO6498wKoK1Ktr2dc2bz0cjBofBjCT+n7ogtHcEYqZWhFYG3usSqe5LY7m
 7MTA==
X-Gm-Message-State: AOAM531X3Xgcb02Jo4XV9uPa5CVZPAAf32DOPXcspq7ycpevwiqGO71N
 gMCo7yI5oD5HhMrxezTzfxQ=
X-Google-Smtp-Source: ABdhPJzZMvKYIloLfO2fexs1vtEuZv6khlYZUkE/hvVvZgpuiguBiwDPE1c2rtdyr/QBSVJvO+1KkQ==
X-Received: by 2002:a37:6a47:: with SMTP id f68mr23321069qkc.12.1616975901742; 
 Sun, 28 Mar 2021 16:58:21 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:21 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 29/30] edma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:25 +0530
Message-Id: <28685183e34f3ae6839eb73265f9055f554ad6f1.1616971780.git.unixbhaskar@gmail.com>
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

s/transfering/transferring/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/ti/edma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 35d81bd857f1..5ad771e34457 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -1815,7 +1815,7 @@ static void edma_issue_pending(struct dma_chan *chan)
  * This limit exists to avoid a possible infinite loop when waiting for proof
  * that a particular transfer is completed. This limit can be hit if there
  * are large bursts to/from slow devices or the CPU is never able to catch
- * the DMA hardware idle. On an AM335x transfering 48 bytes from the UART
+ * the DMA hardware idle. On an AM335x transferring 48 bytes from the UART
  * RX-FIFO, as many as 55 loops have been seen.
  */
 #define EDMA_MAX_TR_WAIT_LOOPS 1000
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
