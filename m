Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 36589289F3E
	for <lists.iommu@lfdr.de>; Sat, 10 Oct 2020 10:18:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5CAAC20454;
	Sat, 10 Oct 2020 08:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fly5b5LHHJmn; Sat, 10 Oct 2020 08:18:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2A8A120413;
	Sat, 10 Oct 2020 08:18:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 159CBC0051;
	Sat, 10 Oct 2020 08:18:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 967FDC0051
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 08:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 90BD887835
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 08:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KDjXNzxGftmj for <iommu@lists.linux-foundation.org>;
 Sat, 10 Oct 2020 08:18:12 +0000 (UTC)
X-Greylist: delayed 00:15:08 by SQLgrey-1.7.6
Received: from ZXSHCAS1.zhaoxin.com (ZXSHCAS1.zhaoxin.com [203.148.12.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1188B875BB
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 08:18:10 +0000 (UTC)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sat, 10 Oct
 2020 16:02:55 +0800
Received: from localhost.localdomain (114.242.250.7) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sat, 10 Oct
 2020 16:02:53 +0800
From: FelixCuioc <FelixCui-oc@zhaoxin.com>
To: Joerg Roedel <joro@8bytes.org>, <iommu@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, "Lu
 Baolu" <baolu.lu@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 <kbuild@lists.01.org>
Subject: [PATCH v3 0/2] Add support for ACPI device in RMRR
Date: Sat, 10 Oct 2020 04:02:39 -0400
Message-ID: <20201010080241.14642-1-FelixCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [114.242.250.7]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Cc: TonyWWang-oc@zhaoxin.com, CobeChen-oc@zhaoxin.com
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

BIOS allocate reserved memory ranges that may be DMA targets.
BIOS may report each such reserved memory region through the
RMRR structures,along with the devices that requires access to
the specified reserved memory region.

The purpose of this series is to achieve ACPI device in RMRR
access reserved memory.Therefore,it is necessary to increase
the analysis of acpi device in RMRR and establish a mapping
for this device.

The first patch adds interfaces for detecting ACPI device
in RMRR and in order to distinguish it from pci device,
some interface functions are modified.

The second patch adds support for probing ACPI device in RMRR.
In probe_acpi_namespace_devices(),add support for direct mapping
of ACPI device and add support for physical node of acpi device
to be NULL.

v2->v3:
   - Add the blank line between functions.
   - Make dmar_acpi_insert_dev_scope() bool,change the 1/0 to true/false
     and add a comment explaining.
   - Delete unused initialization.
   - if dmar_acpi_insert_dev_scope() always returns zero,will not
     call dmar_rmrr_add_acpi_dev().
   - Use a proper error code.
   - Use if(!pdev).
   - Use goto unlock instead of mutex_unlock().


FelixCuioc (2):
  iommu/vt-d:Add support for detecting ACPI device in RMRR
  iommu/vt-d:Add support for probing ACPI device in RMRR

 drivers/iommu/intel/dmar.c  | 76 +++++++++++++++++++++----------------
 drivers/iommu/intel/iommu.c | 52 ++++++++++++++++++++++++-
 drivers/iommu/iommu.c       |  6 +++
 include/linux/dmar.h        | 12 +++++-
 include/linux/iommu.h       |  2 +
 5 files changed, 113 insertions(+), 35 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
