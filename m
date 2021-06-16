Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD53AA27A
	for <lists.iommu@lfdr.de>; Wed, 16 Jun 2021 19:34:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 523AF832A9;
	Wed, 16 Jun 2021 17:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Eo09UHQ4H7L; Wed, 16 Jun 2021 17:34:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6C17283281;
	Wed, 16 Jun 2021 17:34:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A30BFC000D;
	Wed, 16 Jun 2021 17:34:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F35EC000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 17:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06BB7404CB
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 17:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4fHPd1D9EJK for <iommu@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 17:34:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71BEF404BF
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 17:34:32 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id t9so2577354pgn.4
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ahZGAXy9acwSVxDWNfEUSzxnYPHjGydJ4Ki8/ujo2d4=;
 b=UvCRFVv25P6A+UteTKxXOx9FJ9ojOITIh33NeOUUxyFtK8dWRAxiGS+jDP8RzlC6X5
 OmE93MjVhY/RJD6o/euM0bbZXiYqmPvhpKNNSEX+AoOsVPGDrnUacQPuXjWXngoZWOG2
 2Y2IYGnOY1AZoDJBw3VRmKwvvsM/yHMhmGHgOJNQtVPxhJYDlF4WP5+ZjxQ7kru+lqq+
 qUSh0w04/KuzbY1CINvfTkGDRDQaOLx6zNt3kQPMFOOgsyVLQr8Ai2MjOhlp3BeIE9qs
 Upkjn85xzfOdfXUbCnkStUbwwGd3i54TW6ZKJdu3gDGx5OmZ5W6bjrZtV54/prM7lUn0
 VaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahZGAXy9acwSVxDWNfEUSzxnYPHjGydJ4Ki8/ujo2d4=;
 b=eQbnymsjgGH882YcbXvVb+EoCMD80RtnRYycWPbjKk6wWNf2SC5K9KQT4Zp9xkUhg3
 cclcKMUCyK+wml3Wp0COluDVOSSQA1dc82kGFldxi9oDVZKLRrsaaUGac4JjVcdWPZnc
 u6fK/N8z5GEfduZ4hXumwM/EXSEdAVWxhauQfWtyC/neJAUPLZbexV5p8ahPLTnM9dYm
 OdrHY6oEA4ehyylFewyd7NeDqOH26HFryo/c9qEoi9+HjWxgMSkWhbz0jJhxrhxRjoX6
 EdhZj1M2Go11N/VEwLyirksymG7H1ji3U8oJUr8onL8V8gtIzXr6IRN4+jH4UyNE/BsY
 gLkQ==
X-Gm-Message-State: AOAM533bVotAisbQYbiV/CbCdZncqp8x3HTIcx8H+gJrirzkipLqIt1d
 Ib9bYg8EUu5UQW1tXsIt/6s=
X-Google-Smtp-Source: ABdhPJzB4NymddfIJDShOskkNBDG9hmXCzqxoQcCTIDXD4dK1j/pUVOnrFOJw0cFN30oMYIR4WQdIw==
X-Received: by 2002:a62:77d0:0:b029:2e9:a7ca:9c50 with SMTP id
 s199-20020a6277d00000b02902e9a7ca9c50mr985834pfc.5.1623864871795; 
 Wed, 16 Jun 2021 10:34:31 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id m3sm2933901pfh.174.2021.06.16.10.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 10:34:31 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v4 6/7] iommu/amd: Sync once for scatter-gather operations
Date: Wed, 16 Jun 2021 03:04:59 -0700
Message-Id: <20210616100500.174507-7-namit@vmware.com>
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

On virtual machines, software must flush the IOTLB after each page table
entry update.

The iommu_map_sg() code iterates through the given scatter-gather list
and invokes iommu_map() for each element in the scatter-gather list,
which calls into the vendor IOMMU driver through iommu_ops callback. As
the result, a single sg mapping may lead to multiple IOTLB flushes.

Fix this by adding amd_iotlb_sync_map() callback and flushing at this
point after all sg mappings we set.

This commit is followed and inspired by commit 933fcd01e97e2
("iommu/vt-d: Add iotlb_sync_map callback").

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Jiajun Cao <caojiajun@vmware.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Nadav Amit <namit@vmware.com>
---
 drivers/iommu/amd/iommu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 63048aabaf5d..ce8e970aac9a 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2027,6 +2027,16 @@ static int amd_iommu_attach_device(struct iommu_domain *dom,
 	return ret;
 }
 
+static void amd_iommu_iotlb_sync_map(struct iommu_domain *dom,
+				     unsigned long iova, size_t size)
+{
+	struct protection_domain *domain = to_pdomain(dom);
+	struct io_pgtable_ops *ops = &domain->iop.iop.ops;
+
+	if (ops->map)
+		domain_flush_np_cache(domain, iova, size);
+}
+
 static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
 			 phys_addr_t paddr, size_t page_size, int iommu_prot,
 			 gfp_t gfp)
@@ -2045,10 +2055,8 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
 	if (iommu_prot & IOMMU_WRITE)
 		prot |= IOMMU_PROT_IW;
 
-	if (ops->map) {
+	if (ops->map)
 		ret = ops->map(ops, iova, paddr, page_size, prot, gfp);
-		domain_flush_np_cache(domain, iova, page_size);
-	}
 
 	return ret;
 }
@@ -2228,6 +2236,7 @@ const struct iommu_ops amd_iommu_ops = {
 	.attach_dev = amd_iommu_attach_device,
 	.detach_dev = amd_iommu_detach_device,
 	.map = amd_iommu_map,
+	.iotlb_sync_map	= amd_iommu_iotlb_sync_map,
 	.unmap = amd_iommu_unmap,
 	.iova_to_phys = amd_iommu_iova_to_phys,
 	.probe_device = amd_iommu_probe_device,
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
