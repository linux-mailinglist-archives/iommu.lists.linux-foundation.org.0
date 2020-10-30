Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFD29FBD2
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 03:58:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EFA7586ACF;
	Fri, 30 Oct 2020 02:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6dT-wqZJ9Mi; Fri, 30 Oct 2020 02:58:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D07586AC9;
	Fri, 30 Oct 2020 02:58:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D8D5C0051;
	Fri, 30 Oct 2020 02:58:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 273C0C0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 02:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1691187436
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 02:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bsmUerBHnoXN for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 02:58:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 90E918742C
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 02:58:14 +0000 (UTC)
IronPort-SDR: KHrsv+wyEhZ+FMx0faweaVvT4sfk9ZlMpYTCwajv+UFT/DVSIP4XgUplLsEhPew3Dl1s6zKpaz
 VQ/eXjbW3y6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165054110"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="165054110"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 19:58:14 -0700
IronPort-SDR: FD/AEwI0yVS5kY8jkVsWhYxD2oP8AKjMoLYNqDloNC5pFCqe/e5bkDF8HinCaODScUxx1yVJ9a
 zbAebystXiHg==
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="469374387"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.144.104])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 29 Oct 2020 19:58:11 -0700
From: Yi Sun <yi.y.sun@linux.intel.com>
To: joro@8bytes.org, dwmw2@infradead.org, baolu.lu@linux.intel.com,
 jean-philippe@linaro.org
Subject: [PATCH v2 0/2] iommu: Fix a few issues related to PRQ
Date: Fri, 30 Oct 2020 10:37:22 +0800
Message-Id: <1604025444-6954-1-git-send-email-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: iommu@lists.linux-foundation.org, Yi Sun <yi.y.sun@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

We found a few issues about PRQ. So, two patches are cooked to
fix them. Please have a review. Thanks!

Changes from v1:
================
- Modify subject of patch 1 to make it more accurate.
- Move get_domain_info() up to the sanity check part in patch 1.
- Remove v1 patch 2 which is not suitable.
- Add description for current patch 2.
- Add 'Fixes:' tags for all patches.

Liu Yi L (1):
  iommu/vt-d: Fix sid not set issue in in intel_svm_bind_gpasid()

Liu, Yi L (1):
  iommu/vt-d: Fix a bug for PDP check in prq_event_thread

 drivers/iommu/intel/svm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
