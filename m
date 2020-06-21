Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 27993202CC7
	for <lists.iommu@lfdr.de>; Sun, 21 Jun 2020 22:43:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B78A5869EC;
	Sun, 21 Jun 2020 20:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUyG3Ckvi9iF; Sun, 21 Jun 2020 20:43:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 39B9686C6A;
	Sun, 21 Jun 2020 20:43:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F184C016F;
	Sun, 21 Jun 2020 20:43:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56781C016F
 for <iommu@lists.linux-foundation.org>; Sun, 21 Jun 2020 20:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3DD388694A
 for <iommu@lists.linux-foundation.org>; Sun, 21 Jun 2020 20:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RzsovsPcLKkE for <iommu@lists.linux-foundation.org>;
 Sun, 21 Jun 2020 20:43:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BAB1A86946
 for <iommu@lists.linux-foundation.org>; Sun, 21 Jun 2020 20:43:03 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d10so4711844pls.5
 for <iommu@lists.linux-foundation.org>; Sun, 21 Jun 2020 13:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=PvZljGHNreo2tyXJVvsTBccc3LskiWVWOyP0n6ravmE=;
 b=a5FmRKW2nzxF4C5QCSMWyxbMtHd06V1ej3ANmTPXZdyDxWXpV+nqYGzuaoZ3QjNE0G
 6zKlRnuKU/8T42WFDfCTuILMSh+2dHrjnCuXcdl8GPjzXndyCX6ZVxGMUldRaE3jwY1H
 uYjnXMhUQNToXjfQsELyHV7MYban3XTH0ewBWy9ww8hvCnibv7CZfH7xB9c7tQSoFp5J
 jSF7RRc6oH8ytBy+5Tsw6Hy4X+82zx32FF79dfb7oo59/vfB7DA6AaqtnSg328QtBHHD
 v0M5R+GMYYj0DKfqjzGlzRNklq94g2ypEiXzajJ1dAvqKRhkLaFRMSltmuCZort0Hx0Y
 h6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=PvZljGHNreo2tyXJVvsTBccc3LskiWVWOyP0n6ravmE=;
 b=SybpUH6f6pc2RiwFNXpMwMauLxmg81WsWJI9w9v9fPjPFDssejXtZ88lmproQqW8VE
 6j6wX4/q39U486ATKUxMiHCmBej878E/8Gw+MUS5BQaD5rAbasLJazt2oL3XlaBnKVjk
 IeV1NvcENsfrNF5rWhOlk5pxdW7yMoCHILg/EbIYuHgV7wo76pUtnzGWCq6WMhCuqHFS
 bHCL3ZLmziLX3+tBjETsHOvhR+ivgcEBiTCuwfKDxjtPP5Dlh5Gk+c7xVQQ2TFaOxE5+
 hL9obx3G0HvQdNiNWxSPoLYZpGwpfpdjadBOHDvK7PzHiTCFn0HMMh+13pfpV/DIvQA1
 BWCQ==
X-Gm-Message-State: AOAM531BFOIGealnpYZQlSq9aq9ZeHuKa+cxuRbiiuHp8vx19M9OQqIH
 kFjG+Ouciccs/tWhsw3VB4cMyQ==
X-Google-Smtp-Source: ABdhPJyCL0CNvvbYHinbrYnOBjYsY6VcZ2Orf4uq60Hlk3Wki6onOsZa9dNQ8m1/zeVbJhVgC0z6fw==
X-Received: by 2002:a17:902:a511:: with SMTP id
 s17mr16615698plq.37.1592772183174; 
 Sun, 21 Jun 2020 13:43:03 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id f6sm12610020pfe.174.2020.06.21.13.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 13:43:02 -0700 (PDT)
Date: Sun, 21 Jun 2020 13:43:02 -0700 (PDT)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>
Subject: [patch] dma-pool: warn when coherent pool is depleted
Message-ID: <alpine.DEB.2.22.394.2006211335530.195301@chino.kir.corp.google.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Cc: Robin Murphy <robin.murphy@arm.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
From: David Rientjes via iommu <iommu@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

When a DMA coherent pool is depleted, allocation failures may or may not
get reported in the kernel log depending on the allocator.

The admin does have a workaround, however, by using coherent_pool= on the
kernel command line.

Provide some guidance on the failure and a recommended minimum size for
the pools (double the size).

Signed-off-by: David Rientjes <rientjes@google.com>
---
 kernel/dma/pool.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -239,12 +239,16 @@ void *dma_alloc_from_pool(struct device *dev, size_t size,
 	}
 
 	val = gen_pool_alloc(pool, size);
-	if (val) {
+	if (likely(val)) {
 		phys_addr_t phys = gen_pool_virt_to_phys(pool, val);
 
 		*ret_page = pfn_to_page(__phys_to_pfn(phys));
 		ptr = (void *)val;
 		memset(ptr, 0, size);
+	} else {
+		WARN_ONCE(1, "DMA coherent pool depleted, increase size "
+			     "(recommended min coherent_pool=%zuK)\n",
+			  gen_pool_size(pool) >> 9);
 	}
 	if (gen_pool_avail(pool) < atomic_pool_size)
 		schedule_work(&atomic_pool_work);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
