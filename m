Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0941CF070
	for <lists.iommu@lfdr.de>; Tue, 12 May 2020 11:01:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5026486F86;
	Tue, 12 May 2020 09:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ss3EsnqttxX7; Tue, 12 May 2020 09:01:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A947B86FCB;
	Tue, 12 May 2020 09:01:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95D09C088E;
	Tue, 12 May 2020 09:01:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45631C0893
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2010C260A9
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuTlbknTMO0I for <iommu@lists.linux-foundation.org>;
 Tue, 12 May 2020 09:01:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by silver.osuosl.org (Postfix) with ESMTPS id 4706E20028
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:01:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090126euoutp02a164cb99f93f5655ac5d737ded0bbbfb~OPFyPXB0u0533205332euoutp02G
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:01:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090126euoutp02a164cb99f93f5655ac5d737ded0bbbfb~OPFyPXB0u0533205332euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274086;
 bh=o/aCARzJwJTnWYrVIUdYxc2kaVWzrvt/p7+Fv68pjNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QC0pLNt0NDFg9xhMeBjlKAjU52X2Aqb05u2NP829rg2DP0NMNutZzDWNxi13R/rza
 1F8yHG6JTHxF8pshFMRRa9YzYKReZ5gIjWjXJ3uW5NR/xjGKpNOXVx02VujufT+auu
 XMZ5thBEaLl2FwiAklnBJf/9YkW7tjEkGqrMI210=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512090126eucas1p1ad3aa81a22272b2f8362c0e54cc28da1~OPFx219V53053030530eucas1p1w;
 Tue, 12 May 2020 09:01:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 19.7B.60698.6E56ABE5; Tue, 12
 May 2020 10:01:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090125eucas1p1f9eae024a33e92bf1468f2af4e5a1b0a~OPFxWZlID0608306083eucas1p1W;
 Tue, 12 May 2020 09:01:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090125eusmtrp20f8cd9809ad7b4259581f2a15175de0b~OPFxVhpQw0472704727eusmtrp2V;
 Tue, 12 May 2020 09:01:25 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-55-5eba65e6c2fb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0D.45.08375.5E56ABE5; Tue, 12
 May 2020 10:01:25 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090124eusmtip175a978494a4435069084cff88dec0811~OPFwkp7sM1352513525eusmtip1O;
 Tue, 12 May 2020 09:01:24 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 31/38] staging: ion: remove dead code
Date: Tue, 12 May 2020 11:00:51 +0200
Message-Id: <20200512090058.14910-31-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa1CMURzG5+x7bbW8VnQml1iTwUgqckxEbnM+JcYHw4jFO9XUVna7yLis
 YodVEo0uurmmC11kaVWrSNdJRKSyJeSWUjIVym6vy7ff//k/z3nOnDksIe2jbFjfgGBeGSD3
 l9FiUvdw6JH9O17vtag/gkPR9dUi1PPLSKP8hFwKHfkyG43qYglUXDfMoKcDPTSKvJRLo8zs
 ChFKN7iiq2o7lFk8KELfnnaIUEFnE4Ua9ck0uv6gjUG6HDWFynrfUKimrZ9B6U3DzCorrLur
 o3BOag7Av1K+EvhV6X0Sl3xPJ/GFvgEKtzYV0/j293YKG1JyGGw8WSnCNy8fxi0jnQQ++yID
 4LvNahr3lD6j8anCLOA5cat4+R7e3zeUVzq47RT73GmtZYI6JPteFi9Tg+5xWmDBQm4xjH77
 mtICMSvlrgFYWPcWCMM3AKtbH9DC0A/gFU2i6G/kyuNaQlhkAFhUW/o/MtIVyZhdNOcItd1a
 2sxW3DEAq6ItzSaCi6Lgh7y8scUkDsEfHRFjTHJ2UBdTRplZwrlBTWwcI9TZwuy8e4SZLUy6
 Me0naT4IcoksPFc3SAqmtTDR8IkWeBL8WFn4JzwNjhaliYRAJIAd9dcZYYgCsDEiAQguV9ha
 P2xKs6b7zYO5egdBdofJ541jMuTGwxfdE80yYcIzunhCkCXwuEYquOfApMob/2rLGp4QAmOY
 klT157kqALyXepM5DWyT/pelA5AFrPkQlcKbVzkH8GELVXKFKiTAe+HuQEUBMP3E2pHKgTug
 9OeucsCxQGYpOe5U5CWl5KGqcEU5gCwhs5Ic9TVJkj3y8P28MnCHMsSfV5WDqSwps5Y4X/yw
 Xcp5y4N5P54P4pV/tyLWwkYNWNLJEJUvrpGFhlcUejq6KTY7THbZb3Dd0rlhZgzBSM5OcfH1
 qV+jL9q7Qr9g09CE5/EuuStLzrxfn1juvGI1LaOOelivCTvkl6lpOHAw2cd/47Ilw/lxsXuf
 tRs1szxmyE5EZXQxfXNvxLVPz4jWjW5rse+9ZVu19LN787pIRW+Mu4xU+cgd5xNKlfw3k49x
 g4UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xu7pPU3fFGczv0LHoPXeSyeL93/ts
 FhtnrGe1aHynbPF/20Rmiz1nfrFbXPn6ns2iefF6NouVq48yWSzYb22xrEHVYuWeH0wWX648
 ZLLY9Pgaq8XlXXPYLNYeuctusW1NA6vFwQ9PWC1O3f3MbrHg2i92BxGPbbu3sXqsmbeG0ePv
 3I/MHvf2HWbx2PttAYvHwk9fWT3uXNvD5rH92wNWj/1z17B73O8+zuSxeUm9x+1/j5k9Jt9Y
 zuix+2YDm8f7fVfZPPq2rGIMEIzSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIy
 VdK3s0lJzcksSy3St0vQy9hx5zR7wUPeilt7LBsY33J3MXJySAiYSCy9eJq5i5GLQ0hgKaNE
 Y89mZoiEjMTJaQ2sELawxJ9rXWwQRZ8YJbbfmwCWYBMwlOh6C5EQEehklJjW/ZEdxGEWmMEq
 se7APXaQKmEBC4nfD5vYQGwWAVWJbf0Hwbp5Bewk2iZOYYdYIS+xesMBsNWcQPH78/+wgNhC
 AoUSj66+ZZnAyLeAkWEVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYIRuO/Zz8w7GSxuDDzEK
 cDAq8fB2GO2ME2JNLCuuzD3EKMHBrCTC25IJFOJNSaysSi3Kjy8qzUktPsRoCnTURGYp0eR8
 YPLIK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAmB69ZeIug+Zj
 TLvXC11he7nJ9s/tDQxNgs43Cqqv+TJYrzd+krIq0FaFyT7PYl1+kvt25rl77m593Xvq3lpu
 iZALYrmLQ3zuGvRe0XnQX9eQ3ZCwcu9+Rw92D/ecO99Oi6jLOe+VFtxnFGJ0bqleeShLbs1p
 i5jTiTal9y6LKS/hy/r7KuuKEktxRqKhFnNRcSIAzswn4+YCAAA=
