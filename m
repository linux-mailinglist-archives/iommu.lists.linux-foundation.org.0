Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A992A9AD7
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 18:32:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF60386A3C;
	Fri,  6 Nov 2020 17:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-SKexwmAra4; Fri,  6 Nov 2020 17:32:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7EBD386A1A;
	Fri,  6 Nov 2020 17:32:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77D59C0889;
	Fri,  6 Nov 2020 17:32:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D52ABC0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C420D86A1A
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueOV8V15PnMJ for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 17:32:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6219086A14
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vIAzFRE+nSs1Od5bUBFlY5DkV6P9QVEcl+CPAdcAk/o=; b=Riax6Lm6nK77suGcEtPdixJhwy
 ogbah0pJjRO+uUgDRRm0EctKlaLGBbG334qFWcO79vuSi8DoHii0sc7wt302kKLgaigv0cWhnI97t
 OU7nnol7v3/zBlNUx3qbZHaCUmEpV6KS3edRY82zksvqjILrVN1Oul79VgT6ObquLVsmhd8ZcVjIG
 GCBI1aMUZGpX6IFNeg6XUdXUWn6Tt2k/bfDcVLRRel0atZPC4U6EpYZMj6muUdZuMaS4W9Sw4C+MO
 hi3fTyRMlllHav4rwT1z952XjcqfpbKk1CV4kKjjg3CAIR8vkG3b59XdJN4Bt1qUvyC5S0Jn3JcJi
 ZT21YM0Q==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1kb56f-0002PV-5e; Fri, 06 Nov 2020 10:00:58 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1kb56V-0004tN-K4; Fri, 06 Nov 2020 10:00:47 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
Date: Fri,  6 Nov 2020 10:00:33 -0700
Message-Id: <20201106170036.18713-13-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201106170036.18713-1-logang@deltatee.com>
References: <20201106170036.18713-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com, hch@lst.de,
 jgg@ziepe.ca, christian.koenig@amd.com, dan.j.williams@intel.com,
 iweiny@intel.com, jhubbard@nvidia.com, ddutile@redhat.com, willy@infradead.org,
 daniel.vetter@ffwll.ch, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [RFC PATCH 12/15] block: Set FOLL_PCI_P2PDMA in
 __bio_iov_iter_get_pages()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: John Hubbard <jhubbard@nvidia.com>, Ira Weiny <iweiny@intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dan Williams <dan.j.williams@intel.com>, Stephen Bates <sbates@raithlin.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
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
iov_iter_get_pages_flags(). This allows PCI P2PDMA pages to be passed
from userspace and enables the O_DIRECT path in iomap based filesystems
and direct to block devices.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 block/bio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block/bio.c b/block/bio.c
index fa01bef35bb1..6b28256a5575 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -997,6 +997,7 @@ static int __bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
 	struct bio_vec *bv = bio->bi_io_vec + bio->bi_vcnt;
 	struct page **pages = (struct page **)bv;
 	bool same_page = false;
+	unsigned int flags = 0;
 	ssize_t size, left;
 	unsigned len, i;
 	size_t offset;
@@ -1009,7 +1010,11 @@ static int __bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
 	BUILD_BUG_ON(PAGE_PTRS_PER_BVEC < 2);
 	pages += entries_left * (PAGE_PTRS_PER_BVEC - 1);
 
-	size = iov_iter_get_pages(iter, pages, LONG_MAX, nr_pages, &offset);
+	if (bio->bi_disk && blk_queue_pci_p2pdma(bio->bi_disk->queue))
+		flags |= FOLL_PCI_P2PDMA;
+
+	size = iov_iter_get_pages_flags(iter, pages, LONG_MAX, nr_pages,
+					&offset, flags);
 	if (unlikely(size <= 0))
 		return size ? size : -EFAULT;
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
