Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C8D5284A3
	for <lists.iommu@lfdr.de>; Mon, 16 May 2022 14:53:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93EED80B8F;
	Mon, 16 May 2022 12:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOo6U0KqDcxy; Mon, 16 May 2022 12:53:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5E0A280B5E;
	Mon, 16 May 2022 12:53:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA843C007F;
	Mon, 16 May 2022 12:53:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 910D3C002D
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DA6F80B35
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7VGrxW7RtyO for <iommu@lists.linux-foundation.org>;
 Mon, 16 May 2022 12:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0BF880B28
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:53:16 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L1zfK3Z0HzgYBd;
 Mon, 16 May 2022 20:51:53 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 20:53:12 +0800
To: <gregkh@linuxfoundation.org>, <alexander.shishkin@linux.intel.com>,
 <leo.yan@linaro.org>, <james.clark@arm.com>, <will@kernel.org>,
 <robin.murphy@arm.com>, <acme@kernel.org>, <jonathan.cameron@huawei.com>,
 <john.garry@huawei.com>
Subject: [PATCH v8 0/8] Add support for HiSilicon PCIe Tune and Trace device
Date: Mon, 16 May 2022 20:52:15 +0800
Message-ID: <20220516125223.32012-1-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, zhangshaokun@hisilicon.com, prime.zeng@huawei.com,
 mathieu.poirier@linaro.org, suzuki.poulose@arm.com, peterz@infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 linux-perf-users@vger.kernel.org, iommu@lists.linux-foundation.org,
 mingo@redhat.com, helgaas@kernel.org, yangyicong@hisilicon.com,
 liuqi115@huawei.com, linux-arm-kernel@lists.infradead.org
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
From: Yicong Yang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

HiSilicon PCIe tune and trace device (PTT) is a PCIe Root Complex
integrated Endpoint (RCiEP) device, providing the capability
to dynamically monitor and tune the PCIe traffic (tune),
and trace the TLP headers (trace).

PTT tune is designed for monitoring and adjusting PCIe link parameters.
We provide several parameters of the PCIe link. Through the driver,
user can adjust the value of certain parameter to affect the PCIe link
for the purpose of enhancing the performance in certian situation.

PTT trace is designed for dumping the TLP headers to the memory, which
can be used to analyze the transactions and usage condition of the PCIe
Link. Users can choose filters to trace headers, by either requester
ID, or those downstream of a set of Root Ports on the same core of the
PTT device. It's also supported to trace the headers of certain type and
of certain direction.

The driver registers a PMU device for each PTT device. The trace can
be used through `perf record` and the traced headers can be decoded
by `perf report`. The perf command support for the device is also
added in this patchset. The tune can be used through the sysfs
attributes of related PMU device. See the documentation for the
detailed usage.

Change since v7:
- Configure the DMA in probe rather than in runtime. Also use devres to manage
  PMU device as we have no order problem now
- Refactor the config validation function per John and Leo
- Use a spinlock hisi_ptt::pmu_lock instead of mutex to serialize the perf process
  in pmu::start as it's in atomic context
- Only commit the traced data when stop, per Leo and James
- Drop the filter dynamically updating patch from this series to simply the review
  of the driver. That patch will be send separately.
- add a cpumask sysfs attribute and handle the cpu hotplug events, follow the
  uncore PMU convention
- Other cleanups and fixes, both in driver and perf tool
Link: https://lore.kernel.org/lkml/20220407125841.3678-1-yangyicong@hisilicon.com/

Change since v6:
- Fix W=1 errors reported by lkp test, thanks

Change since v5:
- Squash the PMU patch into PATCH 2 suggested by John
- refine the commit message of PATCH 1 and some comments
Link: https://lore.kernel.org/lkml/20220308084930.5142-1-yangyicong@hisilicon.com/

Change since v4:
Address the comments from Jonathan, John and Ma Ca, thanks.
- Use devm* also for allocating the DMA buffers
- Remove the IRQ handler stub in Patch 2
- Make functions waiting for hardware state return boolean
- Manual remove the PMU device as it should be removed first
- Modifier the orders in probe and removal to make them matched well
- Make available {directions,type,format} array const and non-global
- Using the right filter list in filters show and well protect the
  list with mutex
- Record the trace status with a boolean @started rather than enum
- Optimize the process of finding the PTT devices of the perf-tool
Link: https://lore.kernel.org/linux-pci/20220221084307.33712-1-yangyicong@hisilicon.com/

