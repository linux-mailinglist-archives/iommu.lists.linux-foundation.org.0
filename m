Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E50C1E9B09
	for <lists.iommu@lfdr.de>; Mon,  1 Jun 2020 02:46:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BE08E20497;
	Mon,  1 Jun 2020 00:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Up9FrQ++OnNA; Mon,  1 Jun 2020 00:46:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3924820409;
	Mon,  1 Jun 2020 00:46:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BDD0C0176;
	Mon,  1 Jun 2020 00:46:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F095AC0176
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 00:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C3C872044A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 00:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DayNmnTi0yYq for <iommu@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 00:46:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 203482002A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 00:46:51 +0000 (UTC)
IronPort-SDR: LBaIDe8c+djl/LWCjW2khrKIh+ujYy95gGQJNhTNCWmzSySTcw5YKXQA7HGNbqcgXfaWotKlxr
 +e9qVneEAaXw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 17:46:51 -0700
IronPort-SDR: 0Xs46V2hEIESIwGQjp2CNHkkG0YcMN5J2ulkkFrL9nKOZzgPRRvze8Kt2LuiKHz+CgJJzQZ2WW
 Bqk11Oj8xY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,458,1583222400"; d="scan'208";a="293005923"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 31 May 2020 17:46:49 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/2] iommu/vt-d: Two fixes for v5.8
Date: Mon,  1 Jun 2020 08:42:55 +0800
Message-Id: <20200601004257.15591-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Joerg,

This encloses two fixes for v5.8.
- Make Intel SVM code 64-bit only
- Set U/S bit to make IOVA over first level compatible with 2nd level
  translations.

Best regards,
baolu

Lu Baolu (2):
  iommu/vt-d: Make Intel SVM code 64-bit only
  iommu/vt-d: Set U/S bit in first level page table by default

 drivers/iommu/Kconfig       | 2 +-
 drivers/iommu/intel-iommu.c | 5 ++---
 include/linux/intel-iommu.h | 1 +
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
