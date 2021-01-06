Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9112EB7C4
	for <lists.iommu@lfdr.de>; Wed,  6 Jan 2021 02:51:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7996D84EB9;
	Wed,  6 Jan 2021 01:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPy9A2qtCnS0; Wed,  6 Jan 2021 01:51:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4FD1C84DDD;
	Wed,  6 Jan 2021 01:51:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F5D0C013A;
	Wed,  6 Jan 2021 01:51:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 089E7C013A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 01:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E488785325
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 01:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLongFFp-bxN for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jan 2021 01:51:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4EE7F851E5
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 01:51:51 +0000 (UTC)
IronPort-SDR: o6HJ7X60kFWmUrwMwqfzN7hNzWm/iPcq9Bo2/J8lm16Qt9Hxe87RRr7tbn/YVeBnl4iGYjrY9o
 OnVrE6Nu6uhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="164912310"
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; d="scan'208";a="164912310"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 17:51:50 -0800
IronPort-SDR: QAz4tl1dFNjrArGzYCE5AHO5KTudeizzxbVy8iC428crbeCWwOJyZFIKy98Bp4egqnENnYdf5A
 B0rKwgZhMc3g==
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; d="scan'208";a="361387904"
Received: from km-skylake-client-platform.sc.intel.com ([10.3.52.146])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 17:51:49 -0800
From: Kyung Min Park <kyung.min.park@intel.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v4 0/3] Audit Capability and Extended Capability among IOMMUs 
Date: Tue,  5 Jan 2021 17:30:32 -0800
Message-Id: <20210106013035.6476-1-kyung.min.park@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: ravi.v.shankar@intel.com, kevin.tian@intel.com, ashok.raj@intel.com,
 dwmw2@infradead.org, ricardo.neri@intel.com, kyung.min.park@intel.com,
 will@kernel.org
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

Modern platforms have more than one IOMMU. Each IOMMU has its own
feature set. Some of these features must be consistent among IOMMUs.
Otherwise, these differences can lead to improper behavior in the system.
On the other hand, for some features, each IOMMU can have different
capacity values. So, different actions are required to deal with the
inconsistencies depending on the IOMMU features.

Currently, some inconsistencies are ignored by the IOMMU driver.
This patchset checks IOMMU capabilities and extended capabilities
centralizedly during boot and take different actions according to
the impacts caused by the mismatches.

For example:
 1. Disable Shared Virtual Memory.
 2. Use common capacity values (normally the lowest capacity value) for
    all IOMMUs.
 3. Report feature mismatches.

Detailed information on the IOMMU Capability / Extended Capability can
be found in Intel VT-d Specification.

Link: https://software.intel.com/sites/default/files/managed/c5/15/vt-directed-io-spec.pdf

ChangeLog:
- Change from v3 to v4:
  1. fix the build error for when only enabled irq remapping.
- Change from v2 to v3:
  1. fix the wrong macro names and rebase to v5.10.
- Change from v1 to v2:
  1. Add missing cap/ecaps for audit.
  2. Refactor function/macros overal suggested by Lu, Baolu.
  2. Skip audit for gfx dedicated IOMMU.
  3. Change commit message.

Kyung Min Park (3):
  iommu/vt-d: Audit IOMMU Capabilities and add helper functions
  iommu/vt-d: Move capability check code to cap_audit files
  iommu/vt-d: Disable SVM in the platform when IOMMUs have
    inconsistencies

 drivers/iommu/intel/Makefile        |   4 +-
 drivers/iommu/intel/cap_audit.c     | 219 ++++++++++++++++++++++++++++
 drivers/iommu/intel/cap_audit.h     | 132 +++++++++++++++++
 drivers/iommu/intel/iommu.c         |  85 ++---------
 drivers/iommu/intel/irq_remapping.c |   8 +
 drivers/iommu/intel/svm.c           |   3 +-
 include/linux/intel-iommu.h         |  39 ++---
 7 files changed, 395 insertions(+), 95 deletions(-)
 create mode 100644 drivers/iommu/intel/cap_audit.c
 create mode 100644 drivers/iommu/intel/cap_audit.h

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
