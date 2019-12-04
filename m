Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A911304D
	for <lists.iommu@lfdr.de>; Wed,  4 Dec 2019 17:57:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3889086EFF;
	Wed,  4 Dec 2019 16:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGgIPmdifHI3; Wed,  4 Dec 2019 16:57:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E3AAB86E78;
	Wed,  4 Dec 2019 16:57:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDDA5C077D;
	Wed,  4 Dec 2019 16:57:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E511DC077D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 12:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9780D8832F
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 12:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCdIX7S8C2t3 for <iommu@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 12:35:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 301318831B
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 12:35:34 +0000 (UTC)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7B2A20862;
 Wed,  4 Dec 2019 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575462933;
 bh=M1Wf/f30+BvSWegCWZV9CQ1OJDcWNvDUUneWC9hFQOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=A+OJZidzgtdJt6409seAEyH45Ss0kz2SBVJ8TWk3Q0UceO0y4S6OsXy2bjaslg5lP
 LK6ARqr0xZruFvxNrlV5jBQ6dU6ReePVQk9HAWRwyTXGhM4FszRdjBL0OgxolzqKS0
 a9CRC+a0jEEIjKw+N+wMhE7DRPXw7GklS56VuPLw=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: ensure that swiotlb buffer is allocated from low
 memory
Date: Wed,  4 Dec 2019 14:35:24 +0200
Message-Id: <20191204123524.22919-1-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Dec 2019 16:57:12 +0000
Cc: linux-arch@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

From: Mike Rapoport <rppt@linux.ibm.com>

Some powerpc platforms (e.g. 85xx) limit DMA-able memory way below 4G. If a
system has more physical memory than this limit, the swiotlb buffer is not
addressable because it is allocated from memblock using top-down mode.

Force memblock to bottom-up mode before calling swiotlb_init() to ensure
that the swiotlb buffer is DMA-able.

Link: https://lkml.kernel.org/r/F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Darren Stevens <darren@stevens-zone.net>
Cc: mad skateman <madskateman@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 arch/powerpc/mm/mem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index be941d382c8d..14c2c53e3f9e 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -260,6 +260,14 @@ void __init mem_init(void)
 	BUILD_BUG_ON(MMU_PAGE_COUNT > 16);
 
 #ifdef CONFIG_SWIOTLB
+	/*
+	 * Some platforms (e.g. 85xx) limit DMA-able memory way below
+	 * 4G. We force memblock to bottom-up mode to ensure that the
+	 * memory allocated in swiotlb_init() is DMA-able.
+	 * As it's the last memblock allocation, no need to reset it
+	 * back to to-down.
+	 */
+	memblock_set_bottom_up(true);
 	swiotlb_init(0);
 #endif
 
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
