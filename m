Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D26E454FD8
	for <lists.iommu@lfdr.de>; Wed, 17 Nov 2021 22:54:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6016F4094D;
	Wed, 17 Nov 2021 21:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILnnYBcJOUy2; Wed, 17 Nov 2021 21:54:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7E0894057E;
	Wed, 17 Nov 2021 21:54:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A90FDC0040;
	Wed, 17 Nov 2021 21:54:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E73BC002E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D5A405FB
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZ_JLFiPMRgV for <iommu@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 21:54:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16C194052B
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=0VjpBnfEXTqeS7LssS80lKjFqlCuU84Zlsdnl3oeMpI=; b=J8/ScGhGR4EfLNA4M8k3xDKWD7
 n4ULq2+t+DpLyaIi3bxE6x5LYJLiNfPGXhhGBk/8GbUZh+NN8f3NGdv7x6SEPwhoYxdNJlcivPnEQ
 34N4FlJBknbNv0EEjOGVU+dcwCk9gkF+db2auvGj9R1uHhfCgzjwx8eIfaY64CqqSFNM0iKCvvOrH
 D3IPcHq9Ed99UDvbzFYJzIbm7RtE5nJvxw58Pks0Mb0AM5Dtmyj6stWXakxiD/JLYty/YeIlJoPHQ
 OQm0q5+ZpC+JPGk/buBZou6WYPa6lEBST4MxCr7xkaRKdZI0b8WlZj3GWTnOMOTizRcx9hY5KhWzA
 ZyCQ+EFA==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1mnSsn-000Zo5-Gu; Wed, 17 Nov 2021 14:54:22 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1mnSsl-00010E-G8; Wed, 17 Nov 2021 14:54:19 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
Date: Wed, 17 Nov 2021 14:54:07 -0700
Message-Id: <20211117215410.3695-21-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117215410.3695-1-logang@deltatee.com>
References: <20211117215410.3695-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com, hch@lst.de,
 jgg@ziepe.ca, christian.koenig@amd.com, jhubbard@nvidia.com,
 ddutile@redhat.com, willy@infradead.org, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, dave.hansen@linux.intel.com, helgaas@kernel.org,
 dan.j.williams@intel.com, andrzej.jakowski@intel.com, dave.b.minturn@intel.com,
 jianxin.xiong@intel.com, ira.weiny@intel.com, robin.murphy@arm.com,
 martin.oliveira@eideticom.com, ckulkarnilinux@gmail.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v4 20/23] block: set FOLL_PCI_P2PDMA in bio_map_user_iov()
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Ira Weiny <ira.weiny@intel.com>, John Hubbard <jhubbard@nvidia.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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

When a bio's queue supports PCI P2PDMA, set FOLL_PCI_P2PDMA for
iov_iter_get_pages_flags(). This allows PCI P2PDMA pages to be
passed from userspace and enables the NVMe passthru requests to
use P2PDMA pages.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 block/blk-map.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 4526adde0156..7508448e290c 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -234,6 +234,7 @@ static int bio_map_user_iov(struct request *rq, struct iov_iter *iter,
 		gfp_t gfp_mask)
 {
 	unsigned int max_sectors = queue_max_hw_sectors(rq->q);
+	unsigned int flags = 0;
 	struct bio *bio;
 	int ret;
 	int j;
@@ -246,13 +247,17 @@ static int bio_map_user_iov(struct request *rq, struct iov_iter *iter,
 		return -ENOMEM;
 	bio->bi_opf |= req_op(rq);
 
+	if (blk_queue_pci_p2pdma(rq->q))
+		flags |= FOLL_PCI_P2PDMA;
+
 	while (iov_iter_count(iter)) {
 		struct page **pages;
 		ssize_t bytes;
 		size_t offs, added = 0;
 		int npages;
 
-		bytes = iov_iter_get_pages_alloc(iter, &pages, LONG_MAX, &offs);
+		bytes = iov_iter_get_pages_alloc_flags(iter, &pages, LONG_MAX,
+						       &offs, flags);
 		if (unlikely(bytes <= 0)) {
 			ret = bytes ? bytes : -EFAULT;
 			goto out_unmap;
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
