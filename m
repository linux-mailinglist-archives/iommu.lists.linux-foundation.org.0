Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CA71D1546
	for <lists.iommu@lfdr.de>; Wed, 13 May 2020 15:33:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 87DB526351;
	Wed, 13 May 2020 13:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtaXb-HhAOJw; Wed, 13 May 2020 13:33:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3E75622177;
	Wed, 13 May 2020 13:33:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32CF6C016F;
	Wed, 13 May 2020 13:33:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55D36C016F
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 13:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3F60C892B6
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 13:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Op8bptymp4IN for <iommu@lists.linux-foundation.org>;
 Wed, 13 May 2020 13:33:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A47B089200
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 13:33:09 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133307euoutp01c2bd346ff6431659d1d7c803fef9f360~OmcRlNcsq2269422694euoutp01H
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 13:33:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200513133307euoutp01c2bd346ff6431659d1d7c803fef9f360~OmcRlNcsq2269422694euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376787;
 bh=63lQGohYor0znA7PtoKsyn+5okdRMMenYZY4rphErk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=czTVDgpmbB1fqHhgM9zf8z0cj85Tbi++HyhhGzMCzYtolUN3XSicX8UjIS7awfHxD
 JZ/R8EBf00NDWkBmaouLn/k5Hfcji1B4tgGrZBMcq5aOgxi13oaENTGHKlzCM9trhW
 sCZazNgkR/jFCTAGt4ALs/PKlpMTTNVIM5M0kio0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133306eucas1p1b51a94bf57046cb6c3f3a4997bc97aa9~OmcRRmbjw2164721647eucas1p1u;
 Wed, 13 May 2020 13:33:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D5.D8.60698.217FBBE5; Wed, 13
 May 2020 14:33:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133306eucas1p1ab15386cc4bbcf09052a8175d3660997~OmcQ0RUho0874908749eucas1p1h;
 Wed, 13 May 2020 13:33:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133306eusmtrp17acb0e826bf8839bed666e654ab020ee~OmcQzRtpK1050610506eusmtrp1C;
 Wed, 13 May 2020 13:33:06 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-ca-5ebbf712814b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8A.37.07950.217FBBE5; Wed, 13
 May 2020 14:33:06 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133305eusmtip1eeaac7d44d1f5279193afb39c353dc35~OmcQBSTh80741507415eusmtip1i;
 Wed, 13 May 2020 13:33:05 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/38] drm: mediatek: use common helper for a scatterlist
 contiguity check
