Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D50734C07E
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1415F83A6B;
	Mon, 29 Mar 2021 00:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrgRdvEuKTif; Mon, 29 Mar 2021 00:11:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 169AE839E4;
	Mon, 29 Mar 2021 00:11:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CD04C000D;
	Mon, 29 Mar 2021 00:10:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F50CC000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BDB0400C4
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UV_AlYawnRXI for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:58:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01BD6400B9
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:58:12 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id j7so8226164qtx.5
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUGFgtZenGoQf8Uh4RGUdvjnZZYLeMJMHb15/4oeJgc=;
 b=mj/G1xfMN+eBi/mLaJKBCfkPK76TC91NulrZ5Jz6MjHvD1+9uv4rw5JIHWY6jJMkPU
 juBqy15jPxnjEZz88LM7f7n7mKB7TmDWozu6QfjYOf5cdeVB6jvj8YF2JK5SEbaWCtcr
 SLVpipsP8ug8RvIfOCigIBCOOkbSMY0mM8tlHsQ75zbmLFit+2cyQzvlDBSCB3LGSGbV
 pShlkMne+FQekElXhc22p72UjnAWEnoe2D3MPu8Z7RA503hwCfuXky3XJCDO45tC2vxK
 Ir37Ajvmz19yu5bi6jM78kpp6GrDyAnXm5bDAKqUzMmt+jw56iKxC+d1WcuHS2QwjAoe
 bCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EUGFgtZenGoQf8Uh4RGUdvjnZZYLeMJMHb15/4oeJgc=;
 b=S6CxTko9oX3nmXJcvWAEKwz8vgVy3UXkpAha1xpbK6Bh0JQIWqQFN9l/9cIhEZWfWq
 s7Up84Mq7wI0KGMpkdQSEAShe71Eyqa8L7weLma7gXxdWFnRONfOtRgozYnwj4kVziTy
 llN339BS/HGSqqZxnfQIGyY7H4EpMQHKwbI8hzcxfiYQ6TnP1Ir9EaGCAQxGbJJm5ysP
 hcZU1nTtV5LwiRRotzGyYJUDPW8B9muRhakytpjh8DqZujWEjF7c//sxgLSZmgQzEsY3
 L+g9Zasc9oqMSVORbPdbTk6CoS8UJM2PAtYg1Ek02XxOniuAPjAzgbYdXh8fp8b6zpa5
 h7iA==
X-Gm-Message-State: AOAM5323HPCNN0UhWbV9YE5ccks8oLtFW2x5qjU7eubS7MUASER3mkzW
 461pxMOikR7lFmb3PADeKJs=
X-Google-Smtp-Source: ABdhPJw5YfqSr8OAZoUA56+SYw5JOagX/iPu+fij/qaA6VDbAiygjX2++C/zuL+4UodiHI2nu1SuPA==
X-Received: by 2002:ac8:4799:: with SMTP id k25mr1974600qtq.319.1616975891846; 
 Sun, 28 Mar 2021 16:58:11 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:11 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 27/30] dpaa2-qdma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:23 +0530
Message-Id: <75bdf547b024ece2e35f6e83e51101109ae46803.1616971780.git.unixbhaskar@gmail.com>
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

s/contoller/controller/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/sh/shdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/shdmac.c b/drivers/dma/sh/shdmac.c
index 5aafe548ca5f..7b51b15b45b1 100644
--- a/drivers/dma/sh/shdmac.c
+++ b/drivers/dma/sh/shdmac.c
@@ -319,7 +319,7 @@ static void sh_dmae_setup_xfer(struct shdma_chan *schan,
 }

 /*
- * Find a slave channel configuration from the contoller list by either a slave
+ * Find a slave channel configuration from the controller list by either a slave
  * ID in the non-DT case, or by a MID/RID value in the DT case
  */
 static const struct sh_dmae_slave_config *dmae_find_slave(
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
