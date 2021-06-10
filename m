Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 208E13A2714
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 10:31:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDE2983B66;
	Thu, 10 Jun 2021 08:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqJ2Pcshb-Od; Thu, 10 Jun 2021 08:31:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D0F9A83B62;
	Thu, 10 Jun 2021 08:31:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A92D6C0022;
	Thu, 10 Jun 2021 08:31:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0105FC000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 08:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E96FB83B66
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 08:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svcTmFyDFshM for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:31:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 590EE83B62
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 08:31:31 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de
 [79.242.186.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 3501317C;
 Thu, 10 Jun 2021 10:31:27 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Will Deacon <will@kernel.org>
Subject: [PATCH] iommu/vt-d: Fix linker error on 32-bit
Date: Thu, 10 Jun 2021 10:31:20 +0200
Message-Id: <20210610083120.29224-1-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
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

From: Joerg Roedel <jroedel@suse.de>

A recent commit broke the build on 32-bit x86. The linker throws these
messages:

	ld: drivers/iommu/intel/perf.o: in function `dmar_latency_snapshot':
	perf.c:(.text+0x40c): undefined reference to `__udivdi3'
	ld: perf.c:(.text+0x458): undefined reference to `__udivdi3'

The reason are the 64-bit divides in dmar_latency_snapshot(). Use the
div_u64() helper function for those.

Fixes: 55ee5e67a59a ("iommu/vt-d: Add common code for dmar latency performance monitors")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/intel/perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/perf.c b/drivers/iommu/intel/perf.c
index faaa96dda437..73b7ec705552 100644
--- a/drivers/iommu/intel/perf.c
+++ b/drivers/iommu/intel/perf.c
@@ -141,14 +141,14 @@ int dmar_latency_snapshot(struct intel_iommu *iommu, char *str, size_t size)
 				if (val == UINT_MAX)
 					val = 0;
 				else
-					val /= 1000;
+					val = div_u64(val, 1000);
 				break;
 			case COUNTS_MAX:
-				val /= 1000;
+				val = div_u64(val, 1000);
 				break;
 			case COUNTS_SUM:
 				if (lstat[i].samples)
-					val /= (lstat[i].samples * 1000);
+					val = div_u64(val, (lstat[i].samples * 1000));
 				else
 					val = 0;
 				break;
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
