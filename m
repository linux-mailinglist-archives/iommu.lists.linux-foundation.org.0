Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ADF259F52
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 21:39:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82C5286CBA;
	Tue,  1 Sep 2020 19:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZ4J9EbEyx59; Tue,  1 Sep 2020 19:39:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 84B7C868FB;
	Tue,  1 Sep 2020 19:39:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 636FAC0051;
	Tue,  1 Sep 2020 19:39:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A659C0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 19:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0FF4A8710D
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 19:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENadr2VB4eVv for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 19:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0BDF28710C
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 19:38:59 +0000 (UTC)
IronPort-SDR: ECql2hOlhZpdMNwueotr6edhPa4AzV/8veP673GKTus2OZVRqlle7rQ10RQsrYzAI4sszsJVuV
 CCeUfLeKSfFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="157263569"
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; d="scan'208";a="157263569"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 12:38:59 -0700
IronPort-SDR: 61Amtlaes050RxB0qQH7XOzsM3bz8pU+DMPJXc2mdFfd5F2AgqumdZmYXriBmSvC/d2wlrasXC
 L7mwHzZZwUmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; d="scan'208";a="404882026"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2020 12:38:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 12:38:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 12:38:57 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Tue, 1 Sep 2020 12:38:57 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [Intel-gfx] [PATCH v9 08/32] drm: i915: fix common struct
 sg_table related issues
Thread-Topic: [Intel-gfx] [PATCH v9 08/32] drm: i915: fix common struct
 sg_table related issues
Thread-Index: AQHWe3Ml/rRJPBw9lEWMq6REwJ0ovqlUN/gw
Date: Tue, 1 Sep 2020 19:38:57 +0000
Message-ID: <259df561c4bb4ef484799e3776dbb402@intel.com>
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063532eucas1p2a9e0215f483104d45af0560d5dbfa8e0@eucas1p2.samsung.com>
 <20200826063316.23486-9-m.szyprowski@samsung.com>
In-Reply-To: <20200826063316.23486-9-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

>-----Original Message-----
>From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>Marek Szyprowski
>Sent: Wednesday, August 26, 2020 2:33 AM
>To: dri-devel@lists.freedesktop.org; iommu@lists.linux-foundation.org;
>linaro-mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org
>Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>; David Airlie
><airlied@linux.ie>; intel-gfx@lists.freedesktop.org; Robin Murphy
><robin.murphy@arm.com>; Christoph Hellwig <hch@lst.de>; linux-arm-
>kernel@lists.infradead.org; Marek Szyprowski
><m.szyprowski@samsung.com>
>Subject: [Intel-gfx] [PATCH v9 08/32] drm: i915: fix common struct sg_table
>related issues
>
>The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg()
>function
>returns the number of the created entries in the DMA address space.
>However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
>dma_unmap_sg must be called with the original number of the entries
>passed to the dma_map_sg().
>
>struct sg_table is a common structure used for describing a non-contiguous
>memory buffer, used commonly in the DRM and graphics subsystems. It
>consists of a scatterlist with memory pages and DMA addresses (sgl entry),
>as well as the number of scatterlist entries: CPU pages (orig_nents entry)
>and DMA mapped pages (nents entry).
>
>It turned out that it was a common mistake to misuse nents and orig_nents
>entries, calling DMA-mapping functions with a wrong number of entries or
>ignoring the number of mapped entries returned by the dma_map_sg()
>function.
>
>This driver creatively uses sg_table->orig_nents to store the size of the
>allocated scatterlist and ignores the number of the entries returned by
>dma_map_sg function. The sg_table->orig_nents is (mis)used to properly
>free the (over)allocated scatterlist.
>
>This patch only introduces the common DMA-mapping wrappers operating
>directly on the struct sg_table objects to the dmabuf related functions,
>so the other drivers, which might share buffers with i915 could rely on
>the properly set nents and orig_nents values.
>
>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 11 +++--------
> drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  7 +++----
> 2 files changed, 6 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>index 2679380159fc..8a988592715b 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>@@ -48,12 +48,9 @@ static struct sg_table *i915_gem_map_dma_buf(struct
>dma_buf_attachment *attachme
> 		src = sg_next(src);
> 	}
>
>-	if (!dma_map_sg_attrs(attachment->dev,
>-			      st->sgl, st->nents, dir,
>-			      DMA_ATTR_SKIP_CPU_SYNC)) {
>-		ret = -ENOMEM;

You have dropped this error value.

Do you now if this is a benign loss?

M

>+	ret = dma_map_sgtable(attachment->dev, st, dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>+	if (ret)
> 		goto err_free_sg;
>-	}
>
> 	return st;
>
>@@ -73,9 +70,7 @@ static void i915_gem_unmap_dma_buf(struct
>dma_buf_attachment *attachment,
> {
> 	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment-
>>dmabuf);
>
>-	dma_unmap_sg_attrs(attachment->dev,
>-			   sg->sgl, sg->nents, dir,
>-			   DMA_ATTR_SKIP_CPU_SYNC);
>+	dma_unmap_sgtable(attachment->dev, sg, dir,
>DMA_ATTR_SKIP_CPU_SYNC);
> 	sg_free_table(sg);
> 	kfree(sg);
>
>diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>index debaf7b18ab5..be30b27e2926 100644
>--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>@@ -28,10 +28,9 @@ static struct sg_table *mock_map_dma_buf(struct
>dma_buf_attachment *attachment,
> 		sg = sg_next(sg);
> 	}
>
>-	if (!dma_map_sg(attachment->dev, st->sgl, st->nents, dir)) {
>-		err = -ENOMEM;
>+	err = dma_map_sgtable(attachment->dev, st, dir, 0);
>+	if (err)
> 		goto err_st;
>-	}
>
> 	return st;
>
>@@ -46,7 +45,7 @@ static void mock_unmap_dma_buf(struct
>dma_buf_attachment *attachment,
> 			       struct sg_table *st,
> 			       enum dma_data_direction dir)
> {
>-	dma_unmap_sg(attachment->dev, st->sgl, st->nents, dir);
>+	dma_unmap_sgtable(attachment->dev, st, dir, 0);
> 	sg_free_table(st);
> 	kfree(st);
> }
>--
>2.17.1
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
