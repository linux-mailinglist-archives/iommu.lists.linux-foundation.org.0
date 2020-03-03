Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E201783FA
	for <lists.iommu@lfdr.de>; Tue,  3 Mar 2020 21:28:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9BDE68704A;
	Tue,  3 Mar 2020 20:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9H119uehWKu; Tue,  3 Mar 2020 20:28:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37CE08766C;
	Tue,  3 Mar 2020 20:28:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25462C013E;
	Tue,  3 Mar 2020 20:28:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B144AC013E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE0FF86749
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oT1HVJXcIi-q for <iommu@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 20:28:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 119F186788
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:28:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9969A20CC7;
 Tue,  3 Mar 2020 20:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583267280;
 bh=YV6CQtKhLrFI8QEQ4FLBJQUo+r9S+fVJg0CmYyWmunU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fadn+CEkQwJYQHUj4GibELnSV08ZpQFdVdJzZ9g1p3JBC0K7IEOMjasCZpZ5pmrf3
 STEu7OlLONE7G6p/ML20yh9o1mShzV0Bo6+5KC050Jnsy/NhixKNevPtdK+mN0Zx3Z
 6dBuB2DvD2Kn18DwkqaMaXc/67DiEB6nKpJXuzUo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 3/4] iommu/omap: Fix -Woverflow warnings when compiling
 on 64-bit architectures
Date: Tue,  3 Mar 2020 21:27:50 +0100
Message-Id: <20200303202751.5153-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303202751.5153-1-krzk@kernel.org>
References: <20200303202751.5153-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Although the OMAP IOMMU driver supports only ARMv7 (32-bit) platforms,
it can be compile tested for other architectures, including 64-bit ones.
In such case the warning appears:

       In file included from drivers/iommu/omap-iommu.c:33:0:
       drivers/iommu/omap-iommu.c: In function 'omap_iommu_iova_to_phys':
    >> drivers/iommu/omap-iopgtable.h:44:21: warning: large integer implicitly truncated to unsigned type [-Woverflow]
        #define IOPTE_MASK  (~(IOPTE_SIZE - 1))
                            ^
    >> drivers/iommu/omap-iommu.c:1641:41: note: in expansion of macro 'IOPTE_MASK'
           ret = omap_iommu_translate(*pte, da, IOPTE_MASK);
                                                ^~~~~~~~~~

Fix this by using architecture-depending types in omap_iommu_translate():
1. Pointer should be cast to unsigned long,
2. Virtual addresses should be cast to dma_addr_t.

On 32-bit this will be the same as original code (using u32).  On 64-bit
it should produce meaningful result, although it does not really matter.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested on hardware.
---
 drivers/iommu/omap-iopgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/omap-iopgtable.h b/drivers/iommu/omap-iopgtable.h
index 1a4adb59a859..51d74002cc30 100644
--- a/drivers/iommu/omap-iopgtable.h
+++ b/drivers/iommu/omap-iopgtable.h
@@ -63,7 +63,8 @@
  *
  * va to pa translation
  */
-static inline phys_addr_t omap_iommu_translate(u32 d, u32 va, u32 mask)
+static inline phys_addr_t omap_iommu_translate(unsigned long d, dma_addr_t va,
+					       dma_addr_t mask)
 {
 	return (d & mask) | (va & (~mask));
 }
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
