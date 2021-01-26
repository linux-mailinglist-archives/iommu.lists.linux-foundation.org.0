Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E9467303369
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 05:54:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 569B285618;
	Tue, 26 Jan 2021 04:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CS8zm_zOwhue; Tue, 26 Jan 2021 04:54:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C0F3185550;
	Tue, 26 Jan 2021 04:54:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4800C013A;
	Tue, 26 Jan 2021 04:54:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84D5FC013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 04:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6AEA38502C
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 04:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHAuq-0g44Ft for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 04:54:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 50D0684FB0
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 04:54:19 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id gx1so1522461pjb.1
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 20:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a69BMfJQ9E4oHULh93aNwSAV8hiyHTyNrIA1sCczbko=;
 b=mNfngmN/q7ViCvgKIo8bo3NBWuQB90CjvHeINbBALSaZ9eQfiKiHDbOkzIlmSFVJsr
 S1Swe0LlSEQdH19e70KOsf8TqXZl6qUlsmhl8B8BadbI4RpVDG+3PMVsTsXZljl9fTez
 nDIu2af4HTSc7/qULyahGyHx7G1jqNlinR55/bJusztTdX4F96cnWe64sDxGUjr8mP2x
 0G0mp360Y5bYDAsNb62nazgCY6L9MoSuAUCEJk/uXxsqC3EJv70Yq6f0FbtwQ6O/rE06
 aJmTWlzwFplZhScxww31Fji6SUnUGDFL3PUz1KF5NEBsKS+eF7yMd1x0TjLd/fyG1J1s
 eQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a69BMfJQ9E4oHULh93aNwSAV8hiyHTyNrIA1sCczbko=;
 b=WAL1cnKI+3asV/trinlAPLiq+pm4l+g8Rg8bOtMgNbyqqSkmojkgdUAFTbAZiAsAY4
 J1mXprZYGgupjCu4qrHstglT4H/Reai1IwjDh7lWV3edUkPpQ+chwj49pLAYXKVw3eRx
 1O6eqfOTGCJb/iTB7Ou6Nd5cuKZ+p8lffmx0fCFlieFp5ha+HOI+cTxM8H0Cm8yoaJZc
 oacngSDFASnu33aJcRsYHqe/ZyCSP9bVFb6uZ94XhVP7jZlenGEvb7AIqZaE7LYRWslE
 cQXgA9AwL94yJOGikALfCjPwb+/zqDJVALMF8KzlYJOmPDA8tlmPrDZz58IH3FImikuT
 Nkfg==
X-Gm-Message-State: AOAM5333nGYY77TGr7HyhxV0OJE5c/HeTBHPD4Q/waZOa6dChZk1QFMy
 WGQnQ1SqHG5hkvIP60oxTyo=
X-Google-Smtp-Source: ABdhPJwSa2nXR/aKoIRxXCZWsKkoMqrHw7m/qOUyKn2wDN2zSos1dL5DiF7wqcAQ5jV1WhPBUCJ4ow==
X-Received: by 2002:a17:902:7c10:b029:e0:7a2:38c7 with SMTP id
 x16-20020a1709027c10b02900e007a238c7mr4251545pll.79.1611636858988; 
 Mon, 25 Jan 2021 20:54:18 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id w184sm18803382pgb.71.2021.01.25.20.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 20:54:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/5] kernel/dma: remove unnecessary unmap_kernel_range
Date: Tue, 26 Jan 2021 14:54:01 +1000
Message-Id: <20210126045404.2492588-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210126045404.2492588-1-npiggin@gmail.com>
References: <20210126045404.2492588-1-npiggin@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

vunmap will remove ptes.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 kernel/dma/remap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 905c3fa005f1..b4526668072e 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -66,6 +66,5 @@ void dma_common_free_remap(void *cpu_addr, size_t size)
 		return;
 	}
 
-	unmap_kernel_range((unsigned long)cpu_addr, PAGE_ALIGN(size));
 	vunmap(cpu_addr);
 }
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
