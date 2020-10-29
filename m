Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E466529F318
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 18:26:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9C1786B7C;
	Thu, 29 Oct 2020 17:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MGGAZKF9ozB; Thu, 29 Oct 2020 17:26:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D260A86C23;
	Thu, 29 Oct 2020 17:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C068AC0051;
	Thu, 29 Oct 2020 17:26:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F8DAC0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B8CD86FEB
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbeDah4RiCoD for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 17:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4ED1186FE5
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE553AC9A;
 Thu, 29 Oct 2020 17:26:06 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 7/7] mm: Remove examples from enum zone_type comment
Date: Thu, 29 Oct 2020 18:25:50 +0100
Message-Id: <20201029172550.3523-8-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029172550.3523-1-nsaenzjulienne@suse.de>
References: <20201029172550.3523-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-mm@kvack.org, will@kernel.org,
 jeremy.linton@arm.com, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com,
 linux-riscv@lists.infradead.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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

We can't really list every setup in common code. On top of that they are
unlikely to stay true for long as things change in the arch trees
independently of this comment.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/mmzone.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index fb3bf696c05e..9d0c454d23cd 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -354,26 +354,6 @@ enum zone_type {
 	 * DMA mask is assumed when ZONE_DMA32 is defined. Some 64-bit
 	 * platforms may need both zones as they support peripherals with
 	 * different DMA addressing limitations.
-	 *
-	 * Some examples:
-	 *
-	 *  - i386 and x86_64 have a fixed 16M ZONE_DMA and ZONE_DMA32 for the
-	 *    rest of the lower 4G.
-	 *
-	 *  - arm only uses ZONE_DMA, the size, up to 4G, may vary depending on
-	 *    the specific device.
-	 *
-	 *  - arm64 has a fixed 1G ZONE_DMA and ZONE_DMA32 for the rest of the
-	 *    lower 4G.
-	 *
-	 *  - powerpc only uses ZONE_DMA, the size, up to 2G, may vary
-	 *    depending on the specific device.
-	 *
-	 *  - s390 uses ZONE_DMA fixed to the lower 2G.
-	 *
-	 *  - ia64 and riscv only use ZONE_DMA32.
-	 *
-	 *  - parisc uses neither.
 	 */
 #ifdef CONFIG_ZONE_DMA
 	ZONE_DMA,
-- 
2.29.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
