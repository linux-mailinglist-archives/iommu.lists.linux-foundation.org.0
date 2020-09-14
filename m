Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1B268F23
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 17:09:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28D8D86759;
	Mon, 14 Sep 2020 15:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TP9p6sWZObwO; Mon, 14 Sep 2020 15:08:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6ABA38675A;
	Mon, 14 Sep 2020 15:08:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DD92C089E;
	Mon, 14 Sep 2020 15:08:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E529C0859
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6CF0D8501A
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWHwGQTCuoQ9 for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 15:08:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 50A1B84E6B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Hd44flV0rNOoconJIhItgKEmFIKY+u0t7YJsM9KNpfo=; b=KmfGrfDX7byZuKSDmAvqbHPmbG
 rVaI8AfoPY6UsW2JcwgF4VuMlzi7fLK0J2xpI95SGy0q+W5zBRBcMVQ48ucc/QC/JtBbmBw2rpIi9
 k2hdX5nDNJVJiGWdMoQGMk7KRRTGvh0MIF+0oRVh8VPbm/iHIJ4t0AAsaDW8cmC9dxwwIAuvWz6+v
 Gta5PNKJzPOsjrE8pPJot2z39D/4owQoF9Nt8nXSM22jnkkdQMTdKKTO6VZE0csNfpqzMQatn8xP6
 SS2WBIoSfFEy1gOvLpecVGJG4LcKAOo3nI1A6Rs3aY3bxSBocIMVe8GEYW4DiACK5ruWQPrRzPTSo
 HLZyS2gw==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHq5w-0003B7-Sc; Mon, 14 Sep 2020 15:08:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 10/17] hal2: convert to dma_alloc_noncoherent
Date: Mon, 14 Sep 2020 16:44:26 +0200
Message-Id: <20200914144433.1622958-11-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Use the new non-coherent DMA API including proper ownership transfers.
This also means we can allocate the buffer memory with the proper
direction instead of bidirectional.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 sound/mips/hal2.c | 58 ++++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index ec84bc4c3a6e77..9ac9b58d7c8cdd 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -441,7 +441,8 @@ static inline void hal2_stop_adc(struct snd_hal2 *hal2)
 	hal2->adc.pbus.pbus->pbdma_ctrl = HPC3_PDMACTRL_LD;
 }
 
