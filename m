Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 64765200690
	for <lists.iommu@lfdr.de>; Fri, 19 Jun 2020 12:37:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18AE688E9A;
	Fri, 19 Jun 2020 10:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cZUFmmkCygA; Fri, 19 Jun 2020 10:37:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FE2E88EA6;
	Fri, 19 Jun 2020 10:37:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE385C016E;
	Fri, 19 Jun 2020 10:37:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A82F8C016E
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 10:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 96CB086144
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 10:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9N6vsONgs_2 for <iommu@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 10:37:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0143485DF9
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 10:37:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103717euoutp02999c9ac2194e52497bc0bf4c800d3ff0~Z66Udkgbh2363023630euoutp025
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 10:37:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200619103717euoutp02999c9ac2194e52497bc0bf4c800d3ff0~Z66Udkgbh2363023630euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563037;
 bh=i9tfBl9XK1ZIcmVNmOj760Z4Av4MmZkmEeWSykU107Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=atfLKskRDXY9/BVWa8nrWCkqrLlOqNmWkrUN380u7/G1/IYRQ2SquJHlNGdC3pF5u
 yEE7x9K8spZAsjX9UIpMCJy6Mi6EkPN8oqx9oitCGUc7+PXCSenvehDRwWZUpHo+yd
 X4xLDQONvYxHAvDN2Gej1UHl060j28cVKHpr90eU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103717eucas1p1eea0e1812066354b4495c584c9e55e05~Z66UJdHfh0708007080eucas1p1G;
 Fri, 19 Jun 2020 10:37:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 01.AD.05997.D559CEE5; Fri, 19
 Jun 2020 11:37:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103716eucas1p28d6da172346acf044d3c1f213d9543ef~Z66TruWMo3081930819eucas1p2x;
 Fri, 19 Jun 2020 10:37:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103716eusmtrp15280a537011684db0a31a468099f5dbe~Z66TrF-eS1007310073eusmtrp1J;
 Fri, 19 Jun 2020 10:37:16 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-14-5eec955dc01a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AA.1B.06017.C559CEE5; Fri, 19
 Jun 2020 11:37:16 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103716eusmtip29553eb2a23be38cf52b095dd61d865f0~Z66TEv0qL0229502295eusmtip2n;
 Fri, 19 Jun 2020 10:37:16 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 34/36] samples: vfio-mdev/mbochs: fix common struct
 sg_table related issues
