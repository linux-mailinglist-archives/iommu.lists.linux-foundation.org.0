Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E442155B958
	for <lists.iommu@lfdr.de>; Mon, 27 Jun 2022 13:18:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFC140922;
	Mon, 27 Jun 2022 11:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CFC140922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zyu_-pKIdCrx; Mon, 27 Jun 2022 11:18:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E91214092C;
	Mon, 27 Jun 2022 11:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E91214092C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1C44C007E;
	Mon, 27 Jun 2022 11:18:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66D48C002D
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 11:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D93E61073
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 11:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D93E61073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxccIzw6cs1n for <iommu@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 11:18:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5BEF6106A
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5BEF6106A
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 11:18:17 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LWlZ62Tc6z9srK;
 Mon, 27 Jun 2022 19:17:34 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 27 Jun 2022 19:18:12 +0800
Subject: Re: [PATCH v9 0/8] Add support for HiSilicon PCIe Tune and Trace
 device
To: <gregkh@linuxfoundation.org>
References: <20220606115555.41103-1-yangyicong@hisilicon.com>
Message-ID: <af6723f1-c0c5-8af5-857c-af9280e705af@huawei.com>
Date: Mon, 27 Jun 2022 19:18:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220606115555.41103-1-yangyicong@hisilicon.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, prime.zeng@huawei.com, peterz@infradead.org,
 linux-pci@vger.kernel.org, linuxarm@huawei.com,
 Yicong Yang <yangyicong@hisilicon.com>, james.clark@arm.com, will@kernel.org,
 alexander.shishkin@linux.intel.com, mingo@redhat.com, helgaas@kernel.org,
 liuqi115@huawei.com, suzuki.poulose@arm.com, acme@kernel.org,
 zhangshaokun@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, iommu@lists.linux-foundation.org,
 leo.yan@linaro.org, robin.murphy@arm.com
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
Reply-To: Yicong Yang <yangyicong@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Greg,

Since the kernel side of this device has been reviewed for 8 versions with
all comments addressed and no more comment since v9 posted in 5.19-rc1,
is it ok to merge it first (for Patch 1-3 and 7-8)?

Thanks.

