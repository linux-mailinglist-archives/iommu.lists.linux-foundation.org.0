Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 395B93DC29E
	for <lists.iommu@lfdr.de>; Sat, 31 Jul 2021 04:22:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5499D60733;
	Sat, 31 Jul 2021 02:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xu9675PaXKhG; Sat, 31 Jul 2021 02:22:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 75DE46074D;
	Sat, 31 Jul 2021 02:22:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57B5BC0010;
	Sat, 31 Jul 2021 02:22:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5697FC001B
 for <iommu@lists.linux-foundation.org>; Sat, 31 Jul 2021 02:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3962040562
 for <iommu@lists.linux-foundation.org>; Sat, 31 Jul 2021 02:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f415OhhB4jEt for <iommu@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 02:21:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02B56404FC
 for <iommu@lists.linux-foundation.org>; Sat, 31 Jul 2021 02:21:56 +0000 (UTC)
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gc7Cs1BP1zYj9N;
 Sat, 31 Jul 2021 10:15:53 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 31 Jul 2021 10:21:52 +0800
From: chenxiang <chenxiang66@hisilicon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <joro@8bytes.org>
Subject: [PATCH 0/2] Implement [map/unmap]_pages callbacks for ARM SMMUV3
Date: Sat, 31 Jul 2021 10:17:09 +0800
Message-ID: <1627697831-158822-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linuxarm@huawei.com
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

From: Xiang Chen <chenxiang66@hisilicon.com>

The series ("Optimizing iommu_[map/unmap] performance") improve the
iommu_[map/unmap] performance. Based on the series, implement [map/unmap]_pages
callbacks for ARM SMMUV3.
Use tool dma_map_benchmark to test the latency of map/unmap, and it promotes
much on it. The test result is as follows:
t = 1(thread = 1):
                   before opt(us)   after opt(us)
g=1(4K size)        0.1/1.3          0.1/0.8
g=2(8K size)        0.2/1.5          0.2/0.9
g=4(16K size)       0.3/1.9          0.1/1.1
g=8(32K size)       0.5/2.7          0.2/1.4
g=16(64K size)      1.0/4.5          0.2/2.0
g=32(128K size)     1.8/7.9          0.2/3.3
g=64(256K size)     3.7/14.8         0.4/6.1
g=128(512K size)    7.1/14.7         0.5/10.4
g=256(1M size)      14.0/53.9        0.8/19.3
g=512(2M size)      0.2/0.9          0.2/0.9
g=1024(4M size)     0.5/1.5          0.4/1.0

t = 10(thread = 10):
                   before opt(us)   after opt(us)
g=1(4K size)        0.3/7.0          0.1/5.8
g=2(8K size)        0.4/6.7          0.3/6.0
g=4(16K size)       0.5/6.3          0.3/5.6
g=8(32K size)       0.5/8.3          0.2/6.3
g=16(64K size)      1.0/17.3         0.3/12.4
g=32(128K size)     1.8/36.0         0.2/24.2
g=64(256K size)     4.3/67.2         1.2/46.4
g=128(512K size)    7.8/93.7         1.3/94.2
g=256(1M size)      14.7/280.8       1.8/191.5
g=512(2M size)      3.6/3.2          1.5/2.5
g=1024(4M size)     2.0/3.1          1.8/2.6 

Xiang Chen (2):
  iommu/arm-smmu-v3: Implement the unmap_pages() IOMMU driver callback
  iommu/arm-smmu-v3: Implement the map_pages() IOMMU driver callback

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

-- 
2.8.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
