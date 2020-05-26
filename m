Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F781AB7F5
	for <lists.iommu@lfdr.de>; Thu, 16 Apr 2020 08:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 460BC87999;
	Thu, 16 Apr 2020 06:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmBLC3Zmkwm7; Thu, 16 Apr 2020 06:27:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D568187A5E;
	Thu, 16 Apr 2020 06:27:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCDC3C0172;
	Thu, 16 Apr 2020 06:27:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBC2BC0172
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 06:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CAB5121543
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 06:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiDYxBv1Bp9q for <iommu@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 06:27:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id C7926204EB
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 06:27:06 +0000 (UTC)
IronPort-SDR: 1geWYOd9eigRj6Sl6PY2FaPPvnILpqUyJybNTmFRF4gjnvXk5ergC5AtulZWmCkRsfhs7XuNqS
 +N2GRwfAE/AA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 23:27:06 -0700
IronPort-SDR: dv7ZeaZqSqQD1m3XJF5id1Sh44URsCqzejypAsEWfIENW6XR2A8p/sqJRgp3+L1lXomWMDkut6
 VXmqq46m2ZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="277881075"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 23:27:02 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 0/3] Replace private domain with per-group default domain
Date: Thu, 16 Apr 2020 14:23:51 +0800
Message-Id: <20200416062354.10307-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Derrick Jonathan <jonathan.derrick@intel.com>
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

Some devices are required to use a specific type (identity or dma)
of default domain when they are used with a vendor iommu. When the
system level default domain type is different from it, the vendor
iommu driver has to request a new default domain with either
iommu_request_dma_domain_for_dev() or iommu_request_dm_for_dev()
in the add_dev() callback. Unfortunately, these two helpers only
work when the group hasn't been assigned to any other devices,
hence, some vendor iommu driver has to use a private domain if
it fails to request a new default one.

Joerg proposed an on-going proposal which makes the default domain
framework to support configuring per-group default domain during
boot process.

https://lkml.org/lkml/2020/4/14/616

Hence, there is no need to keep the private domain implementation
in the Intel IOMMU driver. This patch series aims to remove it.

Best regards,
baolu

Change log:
v2->v3:
 - Port necessary patches on the top of Joerg's new proposal.
   https://lkml.org/lkml/2020/4/14/616
   The per-group default domain proposed previously in this series
   will be deprecated due to a race concern between domain switching
   and device driver probing.

v1->v2:
 - Rename the iommu ops callback to def_domain_type

Lu Baolu (3):
  iommu/vt-d: Allow 32bit devices to uses DMA domain
  iommu/vt-d: Allow PCI sub-hierarchy to use DMA domain
  iommu/vt-d: Apply per-device dma_ops

 drivers/iommu/intel-iommu.c | 396 +++---------------------------------
 1 file changed, 26 insertions(+), 370 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
