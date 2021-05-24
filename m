Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2438FA86
	for <lists.iommu@lfdr.de>; Tue, 25 May 2021 08:11:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B496B404CD;
	Tue, 25 May 2021 06:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krEj5V_QG0zg; Tue, 25 May 2021 06:11:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E59404B8;
	Tue, 25 May 2021 06:11:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 624BDC0001;
	Tue, 25 May 2021 06:11:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31073C0001
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 06:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F2483BF5
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 06:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4o2qKAH53aH3 for <iommu@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:11:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5676683BF4
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 06:11:17 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so12542450pjb.2
 for <iommu@lists.linux-foundation.org>; Mon, 24 May 2021 23:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sNLrC3xn/EJ4tCCyd6W1ssXumNURL3TkwWzu/8GDQlU=;
 b=npyEvkdaNArfqRQuIDC+XsB2irFyKhScKGWZpjaW6UXNLHFKvndA7eFiCOzKu5bg7a
 ZRhvV0LfrvhXZacK71iG8ZxAei8Ncl6LxL8mMRHdTJIe4hVrOM/Ncef6x50hio/BI+jJ
 cI3sHoIc6vcpe7d/pS6zgr9npJq5zGqPtzUPr4jJRmAdsLddu74Plp8h2jrBx1cNDhaT
 hQIl5B1iGk5xwkETPqJHmcPsuJBTpbp3S+KN6zEnBC+Pf0omM3/mfV2NiUCQd2wQKwQQ
 twNcJWyLbivQLkHeWB5DXf1T54xm0qK7GiRh8EkIO7eN6ozNIf3hTwlVjYbdcnvyBWiM
 hkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNLrC3xn/EJ4tCCyd6W1ssXumNURL3TkwWzu/8GDQlU=;
 b=YVExWWm0Fd2WImBQLxJ1c2WxCyWPMylVD5QwXDt62EcLiuJk0TvH9Fp1SOEhPDgvnE
 EK8d1Akjqcp9wI1C4ugp1b2a5UOa+UabT99n1C4Xlqtu3U5q0yPSKUy7O76lW5Ns5qE7
 3txaUvE57ZfvHoBLTiEroi4UDVYQzMipH/MnSVjIn8a9S6/pA30HDd9WUadj1DdTHIVh
 INtr1cIbJ8vqOVDDpVUkbD8gDpW0JrcwzMtFpQnyZTiqi4zUtB5w8O2p91RjbQaR6Psa
 MY5dwuYcD/bjeQCN/BzrGOoGNbq57bjdjkcWJKZyrdH1FjVm9s4ekaGRmfs4jrdgiApK
 +kDw==
X-Gm-Message-State: AOAM530yjJU98ptDCn1r9u8pVuLdCEfMtINRQ5m07EpzVvgT1jtrIt7p
 /3TGT8iP+HHHZ4q5k6pb/9o=
X-Google-Smtp-Source: ABdhPJwMDM79giShnau33iKxsbIRK6Oy7cikXwREviGHIrkL1IHtzOyMc/Ndw2F+Nc0tijdPTEowMg==
X-Received: by 2002:a17:90a:ac04:: with SMTP id
 o4mr28262632pjq.114.1621923076653; 
 Mon, 24 May 2021 23:11:16 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id h3sm12452301pgp.10.2021.05.24.23.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 23:11:16 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 2/4] iommu/amd: Selective flush on unmap
Date: Mon, 24 May 2021 15:41:57 -0700
Message-Id: <20210524224159.32807-3-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524224159.32807-1-namit@vmware.com>
References: <20210524224159.32807-1-namit@vmware.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Nadav Amit <namit@vmware.com>, Jiajun Cao <caojiajun@vmware.com>,
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
Cc: iommu@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Nadav Amit <namit@vmware.com>
---
 drivers/iommu/amd/iommu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 6723cbcf4030..b8cabbbeed71 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2057,12 +2057,17 @@ static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
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
@@ -2165,7 +2170,13 @@ static void amd_iommu_flush_iotlb_all(struct iommu_domain *domain)
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
