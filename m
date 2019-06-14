Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1245434
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 07:46:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BED5DDD0;
	Fri, 14 Jun 2019 05:46:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 833F3B7A
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 05:46:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E0DF7E5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 05:46:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0084DADF1;
	Fri, 14 Jun 2019 05:46:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] xen/swiotlb: remember having called
	xen_create_contiguous_region()
Date: Fri, 14 Jun 2019 07:46:04 +0200
Message-Id: <20190614054604.30101-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190614054604.30101-1-jgross@suse.com>
References: <20190614054604.30101-1-jgross@suse.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Instead of always calling xen_destroy_contiguous_region() in case the
memory is DMA-able for the used device, do so only in case it has been
made DMA-able via xen_create_contiguous_region() before.

This will avoid a lot of xen_destroy_contiguous_region() calls for
64-bit capable devices.

As the memory in question is owned by swiotlb-xen the PG_owner_priv_1
flag of the first allocated page can be used for remembering.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2: add PG_xen_remapped alias for PG_owner_priv_1 (Boris Ostrovsky)
    only clear page flag in case of sane conditions (Jan Beulich)
V3: use TestClearPageXenRemapped() (Jan Beulich)
---
 drivers/xen/swiotlb-xen.c  | 4 +++-
 include/linux/page-flags.h | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 37ddcfcfbb21..ceb681cf64bb 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -322,6 +322,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
 			return NULL;
 		}
+		SetPageXenRemapped(virt_to_page(ret));
 	}
 	memset(ret, 0, size);
 	return ret;
@@ -346,7 +347,8 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
 	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
-		     range_straddles_page_boundary(phys, size)))
+		     range_straddles_page_boundary(phys, size)) &&
+	    TestClearPageXenRemapped(virt_to_page(vaddr)))
 		xen_destroy_contiguous_region(phys, order);
 
 	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 9f8712a4b1a5..fc503a47e7db 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -152,6 +152,8 @@ enum pageflags {
 	PG_savepinned = PG_dirty,
 	/* Has a grant mapping of another (foreign) domain's page. */
 	PG_foreign = PG_owner_priv_1,
+	/* Remapped by swiotlb-xen. */
+	PG_xen_remapped = PG_owner_priv_1,
 
 	/* SLOB */
 	PG_slob_free = PG_private,
@@ -329,6 +331,8 @@ PAGEFLAG(Pinned, pinned, PF_NO_COMPOUND)
 	TESTSCFLAG(Pinned, pinned, PF_NO_COMPOUND)
 PAGEFLAG(SavePinned, savepinned, PF_NO_COMPOUND);
 PAGEFLAG(Foreign, foreign, PF_NO_COMPOUND);
+PAGEFLAG(XenRemapped, xen_remapped, PF_NO_COMPOUND)
+	TESTCLEARFLAG(XenRemapped, xen_remapped, PF_NO_COMPOUND)
 
 PAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
 	__CLEARPAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
-- 
2.16.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
