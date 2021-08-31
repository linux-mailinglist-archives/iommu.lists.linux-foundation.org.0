Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA013FC5DF
	for <lists.iommu@lfdr.de>; Tue, 31 Aug 2021 13:30:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E7C60BB9;
	Tue, 31 Aug 2021 11:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxuzlpYGsoGf; Tue, 31 Aug 2021 11:30:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A1F8C60BCE;
	Tue, 31 Aug 2021 11:30:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 707CCC0022;
	Tue, 31 Aug 2021 11:30:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A70FC000E
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 11:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A0F24044E
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 11:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8ndlk6m9ujE for <iommu@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 11:30:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51524400C6
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 11:30:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="218171586"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="218171586"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 04:29:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="540970405"
Received: from cfitzp2-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.255.231])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 04:29:54 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu/vt-d: Do not falsely log intel_iommu is unsupported
 kernel option
Date: Tue, 31 Aug 2021 12:29:47 +0100
Message-Id: <20210831112947.310080-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Eero Tamminen <eero.t.tamminen@intel.com>, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Handling of intel_iommu kernel command line option should return "true" to
indicate option is valid and so avoid logging it as unknown by the core
parsing code.

Also log unknown sub-options at the notice level to let user know of
potential typos or similar.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 327f477a8553..41d163e275b2 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -463,13 +463,15 @@ static int __init intel_iommu_setup(char *str)
 		} else if (!strncmp(str, "tboot_noforce", 13)) {
 			pr_info("Intel-IOMMU: not forcing on after tboot. This could expose security risk for tboot\n");
 			intel_iommu_tboot_noforce = 1;
+		} else {
+			pr_notice("Unknown option - '%s'\n", str);
 		}
 
 		str += strcspn(str, ",");
 		while (*str == ',')
 			str++;
 	}
-	return 0;
+	return 1;
 }
 __setup("intel_iommu=", intel_iommu_setup);
 
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
