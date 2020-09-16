Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75926BC8E
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 08:19:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A4EB86A27;
	Wed, 16 Sep 2020 06:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89LT-5yHpSkj; Wed, 16 Sep 2020 06:19:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 764748699E;
	Wed, 16 Sep 2020 06:19:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B112C0051;
	Wed, 16 Sep 2020 06:19:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A9DFC0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 071CD20116
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4aiKsr7MLTs for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 06:19:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 1CE4220010
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OKUyp8qmBFdjgjSYZqN9BFape1Q+ujb81GF9JqUrmy4=; b=iv+7DX+SEc3dNxqeIV8/nkfVbB
 b8Lum5kjOnVL9p18MOyOEipnedUAVsZV998T08r8nDJ02qfiuI/OgxE6TrNC1S/sLldjIpqNBxhiw
 MA3WIZB3Y4Zzb/Hk6uowbpUfXK9eR3CMyPDDGitUJIey9L4b8l93eS6J6bspuTpwC4xJ85gf6KbPf
 bVB8wuuk2DiR3MiZ5+m9zHgRDn6NFKEb9pbvhd9oRnAcmCJDWr66tQ9dczrwhPtFFS2fb/z2L+Etj
 MH01yErQGFs2r2jEivDe8YxNcCLorZwZ3us0tOZdbOVFAw7gUguBFGXYXX0YwNXWa827pKuo7Uftf
 hSyixgbw==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIQmo-0006uo-Dj; Wed, 16 Sep 2020 06:19:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/6] ARM/dma-mapping: remove a __arch_page_to_dma #error
Date: Wed, 16 Sep 2020 08:14:54 +0200
Message-Id: <20200916061500.1970090-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916061500.1970090-1-hch@lst.de>
References: <20200916061500.1970090-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-sh@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>, linux-usb@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>,
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

The __arch_page_to_dma hook is long gone.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/dma-mapping.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
index bdd80ddbca3451..70d95677656044 100644
--- a/arch/arm/include/asm/dma-mapping.h
+++ b/arch/arm/include/asm/dma-mapping.h
@@ -23,10 +23,6 @@ static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
 	return NULL;
 }
 
-#ifdef __arch_page_to_dma
-#error Please update to __arch_pfn_to_dma
-#endif
-
 /*
  * dma_to_pfn/pfn_to_dma/dma_to_virt/virt_to_dma are architecture private
  * functions used internally by the DMA-mapping API to provide DMA
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
