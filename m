Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B632A997
	for <lists.iommu@lfdr.de>; Tue,  2 Mar 2021 19:45:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E22D94319B;
	Tue,  2 Mar 2021 18:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n520MF35s_bv; Tue,  2 Mar 2021 18:45:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E65343183;
	Tue,  2 Mar 2021 18:45:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6409C0001;
	Tue,  2 Mar 2021 18:45:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76B53C0001
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 18:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7128560717
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 18:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fSQh1l3JNhD for <iommu@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 18:45:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E11FB60713
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 18:45:46 +0000 (UTC)
IronPort-SDR: WVXw1tyK9llhx7/p/PjHGRNEkqzsF2CKuhVHX6k/uk/UibbMzOF0yH52x2cXrpaxkXdVIEWUei
 W5p0FthejLpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174575567"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174575567"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 10:45:46 -0800
IronPort-SDR: aCYvvGs7aPQeqpMHnIVnr1zjKEwaG2KBWxEjra5ru6lWdgOgGhqZvSCx1lVamLb7y5F9GYO2KQ
 eWP8BJyB+VhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="406158799"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2021 10:45:45 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 0/4] Misc vSVA fixes for VT-d
Date: Tue,  2 Mar 2021 02:13:56 -0800
Message-Id: <1614680040-1989-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
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

Hi Baolu et al,

This is a collection of SVA-related fixes.

ChangeLog:

v2:
	- For guest SVA, call pasid_set_wpe directly w/o checking host CR0.wp
	  (Review comments by Kevin T.)
	- Added fixes tag

Thanks,

Jacob

Jacob Pan (4):
  iommu/vt-d: Enable write protect for supervisor SVM
  iommu/vt-d: Enable write protect propagation from guest
  iommu/vt-d: Reject unsupported page request modes
  iommu/vt-d: Calculate and set flags for handle_mm_fault

 drivers/iommu/intel/pasid.c | 29 +++++++++++++++++++++++++++++
 drivers/iommu/intel/svm.c   | 21 +++++++++++++++++----
 include/uapi/linux/iommu.h  |  3 ++-
 3 files changed, 48 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
