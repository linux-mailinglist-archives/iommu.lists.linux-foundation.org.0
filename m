Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B969F1C50D1
	for <lists.iommu@lfdr.de>; Tue,  5 May 2020 10:46:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6BFA9878A4;
	Tue,  5 May 2020 08:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Phm9Z-Fsj7V2; Tue,  5 May 2020 08:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EAB8487839;
	Tue,  5 May 2020 08:46:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D431FC0175;
	Tue,  5 May 2020 08:46:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4768EC0175
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 08:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 35D19855B5
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 08:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PR3JEC6Tqjdc for <iommu@lists.linux-foundation.org>;
 Tue,  5 May 2020 08:46:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7BEB9858FC
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 08:46:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084639euoutp01a02a1b4b1f0d11596b51ecc92e75d12c~MFX3qFlNU0326103261euoutp01t
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 08:46:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084639euoutp01a02a1b4b1f0d11596b51ecc92e75d12c~MFX3qFlNU0326103261euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668399;
 bh=TxE/6G1g28mmKh7hooUAC2aT+D+6azanETRBOwRYElg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=omkg7R3W/3Q2Bl+cb32xRIYW7VX/up76W1blrssWmzK4/YV9vkZmGlUAHrftdH/ky
 sBm3jWLZP1zBzJJT1oktuawgrGb+xZ++K3Cust+asUCXnN8sc9seby6u1Iz1mdAPcQ
 6J8uGx4WXNmvPiCCXkEoHiF7i93T48TUIMuyi/8U=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084638eucas1p14d6b13af09eff6253e2019c1163d2ea3~MFX3YaiQa2425224252eucas1p1F;
 Tue,  5 May 2020 08:46:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 54.42.60679.EE721BE5; Tue,  5
 May 2020 09:46:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084638eucas1p24f356b441a3589e9528d239c0b9ac666~MFX28WU0-1948219482eucas1p2b;
 Tue,  5 May 2020 08:46:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084638eusmtrp186bd6d7ec444ca0de6918ea0b42f52cb~MFX27rb8P0969409694eusmtrp1G;
 Tue,  5 May 2020 08:46:38 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-58-5eb127ee86c4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A1.24.08375.EE721BE5; Tue,  5
 May 2020 09:46:38 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084637eusmtip174e6b9fe26a7b71a38ddfeb81a667898~MFX2aZfgP0580805808eusmtip1C;
 Tue,  5 May 2020 08:46:37 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 24/25] samples: vfio-mdev/mbochs: fix common struct
 sg_table related issues
