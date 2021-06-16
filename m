Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 903773AA272
	for <lists.iommu@lfdr.de>; Wed, 16 Jun 2021 19:34:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15CF7405ED;
	Wed, 16 Jun 2021 17:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZKsDC7ocbax; Wed, 16 Jun 2021 17:34:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7B396404AE;
	Wed, 16 Jun 2021 17:34:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56175C000B;
	Wed, 16 Jun 2021 17:34:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33F96C0024
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 17:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16C74831DA
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 17:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbX3Uv_MFgwS for <iommu@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 17:34:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E82B831C1
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 17:34:25 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id t13so2557842pgu.11
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jWMknRbD8X1K6AG9lburjdKW9p491bZf6T9lQOWSxxM=;
 b=WYmmuQrhubPiSJDW9wGOaMi600sb+jgw6jlrzgd9MuDRuGCR80bvURFllIw8BfQXVd
 4TFjA0fLpdScaKVxoEDyng4DGCWQbHnszW/V0kBgfohgSjKJm3f1tT0vIceGETESOO10
 /JipqRvLbzUuJytPGb+aKPld2kHiZV5mAV1gx96jX+eW/PNQCcTjV5sXlX2uLBdz3I9O
 nPlleW5R4avJw5GfeuF2ZgN8grnuRua/eWnJwAZehamQ/XJR2kDzuCvJ2MphojHlFZqJ
 QUThUTYiB6Z46cVzcvpsYirJLprl+ERslbjm5wGrYVjimjcTTB7NIKBBwKjbT1O/qHOG
 RFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jWMknRbD8X1K6AG9lburjdKW9p491bZf6T9lQOWSxxM=;
 b=r9MqH8Pa4nOv/A2ViZaDfm51xMuhvYng8na7d9py3IkUf7COAjfGyqbmRsXXSq7uWF
 VqInmNHhZzIcM7FIHfro416OnQyTO2ZAmHTPr9kPR91BhZwm/ZKlwyo1Z6VS9dIJ7qEY
 A7NI8Jls5l9IutrRraIoTEIIatFr2HBlKgU4OSsr7vdYBJIlKqVr6ybnDE5j0RsgT72g
 YN+Rg80Um/cXpYh5prrWS+yvbe9vxKVCTs1LbWGnMw6dfO3u6z7sHbkbocAEw1D+3PPe
 LYkiIQsSd8lkRE+L5y6WQxx+ZZsFQSMrlYVeLK2ZPGO+P3G3xdNsWZOOkeFUpT+E1pIF
 8dmw==
X-Gm-Message-State: AOAM533lmQoB7+pdB6CFZps9lVJr4TpMsBYt8wNpoB6cqf93xvaU+yYD
 mD1Iub8WV9aefvUCI9w1Yu8=
X-Google-Smtp-Source: ABdhPJz436Zw3YWQKZ/hPtmHRb319Ej3srR8Gc/K3d86FxQPw/wKMhw2zFKWx/8HRIJNrwlO9X6YPw==
X-Received: by 2002:aa7:9983:0:b029:2e9:e086:7917 with SMTP id
 k3-20020aa799830000b02902e9e0867917mr943222pfh.57.1623864864946; 
 Wed, 16 Jun 2021 10:34:24 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id m3sm2933901pfh.174.2021.06.16.10.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 10:34:24 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v4 1/7] iommu/amd: Selective flush on unmap
Date: Wed, 16 Jun 2021 03:04:54 -0700
Message-Id: <20210616100500.174507-2-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616100500.174507-1-namit@vmware.com>
References: <20210616100500.174507-1-namit@vmware.com>
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
index 3ac42bbdefc6..3e40f6610b6a 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2059,12 +2059,17 @@ static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
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
@@ -2167,7 +2172,13 @@ static void amd_iommu_flush_iotlb_all(struct iommu_domain *domain)
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
