Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601334C073
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D996F4032B;
	Mon, 29 Mar 2021 00:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qs-2pYupOaMH; Mon, 29 Mar 2021 00:10:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8961E40332;
	Mon, 29 Mar 2021 00:10:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D1D8C0017;
	Mon, 29 Mar 2021 00:10:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E368FC000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5A84605BE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nd9ro5UoC4BU for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:56:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BDA4605A7
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:56:53 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id g15so10929328qkl.4
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FFq3P7yiseEEIQs2lgtrYVJcUzd7SMyJml+jQ6mPYF4=;
 b=uqre0zmSKtKLv++i82S0mbofGjuwskwC3CvMsmMtmcwjGtVJxeycjVJ6RpN1VYBSe+
 0CQzJMu7PEalUVZXmadGM2px6kQtZ3N7tNZA8m0dvlRcCIAf2qxYblhfj3libS6ly7pM
 7cP6Y7jQrTC4iCIUP2k8mrM8YO2OpsBVZioO1TYaUyX8FXX33csqU52/jNiOF/7HzRdW
 h0q2j3ogjbDgvmDtoSNvMcXXBHSfFF65U6v9ngv5ZS5aXjxah14f4OMwQwxkXQDvmGYq
 AtbeqfKk09GWR+OXgzvinDBtt6Vlb1woQTa7OM74PpgkMbt4TVzXSvTJ5IGTkC59YqDm
 2KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FFq3P7yiseEEIQs2lgtrYVJcUzd7SMyJml+jQ6mPYF4=;
 b=REyUK4UQGgTsJI+uBOM927DaR7ewi7W5IJrSdKgXTYxz+/38w5ghuBn/NbiN3mJJT6
 uCgs3oAcuBtLpDriDO7FzyrdTVDCSBquz5fD26nYxU5a0eMOS8yl/AHOACK6n+3yY7lH
 uecQ/aH5XAmJ6tpz/DbSBOl+yowd5hvdi+0v9LssT/k73oI5hqmtAXDXHGxZc8vzLWXQ
 1J2TtJ7WzBT1cAcaNlFLEYkEhmVpfZRiamKIkmfGHGjpuYHw9vLRtHhBCL1XdXTL6aaW
 9/x76QaL4BLLIKxhgsoBy0eBC2PMrB9FTnu5TVJDgxNxJGQZsjHch3HBf1sfUmLyUVCG
 4AXg==
X-Gm-Message-State: AOAM530tV0HA28Gr40QnJSpGftmE73wBubtSnlat1/duWTQLzVbWal56
 fr7TTvJJYEksiFmnpMhh+hc=
X-Google-Smtp-Source: ABdhPJyLHhya4uvoU4yUX2xpbMzIUxvQ1LFqJZoKSNEtSVlVs50tStFXatwwOAyjof/U/tKgBPUUrw==
X-Received: by 2002:a37:a10a:: with SMTP id k10mr22547586qke.171.1616975812145; 
 Sun, 28 Mar 2021 16:56:52 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 11/30] nbpfaxi.c: Fixed a typo
Date: Mon, 29 Mar 2021 05:23:07 +0530
Message-Id: <4171b74a36b486ce83fd019e654660d7cbe2dae0.1616971780.git.unixbhaskar@gmail.com>
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

s/superflous/superfluous/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/nbpfaxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 9c52c57919c6..9eacaa20ddb3 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -898,7 +898,7 @@ static int nbpf_config(struct dma_chan *dchan,
 	/*
 	 * We could check config->slave_id to match chan->terminal here,
 	 * but with DT they would be coming from the same source, so
-	 * such a check would be superflous
+	 * such a check would be superfluous
 	 */

 	chan->slave_dst_addr = config->dst_addr;
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