Date: Tue,  5 May 2020 10:46:13 +0200
Message-Id: <20200505084614.30424-24-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRjmO7edTSenafhhkTDIMEjTJA4YZuCPE4hFEYaVecqDl9y0zVku
 SmkosZx4KROvQzKvc9PUeSHU5TVBRMW0LJP5J2tecomZaZsH699ze9/n5eMjUUkb7kUmyFM5
 hZxNkhIirH3w19iJ5WPN0ScLKvxp3dgIQjcXG3F6tz0fpad+rhB0XcMAQut7gumy53fp1tFy
 QNunFhC6xTqN05NdZQRt6P8koPtWF/FQMdNY0QiYNxt6jDFvfMGZ+adDCPP6ZQbzcceKMoUz
 NYDpns0kGJ1mmWByW+sBs95y5KJLlOhMLJeUkMYp/ENiRPGzVVlYitnt/nDZWzwT5LhqgZCE
 VBDMqm4mtEBESqhaADs2DbjTkFB2ALsqhbyxDuBW+ziyP/H5R72AN2oAzLUaMJ44JpqWnhHO
 FEEFQK1Nu4c9qCwAh3WuzhBKTSPQ9md5r8OdioH2ueo9jFFHoeZ3EebEYioEduvacL7OGzaY
 elEnFjp068Tc3rGQGhTAfsuM4w7SQcJg7bKKz7vDpaFWAY8Pw9HCHIzPawBcGDMIeJID4OTj
 YsCnguHc2BbhXIRSvtDY5c/L56B2Y5Lg97vBGdsBp4w6YEH7C5SXxfBJtoRP+8CSoaZ/tX3j
 EyiPGdihK0f4BxoA8FvnNp4HvEv+l+kBqAeenEopi+OUgXLunp+SlSlV8ji/28myFuD4TKM7
 Q/YO0LV9ywIoEkhdxVfXjdESnE1TpsssAJKo1EP8atMULRHHsulqTpF8U6FK4pQWcIjEpJ7i
 U1Vfb0ioODaVu8NxKZxi30VIoVcmuD59xdOXuyDUtLi72gK9Dk7YXUJDdksLY2cNlS+ljfLz
 a8YPrCg/rzCMLE3vaauJnI84PZzNvFttCnp4afOyLUKv3vierk40g7pJtQaPmusuD/fpdFs0
 XRsxv1eZM4rid1WayhnfLWO1XZIYzvaeHX2wsiZzMyVK4aOiyEgppoxnA46jCiX7Fz5EzGxI
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xu7rv1DfGGey5L2jRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9tMWdqocWW03MZLb5cechksenxNVaLy7vmsFmsPXKX3eLg
 hyesDrwea+atYfTY+20Bi8f2bw9YPe53H2fy2Lyk3uP2v8fMHpNvLGf02H2zgc2jt/kdm0ff
 llWMHp83yQVwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehl3FzUylKwna/ixJzDrA2MPTxdjJwcEgImEvc+rWLvYuTiEBJYyiix//ouFoiEjMTJ
 aQ2sELawxJ9rXWwQRZ8YJR6f/whWxCZgKNH1FiIhItDJKDGt+yM7SIJZ4B6TxN51fiC2sECc
 xNrNcxlBbBYBVYnm39PAmnkF7CR2926F2iAvsXrDAWYQmxMo/vjSHTYQW0igUOLD+e+sExj5
 FjAyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMlG3Hfm7ewXhpY/AhRgEORiUe3ojP6+OE
 WBPLiitzDzFKcDArifAu+7EhTog3JbGyKrUoP76oNCe1+BCjKdBRE5mlRJPzgVGcVxJvaGpo
 bmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB0WDZBFGvy0efej3/vNFwUvnq
 7Y+P9t25sOyPjaDdzg/1fZuuaMVvUF+4KkRLeLIi5+sLf9/O2pJYzcG2yXqzaPG561YH8sIS
 NuxL+OLNGrR760KPOes3HzKO4fEpKTeN2Za65cTOG4vi7GYL2K1Yv7u5N4dpuUzs+Y6jqd9f
 fjj96Kcd58uVivOUWIozEg21mIuKEwHQUyHvqgIAAA==
X-CMS-MailID: 20200505084638eucas1p24f356b441a3589e9528d239c0b9ac666
X-Msg-Generator: CA
X-RootMTR: 20200505084638eucas1p24f356b441a3589e9528d239c0b9ac666
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084638eucas1p24f356b441a3589e9528d239c0b9ac666
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084638eucas1p24f356b441a3589e9528d239c0b9ac666@eucas1p2.samsung.com>
Cc: kvm@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Kirti Wankhede <kwankhede@nvidia.com>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>,
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

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. A common mistake was to ignore a result
of the dma_map_sg function and don't use the sg_table->orig_nents at all.

To avoid such issues, lets use common dma-mapping wrappers operating
directly on the struct sg_table objects and adjust references to the
nents and orig_nents respectively.

While touching this code, also add missing call to dma_unmap_sgtable.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 samples/vfio-mdev/mbochs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 3cc5e59..f2c62e0 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -846,7 +846,7 @@ static struct sg_table *mbochs_map_dmabuf(struct dma_buf_attachment *at,
 	if (sg_alloc_table_from_pages(sg, dmabuf->pages, dmabuf->pagecount,
 				      0, dmabuf->mode.size, GFP_KERNEL) < 0)
 		goto err2;
-	if (!dma_map_sg(at->dev, sg->sgl, sg->nents, direction))
+	if (dma_map_sgtable(at->dev, sg, direction))
 		goto err3;
 
 	return sg;
@@ -868,6 +868,7 @@ static void mbochs_unmap_dmabuf(struct dma_buf_attachment *at,
 
 	dev_dbg(dev, "%s: %d\n", __func__, dmabuf->id);
 
+	dma_unmap_sgtable(at->dev, sg, direction);
 	sg_free_table(sg);
 	kfree(sg);
 }
-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
