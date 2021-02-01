Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA930AFD6
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 19:56:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A8F3681123;
	Mon,  1 Feb 2021 18:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DCpf_efeof9; Mon,  1 Feb 2021 18:56:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 464CB81BDF;
	Mon,  1 Feb 2021 18:56:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32A95C013A;
	Mon,  1 Feb 2021 18:56:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 739E2C013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 18:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6EEC681BDF
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 18:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0dDy0gvSm9X for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 18:56:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A833D81123
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 18:56:12 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id p185so14077626qkc.9
 for <iommu@lists.linux-foundation.org>; Mon, 01 Feb 2021 10:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to; bh=y7lafpwHwPK5mLUJYNpXf5D/a9FQS9JwhKfquZ6N6PI=;
 b=Lz9RegoyArGD7/Njm0yeOSa9hVKGX5dIR1sKuXMh7YX9fVDPXJYSrsAMuWEk0bii2V
 chvtIy+8dFO6PgQd1YJFNO2TWHWUvywrlNFEhcieuyVZXPKa3Ar53CEbzqDKIILsoX1E
 QMZddPHGcyPHa+g9lscMZg/ciF0UxBTewvkVpBRcEcRYtNcMJLoWOZlomdxonc7YqBqZ
 lYdUc9id12JfatpvDjALnBnLIIIyRGkiLoLPF/V8+eaOpeiGbP6HkMqDoxSbGzR1Xnly
 njCSd4DHvsx5U4XHn2T7vF7reiGURphVkVkf6xhrhut71ZGo1XKvLrhruGNRMT11Ggmy
 JWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to;
 bh=y7lafpwHwPK5mLUJYNpXf5D/a9FQS9JwhKfquZ6N6PI=;
 b=rTyynY3gImEBsFSqu4pE9rn3onx69E+RmF2eReMoa8qcTW2FJ/MGw8/VNld5N8CMco
 bB19gtngslbuq+MiZTsYj9p7xdgJjWyRKKAWefUK3Bk0BMoMaxEhgRZrkTUy1hnkUwxw
 Kn0CnDuNpWS5Ecoqy0/Mfd1FIafQxXbs/dr+t80ZXmiU/b+Hg9n7xNjpeX1ie/EWIK1o
 bCvLiYR0veJ8napyIQK9TNKp1ETN/GgpuP8jSB+Me0Fc7eds3NQYn4hOo6v5zscC9JXJ
 xRZ7QaR3u9qUDnFu0LrYo5Xg4yZ8HelG6IUt26hzGXbIHCp22q7cTYZB8lFpDCthpxgX
 mXig==
X-Gm-Message-State: AOAM531j73XdGYNr/u5uaS9ECdBWFyRU3IwouHw3YwSazELGw7U2Lffv
 3mb4yc8poxqeMJsu/CHyntbCFhqB6A==
X-Google-Smtp-Source: ABdhPJyxPr/mnKV6SfFRVsYQGdbwoOCXbpgSQ9gKmDR4teO9TwxE5BensFncv9xIqKkCY9ImrCPjV5hgMw==
X-Received: from jxgao.kir.corp.google.com
 ([2620:0:1008:11:695f:7f9e:413c:e3c7])
 (user=jxgao job=sendgmr) by 2002:a17:902:d901:b029:e1:6a7f:564c with SMTP id
 c1-20020a170902d901b02900e16a7f564cmr4367057plz.11.1612204227054; Mon, 01 Feb
 2021 10:30:27 -0800 (PST)
Date: Mon,  1 Feb 2021 10:30:17 -0800
In-Reply-To: <20210201183017.3339130-1-jxgao@google.com>
Message-Id: <20210201183017.3339130-4-jxgao@google.com>
Mime-Version: 1.0
References: <20210201183017.3339130-1-jxgao@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH V2 3/3] Adding device_dma_parameters->offset_preserve_mask to
 NVMe driver.
To: jxgao@google.com, erdemaktas@google.com, marcorr@google.com, hch@lst.de, 
 m.szyprowski@samsung.com, robin.murphy@arm.com, gregkh@linuxfoundation.org,
 saravanak@google.com, heikki.krogerus@linux.intel.com, 
 rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
 dan.j.williams@intel.com, bgolaszewski@baylibre.com, jroedel@suse.de, 
 iommu@lists.linux-foundation.org, konrad.wilk@oracle.com, kbusch@kernel.org, 
 axboe@fb.com, sagi@grimberg.me, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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
From: Jianxiong Gao via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jianxiong Gao <jxgao@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

NVMe driver relies on the address offset to function properly.
This patch adds the offset preserve mask to NVMe driver when mapping
via dma_map_sg_attrs and unmapping via nvme_unmap_sg. The mask
depends on the page size defined by CC.MPS register of NVMe
controller.

Signed-off-by: Jianxiong Gao <jxgao@google.com>
---
 drivers/nvme/host/pci.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 81e6389b2042..30e45f7e0f75 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -580,12 +580,15 @@ static void nvme_free_sgls(struct nvme_dev *dev, struct request *req)
 static void nvme_unmap_sg(struct nvme_dev *dev, struct request *req)
 {
 	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
-
+	if (dma_set_min_align_mask(dev->dev, NVME_CTRL_PAGE_SIZE - 1))
+		dev_warn(dev->dev, "dma_set_min_align_mask failed to set offset\n");
 	if (is_pci_p2pdma_page(sg_page(iod->sg)))
 		pci_p2pdma_unmap_sg(dev->dev, iod->sg, iod->nents,
 				    rq_dma_dir(req));
 	else
 		dma_unmap_sg(dev->dev, iod->sg, iod->nents, rq_dma_dir(req));
+	if (dma_set_min_align_mask(dev->dev, 0))
+		dev_warn(dev->dev, "dma_set_min_align_mask failed to reset offset\n");
 }
 
 static void nvme_unmap_data(struct nvme_dev *dev, struct request *req)
@@ -842,7 +845,7 @@ static blk_status_t nvme_map_data(struct nvme_dev *dev, struct request *req,
 {
 	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
 	blk_status_t ret = BLK_STS_RESOURCE;
-	int nr_mapped;
+	int nr_mapped, offset_ret;
 
 	if (blk_rq_nr_phys_segments(req) == 1) {
 		struct bio_vec bv = req_bvec(req);
@@ -868,12 +871,24 @@ static blk_status_t nvme_map_data(struct nvme_dev *dev, struct request *req,
 	if (!iod->nents)
 		goto out_free_sg;
 
+	offset_ret = dma_set_min_align_mask(dev->dev, NVME_CTRL_PAGE_SIZE - 1);
+	if (offset_ret) {
+		dev_warn(dev->dev, "dma_set_min_align_mask failed to set offset\n");
+		goto out_free_sg;
+	}
+
 	if (is_pci_p2pdma_page(sg_page(iod->sg)))
 		nr_mapped = pci_p2pdma_map_sg_attrs(dev->dev, iod->sg,
 				iod->nents, rq_dma_dir(req), DMA_ATTR_NO_WARN);
 	else
 		nr_mapped = dma_map_sg_attrs(dev->dev, iod->sg, iod->nents,
 					     rq_dma_dir(req), DMA_ATTR_NO_WARN);
+
+	offset_ret = dma_set_min_align_mask(dev->dev, 0);
+	if (offset_ret) {
+		dev_warn(dev->dev, "dma_set_min_align_mask failed to reset offset\n");
+		goto out_free_sg;
+	}
 	if (!nr_mapped)
 		goto out_free_sg;
 
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
