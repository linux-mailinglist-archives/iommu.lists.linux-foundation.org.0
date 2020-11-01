Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 805752A1D34
	for <lists.iommu@lfdr.de>; Sun,  1 Nov 2020 11:19:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FD3D8693C;
	Sun,  1 Nov 2020 10:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rb01r-50iMhR; Sun,  1 Nov 2020 10:19:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 12E4287561;
	Sun,  1 Nov 2020 10:19:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDA2FC0051;
	Sun,  1 Nov 2020 10:19:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC046C0051
 for <iommu@lists.linux-foundation.org>; Sun,  1 Nov 2020 10:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C313F872F6
 for <iommu@lists.linux-foundation.org>; Sun,  1 Nov 2020 10:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nYqSLLOd05z for <iommu@lists.linux-foundation.org>;
 Sun,  1 Nov 2020 10:19:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C5257872E8
 for <iommu@lists.linux-foundation.org>; Sun,  1 Nov 2020 10:19:16 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CPBq62hMKzhf4Z;
 Sun,  1 Nov 2020 18:19:14 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.200.128) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 1 Nov 2020 18:19:03 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <iommu@lists.linux-foundation.org>, <hch@lst.de>, <robin.murphy@arm.com>, 
 <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/2] dma-mapping: provide a benchmark for streaming DMA
 mapping
Date: Sun, 1 Nov 2020 23:15:12 +1300
Message-ID: <20201101101514.18840-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.200.128]
X-CFilter-Loop: Reflected
Cc: xuwei5@huawei.com, linuxarm@huawei.com, linux-kselftest@vger.kernel.org
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

Nowadays, there are increasing requirements to benchmark the performance
of dma_map and dma_unmap particually while the device is attached to an
IOMMU.

This patchset provides the benchmark infrastruture for streaming DMA
mapping. The architecture of the code is pretty much similar with GUP
benchmark:
* mm/gup_benchmark.c provides kernel interface;
* tools/testing/selftests/vm/gup_benchmark.c provides user program to
call the interface provided by mm/gup_benchmark.c.

In our case, kernel/dma/map_benchmark.c is like mm/gup_benchmark.c;
tools/testing/selftests/dma/dma_map_benchmark.c is like tools/testing/
selftests/vm/gup_benchmark.c

A major difference with GUP benchmark is DMA_MAP benchmark needs to run
on a device. Considering one board with below devices and IOMMUs
device A  ------- IOMMU 1
device B  ------- IOMMU 2
device C  ------- non-IOMMU

Different devices might attach to different IOMMU or non-IOMMU. To make
benchmark run, we can either
* create a virtual device and hack the kernel code to attach the virtual
device to IOMMU1, IOMMU2 or non-IOMMU.
* use the existing driver_override mechinism, unbind device A,B, OR c from
their original driver and bind A to dma_map_benchmark platform driver or
pci driver for benchmarking.

In this patchset, I prefer to use the driver_override and avoid the ugly
hack in kernel. We can dynamically switch device behind different IOMMUs
to get the performance of IOMMU or non-IOMMU.

-v2:
  * add PCI support; v1 supported platform devices only
  * replace ssleep by msleep_interruptible() to permit users to exit
    benchmark before it is completed
  * many changes according to Robin's suggestions, thanks! Robin
    - add standard deviation output to reflect the worst case
    - check users' parameters strictly like the number of threads
    - make cache dirty before dma_map
    - fix unpaired dma_map_page and dma_unmap_single;
    - remove redundant "long long" before ktime_to_ns();
    - use devm_add_action();
    - wakeup all threads together after they are ready

Barry Song (2):
  dma-mapping: add benchmark support for streaming DMA APIs
  selftests/dma: add test application for DMA_MAP_BENCHMARK

 MAINTAINERS                                   |   6 +
 kernel/dma/Kconfig                            |   8 +
 kernel/dma/Makefile                           |   1 +
 kernel/dma/map_benchmark.c                    | 295 ++++++++++++++++++
 tools/testing/selftests/dma/Makefile          |   6 +
 tools/testing/selftests/dma/config            |   1 +
 .../testing/selftests/dma/dma_map_benchmark.c |  87 ++++++
 7 files changed, 404 insertions(+)
 create mode 100644 kernel/dma/map_benchmark.c
 create mode 100644 tools/testing/selftests/dma/Makefile
 create mode 100644 tools/testing/selftests/dma/config
 create mode 100644 tools/testing/selftests/dma/dma_map_benchmark.c

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
