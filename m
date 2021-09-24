Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E1422416FF2
	for <lists.iommu@lfdr.de>; Fri, 24 Sep 2021 12:07:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 830BB4157B;
	Fri, 24 Sep 2021 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Izx7Fk2LjYdc; Fri, 24 Sep 2021 10:07:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 984B2415AB;
	Fri, 24 Sep 2021 10:07:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82287C001C;
	Fri, 24 Sep 2021 10:07:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04502C000D;
 Fri, 24 Sep 2021 10:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66CCB8435F;
 Fri, 24 Sep 2021 10:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqtUvMyxyEdl; Fri, 24 Sep 2021 10:07:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D234F84367;
 Fri, 24 Sep 2021 10:07:05 +0000 (UTC)
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HG71613Mlz67b9b;
 Fri, 24 Sep 2021 18:04:26 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 24 Sep 2021 12:07:02 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 24 Sep 2021 11:06:58 +0100
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <mst@redhat.com>,
 <jasowang@redhat.com>, <robin.murphy@arm.com>
Subject: [PATCH 0/5] iommu: Some IOVA code reorganisation
Date: Fri, 24 Sep 2021 18:01:52 +0800
Message-ID: <1632477717-5254-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org, xieyongji@bytedance.com,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
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

The IOVA domain structure is a bit overloaded, holding:
- IOVA tree management
- FQ control
- IOVA rcache memories

Indeed only a couple of IOVA users use the rcache, and only dma-iommu.c
uses the FQ feature.

This series separates out that structure. In addition, it moves the FQ
code into dma-iommu.c . This is not strictly necessary, but it does make
it easier for the FQ domain lookup the rcache domain.

The rcache code stays where it is, as it may be reworked in future, so
there is not much point in relocating and then discarding.

This topic was initially discussed and suggested (I think) by Robin here:
https://lore.kernel.org/linux-iommu/1d06eda1-9961-d023-f5e7-fe87e768f067@arm.com/

I also added in another old patch to avoid double-negatives now that
the error handling is a bit better for IOVA init code:
https://lore.kernel.org/linux-iommu/YAVeDOiKBEKZ2Tdq@myrica/

Baseline is v5.15-rc2

John Garry (5):
  iova: Move fast alloc size roundup into alloc_iova_fast()
  iommu: Separate flush queue memories from IOVA domain structure
  iommu: Move IOVA flush queue code to dma-iommu
  iommu: Separate IOVA rcache memories from iova_domain structure
  iommu/iova: Avoid double-negatives in magazine helpers

 drivers/iommu/dma-iommu.c            | 341 +++++++++++++++++++++++---
 drivers/iommu/iova.c                 | 343 ++++++++-------------------
 drivers/vdpa/vdpa_user/iova_domain.c |  61 ++---
 drivers/vdpa/vdpa_user/iova_domain.h |   4 +-
 include/linux/iova.h                 |  82 +------
 5 files changed, 451 insertions(+), 380 deletions(-)

-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
