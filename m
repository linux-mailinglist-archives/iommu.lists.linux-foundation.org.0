Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58242C877
	for <lists.iommu@lfdr.de>; Wed, 13 Oct 2021 20:17:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485B383077;
	Wed, 13 Oct 2021 18:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OukKsQMBf_cU; Wed, 13 Oct 2021 18:17:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 571428301F;
	Wed, 13 Oct 2021 18:17:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D7A1C0022;
	Wed, 13 Oct 2021 18:17:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 435F9C000D
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 18:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32B4260AE8
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 18:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=quicinc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KxG874by4yS for <iommu@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 18:17:21 +0000 (UTC)
X-Greylist: delayed 00:06:04 by SQLgrey-1.8.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F91E600BA
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 18:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634149041; x=1665685041;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=HHyOxsqKkzhzocslGHm95HxmgpnJGL36sX/8Jq2I5VQ=;
 b=SbmcVQtuvu5ydSjJFWWutw7sSSNgCiEIfTJiIIZOTeQf5uCk9cTUZ7H6
 NdC7qS0/gkWipSjHaA0hrooWf2TnnLRAgwJ+gBKiffEZbDWQ0CBvlqg3A
 mWxq9XxCqGNkrbFwjERwQ/XLL9do47tPlLBh4wFRcuT5s2F81RQaSezJR o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Oct 2021 11:11:16 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 11:11:15 -0700
Received: from th-lint-040.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 13 Oct 2021 11:11:15 -0700
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <joro@8bytes.org>, <will@kernel.org>
Subject: [PATCH] iommu/iova: Add support for IOVA max alignment tuning
Date: Wed, 13 Oct 2021 11:11:07 -0700
Message-ID: <1634148667-409263-1-git-send-email-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, akpm@linux-foundation.org,
 robin.murphy@arm.com
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

IOVAs are aligned to the smallest PAGE_SIZE order, where the requested
IOVA can fit. But this might not work for all use-cases. It can cause
IOVA fragmentation in some multimedia and 8K video use-cases that may
require larger buffers to be allocated and mapped.

When the above allocation pattern is used with the current alignment
scheme, the IOVA space could be quickly exhausted for 32bit devices.

In order to get better IOVA space utilization and reduce fragmentation,
a new kernel command line parameter is introduced to make the alignment
limit configurable by the user during boot.

Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
 drivers/iommu/iova.c                            | 26 ++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ad94a2aa9819..630246dc691f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2056,6 +2056,14 @@
 			  forcing Dual Address Cycle for PCI cards supporting
 			  greater than 32-bit addressing.
 
+	iommu.max_align_shift=
+			[ARM64, X86] Limit the alignment of IOVAs to a maximum
+			PAGE_SIZE order. Larger IOVAs will be aligned to this
+			specified order. The order is expressed as a power of
+			two multiplied by the PAGE_SIZE.
+			Format: { "4" | "5" | "6" | "7" | "8" | "9" }
+			Default: 9
+
 	iommu.strict=	[ARM64, X86] Configure TLB invalidation behaviour
 			Format: { "0" | "1" }
 			0 - Lazy mode.
diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 9e8bc802ac05..5a8c86871735 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -15,6 +15,9 @@
 /* The anchor node sits above the top of the usable address space */
 #define IOVA_ANCHOR	~0UL
 
+#define IOMMU_DEFAULT_IOVA_MAX_ALIGN_SHIFT	9
+static unsigned long iommu_max_align_shift __read_mostly = IOMMU_DEFAULT_IOVA_MAX_ALIGN_SHIFT;
+
 static bool iova_rcache_insert(struct iova_domain *iovad,
 			       unsigned long pfn,
 			       unsigned long size);
@@ -27,6 +30,27 @@ static void free_iova_rcaches(struct iova_domain *iovad);
 static void fq_destroy_all_entries(struct iova_domain *iovad);
 static void fq_flush_timeout(struct timer_list *t);
 
+static unsigned long limit_align_shift(struct iova_domain *iovad, unsigned long shift)
+{
+	unsigned long max_align_shift;
+
+	max_align_shift = iommu_max_align_shift + PAGE_SHIFT - iova_shift(iovad);
+	return min_t(unsigned long, max_align_shift, shift);
+}
+
+static int __init iommu_set_def_max_align_shift(char *str)
+{
+	unsigned long max_align_shift;
+
+	int ret = kstrtoul(str, 10, &max_align_shift);
+
+	if (!ret)
+		iommu_max_align_shift = max_align_shift;
+
+	return 0;
+}
+early_param("iommu.max_align_shift", iommu_set_def_max_align_shift);
+
 static int iova_cpuhp_dead(unsigned int cpu, struct hlist_node *node)
 {
 	struct iova_domain *iovad;
@@ -242,7 +266,7 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
 	unsigned long high_pfn = limit_pfn, low_pfn = iovad->start_pfn;
 
 	if (size_aligned)
-		align_mask <<= fls_long(size - 1);
+		align_mask <<= limit_align_shift(iovad, fls_long(size - 1));
 
 	/* Walk the tree backwards */
 	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
