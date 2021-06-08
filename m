Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64C39F7BA
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 15:23:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E56606C1;
	Tue,  8 Jun 2021 13:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tV05ppzrBEiP; Tue,  8 Jun 2021 13:23:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25DD26078E;
	Tue,  8 Jun 2021 13:23:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1062C0011;
	Tue,  8 Jun 2021 13:23:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E9F4C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 13:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC9D606F2
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 13:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIUu5msApmK6 for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 13:22:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8962A606C1
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 13:22:56 +0000 (UTC)
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FzrFF54Zzz6G8YM;
 Tue,  8 Jun 2021 21:10:09 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 15:22:53 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 14:22:49 +0100
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, <robin.murphy@arm.com>
Subject: [PATCH v11 0/3] Enhance IOMMU default DMA mode build options
Date: Tue, 8 Jun 2021 21:18:25 +0800
Message-ID: <1623158308-180604-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: rdunlap@infradead.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org
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

Differences to v10:
- Rebase to v5.13-rc4
- Correct comment and typo in Kconfig (Randy)
- Make Kconfig choice depend on relevant architectures

Differences to v9:
https://lore.kernel.org/linux-iommu/20190613084240.16768-1-thunder.leizhen@huawei.com/#t
- Rebase to v5.13-rc2
- Remove CONFIG_IOMMU_DEFAULT_PASSTHROUGH from choice:
  Since we can dynamically change default domain of group, lazy or strict and
  passthrough are not mutually exclusive
- Drop ia64 patch, which I don't think was ever required
- Drop "x86/dma: use IS_ENABLED() to simplify the code", which is no
  longer required
- Drop s390/pci patch, as this arch does not use CONFIG_IOMMU_API or even
  already honour CONFIG_IOMMU_DEFAULT_PASSTHROUGH
  https://lore.kernel.org/linux-iommu/20190613084240.16768-4-thunder.leizhen@huawei.com/
- Drop powernv/iommu patch, as I no longer think that it is relevant
  https://lore.kernel.org/linux-iommu/20190613084240.16768-5-thunder.leizhen@huawei.com/
- Some tidying

Zhen Lei (3):
  iommu: Enhance IOMMU default DMA mode build options
  iommu/vt-d: Add support for IOMMU default DMA mode build options
  iommu/amd: Add support for IOMMU default DMA mode build options

 drivers/iommu/Kconfig       | 36 ++++++++++++++++++++++++++++++++++++
 drivers/iommu/amd/init.c    |  3 ++-
 drivers/iommu/intel/iommu.c |  2 +-
 drivers/iommu/iommu.c       |  3 ++-
 4 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
