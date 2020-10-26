Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D222986E4
	for <lists.iommu@lfdr.de>; Mon, 26 Oct 2020 07:37:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 89E9E87200;
	Mon, 26 Oct 2020 06:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtKT5PfyGkpS; Mon, 26 Oct 2020 06:37:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 79171871C6;
	Mon, 26 Oct 2020 06:37:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56F61C1ADC;
	Mon, 26 Oct 2020 06:37:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42741C0051
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 06:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E6F4D871CC
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 06:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSBsR7+cFhgL for <iommu@lists.linux-foundation.org>;
 Mon, 26 Oct 2020 06:37:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1827C871D2
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 06:37:23 +0000 (UTC)
IronPort-SDR: vpdq0nX97Nf+GOcbRbjJiPVknMdg3cpMxY1fZ1gUIGXNa8io2caZ7RYQqtULpHtgjgiHFvE8Gj
 7ukpla7J75bA==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="167980529"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="167980529"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2020 23:37:16 -0700
IronPort-SDR: SW9PSpgPrR3cfwI9V9M3hmjSSYsReY583gF9oKzRSJl5lHUHtDDnf1ZzfEfmKPlvb5nB2QesdY
 JTztsEr6wmxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="350001157"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2020 23:37:12 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu: Fix deferred domain attachment in
 iommu_probe_device()
Date: Mon, 26 Oct 2020 14:30:08 +0800
Message-Id: <20201026063008.24849-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

The IOMMU core has support for deferring the attachment of default domain
to device. Fix a missed deferred attaching check in iommu_probe_device().

Fixes: cf193888bfbd3 ("iommu: Move new probe_device path to separate function")
Cc: stable@vger.kernel.org # v5.8+
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 6d847027d35e..690abf60239d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -93,6 +93,8 @@ static void __iommu_detach_group(struct iommu_domain *domain,
 static int iommu_create_device_direct_mappings(struct iommu_group *group,
 					       struct device *dev);
 static struct iommu_group *iommu_group_get_for_dev(struct device *dev);
+static bool iommu_is_attach_deferred(struct iommu_domain *domain,
+				     struct device *dev);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -264,7 +266,8 @@ int iommu_probe_device(struct device *dev)
 	 */
 	iommu_alloc_default_domain(group, dev);
 
-	if (group->default_domain)
+	if (group->default_domain &&
+	    !iommu_is_attach_deferred(group->default_domain, dev))
 		ret = __iommu_attach_device(group->default_domain, dev);
 
 	iommu_create_device_direct_mappings(group, dev);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
