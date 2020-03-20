Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E2918C671
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 05:26:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 640ED888EC;
	Fri, 20 Mar 2020 04:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kOJudS8dR+J; Fri, 20 Mar 2020 04:26:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66372888FC;
	Fri, 20 Mar 2020 04:26:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A14BC07FF;
	Fri, 20 Mar 2020 04:26:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9ABD0C07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 04:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 81966880BB
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 04:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pt7NzvAvqKVw for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 04:26:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8DC1C86762
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 04:26:52 +0000 (UTC)
IronPort-SDR: Mz98gKmZoQEAr8DRrLtC7QetRBo4J3zeDmQW2AipgBD9sp20vYTm7uiWdhQ3luiaWNAs7VALMB
 Iv2ZbvlhWO4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 21:26:52 -0700
IronPort-SDR: u1lUJXpNdjjpPlfGeZRG2MXjJh0/X80d973Mj70lS+4rReMxMX17Qfvyq2F7C+g22rlOQBwkoh
 E5OCLijL9fNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; d="scan'208";a="234391238"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga007.jf.intel.com with ESMTP; 19 Mar 2020 21:26:51 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/3] Misc bug fixes for VT-d SVM
Date: Thu, 19 Mar 2020 21:32:28 -0700
Message-Id: <1584678751-43169-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Raj Ashok <ashok.raj@intel.com>
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

Just a few bug fixes while testing Intel SVM code.

Jacob Pan (3):
  iommu/vt-d: Remove redundant IOTLB flush
  iommu/vt-d: Fix mm reference leak
  iommu/vt-d: Add build dependency on IOASID

 drivers/iommu/Kconfig     |  1 +
 drivers/iommu/intel-svm.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
