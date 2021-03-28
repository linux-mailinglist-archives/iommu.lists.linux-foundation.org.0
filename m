Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E734C07C
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED84D83938;
	Mon, 29 Mar 2021 00:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ska38dgrw8wo; Mon, 29 Mar 2021 00:11:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E025C8398E;
	Mon, 29 Mar 2021 00:10:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A7BAC001D;
	Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CBDFC000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F0CD838DE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBUE1FIEzt62 for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:57:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9F048387D
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:52 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id i9so10935845qka.2
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OMl5ABdwT5DW251I71t3DGinXKhKaq9NsZyTNddHa8Y=;
 b=Rfss4m+DyBLiE2rmvTbB3bLpSu6ljCMgZGJOXL83UY6K7+BOdjg+SSTq8kZaDOEWv6
 rx5iy/w5SOioRKCzTUe3BxyBWYWNrSBKtsFvhFu4XL0OlvsW9PoKO+DxXiWW6St0mTR9
 lTFd+lCy7V8ZkBLrnBlXt3hupR2eaF94TvrXIfIoOxKabz+84KeSvhAaYQ/pLT5rJS9T
 zXOMfY/jZWDHi6IcDT8yRNlR1FPQ+kTzxyWI7467K+gS18rtBl3iSz8m8HbJFMcf4hvI
 qKjsig+kI9u18vColYKr0q6VTUM4wM5tQPrC3qFE9KxeKgm5rGQt7CVWSbQ9fEJeDkEW
 Pyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OMl5ABdwT5DW251I71t3DGinXKhKaq9NsZyTNddHa8Y=;
 b=jIacSKQpQ5wx2JI3FQmBCSIpHHmlOMe1dCdWhdf85JNHEcHdnWfd8LAIMpfMu1z9p/
 puyjSF6kKcfKZoQmYt+Mx+DzT4tq79/bVLrQua1qpGe0GusLvs+QWCEQwpET/GbyyPET
 J7UG9pfGNINUXIw4KOZqsW/wsa5sgVdLJ8mD8F1YZAPEbSLoC339Oh0CfpMf+hHtg4Qc
 OVRtN+J+teNZKJUNUg4tz0EALj/WBnwr2bVtGvjp2/cdxPTaIwnailKiE+qKeO/Bfr2d
 XvUPPMuhsFH8Udu9Iz8vG32pE6Skgj1Eu4T//NmgcEMPiJ292yEO3WF5mJHjfdtMDNVx
 FRlQ==
X-Gm-Message-State: AOAM5324LrBTqNeX8ghVDxYy8K8ls/eaAbCrpVvyXnFz9J6jQDJV7kLK
 j9uReaHgvw1GprnZ7JahS7A=
X-Google-Smtp-Source: ABdhPJxStwmIthIUA++khUWtx+qx1BVfAS/jMvDgsTU1bqiz3K++ChYbHlJMBeZAq5/maT4/buJuaQ==
X-Received: by 2002:a37:a147:: with SMTP id k68mr23143111qke.66.1616975871664; 
 Sun, 28 Mar 2021 16:57:51 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 23/30] dma-jz4780.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:19 +0530
Message-Id: <ecd961a789c07f2c6a05330688e084547e78c191.1616971780.git.unixbhaskar@gmail.com>
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

s/proceeed/proceed/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/dma-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index ebee94dbd630..451bc754b609 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -379,7 +379,7 @@ static struct dma_async_tx_descriptor *jz4780_dma_prep_slave_sg(

 		if (i != (sg_len - 1) &&
 		    !(jzdma->soc_data->flags & JZ_SOC_DATA_BREAK_LINKS)) {
-			/* Automatically proceeed to the next descriptor. */
+			/* Automatically proceed to the next descriptor. */
 			desc->desc[i].dcm |= JZ_DMA_DCM_LINK;

 			/*
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
