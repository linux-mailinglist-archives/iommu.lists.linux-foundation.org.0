Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EECBD25D9C2
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 15:35:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9EA8086C3A;
	Fri,  4 Sep 2020 13:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdKT1XCPfqdt; Fri,  4 Sep 2020 13:35:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9ECAF86C71;
	Fri,  4 Sep 2020 13:35:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83FDBC0051;
	Fri,  4 Sep 2020 13:35:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65FA7C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 13:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CFF8E87529
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 13:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sRRjrpumMmA for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 13:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 13EF7874BF
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 13:35:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133501euoutp029165fe04aa3505ee968a32c9a9a50668~xmAeYBntu2781727817euoutp02f
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 13:35:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133501euoutp029165fe04aa3505ee968a32c9a9a50668~xmAeYBntu2781727817euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226501;
 bh=8ianEPGg4Fj0mBOrYoviW1eRvGacK64D5+qLvfqX6cs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Swn//sbHJE7MhmY8WgRnLTnPYgtFyPKP7Gp80rduiRYurtlCt4Ruq4dB7KJqAsPX6
 bvJ7j8HzASO1leb5zRB19P9JM0IEpZBoTrdlhw+z8KZpTM2W5e9fBuAU0ivFAqRNjZ
 daEQmauqnd0aY80f3MCupr1fkTuv5l0FUyGhQ0hw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133500eucas1p1ae41c3c4948f784f6d3a773b51c1cd27~xmAeGUcdR0117201172eucas1p1s;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.01.06456.482425F5; Fri,  4
 Sep 2020 14:35:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6~xmAd086oh0694006940eucas1p2i;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133500eusmtrp2113c0e9f6e103ab5048de0d1726d3b03~xmAd0KCpP0977009770eusmtrp2B;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-3f-5f52428412b4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 54.A0.06017.482425F5; Fri,  4
 Sep 2020 14:35:00 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133459eusmtip17d41314ad1ec08748b7c67e79b4bd95d~xmAdHYUiq1888418884eusmtip1S;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 11/30] drm: mediatek: use common helper for extracting
 pages array
Date: Fri,  4 Sep 2020 15:16:52 +0200
Message-Id: <20200904131711.12950-12-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRj22zk7Oy5Xx6n5YRdpaaKQd+qAoikGByqK/RApUpeeVNqmbGqp
 RKLLaqVmGcmwJSJ4z5y3vKzyrplWTnSR84L+SEWMvNVIzdNR+/fc3u95eflwRNjPdcDj5Im0
 Qi6RijA+2tjze+ikKlgc4akpdCezh/o5ZG1BDZcszs5Gya3GPIQcWV3CyPLKbg5Z9M6PXBmZ
 5pC6mVEuaWgpxEhD5hdAVneZeGSGyoc0TfShZPuPWe6ZA1SVtgpQ+rUilGrWmHiUruIBRjWt
 TXGpyYe9HKqu5A71bXMGoZ4aSwHV+jUdo3I3PKmc+gpALeuOXhJc5vtH09K4ZFrhERDJjx1f
 q0ETuvm3MtbVWDpYwtXAEoeEL9TOf+CoAR8XEmUALpiMGEtWAFRpJwFLlgFsHcvh7o7MjW0g
 rFEKYKluEOyNDJdt8pgURnhB9aIaY7AtcRfAvmwrJoQQbQgsbjGjjGFDhMGGthHAYJRwhi9y
 s7Y3wXEBEQBVTSFsmyOsfP0eYbDlttxQMMtl3oHEBA+ul5TvrBQC1yo2EBbbwPneeh6LD8Ot
 5pccdiATwOmhah5LHgFoyCgAbMoPjg+ZMaYZIVxhTYsHKwdBQ/HbfzIk9kPjojUjI9vwSeNz
 hJUF8H6WkE2fgJreV3u17Z+Hd9ahoEHfuHPTPADnykY5j4Gj5n9ZEQAVwJ5OUspiaKWXnL7p
 rpTIlEnyGPeoeJkObH+wgc3en2/A6vC1DkDgQGQlsAgURwi5kmRliqwDQBwR2QqCBwfChYJo
 SUoqrYiPUCRJaWUHOISjInuBT/HcVSERI0mkb9B0Aq3YdTm4pUM6SLXr6rAzBU+XfIzUwx77
 +piDLk7eTqrU/HMzeJvr1ML1iwu2oaeLys+KNQ7HLC3EF8L77Af1znHexitp3k2hfjpFoh+d
 bJVS4hHYXjt827zvV35WpDbNeA/vXPK3MZutwwQeIZ2nsvhudv7Hocun83+k6JEo37pn38WI
 LjZIL0KVsRIvN0ShlPwF/3/fkVwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7otTkHxBhtWi1r0njvJZLFxxnpW
 i0W9vSwW/7dNZLa48vU9m8XK1UeZLBbst7b4cuUhk8Wmx9dYLS7vmsNmcbn5IqPF2iN32S2a
 Wowt7t47wWJx8MMTVgd+jzXz1jB67P22gMVj56y77B6bVnWyeWz/9oDV4373cSaPzUvqPW7/
 e8zsMfnGckaP3Tcb2Dz6/xp49G1ZxejxeZNcAG+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
 iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsadb+tZCo5yVTR972JrYHzP0cXIySEhYCLx8vpf
 5i5GLg4hgaWMEo2Pn7BBJGQkTk5rYIWwhSX+XOtigyj6xCix/c8kRpAEm4ChRNdbiISIQCej
 xLTuj+wgDrPAMWaJjY/fM4NUCQuESbSvnsIEYrMIqErM7W8Dsjk4eAXsJFq2u0BskJdYveEA
 WDknUHjrjCdgm4UEbCU+zFnMMoGRbwEjwypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAeNp2
 7OeWHYxd74IPMQpwMCrx8DLYB8ULsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1
 +BCjKdBNE5mlRJPzgbGeVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
 U6qBcZJv3OajVXatrlKJHTE5R24bz9FYxf7X+Mi50sClz1+s51FctnSvR5x2ycbHc2zEBebM
 Vn7HKnttTuEGhewddr90klKfxM8KiLU5wxLln7BXblNk+NHcms/v8pdtYYgLvizVNvHHFD4W
 67X6vhkPZU5e94tSZOnzmTs5/0PBLNUv376JzI3WVGIpzkg01GIuKk4EAOitNhO9AgAA
X-CMS-MailID: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
X-Msg-Generator: CA
X-RootMTR: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6@eucas1p2.samsung.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Use common helper for converting a sg_table object into struct
page pointer array.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 3654ec732029..0583e557ad37 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -233,9 +233,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct sg_table *sgt;
-	struct sg_page_iter iter;
 	unsigned int npages;
-	unsigned int i = 0;
 
 	if (mtk_gem->kvaddr)
 		return mtk_gem->kvaddr;
@@ -249,11 +247,8 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
 	if (!mtk_gem->pages)
 		goto out;
 
-	for_each_sg_page(sgt->sgl, &iter, sgt->orig_nents, 0) {
-		mtk_gem->pages[i++] = sg_page_iter_page(&iter);
-		if (i > npages)
-			break;
-	}
+	drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npages);
+
 	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
 			       pgprot_writecombine(PAGE_KERNEL));
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
