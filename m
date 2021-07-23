Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F393D3E0C
	for <lists.iommu@lfdr.de>; Fri, 23 Jul 2021 19:02:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 741E783AF1;
	Fri, 23 Jul 2021 17:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-dDoluRM8Pz; Fri, 23 Jul 2021 17:02:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 95C3F83B1F;
	Fri, 23 Jul 2021 17:02:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7916C0022;
	Fri, 23 Jul 2021 17:02:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED138C001A
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 17:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA5C740658
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 17:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3SIBjVmLnNWc for <iommu@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 17:02:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B4624067C
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 17:02:00 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id l19so3211952pjz.0
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dRGkXhFVPDCN6lHFCDskTpMUgejvDkPOTh0TQ1SmxgY=;
 b=kqMNWSv+DGS0mWFaqPpv1UMyTiwjjOpQQHyZFVsfWaC+2Xy5Tm881HC9sEq2X3OWCc
 0yPMLBYHaSRhUBiBgqoU3041TgLO6io+C8wO5I8b+8j+Xr2ezZCpXGPCNd0X8Pp0RHEy
 iSe3J8bGQsTmZcxpzPq7x/4NTXkUpL2/z/2tj+FUoLfadLgsDOK2kSct+MGINjUeDPip
 mfnws1qZoRSRibbdFwJhuhmtm0BHRFBm01uaLd2zNtbfCOfVTaLl9n6KY1CoYIiPJLp/
 6Vy/iyRqaKX0dkr3oXGwXRLGIsSmsqrL4w572nOZrwhcsjQKBC9TAUYwbMa2PVpRKDKr
 iJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dRGkXhFVPDCN6lHFCDskTpMUgejvDkPOTh0TQ1SmxgY=;
 b=fdSTyIvz8gyf723JiUTRkKNHqIwRcR21Xdnn9qvi6upMJns3TXcOdffCEuHxPo0HL8
 jAHUu+1SjdmYIF/F6qgTJ1lCEROUHwX5vot04v0TNp8oPMKq9aV23OwnszAGFb0TqTm1
 uIQxtDqJcMNYqE/KvdwkI/TgfpRgOVDSxfMvS8pNFLbLIVeEHCkRhJWITrqNDneE2qeH
 8hQIg8rDaEPwOhehS96SdJy5Hzlu/sZztTgY8THYuuhQPIgyVhIEsMXnxGEVTd3gQpvv
 oUvKSXz/h/meZ+bfcFBChFHVndeGcWtp6EDAxbDzkYkHDrBEsOW0u1aHyT7x8hqwnaxp
 RaYg==
X-Gm-Message-State: AOAM532AphHwtr9xN5XYfiijfTW07vrPmDK7KT+oHQgyoOfXukP0sKKZ
 n58smCJGa6SXegFmq7qxebU=
X-Google-Smtp-Source: ABdhPJz+uCdl5dDuZlVhexy7b6MtXYblXRkG+BBEUi5vIyEnimRH9/Y/SYERTz3kqEV5yBN72IHrFg==
X-Received: by 2002:a63:5064:: with SMTP id q36mr5696945pgl.196.1627059719660; 
 Fri, 23 Jul 2021 10:01:59 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id d15sm33479004pfl.82.2021.07.23.10.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:01:59 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v6 1/7] iommu/amd: Selective flush on unmap
Date: Fri, 23 Jul 2021 02:32:03 -0700
Message-Id: <20210723093209.714328-2-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723093209.714328-1-namit@vmware.com>
References: <20210723093209.714328-1-namit@vmware.com>
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