-static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
+static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec,
+		enum dma_data_direction buffer_dir)
 {
 	struct device *dev = hal2->card->dev;
 	struct hal2_desc *desc;
@@ -449,15 +450,15 @@ static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
 	int count = H2_BUF_SIZE / H2_BLOCK_SIZE;
 	int i;
 
-	codec->buffer = dma_alloc_attrs(dev, H2_BUF_SIZE, &buffer_dma,
-					GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
+	codec->buffer = dma_alloc_noncoherent(dev, H2_BUF_SIZE, &buffer_dma,
+					buffer_dir, GFP_KERNEL);
 	if (!codec->buffer)
 		return -ENOMEM;
-	desc = dma_alloc_attrs(dev, count * sizeof(struct hal2_desc),
-			       &desc_dma, GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
+	desc = dma_alloc_noncoherent(dev, count * sizeof(struct hal2_desc),
+			&desc_dma, DMA_BIDIRECTIONAL, GFP_KERNEL);
 	if (!desc) {
-		dma_free_attrs(dev, H2_BUF_SIZE, codec->buffer, buffer_dma,
-			       DMA_ATTR_NON_CONSISTENT);
+		dma_free_noncoherent(dev, H2_BUF_SIZE, codec->buffer, buffer_dma,
+				buffer_dir);
 		return -ENOMEM;
 	}
 	codec->buffer_dma = buffer_dma;
@@ -470,20 +471,22 @@ static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
 		      desc_dma : desc_dma + (i + 1) * sizeof(struct hal2_desc);
 		desc++;
 	}
-	dma_cache_sync(dev, codec->desc, count * sizeof(struct hal2_desc),
-		       DMA_TO_DEVICE);
+	dma_sync_single_for_device(dev, codec->desc_dma,
+				   count * sizeof(struct hal2_desc),
+				   DMA_BIDIRECTIONAL);
 	codec->desc_count = count;
 	return 0;
 }
 
-static void hal2_free_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
+static void hal2_free_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec,
+		enum dma_data_direction buffer_dir)
 {
 	struct device *dev = hal2->card->dev;
 
-	dma_free_attrs(dev, codec->desc_count * sizeof(struct hal2_desc),
-		       codec->desc, codec->desc_dma, DMA_ATTR_NON_CONSISTENT);
-	dma_free_attrs(dev, H2_BUF_SIZE, codec->buffer, codec->buffer_dma,
-		       DMA_ATTR_NON_CONSISTENT);
+	dma_free_noncoherent(dev, codec->desc_count * sizeof(struct hal2_desc),
+		       codec->desc, codec->desc_dma, DMA_BIDIRECTIONAL);
+	dma_free_noncoherent(dev, H2_BUF_SIZE, codec->buffer, codec->buffer_dma,
+			buffer_dir);
 }
 
 static const struct snd_pcm_hardware hal2_pcm_hw = {
@@ -509,21 +512,16 @@ static int hal2_playback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
-	int err;
 
 	runtime->hw = hal2_pcm_hw;
-
-	err = hal2_alloc_dmabuf(hal2, &hal2->dac);
-	if (err)
-		return err;
-	return 0;
+	return hal2_alloc_dmabuf(hal2, &hal2->dac, DMA_TO_DEVICE);
 }
 
 static int hal2_playback_close(struct snd_pcm_substream *substream)
 {
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
 
-	hal2_free_dmabuf(hal2, &hal2->dac);
+	hal2_free_dmabuf(hal2, &hal2->dac, DMA_TO_DEVICE);
 	return 0;
 }
 
@@ -579,7 +577,9 @@ static void hal2_playback_transfer(struct snd_pcm_substream *substream,
 	unsigned char *buf = hal2->dac.buffer + rec->hw_data;
 
 	memcpy(buf, substream->runtime->dma_area + rec->sw_data, bytes);
-	dma_cache_sync(hal2->card->dev, buf, bytes, DMA_TO_DEVICE);
+	dma_sync_single_for_device(hal2->card->dev,
+			hal2->dac.buffer_dma + rec->hw_data, bytes,
+			DMA_TO_DEVICE);
 
 }
 
@@ -597,22 +597,16 @@ static int hal2_capture_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
-	struct hal2_codec *adc = &hal2->adc;
-	int err;
 
 	runtime->hw = hal2_pcm_hw;
-
-	err = hal2_alloc_dmabuf(hal2, adc);
-	if (err)
-		return err;
-	return 0;
+	return hal2_alloc_dmabuf(hal2, &hal2->adc, DMA_FROM_DEVICE);
 }
 
 static int hal2_capture_close(struct snd_pcm_substream *substream)
 {
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
 
-	hal2_free_dmabuf(hal2, &hal2->adc);
+	hal2_free_dmabuf(hal2, &hal2->adc, DMA_FROM_DEVICE);
 	return 0;
 }
 
@@ -667,7 +661,9 @@ static void hal2_capture_transfer(struct snd_pcm_substream *substream,
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
 	unsigned char *buf = hal2->adc.buffer + rec->hw_data;
 
-	dma_cache_sync(hal2->card->dev, buf, bytes, DMA_FROM_DEVICE);
+	dma_sync_single_for_cpu(hal2->card->dev,
+			hal2->adc.buffer_dma + rec->hw_data, bytes,
+			DMA_FROM_DEVICE);
 	memcpy(substream->runtime->dma_area + rec->sw_data, buf, bytes);
 }
 
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
