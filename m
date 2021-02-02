Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4AC30B6B1
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 05:49:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4CA8B835E8;
	Tue,  2 Feb 2021 04:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COe4yligmuy2; Tue,  2 Feb 2021 04:49:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2BB63835DF;
	Tue,  2 Feb 2021 04:49:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14ABEC013A;
	Tue,  2 Feb 2021 04:49:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B5BCC013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 04:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 72B3F8667A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 04:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id faaufwhHDihW for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 04:49:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D41508665D
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 04:49:25 +0000 (UTC)
IronPort-SDR: FYwTY/EIb/9i+lIA3KrSrAkZaGMlWyujaRRvPw4/dsqT3he9FP8Tor7Pjp6qB6nVJK6VIvUXnj
 xhcBh/X2zgtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="199708349"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="199708349"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 20:49:25 -0800
IronPort-SDR: 1lAE3OWH1MDJokNweNf9yHQ+WZ8pajDbquDw52AHFbF93hyDajy5+HMrR6BxbxX9dJFgPKxLfZ
 cgAHU5OjOzOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="479423171"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2021 20:49:23 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 0/3] iommu/vt-d: Add support for ACPI/SATC table
Date: Tue,  2 Feb 2021 12:40:54 +0800
Message-Id: <20210202044057.615277-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org
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

Intel platform VT-d (v3.2) comes with a new type of DMAR subtable
SATC. The SATC table includes a list of SoC integrated devices
that require SATC. OS software can use this table to enable ATS
only for the devices in the list.

Yian Chen (3):
  iommu/vt-d: Add new enum value and structure for SATC
  iommu/vt-d: Parse SATC reporting structure
  iommu/vt-d: Apply SATC policy

 drivers/iommu/intel/dmar.c  |   9 ++
 drivers/iommu/intel/iommu.c | 161 +++++++++++++++++++++++++++++++++++-
 include/acpi/actbl1.h       |  11 ++-
 include/linux/dmar.h        |   2 +
 4 files changed, 178 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
