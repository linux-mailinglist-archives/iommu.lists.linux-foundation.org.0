Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E27554C89B2
	for <lists.iommu@lfdr.de>; Tue,  1 Mar 2022 11:53:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D748980892;
	Tue,  1 Mar 2022 10:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caUuSbEjFCaa; Tue,  1 Mar 2022 10:53:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2B84881307;
	Tue,  1 Mar 2022 10:53:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05374C007B;
	Tue,  1 Mar 2022 10:53:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A896C001A
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77E8960E5C
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6Ui_lfqidPA for <iommu@lists.linux-foundation.org>;
 Tue,  1 Mar 2022 10:53:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E838C60ACE
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8kkkqKTmx4an5HwtAkctrRmIlb8tNewwdnwFgQaeBs4=; b=jLl0j4bSOfVgHsr3MQ5Bv5W25W
 eBCL+ezlRGLhWYJUDEMLnfnY03XvNmRuJ3NVkaIN+j91e7hLR85KeZAUrre7FDsYIGG5LJVefqfFQ
 aBw4XS4clVWlj8OlW5+no9SoBD1TeUv7rQYDWrKf4OHZIcAUPacEQWejKAQpzWZV4sMB16ogBdJNd
 BYo+cef7t0HrzSLXHOj4597NsWHTixNewjzb8+eB6sepbzbOCAKRdiYjQ0SKHJwpHXjDNI+7jB/Nl
 V6d7NCk96h2kf6oMslvOoIEJGHn3fDqOVyBakQxgHeZAYF5ayU7+PWsZkl0kSLTP/USHzDRJXcvab
 v9YgSnow==;
Received: from [2.53.44.23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP08A-00GCxm-Dw; Tue, 01 Mar 2022 10:53:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 02/12] swiotlb: make swiotlb_exit a no-op if SWIOTLB_FORCE is
 set
Date: Tue,  1 Mar 2022 12:53:01 +0200
Message-Id: <20220301105311.885699-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301105311.885699-1-hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
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

If force bouncing is enabled we can't release the buffers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 kernel/dma/swiotlb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index bfc56cb217059..64b390136f9ef 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -378,6 +378,9 @@ void __init swiotlb_exit(void)
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
 
+	if (swiotlb_force == SWIOTLB_FORCE)
+		return;
+
 	if (!mem->nslabs)
 		return;
 
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
