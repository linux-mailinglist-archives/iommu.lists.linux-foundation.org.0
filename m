Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 67808388498
	for <lists.iommu@lfdr.de>; Wed, 19 May 2021 03:51:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6D0960861;
	Wed, 19 May 2021 01:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z53HkVk4RcAJ; Wed, 19 May 2021 01:51:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13BF360673;
	Wed, 19 May 2021 01:51:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1317C0001;
	Wed, 19 May 2021 01:51:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1613C0001
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97DBF60861
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o12bpat9AgcS for <iommu@lists.linux-foundation.org>;
 Wed, 19 May 2021 01:51:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFB8C60647
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:28 +0000 (UTC)
IronPort-SDR: UYE0REeisdNIStGwnZA/1j7rtr7kK+SObLIcd/yPiB8TrfmmtNJs2AlsGuf6hvAC6Y3s6sluwJ
 oGrIijIMMrWA==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="197774681"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="197774681"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 18:51:27 -0700
IronPort-SDR: QCSY6GjVp0GtMYqSKmqDyk/T4yUBozVlkqbyVXRzg08pEyeCirsNvGovb3knlxDknEcV8Uefj/
 HWV0y6K2mLHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="542260512"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 18 May 2021 18:51:26 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/2] [PULL REQUEST] iommu/vt-d: Fixes for v5.13-rc3
Date: Wed, 19 May 2021 09:50:25 +0800
Message-Id: <20210519015027.108468-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>
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

Hi Joerg,

Two small fixes are queued in this series. It includes:

 - Use user privilege for RID2PASID translation
 - Check memory allocation return value

Please consider them for v5.13.

Best regards,
Lu Baolu

Dan Carpenter (1):
  iommu/vt-d: Check for allocation failure in aux_detach_device()

Lu Baolu (1):
  iommu/vt-d: Use user privilege for RID2PASID translation

 drivers/iommu/intel/iommu.c | 9 +++++++--
 drivers/iommu/intel/pasid.c | 3 ++-
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
