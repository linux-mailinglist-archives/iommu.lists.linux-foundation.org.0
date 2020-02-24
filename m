Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3916B501
	for <lists.iommu@lfdr.de>; Tue, 25 Feb 2020 00:21:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 72035861A7;
	Mon, 24 Feb 2020 23:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERRuVziTxkuO; Mon, 24 Feb 2020 23:21:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3809B8609F;
	Mon, 24 Feb 2020 23:21:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30850C0177;
	Mon, 24 Feb 2020 23:21:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A128C0177
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 23:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 34397204FE
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 23:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scG1L81SPomM for <iommu@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 23:21:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by silver.osuosl.org (Postfix) with ESMTPS id 37BA5203DF
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 23:21:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 15:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,481,1574150400"; d="scan'208";a="255749662"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga002.jf.intel.com with ESMTP; 24 Feb 2020 15:21:10 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/2] Replace Intel SVM with IOMMU SVA APIs
Date: Mon, 24 Feb 2020 15:26:34 -0800
Message-Id: <1582586797-61697-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Shared virtual address (SVA) capable accelerator device drivers on Intel
platform are required to call VT-d driver directly to bind a device with
a given address space. It is conceptually incorrect with the following
reasons:
- A device driver is bypassing IOMMU generic layer
- Device driver cannot be reused across architectures
- Opens a door to duplicated code

Generic SVA APIs was introduced[1] and partially merged upstream which
created a common ground for vendor IOMMU driver to consolidate SVA code.

On the other hand, Uacce (Unified/User-space-access-intended Accelerator
Framework) [2] is emerging to be a generic user-kernel interface for SVA
capable devices.

IOMMU generic SVA APIs are used by Uacce. Therefore, replacing VT-d SVM
code with IOMMU SVA APIs are required by device drivers want to use
Uacce.

The features below will continue to work but are not included in this patch
in that they are handled mostly within the IOMMU subsystem.
- IO page fault
- mmu notifier

Consolidation of the above will come after generic IOMMU sva code[1].
There should not be any changes needed for accelerator device drivers
during this time.

References:
[1] http://jpbrucker.net/sva/
[2] https://lkml.org/lkml/2020/1/15/604

Jacob Pan (2):
  iommu/vt-d: Report SVA feature with generic flag
  iommu/vt-d: Replace intel SVM APIs with generic SVA APIs

 drivers/iommu/intel-iommu.c |   8 +++
 drivers/iommu/intel-svm.c   | 123 ++++++++++++++++++++++++--------------------
 include/linux/intel-iommu.h |   7 +++
 include/linux/intel-svm.h   |  85 ------------------------------
 4 files changed, 83 insertions(+), 140 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
