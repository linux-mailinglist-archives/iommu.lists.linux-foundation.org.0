Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2592BBF63
	for <lists.iommu@lfdr.de>; Sat, 21 Nov 2020 15:04:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C814386A9E;
	Sat, 21 Nov 2020 14:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cgiLw8ki8KQ; Sat, 21 Nov 2020 14:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D07A686A97;
	Sat, 21 Nov 2020 14:03:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4709C1DA2;
	Sat, 21 Nov 2020 14:03:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75C79C0891
 for <iommu@lists.linux-foundation.org>; Sat, 21 Nov 2020 14:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5AFEC87428
 for <iommu@lists.linux-foundation.org>; Sat, 21 Nov 2020 14:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4Q+YcjrO+ZD for <iommu@lists.linux-foundation.org>;
 Sat, 21 Nov 2020 14:03:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4C98387422
 for <iommu@lists.linux-foundation.org>; Sat, 21 Nov 2020 14:03:56 +0000 (UTC)
IronPort-SDR: vQ1LWf4wo8+B1VcvnBj6mACg/9KjNzMbaWeNyeiJwMW+7GraSuL0xg8/EHFUj4GnAOT+1BBZrO
 aKoXygX5oAeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="168083742"
X-IronPort-AV: E=Sophos;i="5.78,359,1599548400"; d="scan'208";a="168083742"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2020 06:03:55 -0800
IronPort-SDR: Z2RFuzugzo4ns16V5sHEud+UIphPrk3mALkPsmg1cl7H36gFouYodR0LRGd5IFF9Rel9+rt4az
 yAGIBG/HBVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,359,1599548400"; d="scan'208";a="431852752"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2020 06:03:53 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v9 0/4] iommu: Add support to change default domain of
Date: Sat, 21 Nov 2020 21:56:16 +0800
Message-Id: <20201121135620.3496419-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Hi,

The description and last post of this series could be found here.

https://lore.kernel.org/linux-iommu/20200925190620.18732-1-ashok.raj@intel.com/

Change log in this series:
 1. Changes according to comments at
    https://lore.kernel.org/linux-iommu/243ce89c33fe4b9da4c56ba35acebf81@huawei.com/
    - Move the untrusted device check to iommu core
    - Remove the requirement of def_domain_type callback
 
2. Changes according to comments at
    https://lore.kernel.org/linux-iommu/20201118135153.GB2177@willie-the-truck/
    - Replace pr_err_ratelimited() with dev_err_ratelimited() for more
      context.
    - Refine the getting default domain type code.
    - Add comments about the lock mechanism (vs. device release path)
      for future reference.

    https://lore.kernel.org/linux-iommu/20201118135137.GA2177@willie-the-truck/
    - Refine the ABI document.

Best regards,
baolu

Lu Baolu (1):
  iommu: Move def_domain type check for untrusted device into core

Sai Praneeth Prakhya (3):
  iommu: Add support to change default domain of an iommu group
  iommu: Take lock before reading iommu group default domain type
  iommu: Document usage of "/sys/kernel/iommu_groups/<grp_id>/type" file

 .../ABI/testing/sysfs-kernel-iommu_groups     |  29 ++
 drivers/iommu/intel/iommu.c                   |   7 -
 drivers/iommu/iommu.c                         | 255 +++++++++++++++++-
 3 files changed, 276 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
