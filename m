Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BC3CF1D1
	for <lists.iommu@lfdr.de>; Tue, 20 Jul 2021 04:08:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C657E4023A;
	Tue, 20 Jul 2021 02:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdf5UabTfk8h; Tue, 20 Jul 2021 02:08:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 99E5440105;
	Tue, 20 Jul 2021 02:08:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76A21C001F;
	Tue, 20 Jul 2021 02:08:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFFE7C000E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 02:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9127D4046E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 02:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugVW8Qh4L5RT for <iommu@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 02:08:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC46D4046D
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 02:08:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="274987745"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="274987745"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 19:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="453891940"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga007.jf.intel.com with ESMTP; 19 Jul 2021 19:08:27 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/3] iommu/vt-d: Implement [map/unmap]_pages callbacks
Date: Tue, 20 Jul 2021 10:06:12 +0800
Message-Id: <20210720020615.4144323-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: will@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

The "Optimizing iommu_[map/unmap] performance" series posted here,

https://lore.kernel.org/linux-iommu/1623850736-389584-1-git-send-email-quic_c_gdjako@quicinc.com/

improves the iommu_[map/unmap] performce by reducing the number of
calls to the vendor-specific map/unmap callbacks. This series
introduces the implementation of those new callbacks in Intel IOMMU
implementation.

Note: This series depends on above series. It can only be taken after
      above series get merged.

Best regards,
baolu

Lu Baolu (3):
  iommu/vt-d: Report real pgsize bitmap to iommu core
  iommu/vt-d: Implement map/unmap_pages() iommu_ops callback
  iommu/vt-d: Move clflush'es from iotlb_sync_map() to map_pages()

 drivers/iommu/intel/iommu.c | 123 ++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 62 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