X-CMS-MailID: 20200512090125eucas1p1f9eae024a33e92bf1468f2af4e5a1b0a
X-Msg-Generator: CA
X-RootMTR: 20200512090125eucas1p1f9eae024a33e92bf1468f2af4e5a1b0a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090125eucas1p1f9eae024a33e92bf1468f2af4e5a1b0a
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090125eucas1p1f9eae024a33e92bf1468f2af4e5a1b0a@eucas1p1.samsung.com>
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>,
 Daniel Vetter <daniel@ffwll.ch>, Joel Fernandes <joel@joelfernandes.org>,
 Laura Abbott <labbott@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

ion_heap_pages_zero() function is not used at all, so remove it to
simplify the ion_heap_sglist_zero() function later.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/staging/android/ion/ion.h      | 1 -
 drivers/staging/android/ion/ion_heap.c | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/android/ion/ion.h b/drivers/staging/android/ion/ion.h
index 74914a2..c199e88 100644
--- a/drivers/staging/android/ion/ion.h
+++ b/drivers/staging/android/ion/ion.h
@@ -177,7 +177,6 @@ struct ion_heap {
 int ion_heap_map_user(struct ion_heap *heap, struct ion_buffer *buffer,
 		      struct vm_area_struct *vma);
 int ion_heap_buffer_zero(struct ion_buffer *buffer);
-int ion_heap_pages_zero(struct page *page, size_t size, pgprot_t pgprot);
 
 /**
  * ion_heap_init_shrinker
diff --git a/drivers/staging/android/ion/ion_heap.c b/drivers/staging/android/ion/ion_heap.c
index 0755b11..9c23b23 100644
--- a/drivers/staging/android/ion/ion_heap.c
+++ b/drivers/staging/android/ion/ion_heap.c
@@ -145,15 +145,6 @@ int ion_heap_buffer_zero(struct ion_buffer *buffer)
 	return ion_heap_sglist_zero(table->sgl, table->nents, pgprot);
 }
 
-int ion_heap_pages_zero(struct page *page, size_t size, pgprot_t pgprot)
-{
-	struct scatterlist sg;
-
-	sg_init_table(&sg, 1);
-	sg_set_page(&sg, page, size, 0);
-	return ion_heap_sglist_zero(&sg, 1, pgprot);
-}
-
 void ion_heap_freelist_add(struct ion_heap *heap, struct ion_buffer *buffer)
 {
 	spin_lock(&heap->free_lock);
-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
