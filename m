Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2D912E145
	for <lists.iommu@lfdr.de>; Thu,  2 Jan 2020 01:19:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0790860BE;
	Thu,  2 Jan 2020 00:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMdlqjeudbxH; Thu,  2 Jan 2020 00:19:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 07C2D85D5C;
	Thu,  2 Jan 2020 00:19:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E91CDC077D;
	Thu,  2 Jan 2020 00:19:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE8BCC077D
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CDAE586224
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gn7vDasCEBY for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 00:19:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 23AEE85F37
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jan 2020 16:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,384,1571727600"; d="scan'208";a="244475946"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jan 2020 16:19:49 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 19/22] iommu/vt-d: Update first level super page capability
Date: Thu,  2 Jan 2020 08:18:20 +0800
Message-Id: <20200102001823.21976-20-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102001823.21976-1-baolu.lu@linux.intel.com>
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
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

First-level translation may map input addresses to 4-KByte pages,
2-MByte pages, or 1-GByte pages. Support for 4-KByte pages and
2-Mbyte pages are mandatory for first-level translation. Hardware
support for 1-GByte page is reported through the FL1GP field in
the Capability Register.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 1ebf5ed460cf..34e619318f64 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -685,11 +685,12 @@ static int domain_update_iommu_snooping(struct intel_iommu *skip)
 	return ret;
 }
 
-static int domain_update_iommu_superpage(struct intel_iommu *skip)
+static int domain_update_iommu_superpage(struct dmar_domain *domain,
+					 struct intel_iommu *skip)
 {
 	struct dmar_drhd_unit *drhd;
 	struct intel_iommu *iommu;
-	int mask = 0xf;
+	int mask = 0x3;
 
 	if (!intel_iommu_superpage) {
 		return 0;
@@ -699,7 +700,13 @@ static int domain_update_iommu_superpage(struct intel_iommu *skip)
 	rcu_read_lock();
 	for_each_active_iommu(iommu, drhd) {
 		if (iommu != skip) {
-			mask &= cap_super_page_val(iommu->cap);
+			if (domain && domain_use_first_level(domain)) {
+				if (!cap_fl1gp_support(iommu->cap))
+					mask = 0x1;
+			} else {
+				mask &= cap_super_page_val(iommu->cap);
+			}
+
 			if (!mask)
 				break;
 		}
@@ -714,7 +721,7 @@ static void domain_update_iommu_cap(struct dmar_domain *domain)
 {
 	domain_update_iommu_coherency(domain);
 	domain->iommu_snooping = domain_update_iommu_snooping(NULL);
-	domain->iommu_superpage = domain_update_iommu_superpage(NULL);
+	domain->iommu_superpage = domain_update_iommu_superpage(domain, NULL);
 }
 
 struct context_entry *iommu_context_addr(struct intel_iommu *iommu, u8 bus,
@@ -4604,7 +4611,7 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 			iommu->name);
 		return -ENXIO;
 	}
-	sp = domain_update_iommu_superpage(iommu) - 1;
+	sp = domain_update_iommu_superpage(NULL, iommu) - 1;
 	if (sp >= 0 && !(cap_super_page_val(iommu->cap) & (1 << sp))) {
 		pr_warn("%s: Doesn't support large page.\n",
 			iommu->name);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