On 2022/6/6 19:55, Yicong Yang wrote:
> HiSilicon PCIe tune and trace device (PTT) is a PCIe Root Complex
> integrated Endpoint (RCiEP) device, providing the capability
> to dynamically monitor and tune the PCIe traffic (tune),
> and trace the TLP headers (trace).
> 
> PTT tune is designed for monitoring and adjusting PCIe link parameters.
> We provide several parameters of the PCIe link. Through the driver,
> user can adjust the value of certain parameter to affect the PCIe link
> for the purpose of enhancing the performance in certian situation.
> 
> PTT trace is designed for dumping the TLP headers to the memory, which
> can be used to analyze the transactions and usage condition of the PCIe
> Link. Users can choose filters to trace headers, by either requester
> ID, or those downstream of a set of Root Ports on the same core of the
> PTT device. It's also supported to trace the headers of certain type and
> of certain direction.
> 
> The driver registers a PMU device for each PTT device. The trace can
> be used through `perf record` and the traced headers can be decoded
> by `perf report`. The perf command support for the device is also
> added in this patchset. The tune can be used through the sysfs
> attributes of related PMU device. See the documentation for the
> detailed usage.
> 
> Change since v8:
> - Cleanups and one minor fix from Jonathan and John, thanks
> Link: https://lore.kernel.org/lkml/20220516125223.32012-1-yangyicong@hisilicon.com/
> 
> Change since v7:
> - Configure the DMA in probe rather than in runtime. Also use devres to manage
>   PMU device as we have no order problem now
> - Refactor the config validation function per John and Leo
> - Use a spinlock hisi_ptt::pmu_lock instead of mutex to serialize the perf process
>   in pmu::start as it's in atomic context
> - Only commit the traced data when stop, per Leo and James
> - Drop the filter dynamically updating patch from this series to simply the review
>   of the driver. That patch will be send separately.
> - add a cpumask sysfs attribute and handle the cpu hotplug events, follow the
>   uncore PMU convention
> - Other cleanups and fixes, both in driver and perf tool
> Link: https://lore.kernel.org/lkml/20220407125841.3678-1-yangyicong@hisilicon.com/
> 
> Change since v6:
> - Fix W=1 errors reported by lkp test, thanks
> 
> Change since v5:
> - Squash the PMU patch into PATCH 2 suggested by John
> - refine the commit message of PATCH 1 and some comments
> Link: https://lore.kernel.org/lkml/20220308084930.5142-1-yangyicong@hisilicon.com/
> 
> Change since v4:
> Address the comments from Jonathan, John and Ma Ca, thanks.
> - Use devm* also for allocating the DMA buffers
> - Remove the IRQ handler stub in Patch 2
> - Make functions waiting for hardware state return boolean
> - Manual remove the PMU device as it should be removed first
> - Modifier the orders in probe and removal to make them matched well
> - Make available {directions,type,format} array const and non-global
> - Using the right filter list in filters show and well protect the
>   list with mutex
> - Record the trace status with a boolean @started rather than enum
> - Optimize the process of finding the PTT devices of the perf-tool
> Link: https://lore.kernel.org/linux-pci/20220221084307.33712-1-yangyicong@hisilicon.com/
> 
> Change since v3:
> Address the comments from Jonathan and John, thanks.
> - drop members in the common struct which can be get on the fly
> - reduce buffer struct and organize the buffers with array instead of list
> - reduce the DMA reset wait time to avoid long time busy loop
> - split the available_filters sysfs attribute into two files, for root port
>   and requester respectively. Update the documentation accordingly
> - make IOMMU mapping check earlier in probe to avoid race condition. Also
>   make IOMMU quirk patch prior to driver in the series
> - Cleanups and typos fixes from John and Jonathan
> Link: https://lore.kernel.org/linux-pci/20220124131118.17887-1-yangyicong@hisilicon.com/
> 
> Change since v2:
> - address the comments from Mathieu, thanks.
>   - rename the directory to ptt to match the function of the device
>   - spinoff the declarations to a separate header
>   - split the trace function to several patches
>   - some other comments.
> - make default smmu domain type of PTT device to identity
>   Drop the RMR as it's not recommended and use an iommu_def_domain_type
>   quirk to passthrough the device DMA as suggested by Robin. 
> Link: https://lore.kernel.org/linux-pci/20211116090625.53702-1-yangyicong@hisilicon.com/
> 
> Change since v1:
> - switch the user interface of trace to perf from debugfs
> - switch the user interface of tune to sysfs from debugfs
> - add perf tool support to start trace and decode the trace data
> - address the comments of documentation from Bjorn
> - add RMR[1] support of the device as trace works in RMR mode or
>   direct DMA mode. RMR support is achieved by common APIs rather
>   than the APIs implemented in [1].
> Link: https://lore.kernel.org/lkml/1618654631-42454-1-git-send-email-yangyicong@hisilicon.com/
> [1] https://lore.kernel.org/linux-acpi/20210805080724.480-1-shameerali.kolothum.thodi@huawei.com/
> 
> Qi Liu (3):
>   perf tool: arm: Refactor event list iteration in
>     auxtrace_record__init()
>   perf tool: Add support for HiSilicon PCIe Tune and Trace device driver
>   perf tool: Add support for parsing HiSilicon PCIe Trace packet
> 
> Yicong Yang (5):
>   iommu/arm-smmu-v3: Make default domain type of HiSilicon PTT device to
>     identity
>   hwtracing: hisi_ptt: Add trace function support for HiSilicon PCIe
>     Tune and Trace device
>   hwtracing: hisi_ptt: Add tune function support for HiSilicon PCIe Tune
>     and Trace device
>   docs: trace: Add HiSilicon PTT device driver documentation
>   MAINTAINERS: Add maintainer for HiSilicon PTT driver
> 
>  Documentation/trace/hisi-ptt.rst              |  307 +++++
>  Documentation/trace/index.rst                 |    1 +
>  MAINTAINERS                                   |    7 +
>  drivers/Makefile                              |    1 +
>  drivers/hwtracing/Kconfig                     |    2 +
>  drivers/hwtracing/ptt/Kconfig                 |   12 +
>  drivers/hwtracing/ptt/Makefile                |    2 +
>  drivers/hwtracing/ptt/hisi_ptt.c              | 1092 +++++++++++++++++
>  drivers/hwtracing/ptt/hisi_ptt.h              |  200 +++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   21 +
>  tools/perf/arch/arm/util/auxtrace.c           |  116 +-
>  tools/perf/arch/arm/util/pmu.c                |    3 +
>  tools/perf/arch/arm64/util/Build              |    2 +-
>  tools/perf/arch/arm64/util/hisi-ptt.c         |  187 +++
>  tools/perf/util/Build                         |    2 +
>  tools/perf/util/auxtrace.c                    |    4 +
>  tools/perf/util/auxtrace.h                    |    1 +
>  tools/perf/util/hisi-ptt-decoder/Build        |    1 +
>  .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   |  164 +++
>  .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |   31 +
>  tools/perf/util/hisi-ptt.c                    |  192 +++
>  tools/perf/util/hisi-ptt.h                    |   19 +
>  22 files changed, 2347 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/trace/hisi-ptt.rst
>  create mode 100644 drivers/hwtracing/ptt/Kconfig
>  create mode 100644 drivers/hwtracing/ptt/Makefile
>  create mode 100644 drivers/hwtracing/ptt/hisi_ptt.c
>  create mode 100644 drivers/hwtracing/ptt/hisi_ptt.h
>  create mode 100644 tools/perf/arch/arm64/util/hisi-ptt.c
>  create mode 100644 tools/perf/util/hisi-ptt-decoder/Build
>  create mode 100644 tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
>  create mode 100644 tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
>  create mode 100644 tools/perf/util/hisi-ptt.c
>  create mode 100644 tools/perf/util/hisi-ptt.h
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
