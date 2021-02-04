Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1530ECDA
	for <lists.iommu@lfdr.de>; Thu,  4 Feb 2021 08:01:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C5DE220437;
	Thu,  4 Feb 2021 07:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7vZ37Q+41L3; Thu,  4 Feb 2021 07:01:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3A2732037A;
	Thu,  4 Feb 2021 07:01:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3155CC013A;
	Thu,  4 Feb 2021 07:01:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85F55C013A
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 07:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 71928871D6
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 07:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAtf28eZd7F9 for <iommu@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 07:01:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id AFFB885EE7
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 07:01:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EA5D1396;
 Wed,  3 Feb 2021 23:01:16 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.94.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 983C73F694;
 Wed,  3 Feb 2021 23:01:12 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org
Subject: [RFC 2/3] arm64/hugetlb: Enable HUGETLB_PAGE_SIZE_VARIABLE
Date: Thu,  4 Feb 2021 12:31:23 +0530
Message-Id: <1612422084-30429-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612422084-30429-1-git-send-email-anshuman.khandual@arm.com>
References: <1612422084-30429-1-git-send-email-anshuman.khandual@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

MAX_ORDER which invariably depends on FORCE_MAX_ZONEORDER can be a variable
for a given page size, depending on whether TRANSPARENT_HUGEPAGE is enabled
or not. In certain page size and THP combinations HUGETLB_PAGE_ORDER can be
greater than MAX_ORDER, making it unusable as pageblock_order.

This enables HUGETLB_PAGE_SIZE_VARIABLE making pageblock_order a variable
rather than the compile time constant HUGETLB_PAGE_ORDER which could break
MAX_ORDER rule for certain configurations.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 175914f2f340..c4acf8230f20 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1918,6 +1918,10 @@ config ARCH_ENABLE_THP_MIGRATION
 	def_bool y
 	depends on TRANSPARENT_HUGEPAGE
 
+config HUGETLB_PAGE_SIZE_VARIABLE
+	def_bool y
+	depends on HUGETLB_PAGE
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
