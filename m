Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E187930BB61
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 10:51:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 881F18589C;
	Tue,  2 Feb 2021 09:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9lUlnXySpiN; Tue,  2 Feb 2021 09:51:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EEE958593F;
	Tue,  2 Feb 2021 09:51:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7CC9C1DA8;
	Tue,  2 Feb 2021 09:51:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFFE7C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 09:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A2219214EC
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 09:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id as8bOX+OP24t for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 09:51:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 1FB102042C
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 09:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=QTGwZsHUykjIplzXOpellqEP0wlz0ReWLq9Jccm8VmE=; b=bEaPt84LngP64M0S0FFor0M6mU
 k2kConm0zblT0nwONmZm0KLMNpUz6aR5G4+gxRdbwpI7kjqsNiQL45IRMHIwEy1yoY1wQEjkYmgBH
 NAO9hOgpFGFepC2hcCYmA6F+7xmltXrBFrKe2S+gtu05T8Xa8Rm7sLCyVbeDD5vZLYgb2bzzNTlO/
 StrExNLDIGuo9gtGO1NQa03DsAxK/8m12hwmTS0AM9J7GlEtzUTqwUmkIbkcRQRtsdDZXdxTkzblY
 1kHfg7WZCwVNnLbrhfvHoI7LNQvQOBTZIdTdvk0P9QSD1m3JCFVJ8qcUZJzXa/SAZFEBnwZoOMM5Y
 M6aH9/Dg==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6sL1-00F0vV-Nz; Tue, 02 Feb 2021 09:51:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Sergey Senozhatsky <senozhatsky@google.com>,
 iommu@lists.linux-foundation.org
Subject: add a new dma_alloc_noncontiguous API v2
Date: Tue,  2 Feb 2021 10:51:03 +0100
Message-Id: <20210202095110.1215346-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

Hi all,

this series adds the new noncontiguous DMA allocation API requested by
various media driver maintainers.

Changes since v1:
 - document that flush_kernel_vmap_range and invalidate_kernel_vmap_range
   must be called once an allocation is mapped into KVA
 - add dma-debug support
 - remove the separate dma_handle argument, and instead create fully formed
   DMA mapped scatterlists
 - use a directional allocation in uvcvideo
 - call invalidate_kernel_vmap_range from uvcvideo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