Date: Wed, 13 May 2020 15:32:21 +0200
Message-Id: <20200513133245.6408-14-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSaUhUURjlzlvmOTn5GiVvKhkjRQm5oNALM1KkXhYZ1K/AZdSXSm7MqKkF
 iZbZuGepDSHjZJl7TuI2lbvjgpIpLriN6A8zLXNcUkybx1P7d875zvnOx+USiKgTsyBCwqMY
 abgkVIwL0NrOzf6zog2Nj0N25Xkqvb+bR1XnV2GUKj0dpXZrsxFqaO0XTpWUdfAoZZMLtTo0
 w6PUs8MYNdj4GqcGkwYAVdE+yacSHztRk1NdKNWyPIddMqHLC8oB/XldidINikk+rS59htN1
 6zqMnk7V8uiPRY/o8Z1ZhM4ZLQa0ZiwBpzP/OtAZNaWA1quP3xTeEVwIZEJDYhip/UU/QfCy
 IjoyzyS2MFWDJYBpYzkwIiDpDMdzhzE5EBAi8j2AWX90gCOrAL5b6cM5ogewp/4tuh8pVFTz
 uUExgGPzSv5B5GVTDsa6cNIRypfkOIvNyCcAdqUbsyaE/IRAVeOWYRVBmJK+cHzlIQtR8iTs
 aXNm7ULSFVaO1PK4MmtY9qEZYbGRQV+YaELZNZCc4sPkIT3gTB6wO2V+L2AKF7Q1fA5bwd6c
 tL1AEoAz/RV8jqQBOJiYv5d2gRP9Wzh7BUKegVWN9pzsBnX6bj4rQ/IwHF06wsqIAT6vzUM4
 WQhTkkWc+xRUaCsPalu+ftuz0HDnzWXuedoA3OzcBVnAWvG/SwlAKTBnomVhQYzMKZy5byeT
 hMmiw4PsAiLC1MDwu3p3tGv14Mu2fysgCSA2FupGND4iTBIjiwtrBZBAxGbCG1UGSRgoiYtn
 pBG+0uhQRtYKLAlUbC50Un33FpFBkijmHsNEMtL9KY8wskgAvMWSnIxRZXuP2nPDW2XFq4gH
 KdqUztgr4piOoJ91s81Fi6/yT/wutTnN2NuiMx4ttwcCfNwRLeZv4zG7PbfUUvdDz5RrJG7n
 nrYf82qfHxvcKHtguXvVXXc3bifTy3M8zjj00GKuZ17A0S3XxhcW0sqihrHIvlvXlNcF8jK/
 AjEqC5Y42iJSmeQf1keEsVkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7pC33fHGcy+L2bRe+4kk8XGGetZ
 LRb19rJY/N82kdniytf3bBYrVx9lsliw39riy5WHTBabHl9jtbi8aw6bxeXmi4wWa4/cZbdo
 ajG2uHvvBIvFwQ9PWB34PdbMW8PosffbAhaPnbPusntsWtXJ5rH92wNWj/vdx5k8Ni+p97j9
 7zGzx+Qbyxk9dt9sYPPo/2vg0bdlFaPH501yAbxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkfZpUWTOevWNi9m7WB8T5PFyMnh4SAicTCWRvZ
 uxi5OIQEljJKbL58iR0iISNxcloDK4QtLPHnWhcbRNEnRoknfceYQBJsAoYSXW8hEiICnYwS
 07o/go1iFjjGLLHx8XtmkCphgViJPzd6gKo4OFgEVCVOHTYBCfMK2Eqsu76NCWKDvMTqDQfA
 yjmB4q/u7GcBsYUE8iX2Lt7HNoGRbwEjwypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAaNp2
 7OeWHYxd74IPMQpwMCrx8Frc2h0nxJpYVlyZe4hRgoNZSYTXbz1QiDclsbIqtSg/vqg0J7X4
 EKMp0E0TmaVEk/OBkZ5XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNT
 qoFxyUSTjBO8S79PKvCevEr5lMybdduMYlhSU49uD389+c7n8kdt0x3Nbu9wXiag/GBfosed
 Lxd5mj48/pS1/vjFZ+pr1F5mqJx+8OcLd8OWyOu/eeb08k+SWLN/hdwt++5IVQNjQ+7Ky21n
 y15KvJ1/I/9GUrm7AtOiJ1rFxvuUX33tZ875peHYq8RSnJFoqMVcVJwIAI8m24y8AgAA
X-CMS-MailID: 20200513133306eucas1p1ab15386cc4bbcf09052a8175d3660997
X-Msg-Generator: CA
X-RootMTR: 20200513133306eucas1p1ab15386cc4bbcf09052a8175d3660997
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133306eucas1p1ab15386cc4bbcf09052a8175d3660997
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133306eucas1p1ab15386cc4bbcf09052a8175d3660997@eucas1p1.samsung.com>
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

Use common helper for checking the contiguity of the imported dma-buf and
do this check before allocating resources, so the error path is simpler.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index b04a3c2..6c34c06 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -212,34 +212,21 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg)
 {
 	struct mtk_drm_gem_obj *mtk_gem;
-	int ret;
-	struct scatterlist *s;
-	unsigned int i;
-	dma_addr_t expected;
 
-	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
+	/* check if the entries in the sg_table are contiguous */
+	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
+		DRM_ERROR("sg_table is not contiguous");
+		return ERR_PTR(-EINVAL);
+	}
 
+	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
 
-	expected = sg_dma_address(sg->sgl);
-	for_each_sg(sg->sgl, s, sg->nents, i) {
-		if (sg_dma_address(s) != expected) {
-			DRM_ERROR("sg_table is not contiguous");
-			ret = -EINVAL;
-			goto err_gem_free;
-		}
-		expected = sg_dma_address(s) + sg_dma_len(s);
-	}
-
 	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
 	mtk_gem->sg = sg;
 
 	return &mtk_gem->base;
-
-err_gem_free:
-	kfree(mtk_gem);
-	return ERR_PTR(ret);
 }
 
 void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
