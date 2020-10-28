Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3729CD72
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 02:57:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8855A864A6;
	Wed, 28 Oct 2020 01:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0n3XwvhEAjv5; Wed, 28 Oct 2020 01:57:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3544286987;
	Wed, 28 Oct 2020 01:57:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18BFCC0051;
	Wed, 28 Oct 2020 01:57:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6964BC0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 48CF22E122
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXA3xrM9At+K for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 01:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 849402049B
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:47 +0000 (UTC)
IronPort-SDR: PAGvBuUJNxxvUXbNutoVWzMkLw3ueAHCxNDJ9+VVxiqfn3p+JH+SET2KbnnKgE0lpB09ij4OJm
 +vqqiU8A3h5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="185942618"
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="185942618"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 18:57:43 -0700
IronPort-SDR: mtzmsDX6FK/jq6PSJ3kRaOwc96ZNR77fzLu8/mvqK5ssxwm+G76pJxJohmlf2fQkvtFu8UFpC9
 m4wQh/By+B0A==
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="468554086"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.145.59])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 27 Oct 2020 18:57:41 -0700
From: Yi Sun <yi.y.sun@linux.intel.com>
To: joro@8bytes.org,
	dwmw2@infradead.org,
	baolu.lu@linux.intel.com
Subject: [PATCH v1 0/3] iommu: Fix a few issues related to PRQ
Date: Wed, 28 Oct 2020 09:36:55 +0800
Message-Id: <1603849018-6578-1-git-send-email-yi.y.sun@linux.intel.com>
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

We found a few issues about PRQ. So, three patches are cooked to
fix them. Please have a review. Thanks!

Jacob Pan (1):
  iommu: Fix an issue in iommu_page_response() flags check

Liu Yi L (1):
  iommu/vt-d: Fix prq reporting issues

Liu, Yi L (1):
  iommu/vt-d: Fix a bug for PDP check in prq_event_thread

 drivers/iommu/intel/svm.c | 5 ++++-
 drivers/iommu/iommu.c     | 6 ++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
