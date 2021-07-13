Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2AC3C75AF
	for <lists.iommu@lfdr.de>; Tue, 13 Jul 2021 19:24:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCAD83B0B;
	Tue, 13 Jul 2021 17:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGS2YWLB3p6x; Tue, 13 Jul 2021 17:24:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E31A983B01;
	Tue, 13 Jul 2021 17:24:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC7ACC000E;
	Tue, 13 Jul 2021 17:24:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3724C000E
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 17:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C35AE404F1
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 17:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCcS0XEqO-EO for <iommu@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 17:24:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BFF0404D5
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 17:24:50 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id o201so15217605pfd.1
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 10:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dRGkXhFVPDCN6lHFCDskTpMUgejvDkPOTh0TQ1SmxgY=;
 b=hC302NZA8ul/V+t8Z3Trs8zOIl6iLzgSxjoO/edKlYvKkEl9f6Zystolb9Ywauciek
 +hzneNkisIFFl0+3d3iFwjableLGJndP2tcfcw8peWty+OYoKswjVPDyHH7+Ff5louIW
 64DOKyUhkgXYyexcov1Bf8cqKm4XWCU1kmjfE9B04D1cZFKQtSMWZmowz4elIun+zOn9
 Z2jPV1eHkoYoeKtNVzak+7qfmqiqlR982/R7bqnDwJccowMQmiXbByt0ztpuv1SvI2Xs
 PYi9hU9Dm4ps0dwzgdzQhdwRqccpvqyctgVOKK3ix3tIq7UdOH57OqaAy1+OBM1CcmHX
 i+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dRGkXhFVPDCN6lHFCDskTpMUgejvDkPOTh0TQ1SmxgY=;
 b=NyRssXYbp3hazsDXMoYrj3/Qga7Pnb/KP4J4B1h6eTt5nY72XQz0U1ALupDBGN+k4c
 hQ609CdcQEJykzGXvHVLX0fh4V/TwzAJWJeq+taTjY7kusWOxvqzchm389hWeeVTzpnr
 TmRhs4tMcC0w5x+a9I7BV/DSXw/kQcsMx3lZ5tkYUFFTVNc+ywBj+SGwhQxvBvZ/rUSu
 4QFC1MlSdTxsDrTB4KJgnR/0JhgMHtOwRyuQ+bAz5+Lp/mkhMyigjNuGtXUK4o1Md8Ok
 oFLU9Tzu9QDqvYL3XY+bgFvy53cOXoEFI5za9B9eWbn/2GkIZpXDcwR8cOZd+RGGOOA8
 Up/w==
X-Gm-Message-State: AOAM533C+WzW5iwvxyajCJ3dZXF66LiiLj/4AYiSaJkvN1A4GI/x6pzf
 0ba2w77fKFR5HPswgFSnmiM=
X-Google-Smtp-Source: ABdhPJwl24HFWvtohvEl9N5FlO2WDW6tugBIkQCzWSqu3enuljJcDf+az36g29V2YUSO4m4dObwCMQ==
X-Received: by 2002:a65:4047:: with SMTP id h7mr5292979pgp.198.1626197089588; 
 Tue, 13 Jul 2021 10:24:49 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id lt14sm18239032pjb.47.2021.07.13.10.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 10:24:49 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v5 1/7] iommu/amd: Selective flush on unmap
Date: Tue, 13 Jul 2021 02:41:45 -0700
Message-Id: <20210713094151.652597-2-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713094151.652597-1-namit@vmware.com>
References: <20210713094151.652597-1-namit@vmware.com>
MIME-Version: 1.0
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Nadav Amit <namit@vmware.com>,
 Jiajun Cao <caojiajun@vmware.com>, Will Deacon <will@kernel.org>
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

From: Nadav Amit <namit@vmware.com>

Recent patch attempted to enable selective page flushes on AMD IOMMU but
neglected to adapt amd_iommu_iotlb_sync() to use the selective flushes.

Adapt amd_iommu_iotlb_sync() to use selective flushes and change
amd_iommu_unmap() to collect the flushes. As a defensive measure, to
avoid potential issues as those that the Intel IOMMU driver encountered
recently, flush the page-walk caches by always setting the "pde"
parameter. This can be removed later.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Jiajun Cao <caojiajun@vmware.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Nadav Amit <namit@vmware.com>
---
 drivers/iommu/amd/iommu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 811a49a95d04..bfae3928b98f 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2054,12 +2054,17 @@ static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
 {
 	struct protection_domain *domain = to_pdomain(dom);
 	struct io_pgtable_ops *ops = &domain->iop.iop.ops;
+	size_t r;
 
 	if ((amd_iommu_pgtable == AMD_IOMMU_V1) &&
 	    (domain->iop.mode == PAGE_MODE_NONE))
 		return 0;
 
-	return (ops->unmap) ? ops->unmap(ops, iova, page_size, gather) : 0;
+	r = (ops->unmap) ? ops->unmap(ops, iova, page_size, gather) : 0;
+
+	iommu_iotlb_gather_add_page(dom, gather, iova, page_size);
+
+	return r;
 }
 
 static phys_addr_t amd_iommu_iova_to_phys(struct iommu_domain *dom,
@@ -2162,7 +2167,13 @@ static void amd_iommu_flush_iotlb_all(struct iommu_domain *domain)
 static void amd_iommu_iotlb_sync(struct iommu_domain *domain,
 				 struct iommu_iotlb_gather *gather)
 {
-	amd_iommu_flush_iotlb_all(domain);
+	struct protection_domain *dom = to_pdomain(domain);
+	unsigned long flags;
+
+	spin_lock_irqsave(&dom->lock, flags);
+	__domain_flush_pages(dom, gather->start, gather->end - gather->start, 1);
+	amd_iommu_domain_flush_complete(dom);
+	spin_unlock_irqrestore(&dom->lock, flags);
 }
 
 static int amd_iommu_def_domain_type(struct device *dev)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
