Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F22162D2
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 02:06:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 669DA81CC4;
	Tue,  7 Jul 2020 00:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEDQHsg1F58z; Tue,  7 Jul 2020 00:06:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C9358860D;
	Tue,  7 Jul 2020 00:06:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D700C0891;
	Tue,  7 Jul 2020 00:06:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DD62C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 00:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1B6D488EE6
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 00:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BHFy0wyHW49 for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 00:06:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3472686397
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 00:06:18 +0000 (UTC)
IronPort-SDR: wrVxdwgTBVtYWrGJlsTeiqtX6vXs9PPdHqAEmcPlueqb06mnDS5w+c0jr1GBTfwdv3r5/+BLrC
 OWTWWQXjd+AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="232379348"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="232379348"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 17:06:17 -0700
IronPort-SDR: VrRVTkhV5Kkl8bkovYinkC2tlC80oMlpdIW65zKC5YQI3igcyF+gPzRtvI0VC5fV63kTqJQJIj
 sogfGByOhuNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="456913803"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 06 Jul 2020 17:06:17 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v4 0/7] iommu/vt-d: Misc tweaks and fixes for vSVA
Date: Mon,  6 Jul 2020 17:12:47 -0700
Message-Id: <1594080774-33413-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>
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

Hi Baolu and all,

This is a series to address some of the issues we found in vSVA support.
Most of the patches deal with exception handling, we also removed some bits
that are not currently supported.

Many thanks to Kevin Tian's review.

Jacob & Yi


Changelog:
v4	Address reviews from Eric Auger
	- Additional warning for unaligned mask and address in guest IOTLB
	  invalidation
	- Comments rewrite and code simplification
v3
	- Use pr_err instead of WARN() for invalid user address range (6/7)
	- Fix logic in PASID selective devTLB flush (3/7)

v2 Address reviews from Baolu
	- Fixed addr field in devTLB flush (5/7)
	- Assign address for single page devTLB invalidation (4/7)
	- Coding style tweaks


Jacob Pan (4):
  iommu/vt-d: Remove global page support in devTLB flush
  iommu/vt-d: Fix PASID devTLB invalidation
  iommu/vt-d: Warn on out-of-range invalidation address
  iommu/vt-d: Disable multiple GPASID-dev bind

Liu Yi L (3):
  iommu/vt-d: Enforce PASID devTLB field mask
  iommu/vt-d: Handle non-page aligned address
  iommu/vt-d: Fix devTLB flush for vSVA

 drivers/iommu/intel/dmar.c  | 24 +++++++++++++++++++-----
 drivers/iommu/intel/iommu.c | 39 ++++++++++++++++++++++++---------------
 drivers/iommu/intel/pasid.c | 11 ++++++++++-
 drivers/iommu/intel/svm.c   | 22 +++++++++-------------
 include/linux/intel-iommu.h |  5 ++---
 5 files changed, 64 insertions(+), 37 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
