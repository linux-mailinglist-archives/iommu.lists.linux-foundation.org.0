Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E32B5CDA
	for <lists.iommu@lfdr.de>; Tue, 17 Nov 2020 11:30:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 97B5C204B9;
	Tue, 17 Nov 2020 10:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFstcdJlZS33; Tue, 17 Nov 2020 10:30:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A198B214E6;
	Tue, 17 Nov 2020 10:30:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C2BCC07FF;
	Tue, 17 Nov 2020 10:30:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F43BC07FF
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 10:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1C1E48669E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 10:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndrV5GdxTS1K for <iommu@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 10:30:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 47EB68669F
 for <iommu@lists.linux-foundation.org>; Tue, 17 Nov 2020 10:30:03 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cb2Hm0JxfzLmCh;
 Tue, 17 Nov 2020 18:29:40 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 17 Nov 2020 18:29:51 +0800
From: John Garry <john.garry@huawei.com>
To: <robin.murphy@arm.com>, <joro@8bytes.org>, <will@kernel.org>
Subject: [RESEND PATCH v3 0/4] iommu/iova: Solve longterm IOVA issue
Date: Tue, 17 Nov 2020 18:25:30 +0800
Message-ID: <1605608734-84416-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, xiyou.wangcong@gmail.com
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

This series contains a patch to solve the longterm IOVA issue which
leizhen originally tried to address at [0].

A sieved kernel log is at the following, showing periodic dumps of IOVA
sizes, per CPU and per depot bin, per IOVA size granule:
https://raw.githubusercontent.com/hisilicon/kernel-dev/topic-iommu-5.10-iova-debug-v3/aging_test

Notice, for example, the following logs:
[13175.355584] print_iova1 cpu_total=40135 depot_total=3866 total=44001
[83483.457858] print_iova1 cpu_total=62532 depot_total=24476 total=87008

Where total IOVA rcache size has grown from 44K->87K over a long time.

Along with this patch, I included the following:
- A smaller helper to clear all IOVAs for a domain
- Change polarity of the IOVA magazine helpers
- Small optimisation from Cong Wang included, which was never applied [1].
  There was some debate of the other patches in that series, but this one
  is quite straightforward.

Differnces to v2:
- Update commit message for patch 3/4

Differences to v1:
- Add IOVA clearing helper
- Add patch to change polarity of mag helpers
- Avoid logically-redundant extra variable in __iova_rcache_insert()

[0] https://lore.kernel.org/linux-iommu/20190815121104.29140-3-thunder.leizhen@huawei.com/
[1] https://lore.kernel.org/linux-iommu/4b74d40a-22d1-af53-fcb6-5d70183705a8@huawei.com/

Cong Wang (1):
  iommu: avoid taking iova_rbtree_lock twice

John Garry (3):
  iommu/iova: Add free_all_cpu_cached_iovas()
  iommu/iova: Avoid double-negatives in magazine helpers
  iommu/iova: Flush CPU rcache for when a depot fills

 drivers/iommu/iova.c | 66 +++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 28 deletions(-)

-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
