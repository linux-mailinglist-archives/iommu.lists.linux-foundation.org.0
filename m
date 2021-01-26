Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B523037AA
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 09:15:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E0FF85166;
	Tue, 26 Jan 2021 08:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcVYBWH3YVcS; Tue, 26 Jan 2021 08:15:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 23A778511B;
	Tue, 26 Jan 2021 08:15:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2B0EC1DA7;
	Tue, 26 Jan 2021 08:15:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CBADC013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 08:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2B57E85188
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 08:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isFVW_Mj3F-s for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 08:15:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9EF378511B
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 08:15:53 +0000 (UTC)
IronPort-SDR: BrWvFBEJKXG7dZTrI5uCiCDYOVdu2lCmg5Gr56iDWmQFNvEBu6RLaz3xKLSZtCoF4vtAQ3McVr
 tBZ5sKvmlpLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="177297768"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="177297768"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:15:50 -0800
IronPort-SDR: e/fSyhZG9rDLlzvsJ06TPGj1CGwEPgtCmI6wdhztK1UOLumOcWYbdeQoT5D2oXfTs96ru2V7wO
 PXhHWzlhzsTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="577725446"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jan 2021 00:15:48 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 0/2] iommu/vt-d: Some misc tweaks in SVA
Date: Tue, 26 Jan 2021 16:07:28 +0800
Message-Id: <20210126080730.2232859-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

This includes some misc tweaks in the VT-d SVA implementation. I will
plan them for v5.12 if no objections.

Change log:
v1->v2:
  - v1:
    https://lore.kernel.org/linux-iommu/20210121014505.1659166-1-baolu.lu@linux.intel.com/
  - Keep the logic of clearing PRO sane
  - Drop the device outstanding PRQ number patch. Need more test and
    will repost later. 

Best regards,
baolu

Lu Baolu (2):
  iommu/vt-d: Clear PRQ overflow only when PRQ is empty
  iommu/vt-d: Use INVALID response code instead of FAILURE

 drivers/iommu/intel/svm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
