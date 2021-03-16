Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4133D8E8
	for <lists.iommu@lfdr.de>; Tue, 16 Mar 2021 17:16:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859224ED8D;
	Tue, 16 Mar 2021 16:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIsO6AlcDFkm; Tue, 16 Mar 2021 16:16:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E0C94ED0A;
	Tue, 16 Mar 2021 16:16:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8387BC0014;
	Tue, 16 Mar 2021 16:16:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4826BC000A;
 Tue, 16 Mar 2021 16:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 278584ED55;
 Tue, 16 Mar 2021 16:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WcEgQglnZqxp; Tue, 16 Mar 2021 16:16:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50F544ED0A;
 Tue, 16 Mar 2021 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=WCctDB3aBbf47gvZbBBbXOyUY2tUO8VwmVGAxmrB6lU=; b=deUFeS00cyCtv1K6xdoQSBzs4S
 7apA+k0/2Zd4K9E+AeMCsc956KeepRkBycFxEG3F8Jv0WfGepxghziwaNXRJ+v20OzB47kpRopAdb
 e+1HmVPyZkCrvobyhdR3rdoz+wXNzxMJDua55Srn/1/QUceh815wN2VdiZqOjL0lr0H+9B3MRsZUV
 U6cKSNMU2rIqN2QhWBYqpmkQfw9FC32BDpB4IN/VnP2We0InqV++LUWq5YL5XJeHWBTcH/xcoIqZ6
 ccTQtKNy8c7DoTlE7lDlAshX09CXkw8OMgMUKouRXb+I7Nptovh5syzrtPhBk1n9VlPqDPsS39xOx
 ssSAD9jw==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMCMY-000IT2-QA; Tue, 16 Mar 2021 16:16:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 15/18] iommu: remove iommu_set_cmd_line_dma_api and
 iommu_cmd_line_dma_api
Date: Tue, 16 Mar 2021 16:38:21 +0100
Message-Id: <20210316153825.135976-16-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316153825.135976-1-hch@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Don't obsfucate the trivial bit flag check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/iommu.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 58d1d11a8d5c10..052cef11ae30df 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -70,16 +70,6 @@ static const char * const iommu_group_resv_type_string[] = {
 
 #define IOMMU_CMD_LINE_DMA_API		BIT(0)
 
-static void iommu_set_cmd_line_dma_api(void)
-{
-	iommu_cmd_line |= IOMMU_CMD_LINE_DMA_API;
-}
-
-static bool iommu_cmd_line_dma_api(void)
-{
-	return !!(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API);
-}
-
 static int iommu_alloc_default_domain(struct iommu_group *group,
 				      struct device *dev);
 static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
@@ -130,9 +120,7 @@ static const char *iommu_domain_type_str(unsigned int t)
 
 static int __init iommu_subsys_init(void)
 {
-	bool cmd_line = iommu_cmd_line_dma_api();
-
-	if (!cmd_line) {
+	if (!(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API)) {
 		if (IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH))
 			iommu_set_default_passthrough(false);
 		else
@@ -146,7 +134,8 @@ static int __init iommu_subsys_init(void)
 
 	pr_info("Default domain type: %s %s\n",
 		iommu_domain_type_str(iommu_def_domain_type),
-		cmd_line ? "(set via kernel command line)" : "");
+		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
+			"(set via kernel command line)" : "");
 
 	return 0;
 }
@@ -2757,16 +2746,14 @@ EXPORT_SYMBOL_GPL(iommu_alloc_resv_region);
 void iommu_set_default_passthrough(bool cmd_line)
 {
 	if (cmd_line)
-		iommu_set_cmd_line_dma_api();
-
+		iommu_cmd_line |= IOMMU_CMD_LINE_DMA_API;
 	iommu_def_domain_type = IOMMU_DOMAIN_IDENTITY;
 }
 
 void iommu_set_default_translated(bool cmd_line)
 {
 	if (cmd_line)
-		iommu_set_cmd_line_dma_api();
-
+		iommu_cmd_line |= IOMMU_CMD_LINE_DMA_API;
 	iommu_def_domain_type = IOMMU_DOMAIN_DMA;
 }
 
-- 
2.30.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
