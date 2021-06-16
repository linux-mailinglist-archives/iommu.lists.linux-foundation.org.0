Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF9B3A9C29
	for <lists.iommu@lfdr.de>; Wed, 16 Jun 2021 15:39:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20D87414A0;
	Wed, 16 Jun 2021 13:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkEvyKN1Axh0; Wed, 16 Jun 2021 13:39:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E4CC5414BF;
	Wed, 16 Jun 2021 13:39:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D2EEC0024;
	Wed, 16 Jun 2021 13:39:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16D1DC0026
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 13:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D69583B0B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 13:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=quicinc.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUvVIVfILNWk for <iommu@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 13:39:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8928838C9
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1623850753; x=1655386753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=a7q8EuAYMzxg+4doJVnZ179Qf38aU1OCTgmBjq9gR0M=;
 b=oHxoKozenjCdcr8K+QP3/p2mUp2cNrQWA/f/rdddy2N9HiQKZtkKmG0x
 IAGpvF8hpNc8pdKhHUyLCwpM10egSiFjAe/aFd97xAdaRlAcZcUjTD8lG
 PJYfqwt6Cm6ZeWqxSduUqTcPWNjrOsrN5Ty++cSEjJyD/whMDfzTp64fU o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jun 2021 06:39:12 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 16 Jun 2021 06:39:11 -0700
Received: from th-lint-040.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Wed, 16 Jun 2021 06:39:10 -0700
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <will@kernel.org>, <robin.murphy@arm.com>
Subject: [PATCH v7 12/15] iommu/io-pgtable-arm-v7s: Implement
 arm_v7s_unmap_pages()
Date: Wed, 16 Jun 2021 06:38:53 -0700
Message-ID: <1623850736-389584-13-git-send-email-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623850736-389584-1-git-send-email-quic_c_gdjako@quicinc.com>
References: <1623850736-389584-1-git-send-email-quic_c_gdjako@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Cc: isaacm@codeaurora.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, djakov@kernel.org, pratikp@codeaurora.org,
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

From: "Isaac J. Manjarres" <isaacm@codeaurora.org>

Implement the unmap_pages() callback for the ARM v7s io-pgtable
format.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index d4004bcf333a..1af060686985 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -710,15 +710,32 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 	return __arm_v7s_unmap(data, gather, iova, size, lvl + 1, ptep);
 }
 
-static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
-			    size_t size, struct iommu_iotlb_gather *gather)
+static size_t arm_v7s_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
+				  size_t pgsize, size_t pgcount,
+				  struct iommu_iotlb_gather *gather)
 {
 	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	size_t unmapped = 0, ret;
 
 	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
 		return 0;
 
-	return __arm_v7s_unmap(data, gather, iova, size, 1, data->pgd);
+	while (pgcount--) {
+		ret = __arm_v7s_unmap(data, gather, iova, pgsize, 1, data->pgd);
+		if (!ret)
+			break;
+
+		unmapped += pgsize;
+		iova += pgsize;
+	}
+
+	return unmapped;
+}
+
+static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
+			    size_t size, struct iommu_iotlb_gather *gather)
+{
+	return arm_v7s_unmap_pages(ops, iova, size, 1, gather);
 }
 
 static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
@@ -781,6 +798,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	data->iop.ops = (struct io_pgtable_ops) {
 		.map		= arm_v7s_map,
 		.unmap		= arm_v7s_unmap,
+		.unmap_pages	= arm_v7s_unmap_pages,
 		.iova_to_phys	= arm_v7s_iova_to_phys,
 	};
 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
