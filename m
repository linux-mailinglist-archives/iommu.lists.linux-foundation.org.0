Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAFA2A25DE
	for <lists.iommu@lfdr.de>; Mon,  2 Nov 2020 09:10:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 32DCE87347;
	Mon,  2 Nov 2020 08:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UW4puaxfAUJB; Mon,  2 Nov 2020 08:10:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F2418733C;
	Mon,  2 Nov 2020 08:10:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F900C0051;
	Mon,  2 Nov 2020 08:10:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3904EC0051
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 08:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2769E8701D
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 08:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_sX2M_T0wts for <iommu@lists.linux-foundation.org>;
 Mon,  2 Nov 2020 08:10:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9DE7586D24
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 08:10:49 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPlwL3HrBzLpT6;
 Mon,  2 Nov 2020 16:10:42 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.202.65) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 16:10:37 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <iommu@lists.linux-foundation.org>, <hch@lst.de>, <robin.murphy@arm.com>, 
 <m.szyprowski@samsung.com>
Subject: [PATCH v3 0/2] dma-mapping: provide a benchmark for streaming DMA
 mapping
Date: Mon, 2 Nov 2020 21:06:44 +1300
Message-ID: <20201102080646.2180-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.202.65]
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

-v3:
  * fix build issues reported by 0day kernel test robot
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
    - use devm_add_action()

Barry Song (2):
  dma-mapping: add benchmark support for streaming DMA APIs
  selftests/dma: add test application for DMA_MAP_BENCHMARK

 MAINTAINERS                                   |   6 +
 kernel/dma/Kconfig                            |   8 +
 kernel/dma/Makefile                           |   1 +
 kernel/dma/map_benchmark.c                    | 296 ++++++++++++++++++
 tools/testing/selftests/dma/Makefile          |   6 +
 tools/testing/selftests/dma/config            |   1 +
 .../testing/selftests/dma/dma_map_benchmark.c |  87 +++++
 7 files changed, 405 insertions(+)
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
