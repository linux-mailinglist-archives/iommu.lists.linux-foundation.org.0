Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0453ACA03
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 13:39:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 986134018C;
	Fri, 18 Jun 2021 11:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVJ2P8p17kQI; Fri, 18 Jun 2021 11:39:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A942F400EA;
	Fri, 18 Jun 2021 11:39:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87255C000B;
	Fri, 18 Jun 2021 11:39:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29507C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 11:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D190405A1
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 11:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hsp_n1rriec for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 11:38:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 151DC40382
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 11:38:57 +0000 (UTC)
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G5xb63XTRz6G7Tw;
 Fri, 18 Jun 2021 19:31:46 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 13:38:54 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 12:38:51 +0100
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, <robin.murphy@arm.com>, <corbet@lwn.net>
Subject: [PATCH v14 0/6] iommu: Enhance IOMMU default DMA mode build options
Date: Fri, 18 Jun 2021 19:34:12 +0800
Message-ID: <1624016058-189713-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, iommu@lists.linux-foundation.org
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

This is a reboot of Zhen Lei's series from a couple of years ago, which
never made it across the line.

I still think that it has some value, so taking up the mantle.

Motivation:
Allow lazy mode be default mode for DMA domains for all ARCHs, and not
only those who hardcode it (to be lazy). For ARM64, currently we must use
a kernel command line parameter to use lazy mode, which is less than
ideal.

I have now included the print for strict/lazy mode, which I originally
sent in:
https://lore.kernel.org/linux-iommu/72eb3de9-1d1c-ae46-c5a9-95f26525d435@huawei.com/

There was some concern there about drivers and their custom prints
conflicting with the print in that patch, but I think that it
should be ok.

Based on next-20210611 + "iommu: Update "iommu.strict" documentation"

Differences to v13:
- Improve strict mode deprecation messages and cut out some
  kernel-parameters.txt legacy description
- Add tag in 1/6
- use pr_info_once() for vt-d message about VM and caching

Differences to v12:
- Add Robin's RB tags (thanks!)
- Add a patch to mark x86 strict cmdline params as deprecated
- Improve wording in Kconfig change and tweak iommu_dma_strict declaration

Differences to v11:
- Rebase to next-20210610
- Drop strict mode globals in Intel and AMD drivers
- Include patch to print strict vs lazy mode
- Include patch to remove argument from iommu_set_dma_strict()

John Garry (3):
  iommu: Deprecate Intel and AMD cmdline methods to enable strict mode
  iommu: Print strict or lazy mode at init time
  iommu: Remove mode argument from iommu_set_dma_strict()

Zhen Lei (3):
  iommu: Enhance IOMMU default DMA mode build options
  iommu/vt-d: Add support for IOMMU default DMA mode build options
  iommu/amd: Add support for IOMMU default DMA mode build options

 .../admin-guide/kernel-parameters.txt         | 12 ++----
 drivers/iommu/Kconfig                         | 41 +++++++++++++++++++
 drivers/iommu/amd/amd_iommu_types.h           |  6 ---
 drivers/iommu/amd/init.c                      |  7 ++--
 drivers/iommu/amd/iommu.c                     |  6 ---
 drivers/iommu/intel/iommu.c                   | 16 ++++----
 drivers/iommu/iommu.c                         | 12 ++++--
 include/linux/iommu.h                         |  2 +-
 8 files changed, 65 insertions(+), 37 deletions(-)

-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
