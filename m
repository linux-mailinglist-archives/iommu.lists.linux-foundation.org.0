Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA130D67A
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 10:42:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3340B86793;
	Wed,  3 Feb 2021 09:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aU-jGaXvbiZT; Wed,  3 Feb 2021 09:42:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 92FC586777;
	Wed,  3 Feb 2021 09:42:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72FF8C013A;
	Wed,  3 Feb 2021 09:42:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2244BC013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 106CA86777
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HgDSGEg6QFzx for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 09:42:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4D0E486456
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:42:11 +0000 (UTC)
IronPort-SDR: hcWpBS0Xx2pvZVP/jsFdyszEhl8x9NrpUsxgDdBl/9Qqdsz8BEq+o7XrvF8paNFkUNR9NxCuCB
 TGrQMxmkarkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="181160142"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="181160142"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 01:42:10 -0800
IronPort-SDR: 4di4MGDNauou9gr9WYEvpec2zJ1u4a8jz8BZpnPBC6F9Xc4pmyEn1r9gPN4EwTyYPVfRmIb12r
 P0PlzUbkrWkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="480285024"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2021 01:42:08 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 0/3] iommu/vt-d: Add support for ACPI/SATC table
Date: Wed,  3 Feb 2021 17:33:25 +0800
Message-Id: <20210203093329.1617808-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
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

The Intel VT-d specification v3.2 comes with a new ACPI SATC (SoC-
Integrated Address Translation Cache) reporting structure. The SoC
integrated device enumerated in this table has a functional
requirement to enable its ATC (Address Translation Cache) via the
ATS capability for device operation.

This patch set adds the code to parse the SATC table, enumerates the
devices in it and satisfies the ATS requirement for them. Please help
to review. I will queue it in VT-d update for v5.12 if no objection.

Yian Chen (3):
  iommu/vt-d: Add new enum value and structure for SATC
  iommu/vt-d: Parse SATC reporting structure
  iommu/vt-d: Apply SATC policy

 drivers/iommu/intel/dmar.c  |   8 ++
 drivers/iommu/intel/iommu.c | 162 +++++++++++++++++++++++++++++++++++-
 include/acpi/actbl1.h       |  11 ++-
 include/linux/dmar.h        |   2 +
 4 files changed, 178 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