Change since v3:
Address the comments from Jonathan and John, thanks.
- drop members in the common struct which can be get on the fly
- reduce buffer struct and organize the buffers with array instead of list
- reduce the DMA reset wait time to avoid long time busy loop
- split the available_filters sysfs attribute into two files, for root port
  and requester respectively. Update the documentation accordingly
- make IOMMU mapping check earlier in probe to avoid race condition. Also
  make IOMMU quirk patch prior to driver in the series
- Cleanups and typos fixes from John and Jonathan
Link: https://lore.kernel.org/linux-pci/20220124131118.17887-1-yangyicong@hisilicon.com/

Change since v2:
- address the comments from Mathieu, thanks.
  - rename the directory to ptt to match the function of the device
  - spinoff the declarations to a separate header
  - split the trace function to several patches
  - some other comments.
- make default smmu domain type of PTT device to identity
  Drop the RMR as it's not recommended and use an iommu_def_domain_type
  quirk to passthrough the device DMA as suggested by Robin. 
Link: https://lore.kernel.org/linux-pci/20211116090625.53702-1-yangyicong@hisilicon.com/

Change since v1:
- switch the user interface of trace to perf from debugfs
- switch the user interface of tune to sysfs from debugfs
- add perf tool support to start trace and decode the trace data
- address the comments of documentation from Bjorn
- add RMR[1] support of the device as trace works in RMR mode or
  direct DMA mode. RMR support is achieved by common APIs rather
  than the APIs implemented in [1].
Link: https://lore.kernel.org/lkml/1618654631-42454-1-git-send-email-yangyicong@hisilicon.com/
[1] https://lore.kernel.org/linux-acpi/20210805080724.480-1-shameerali.kolothum.thodi@huawei.com/

Qi Liu (3):
  perf arm: Refactor event list iteration in auxtrace_record__init()
  perf tool: Add support for HiSilicon PCIe Tune and Trace device driver
  perf tool: Add support for parsing HiSilicon PCIe Trace packet

Yicong Yang (5):
  iommu/arm-smmu-v3: Make default domain type of HiSilicon PTT device to
    identity
  hwtracing: hisi_ptt: Add trace function support for HiSilicon PCIe
    Tune and Trace device
  hwtracing: hisi_ptt: Add tune function support for HiSilicon PCIe Tune
    and Trace device
  docs: trace: Add HiSilicon PTT device driver documentation
  MAINTAINERS: Add maintainer for HiSilicon PTT driver

 Documentation/trace/hisi-ptt.rst              |  307 +++++
 Documentation/trace/index.rst                 |    1 +
 MAINTAINERS                                   |    7 +
 drivers/Makefile                              |    1 +
 drivers/hwtracing/Kconfig                     |    2 +
 drivers/hwtracing/ptt/Kconfig                 |   12 +
 drivers/hwtracing/ptt/Makefile                |    2 +
 drivers/hwtracing/ptt/hisi_ptt.c              | 1121 +++++++++++++++++
 drivers/hwtracing/ptt/hisi_ptt.h              |  201 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   21 +
 tools/perf/arch/arm/util/auxtrace.c           |  116 +-
 tools/perf/arch/arm/util/pmu.c                |    3 +
 tools/perf/arch/arm64/util/Build              |    2 +-
 tools/perf/arch/arm64/util/hisi-ptt.c         |  187 +++
 tools/perf/util/Build                         |    2 +
 tools/perf/util/auxtrace.c                    |    4 +
 tools/perf/util/auxtrace.h                    |    1 +
 tools/perf/util/hisi-ptt-decoder/Build        |    1 +
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   |  167 +++
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |   31 +
 tools/perf/util/hisi-ptt.c                    |  193 +++
 tools/perf/util/hisi-ptt.h                    |   19 +
 22 files changed, 2381 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/trace/hisi-ptt.rst
 create mode 100644 drivers/hwtracing/ptt/Kconfig
 create mode 100644 drivers/hwtracing/ptt/Makefile
 create mode 100644 drivers/hwtracing/ptt/hisi_ptt.c
 create mode 100644 drivers/hwtracing/ptt/hisi_ptt.h
 create mode 100644 tools/perf/arch/arm64/util/hisi-ptt.c
 create mode 100644 tools/perf/util/hisi-ptt-decoder/Build
 create mode 100644 tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
 create mode 100644 tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
 create mode 100644 tools/perf/util/hisi-ptt.c
 create mode 100644 tools/perf/util/hisi-ptt.h

-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
