Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BB76543D015
	for <lists.iommu@lfdr.de>; Wed, 27 Oct 2021 19:48:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1161060B15;
	Wed, 27 Oct 2021 17:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egmH0a9z0tOB; Wed, 27 Oct 2021 17:48:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 36DB860B12;
	Wed, 27 Oct 2021 17:48:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06897C0036;
	Wed, 27 Oct 2021 17:48:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71DB7C000E
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 17:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5304981CA5
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 17:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iwxdlv8_CQst for <iommu@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 17:48:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3A0480DCA
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 17:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-Id:Date:Cc:To:From
 :references:content-disposition:in-reply-to;
 bh=ixLSC4o+uhsNJFfM+3WjU/KW6d5SsHJCs8Tnj6YC5pw=; b=okyWYXdfSdHHJ5UP8SDWqAugiu
 PNPBruGGXoL5gOPZZFve7iL8xSnqUboGitotenc2EGldMrHEPhsCmQpeuKRsPiyFfL1rxPYHxP+bI
 qx91AlufbsY9c6CzEP1UoU0D4W37kM79WlgDnWL+I/O6/zs3J95MqLOYZrp1OlGJHw4Gvlpmv4KMq
 pXGuSD2AWOVu7WdJtvQ6oFX8cJ0qRKOxxM18074DQ3yV4IuuGZvupWg+KFylymBtlDTQne5hk7xux
 xOcJtPeOmkuEOHbr/ltyTBGHg4atELLPHTBBxVq+++6kTUVKOl9WBMUmKn+ja+vsK9FgliI2XdPcE
 EeACUFOA==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1mfn1t-000kp8-0E; Wed, 27 Oct 2021 11:48:02 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1mfn1s-000VAK-Jp; Wed, 27 Oct 2021 11:48:00 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Date: Wed, 27 Oct 2021 11:47:57 -0600
Message-Id: <20211027174757.119755-1-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, hch@lst.de, logang@deltatee.com,
 marshallmidden@gmail.com, joro@8bytes.org, will@kernel.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH] iommu/dma: fix incorrect error return on iommu deferred attach
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Will Deacon <will@kernel.org>, Marshall Midden <marshallmidden@gmail.com>,
 Logan Gunthorpe <logang@deltatee.com>
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

scsi_dma_map() was reporting a failure during boot on an AMD machine
with the IOMMU enabled.

  scsi_dma_map failed: request for 36 bytes!

The issue was tracked down to a mistake in logic: should not return
an error if iommu_deferred_attach() returns zero.

Reported-by: Marshall Midden <marshallmidden@gmail.com>
Fixes: dabb16f67215 ("iommu/dma: return error code from iommu_dma_map_sg()")
Link: https://lore.kernel.org/all/CAD2CkAWjS8=kKwEEN4cgVNjyFORUibzEiCUA-X+SMtbo0JoMmA@mail.gmail.com
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
---
 drivers/iommu/dma-iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

If possible, this fix should really get into Linus's tree before the
v5.15 release.

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 896bea04c347..3e5a21b0bb24 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1016,7 +1016,8 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,

 	if (static_branch_unlikely(&iommu_deferred_attach_enabled)) {
 		ret = iommu_deferred_attach(dev, domain);
-		goto out;
+		if (ret)
+			goto out;
 	}

 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))

base-commit: 3906fe9bb7f1a2c8667ae54e967dc8690824f4ea
--
2.30.2
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