Date: Fri, 19 Jun 2020 12:36:34 +0200
Message-Id: <20200619103636.11974-35-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURiFvZ3OdFhqhoLhCiimCgaTsqjRSVAE9GFI1PjAiyYgBSZAhAIt
 qw+KgCC7yNYgAhoMS9klhZQIdMQWbKhGluAWIRBFsIiCREDAlgF8O//3nz/n3OTiiKADtcMj
 JHG0VCKOFGLmXKVm5bUooOR7oHt/NULm6Qc5ZJu8BSU3lYUIOfL7B0bWK15yyOpeT7KiJJbs
 0D0C5NLIJIdsnxpDyWFVBUY29X/ikeqFadSbTzVWNgLq+XI1l+pcnkCpzzlaDvWs5jb1YWMK
 oYrGawHV/S4Fo/LS5jEqv6MBUIvtB69YXDM/E0pHRiTQUjevIPPwNWU7L6bGKul9V3QKaNub
 DcxwSJyEAy8YNBuY4wKiDsD83pHtYQnA0o387WERQE13PW/nxJA6DdhFLYCpD19huycFWVnA
 5MIID5htyMZM2oa4C+BAnqXJhBBjHGhYn0dNC2siCNZkVm6ZuIQTXFFkICbNJ7wgs/mYy8Y5
 QkVr3xY3M/K5dDXKcoYHdX/2s/oClHcNI6y2hrPaju2qDlBXlMs1BUMiDcBJfROPHXIBHE6V
 A9blCT/qV40tcGM9F9iicmOxD1zRjHFMGBJ74bjByoQRo3ygLENYzIf3MgSs2xmWa5t3Y9Vv
 3m7XoeB6afrWEwVEIYDF+Xb3gWP5/6xqABqALR0viwqjZccldKKrTBwli5eEuYZER7UD41/S
 bWiXuoDqbzADCBwILfkz/nOBAlScIEuOYgDEEaEN33dIFyjgh4qTb9LS6OvS+EhaxgB7nCu0
 5Z948i1AQISJ4+gbNB1DS3e2HNzMLgUUfznVo5rpylmqUlxyX4/1qx8VHejzyZ2/eGs1qbnT
 /vSQH1oUkXnW2V90xJu5A/McDpk1BU+MqbudRxd6NurOJw7PyvVrSOtXrGCSCblaYTUkIiZm
 5quIRrlvkf4wfa6sX5J11Cld6+L51OEys+8X8XOwyb+NBzUWij2TnFwhVxYu9jiGSGXif6kI
 LLtHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xe7oxU9/EGWxco2/Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9tMWdqocWW03MZLb5cechksenxNVaLy7vmsFmsPXKX3eLg
 hyesDrwea+atYfTY+20Bi8f2bw9YPe53H2fy2Lyk3uP2v8fMHpNvLGf02H2zgc2jt/kdm0ff
 llWMHp83yQVwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehl/N62ib1giWDFrR35DYwb+boYOTkkBEwk3jY9Yexi5OIQEljKKPHx1VU2iISMxMlp
 DawQtrDEn2tdbBBFnxgl7s9dywySYBMwlOh6C5EQEehklJjW/ZEdJMEscI9JYu86PxBbWCBO
 ovvjXxYQm0VAVeLn6jawZl4BO4lD/xeyQGyQl1i94QBYnBMo/rrlINhmIQFbieUL3jNPYORb
 wMiwilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBOth37uWUHY9e74EOMAhyMSjy8L0Jexwmx
 JpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKMp0FETmaVEk/OBMZxXEm9oamhu
 YWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFxTmLo16xbv99UpNy47P79hMR2
 th4ro2yrMJ1/17ety4lbaKehOM3mUVDIs5qaglOv68K8NzuFPMn+0CnnMl3+p0WUgePSf/+O
 f3lXdoxfIOXhibch3nsNrbo/P29st7k/TT6Hp/N7yl725N7zi9W4mp9M/nfms+Isbua7Cfrl
 8y+djNiXmymqxFKckWioxVxUnAgAn5sRn6kCAAA=
X-CMS-MailID: 20200619103716eucas1p28d6da172346acf044d3c1f213d9543ef
X-Msg-Generator: CA
X-RootMTR: 20200619103716eucas1p28d6da172346acf044d3c1f213d9543ef
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103716eucas1p28d6da172346acf044d3c1f213d9543ef
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103716eucas1p28d6da172346acf044d3c1f213d9543ef@eucas1p2.samsung.com>
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

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

While touching this code, also add missing call to dma_unmap_sgtable.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 samples/vfio-mdev/mbochs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 3cc5e5921682..e03068917273 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -846,7 +846,7 @@ static struct sg_table *mbochs_map_dmabuf(struct dma_buf_attachment *at,
 	if (sg_alloc_table_from_pages(sg, dmabuf->pages, dmabuf->pagecount,
 				      0, dmabuf->mode.size, GFP_KERNEL) < 0)
 		goto err2;
-	if (!dma_map_sg(at->dev, sg->sgl, sg->nents, direction))
+	if (dma_map_sgtable(at->dev, sg, direction, 0))
 		goto err3;
 
 	return sg;
@@ -868,6 +868,7 @@ static void mbochs_unmap_dmabuf(struct dma_buf_attachment *at,
 
 	dev_dbg(dev, "%s: %d\n", __func__, dmabuf->id);
 
+	dma_unmap_sgtable(at->dev, sg, direction, 0);
 	sg_free_table(sg);
 	kfree(sg);
 }
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
