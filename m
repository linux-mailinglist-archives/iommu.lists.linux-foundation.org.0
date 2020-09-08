Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF1C25EC29
	for <lists.iommu@lfdr.de>; Sun,  6 Sep 2020 04:41:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FDA087006;
	Sun,  6 Sep 2020 02:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IliuI4DA7G-6; Sun,  6 Sep 2020 02:41:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6719687014;
	Sun,  6 Sep 2020 02:41:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50737C0051;
	Sun,  6 Sep 2020 02:41:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ADCCC0052
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 02:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ECE3986FE8
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 02:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1AuAqx4KlAY for <iommu@lists.linux-foundation.org>;
 Sun,  6 Sep 2020 02:41:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCB6E87006
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 02:41:46 +0000 (UTC)
IronPort-SDR: vXk9g90fv6nwGtXP8ld1UOu2Bg4NCdEBK0vmqWXI+Qm/9kAgvKr4L01sjc9gkCJ2ByngfmFa1l
 TONuKM+c9qxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9735"; a="137938309"
X-IronPort-AV: E=Sophos;i="5.76,396,1592895600"; d="scan'208";a="137938309"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2020 19:41:46 -0700
IronPort-SDR: qV56VscQ8/T6SAReczFTN9l7BsOoEZXx0pCcI4cd883kkcQ/QOfHr5zVDAz564NrUHKkFHPRTL
 oPlwYVjwiUmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,396,1592895600"; d="scan'208";a="340359284"
Received: from purley-4s.sc.intel.com ([172.25.112.112])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2020 19:41:45 -0700
From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V7 2/3] iommu: Take lock before reading iommu group default
 domain type
Date: Mon,  7 Sep 2020 20:54:46 -0700
Message-Id: <1c874d14614921c7283de594fb69d430e3be6cc7.1595619936.git.sai.praneeth.prakhya@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1595619936.git.sai.praneeth.prakhya@intel.com>
References: <cover.1595619936.git.sai.praneeth.prakhya@intel.com>
In-Reply-To: <cover.1595619936.git.sai.praneeth.prakhya@intel.com>
References: <cover.1595619936.git.sai.praneeth.prakhya@intel.com>
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

"/sys/kernel/iommu_groups/<grp_id>/type" file could be read to find out the
default domain type of an iommu group. The default domain of an iommu group
doesn't change after booting and hence could be read directly. But,
after addding support to dynamically change iommu group default domain, the
above assumption no longer stays valid.

iommu group default domain type could be changed at any time by writing to
"/sys/kernel/iommu_groups/<grp_id>/type". So, take group mutex before
reading iommu group default domain type so that the user wouldn't see stale
values or iommu_group_show_type() doesn't try to derefernce stale pointers.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
---
 drivers/iommu/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 939b37727722..b1607832ede9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -501,6 +501,7 @@ static ssize_t iommu_group_show_type(struct iommu_group *group,
 {
 	char *type = "unknown\n";
 
+	mutex_lock(&group->mutex);
 	if (group->default_domain) {
 		switch (group->default_domain->type) {
 		case IOMMU_DOMAIN_BLOCKED:
@@ -517,6 +518,7 @@ static ssize_t iommu_group_show_type(struct iommu_group *group,
 			break;
 		}
 	}
+	mutex_unlock(&group->mutex);
 	strcpy(buf, type);
 
 	return strlen(type);
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
