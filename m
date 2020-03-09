Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EAD17EA4E
	for <lists.iommu@lfdr.de>; Mon,  9 Mar 2020 21:43:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E423E889A3;
	Mon,  9 Mar 2020 20:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Zb7HA-lmshi; Mon,  9 Mar 2020 20:43:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 52C0788936;
	Mon,  9 Mar 2020 20:43:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36BD7C0177;
	Mon,  9 Mar 2020 20:43:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5F27C0177
 for <iommu@lists.linux-foundation.org>; Mon,  9 Mar 2020 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A4FD987303
 for <iommu@lists.linux-foundation.org>; Mon,  9 Mar 2020 19:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkZw7V6_Aprf for <iommu@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 19:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 979E587264
 for <iommu@lists.linux-foundation.org>; Mon,  9 Mar 2020 19:53:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 12:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="234104034"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.162])
 by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2020 12:53:17 -0700
From: Megha Dey <megha.dey@linux.intel.com>
To: dwmw2@infradead.org, baolu.lu@linux.intel.com,
 iommu@lists.linux-foundation.org
Subject: [Patch V1 0/2] iommu/vtd: Fixes to the IOMMU debugfs
Date: Mon,  9 Mar 2020 13:09:45 -0700
Message-Id: <1583784587-26126-1-git-send-email-megha.dey@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 09 Mar 2020 20:43:19 +0000
Cc: Megha Dey <megha.dey@linux.intel.com>, megha.dey@intel.com
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

This patchset aims to fix some of the existing issues in the iommu debugfs.

The first patch aims to fix the debugfs register reads by using the correct
read function variant while reading the contents of iommu registers while
the second patch ensures the debugfs directory is populated even if DMA
remapping is disabled.

Megha Dey (2):
  iommu/vt-d: Fix debugfs register reads
  iommu/vt-d: Populate debugfs if IOMMUs are detected

 drivers/iommu/intel-iommu-debugfs.c | 53 ++++++++++++++++++++++++++-----------
 drivers/iommu/intel-iommu.c         |  4 ++-
 include/linux/intel-iommu.h         |  2 ++
 3 files changed, 43 insertions(+), 16 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
