Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F5D1A20F8
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 14:01:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1AE3F204F2;
	Wed,  8 Apr 2020 12:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJx64bD7pyUz; Wed,  8 Apr 2020 12:01:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 657E520361;
	Wed,  8 Apr 2020 12:01:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C529C0177;
	Wed,  8 Apr 2020 12:01:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28383C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 171B487EA7
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnjbeMWiPybg for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 12:01:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1026A87E9D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+lcZXxZEHGVocLnAtFg5vca+ZcryIgWoBTFv1YYLF4g=; b=pyDdyMNBolOORlttG0Ow8hMuA8
 buz5EeD0sjSvmJHQdIlYMloXGCUqtH/NgI1zYxqxslpC50LmuKkT2+rHdh9Zy0HSRo06czklbqt1u
 UonmZgJX7dvVKYYlVmBu45Xwb108cTxn+IssXZhLq7pBnsEYZvMZ9OIGblW7pVBUtl8yETpwacET5
 O3xVQLQEEVCxAMnU35vpWxF2yaWjY4jp5jnRit6Z6WZEXeSf7gPKmbHzd0MbHP1LjLzICE/Cead+4
 CF/PVgJQtX89EiknsH5urF9gCmJ0Ccb6at4CUW7p3c8Rf4p2uJG/7FAohqFcDtc7MShP8AYKN+bo/
 te1inlrQ==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9OC-0005u0-OI; Wed, 08 Apr 2020 12:01:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: [PATCH 27/28] s390: use __vmalloc_node in alloc_vm_stack
Date: Wed,  8 Apr 2020 13:59:25 +0200
Message-Id: <20200408115926.1467567-28-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408115926.1467567-1-hch@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

alloc_vm_stack can use a slightly higher level vmalloc function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/kernel/irq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index a25ed47087ee..4518fb1d6bf4 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -735,9 +735,8 @@ void do_IRQ(struct pt_regs *regs)
 
 static void *__init alloc_vm_stack(void)
 {
-	return __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN, VMALLOC_START,
-				    VMALLOC_END, THREADINFO_GFP, PAGE_KERNEL,
-				     0, NUMA_NO_NODE, (void*)_RET_IP_);
+	return __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, THREADINFO_GFP,
+			      NUMA_NO_NODE, (void *)_RET_IP_);
 }
 
 static void __init vmap_irqstack_init(void)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
