Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4AFA5CE8
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 22:08:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 10C06CDE;
	Mon,  2 Sep 2019 20:08:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4FF61AC8
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 20:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0696F5D3
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LdVrxkL37VTklHgUT3hBqRPwtefR2ZTRSxffxyS1bNQ=;
	b=eR12wCXrzskT5yKF1EtGfMTIMC
	vZO29ISsn2SsgNgCKOVf61BsrSaQD1/XVR6ffJvy77NmG9RyMaLCYU673eUuzIxBnDM7iPvPkgDek
	V1Jh6CGzMVA880f+FelEGBscMWDTL5BLMmEEtdykAixCnjvEosgvRe9ElmCO23oBab9pvPtm3aPbn
	nKMXn6TP57hSjzkFNg9HndaaQsZAd4xVPO9Hj/1jWHlJAGOFCVD+1XFqgNA6qKn5dyZZacAtfNtBD
	fMLLoRFGC6/uJ6zUcYJVvn9NnFqsm8B07tqEQHsf/O8ZNQrrmJUbHDA6Nc0MU4WzWbJy2nPqkqT95
	JzuhOtgw==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i4scQ-0007Mi-SU; Mon, 02 Sep 2019 20:08:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org, Loic Pallardy <loic.pallardy@st.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/4] dma-mapping: remove the dma_mmap_from_dev_coherent export
Date: Mon,  2 Sep 2019 22:07:44 +0200
Message-Id: <20190902200746.16185-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902200746.16185-1-hch@lst.de>
References: <20190902200746.16185-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

dma_mmap_from_dev_coherent is only used by dma_map_ops instances,
none of which is modular.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/coherent.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 7271cda86a37..7cafe1affdc9 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -277,7 +277,6 @@ int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 
 	return __dma_mmap_from_coherent(mem, vma, vaddr, size, ret);
 }
-EXPORT_SYMBOL(dma_mmap_from_dev_coherent);
 
 int dma_mmap_from_global_coherent(struct vm_area_struct *vma, void *vaddr,
 				   size_t size, int *ret)
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
