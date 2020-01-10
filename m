Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C340A137132
	for <lists.iommu@lfdr.de>; Fri, 10 Jan 2020 16:29:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6569C221FF;
	Fri, 10 Jan 2020 15:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1X6IV7eQ31h; Fri, 10 Jan 2020 15:29:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 76DB92221C;
	Fri, 10 Jan 2020 15:29:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64EA5C0881;
	Fri, 10 Jan 2020 15:29:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74B8DC0881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 15:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 640AF22219
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 15:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Ip3qesG3zOz for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 15:29:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 323C5221FB
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 15:29:02 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9A162072E;
 Fri, 10 Jan 2020 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578670142;
 bh=XDhMKYHKYKCs5Yd37zUZP3/fa97xSPHnezl5XOkh/wE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xLFsU+ze8ckwBqHsHqq2pBptDUrdFlE+4KQ35YxjI0IdWKuBDBSp7/lzsjgzAc0ep
 MFu9c7KCbIr1ceyZ6AIC4vgX888Za+NXjnX4Ldenf3HRKogHLz6ZTe6cMjHuX7gwu5
 OTLWpeImXMPet7KnhjnTCaUAnfHYNPwCw4gSGVPM=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 3/8] iommu/io-pgtable-arm: Ensure non-cacheable mappings are
 Outer Shareable
Date: Fri, 10 Jan 2020 15:28:47 +0000
Message-Id: <20200110152852.24259-4-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110152852.24259-1-will@kernel.org>
References: <20200110152852.24259-1-will@kernel.org>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, kernel-team@android.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

The Armv7 ARM states that Normal, Non-cacheable mappings must explicitly
be marked as Outer Shareable in order to avoid UNPREDICTABLE behaviour:

  | Overlaying the shareability attribute (B3-1377, ARM DDI 0406C.c)
  |
  | A memory region with a resultant memory type attribute of Normal, and
  | a resultant cacheability attribute of Inner Non-cacheable, Outer
  | Non-cacheable, must have a resultant shareability attribute of Outer
  | Shareable, otherwise shareability is UNPREDICTABLE

Although this requirement doesn't appear to exist in the Armv8 docs,
where the 'SH' field is simply ignored in this case, it's
straightforward enough to set it here.

Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/io-pgtable-arm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index ab440b52a5f4..4b437ead2300 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -303,9 +303,8 @@ static void __arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 
 	if (data->iop.fmt != ARM_MALI_LPAE)
 		pte |= ARM_LPAE_PTE_AF;
-	pte |= ARM_LPAE_PTE_SH_IS;
-	pte |= paddr_to_iopte(paddr, data);
 
+	pte |= paddr_to_iopte(paddr, data);
 	__arm_lpae_set_pte(ptep, pte, &data->iop.cfg);
 }
 
@@ -463,6 +462,11 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 	if (prot & IOMMU_NOEXEC)
 		pte |= ARM_LPAE_PTE_XN;
 
+	if (prot & IOMMU_CACHE)
+		pte |= ARM_LPAE_PTE_SH_IS;
+	else
+		pte |= ARM_LPAE_PTE_SH_OS;
+
 	return pte;
 }
 
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
