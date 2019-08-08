Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB88667C
	for <lists.iommu@lfdr.de>; Thu,  8 Aug 2019 18:01:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3302A115A;
	Thu,  8 Aug 2019 16:00:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 239D21088
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 16:00:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0C0868A6
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n1yjt2X7Jq9I74UVesO3pDwFX28IMKr9d3wsrGu9KqY=;
	b=OwgJF9RIfE/qwoQqR7l8QYGiHB
	bvtV/37DqJIMUHgOulrheG0U8WgeaRxU8A0YhRjwc2L5EZG/4DqstAFRXp8HGdigFTZhK5YXfmfGt
	coPNAmaebVbBbCYlrzrEwVQgyPpWJZzK/LoWey11hO1GSSfv25yrYY8Z0pgbbt7GlOhBeuloKEOr2
	sHJd+APjVNPjjdd5aPQ7yL6A+fIcWuioPHUa46TWdyoBesuGcDHJC5GtLcBgOq+BR5/W3te0GbpbX
	VJQo7Hmi5mAVnw+3z5LnxVbgKzdDo3xnkI8MincpwCcJzOPKhwWYvODcSKcY9dhszhfv1xL9nQzTB
	g3NI+Isg==;
Received: from [195.167.85.94] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hvkqO-0006pM-U7; Thu, 08 Aug 2019 16:00:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/8] arm-nommu: call dma_mmap_from_dev_coherent directly
Date: Thu,  8 Aug 2019 19:00:03 +0300
Message-Id: <20190808160005.10325-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808160005.10325-1-hch@lst.de>
References: <20190808160005.10325-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>, linuxppc-dev@lists.ozlabs.org,
	Helge Deller <deller@gmx.de>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Ther is no need to go through dma_common_mmap for the arm-nommu
dma mmap implementation as the only possible memory not handled above
could be that from the per-device coherent pool.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/dma-mapping-nommu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index 52b82559d99b..db9247898300 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -68,8 +68,9 @@ static int arm_nommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 
 	if (dma_mmap_from_global_coherent(vma, cpu_addr, size, &ret))
 		return ret;
-
-	return dma_common_mmap(dev, vma, cpu_addr, dma_addr, size, attrs);
+	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
+		return ret;
+	return -ENXIO;
 }
 
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
