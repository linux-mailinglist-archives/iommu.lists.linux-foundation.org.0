Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF225D9D8
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 15:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 36BDB2E1C0;
	Fri,  4 Sep 2020 13:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omx3tjMlVnBe; Fri,  4 Sep 2020 13:35:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 38CD02E1B1;
	Fri,  4 Sep 2020 13:35:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 285AAC0051;
	Fri,  4 Sep 2020 13:35:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A3C7C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 13:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CA82587517
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 13:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb7F3alsyrbr for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 13:35:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9EADC87450
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 13:35:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133500euoutp0109728a301332c86e233b7da4ac7813aa~xmAd-T2UA0639206392euoutp018
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904133500euoutp0109728a301332c86e233b7da4ac7813aa~xmAd-T2UA0639206392euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226500;
 bh=NYnvbPyOZLQo1/GIrDI7koIGvh87V0ObJK4eb3EwqSA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GVKFJM05jvZj1B3dZiNYfwU8wbaU0DxiwcabSUB85S6or50AHyqMR/cqoQT11z6Ae
 OynzUV2+IBCIAGX6nHHpdz/qJMzTVuNngqSvhqHAb44WzJX3uQmWCknCxdeGtGLynk
 TIA+MthllyEJL/CGgBTbmvfQqbpWZ5siozM9KAC8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133500eucas1p193aed082236213c3dc90e2875068ab4b~xmAdq5fdD2307423074eucas1p1O;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 55.39.06318.482425F5; Fri,  4
 Sep 2020 14:35:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133459eucas1p10b98861f36318ef07dcbc58f7e4ad5d1~xmAdHPSf00114101141eucas1p10;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133459eusmtrp261dc1c68676e4f23158f3dcf246acd65~xmAdGh6F70905709057eusmtrp2k;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-96-5f5242843853
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3B.AE.06314.382425F5; Fri,  4
 Sep 2020 14:34:59 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133459eusmtip113f586ab99fbf448d92bbaa77cfb43f6~xmAcgZabh1941819418eusmtip1H;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 10/30] drm: mediatek: use common helper for a
 scatterlist contiguity check
Date: Fri,  4 Sep 2020 15:16:51 +0200
Message-Id: <20200904131711.12950-11-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJKsWRmVeSWpSXmKPExsWy7djP87otTkHxBrdbhCx6z51kstg4Yz2r
 xaLeXhaL/9smMltc+fqezWLl6qNMFgv2W1t8ufKQyWLT42usFpd3zWGzuNx8kdFi7ZG77BZN
 LcYWd++dYLE4+OEJqwO/x5p5axg99n5bwOKxc9Zddo9NqzrZPLZ/e8Dqcb/7OJPH5iX1Hrf/
 PWb2mHxjOaPH7psNbB79fw08+rasYvT4vEkugDeKyyYlNSezLLVI3y6BK+P+LYWC53wV2y4t
 YGtgXM/TxcjJISFgItHwZStzFyMXh5DACkaJDS0L2SCcL4wS+z/MYIVwPjNKtM1vZoFpeXNq
 F1TVckaJlonnWOFa7jdvZwSpYhMwlOh628UGYosItDJKnOjlASliFtjDLLFo1y+wUcICCRLX
 n7aDFbEIqEqsePkBzOYVsJNouXWCHWKdvMTqDQeYQWxOoPjWGU/AtkkI3GKX2L23hxmiyEXi
 6ttnUA3CEq+Ob4GyZST+75zPBNHQzCjx8Nxadginh1HictMMRogqa4k7534BreYAuk9TYv0u
 fYiwo8STS5MZQcISAnwSN94KgoSZgcxJ26YzQ4R5JTrahCCq1SRmHV8Ht/bghUtQp3lI3H0/
 CRrCExklrlw7yDSBUX4WwrIFjIyrGMVTS4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAhPY6X/H
 v+5g3Pcn6RCjAAejEg8vg31QvBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosP
 MUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYKx7uXD/Edtlcu9Msn/8a1iwv1tl9e6J
 6wsP6oe9aOo7wSX0l1nGY07apqWrvl9/k38pJdUr/OSHvveMPtbSQuqW13MPJ5zfND8jfurM
 5erxrj4+NX9Nn8iyPTv4J7D0n1RXHqtkglzcjaINRR8/CVd9Nrp4eOK12twmsycX01b8aTNc
 LGPnv1mJpTgj0VCLuag4EQCikimuXAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7rNTkHxBqtna1n0njvJZLFxxnpW
 i0W9vSwW/7dNZLa48vU9m8XK1UeZLBbst7b4cuUhk8Wmx9dYLS7vmsNmcbn5IqPF2iN32S2a
 Wowt7t47wWJx8MMTVgd+jzXz1jB67P22gMVj56y77B6bVnWyeWz/9oDV4373cSaPzUvqPW7/
 e8zsMfnGckaP3Tcb2Dz6/xp49G1ZxejxeZNcAG+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
 iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsb9WwoFz/kqtl1awNbAuJ6ni5GTQ0LAROLNqV1s
 XYxcHEICSxklHn9+xw6RkJE4Oa2BFcIWlvhzrQuq6BOjxKr7fWBFbAKGEl1vIRIiAp2MEtO6
 P7KDOMwCx5glNj5+zwxSJSwQJ/H/yj8mEJtFQFVixcsPbCA2r4CdRMutE1Dr5CVWbzgAVs8J
 FN864wnYaiEBW4kPcxazTGDkW8DIsIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwnrYd+7l5
 B+OljcGHGAU4GJV4eBnsg+KFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjR
 FOioicxSosn5wFjPK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA
 qLlcdXfv2fXrhA/OOmqmWFewNZJZj//YdXV/zYT0TbkpbKHX+A+G/eg1vOCZ7f3gX3eC2JXA
 kKv2MQ9ztki9XjxdLr2j5KngfwfHPTHZS+4ae1+Krc86PdGLUzY99UdepcWiVhu1pMm7brD+
 eLgh8sN/Z/Zbd46+6frXtPxP4K6obNeOyVztSizFGYmGWsxFxYkAKTW6dr0CAAA=
X-CMS-MailID: 20200904133459eucas1p10b98861f36318ef07dcbc58f7e4ad5d1
X-Msg-Generator: CA
X-RootMTR: 20200904133459eucas1p10b98861f36318ef07dcbc58f7e4ad5d1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133459eucas1p10b98861f36318ef07dcbc58f7e4ad5d1
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133459eucas1p10b98861f36318ef07dcbc58f7e4ad5d1@eucas1p1.samsung.com>
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
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 28 ++++++--------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 6190cc3b7b0d..3654ec732029 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -212,37 +212,21 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
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
-		if (!sg_dma_len(s))
-			break;
-
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
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
