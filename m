Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78E3C2215
	for <lists.iommu@lfdr.de>; Fri,  9 Jul 2021 12:09:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286E5605CB;
	Fri,  9 Jul 2021 10:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3wnwHhfpGe3; Fri,  9 Jul 2021 10:09:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5B3FC605FD;
	Fri,  9 Jul 2021 10:09:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29E85C0022;
	Fri,  9 Jul 2021 10:09:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E8ECC000E
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 08:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EB1A42274
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 08:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVdb97pq3fVr for <iommu@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 08:38:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9178042272
 for <iommu@lists.linux-foundation.org>; Fri,  9 Jul 2021 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625819904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=z6Hk4bJ8S8lcwyhof3193pL12mlYl2MQc8nr7rUonLc=;
 b=ZEeLuHLOLcB8+ptQbgpiiKOK7dbhVSsqz5lMC7UCc5fHGvIzh3HkOK+AYu5fdTdW7Qr2km
 y33dkM+LYe97aA3WHfj/pDMiDHO14aoVSn6vACEjwERx/v1U0p4DjyBBG+VJs467iV0LDP
 Mv90ZILuHSdiEZZioDnyDRTWKV1jiVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-kW-M2W2pOPeYf3W8V_w2gA-1; Fri, 09 Jul 2021 04:38:21 -0400
X-MC-Unique: kW-M2W2pOPeYf3W8V_w2gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EA461018720;
 Fri,  9 Jul 2021 08:38:20 +0000 (UTC)
Received: from T590 (ovpn-13-13.pek2.redhat.com [10.72.13.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C27E5C1A3;
 Fri,  9 Jul 2021 08:38:13 +0000 (UTC)
Date: Fri, 9 Jul 2021 16:38:09 +0800
From: Ming Lei <ming.lei@redhat.com>
To: linux-nvme@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org
Subject: [bug report] iommu_dma_unmap_sg() is very slow then running IO from
 remote numa node
Message-ID: <YOgK8fdv7dOQtkET@T590>
MIME-Version: 1.0
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mailman-Approved-At: Fri, 09 Jul 2021 10:09:37 +0000
Cc: linux-kernel@vger.kernel.org
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

Hello,

I observed that NVMe performance is very bad when running fio on one
CPU(aarch64) in remote numa node compared with the nvme pci numa node.

Please see the test result[1] 327K vs. 34.9K.

Latency trace shows that one big difference is in iommu_dma_unmap_sg(),
1111 nsecs vs 25437 nsecs.


[1] fio test & results

1) fio test result:

- run fio on local CPU
taskset -c 0 ~/git/tools/test/nvme/io_uring 10 1 /dev/nvme1n1 4k
+ fio --bs=4k --ioengine=io_uring --fixedbufs --registerfiles --hipri --iodepth=64 --iodepth_batch_submit=16 --iodepth_batch_complete_min=16 --filename=/dev/nvme1n1 --direct=1 --runtime=10 --numjobs=1 --rw=randread --name=test --group_reporting

IOPS: 327K
avg latency of iommu_dma_unmap_sg(): 1111 nsecs


- run fio on remote CPU
taskset -c 80 ~/git/tools/test/nvme/io_uring 10 1 /dev/nvme1n1 4k
+ fio --bs=4k --ioengine=io_uring --fixedbufs --registerfiles --hipri --iodepth=64 --iodepth_batch_submit=16 --iodepth_batch_complete_min=16 --filename=/dev/nvme1n1 --direct=1 --runtime=10 --numjobs=1 --rw=randread --name=test --group_reporting

IOPS: 34.9K
avg latency of iommu_dma_unmap_sg(): 25437 nsecs

2) system info
[root@ampere-mtjade-04 ~]# lscpu | grep NUMA
NUMA node(s):                    2
NUMA node0 CPU(s):               0-79
NUMA node1 CPU(s):               80-159

lspci | grep NVMe
0003:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983

[root@ampere-mtjade-04 ~]# cat /sys/block/nvme1n1/device/device/numa_node
0



Thanks, 
Ming

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
