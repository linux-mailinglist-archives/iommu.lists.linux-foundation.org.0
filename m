Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 667027C7FE
	for <lists.iommu@lfdr.de>; Wed, 31 Jul 2019 18:00:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 021323EC4;
	Wed, 31 Jul 2019 15:59:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3E48A3AA5
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 15:48:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF6B8E7
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 15:48:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 1CBAEB05E;
	Wed, 31 Jul 2019 15:48:11 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
	marc.zyngier@arm.com, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] mm: comment arm64's usage of 'enum zone_type'
Date: Wed, 31 Jul 2019 17:47:51 +0200
Message-Id: <20190731154752.16557-9-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731154752.16557-1-nsaenzjulienne@suse.de>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, f.fainelli@gmail.com, mbrugger@suse.com,
	frowand.list@gmail.com, eric@anholt.net, robh+dt@kernel.org,
	linux-rpi-kernel@lists.infradead.org, akpm@linux-foundation.org,
	will@kernel.org, nsaenzjulienne@suse.de
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

arm64 uses both ZONE_DMA and ZONE_DMA32 for the same reasons x86_64
does: peripherals with different DMA addressing limitations. This
updates both ZONE_DMAs comments to inform about the usage.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

---

 include/linux/mmzone.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index d77d717c620c..8fa6bcf72e7c 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -365,23 +365,24 @@ enum zone_type {
 	 *
 	 * Some examples
 	 *
-	 * Architecture		Limit
-	 * ---------------------------
-	 * parisc, ia64, sparc	<4G
-	 * s390, powerpc	<2G
-	 * arm			Various
-	 * alpha		Unlimited or 0-16MB.
+	 * Architecture			Limit
+	 * ----------------------------------
+	 * parisc, ia64, sparc, arm64	<4G
+	 * s390, powerpc		<2G
+	 * arm				Various
+	 * alpha			Unlimited or 0-16MB.
 	 *
 	 * i386, x86_64 and multiple other arches
-	 * 			<16M.
+	 *				<16M.
 	 */
 	ZONE_DMA,
 #endif
 #ifdef CONFIG_ZONE_DMA32
 	/*
-	 * x86_64 needs two ZONE_DMAs because it supports devices that are
-	 * only able to do DMA to the lower 16M but also 32 bit devices that
-	 * can only do DMA areas below 4G.
+	 * x86_64 and arm64 need two ZONE_DMAs because they support devices
+	 * that are only able to DMA a fraction of the 32 bit addressable
+	 * memory area, but also devices that are limited to that whole 32 bit
+	 * area.
 	 */
 	ZONE_DMA32,
 #endif
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
