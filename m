Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB0268E64
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 16:53:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6939A85B4D;
	Mon, 14 Sep 2020 14:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sb84rMYl1OOK; Mon, 14 Sep 2020 14:53:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0912D85B3D;
	Mon, 14 Sep 2020 14:53:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1FC6C0051;
	Mon, 14 Sep 2020 14:53:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 773AFC0051
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 14:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5E75B87220
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 14:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOHcjWyClKXA for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 14:53:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BBB648721B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=wWR7H3WZih9ZGlGO6OHg+MKLXPw0ngda85sKeqyd2Cw=; b=ifsAl2RrU7KnR1yT2uKbMkDdPl
 XkvmPaEnJfciEndlUDneY+5JqCj8WbUratm+mlOoljGDnRpAblVkHJt5HxwZP88i+1ZeUkb3Q4kPB
 Q0hYtsUAwLyA82WBlvmT34I76tDhu2XUUL+Wln8SIqaM03pjRT6I+XF4gy3lM7lEonWUAF1QtO3nM
 lnZ4Uw3pVPI+sKkkInM9hz/97JfUtGChXNAZFyOdPolUcrlDaG+zPS8jdMSC2Jpjzh5wD/nEzvhrb
 HoIjUlPKR9uBUiALYFS7+3bG6ZWkYeISVrlgBbD0hWEq5oDJFe5+qpgK8BhcxaG9TxulgvC3/PSP2
 H5/a4Rbw==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHpr7-0001jw-Ar; Mon, 14 Sep 2020 14:53:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 03/17] drm/exynos: stop setting DMA_ATTR_NON_CONSISTENT
Date: Mon, 14 Sep 2020 16:44:19 +0200
Message-Id: <20200914144433.1622958-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

DMA_ATTR_NON_CONSISTENT is a no-op except on PARISC and some mips
configs, so don't set it in this ARM specific driver.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index efa476858db54b..07073222b8f691 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -42,8 +42,6 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	if (exynos_gem->flags & EXYNOS_BO_WC ||
 			!(exynos_gem->flags & EXYNOS_BO_CACHABLE))
 		attr |= DMA_ATTR_WRITE_COMBINE;
-	else
-		attr |= DMA_ATTR_NON_CONSISTENT;
 
 	/* FBDev emulation requires kernel mapping */
 	if (!kvmap)
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
