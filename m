Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD931852E
	for <lists.iommu@lfdr.de>; Thu, 11 Feb 2021 07:22:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61D2D873CA;
	Thu, 11 Feb 2021 06:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJkDnbjGugdp; Thu, 11 Feb 2021 06:22:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4CACB873B6;
	Thu, 11 Feb 2021 06:22:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 371CDC0174;
	Thu, 11 Feb 2021 06:22:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EA9CC013A
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 06:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8A35D86AF2
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 06:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBWAsQCRFQNI for <iommu@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 06:22:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CCD2086AB7
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 06:22:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E6CC1396;
 Wed, 10 Feb 2021 22:22:08 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.94.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 804593F73B;
 Wed, 10 Feb 2021 22:22:03 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, will@kernel.org
Subject: [PATCH 2/3] arm64/hugetlb: Enable HUGETLB_PAGE_SIZE_VARIABLE
Date: Thu, 11 Feb 2021 11:52:10 +0530
Message-Id: <1613024531-19040-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613024531-19040-1-git-send-email-anshuman.khandual@arm.com>
References: <1613024531-19040-1-git-send-email-anshuman.khandual@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-kernel@vger.kernel.org,
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
index f39568b28ec1..8e3a5578f663 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1909,6 +1909,10 @@ config ARCH_ENABLE_THP_MIGRATION
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
