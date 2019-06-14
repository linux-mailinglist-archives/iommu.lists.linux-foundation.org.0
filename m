Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D245431
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 07:46:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 89A04DCD;
	Fri, 14 Jun 2019 05:46:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 735B6C00
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 05:46:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E63A3711
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 05:46:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 05224AF0B;
	Fri, 14 Jun 2019 05:46:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] xen/swiotlb: fix condition for calling
	xen_destroy_contiguous_region()
Date: Fri, 14 Jun 2019 07:46:02 +0200
Message-Id: <20190614054604.30101-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190614054604.30101-1-jgross@suse.com>
References: <20190614054604.30101-1-jgross@suse.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
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

The condition in xen_swiotlb_free_coherent() for deciding whether to
call xen_destroy_contiguous_region() is wrong: in case the region to
be freed is not contiguous calling xen_destroy_contiguous_region() is
the wrong thing to do: it would result in inconsistent mappings of
multiple PFNs to the same MFN. This will lead to various strange
crashes or data corruption.

Instead of calling xen_destroy_contiguous_region() in that case a
warning should be issued as that situation should never occur.

Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2: always issue a warning in case xen_destroy_contiguous_region()
    isn't called (Jan Beulich)
---
 drivers/xen/swiotlb-xen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index d53f3493a6b9..50fd7de54969 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -361,8 +361,8 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
-	if (((dev_addr + size - 1 <= dma_mask)) ||
-	    range_straddles_page_boundary(phys, size))
+	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
+		     range_straddles_page_boundary(phys, size)))
 		xen_destroy_contiguous_region(phys, order);
 
 	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
-- 
2.16.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
