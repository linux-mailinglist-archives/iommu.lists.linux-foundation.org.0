Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC5F53D
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 13:16:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C0A9DE44;
	Tue, 30 Apr 2019 11:16:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 569D9E20
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 11:15:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 09FED5F4
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9k4nQZPif7ndSOFrX9noMGAIl+nulGOO2bXKPiEFONo=;
	b=R52KnTYK39v9DYmdZt0znCKz+
	6+GdQmFsPQBixVC5Ubs/WZ3negqJs6tLT6oN6cb99ptdIgFyunyiX/69KRF08ExBNBOIV900gYmS+
	knnmMgSKloFzuv6VmQHAxzLWEoSr+z3Iz7oT6rhpOPBmHmIMTJleXgeGQ1U3A+yXLlzwnhczP+qAA
	F+tuiVUhm2lALsuqj5YyIOc8Y0tAKyp80I2M2l3FC8/aVZYvQai9AII361GVgXKMCuzQxee7v3lU4
	egYoCFBjgxk1Sobkk9S2YOT7qO6e/2I7U+0kHhlIVuPRDkk7wvq9goAf0/lz20leSwzjujQyIpuC6
	a1aP4pnlA==;
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLQjr-0007ZN-DV; Tue, 30 Apr 2019 11:15:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: robdclark@gmail.com
Subject: [PATCH] qcom_iommu: fix a config symbol typo
Date: Tue, 30 Apr 2019 07:15:18 -0400
Message-Id: <20190430111518.27569-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org
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

The arm/arm64 symbol for big endian builds is CONFIG_CPU_BIG_ENDIAN,
not CONFIG_BIG_ENDIAN.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/qcom_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 8cdd3f059513..69f58b633f9d 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -280,7 +280,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		reg = SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE |
 			SCTLR_M | SCTLR_S1_ASIDPNE | SCTLR_CFCFG;
 
-		if (IS_ENABLED(CONFIG_BIG_ENDIAN))
+		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 			reg |= SCTLR_E;
 
 		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, reg);
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
