Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 937BF5216E9
	for <lists.iommu@lfdr.de>; Tue, 10 May 2022 15:17:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3317F400FB;
	Tue, 10 May 2022 13:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLeJmUq_zZom; Tue, 10 May 2022 13:17:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BEF7F40327;
	Tue, 10 May 2022 13:17:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D6EFC0081;
	Tue, 10 May 2022 13:17:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6208C002D
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 13:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B556340327
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 13:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exxj1Xgo749C for <iommu@lists.linux-foundation.org>;
 Tue, 10 May 2022 13:17:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8DA6400FB
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 13:17:34 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KyJTG3l3Sz1JC0h;
 Tue, 10 May 2022 21:16:18 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 10 May 2022 21:17:29 +0800
Subject: Re: [PATCH v7 2/7] hwtracing: Add trace function support for
 HiSilicon PCIe Tune and Trace device
To: James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>
References: <20220407125841.3678-1-yangyicong@hisilicon.com>
 <20220407125841.3678-3-yangyicong@hisilicon.com>
 <e56c02c5-3696-c8d5-89e0-050bfe9edaa8@arm.com>
 <ad518edf-425b-f2ab-08e9-5a00b712508c@huawei.com>
 <30ad6a53-1f4a-a88e-c239-fdd6d80ca4e1@arm.com>
Message-ID: <1d0ce530-f30b-23f0-a133-4571599f8a79@huawei.com>
Date: Tue, 10 May 2022 21:17:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <30ad6a53-1f4a-a88e-c239-fdd6d80ca4e1@arm.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, prime.zeng@huawei.com,
 alexander.shishkin@linux.intel.com, linux-pci@vger.kernel.org,
 linuxarm@huawei.com, yangyicong@hisilicon.com, will@kernel.org,
 daniel.thompson@linaro.org, peterz@infradead.org, mingo@redhat.com,
 helgaas@kernel.org, liuqi115@huawei.com, mike.leach@linaro.org,
 suzuki.poulose@arm.com, coresight@lists.linaro.org, acme@kernel.org,
 zhangshaokun@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
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
From: Yicong Yang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yicong Yang <yangyicong@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2022/5/10 20:54, James Clark wrote:
> 
> 
> On 10/05/2022 12:18, Yicong Yang wrote:
>> On 2022/5/10 17:46, James Clark wrote:
>>>
>>>
>>> On 07/04/2022 13:58, Yicong Yang wrote:
>>>> HiSilicon PCIe tune and trace device(PTT) is a PCIe Root Complex integrated
>>>> Endpoint(RCiEP) device, providing the capability to dynamically monitor and
>>>> tune the PCIe traffic, and trace the TLP headers.
>>>>
>>>> Add the driver for the device to enable the trace function. Register PMU
>>>> device of PTT trace, then users can use trace through perf command. The
>>>> driver makes use of perf AUX trace and support following events to
>>>> configure the trace:
>>>>
>>>> - filter: select Root port or Endpoint to trace
>>>> - type: select the type of traced TLP headers
>>>> - direction: select the direction of traced TLP headers
>>>> - format: select the data format of the traced TLP headers
>>>>
>>>> This patch adds the driver part of PTT trace. The perf command support of
>>>> PTT trace is added in the following patch.
>>>>
>>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>> ---
>>>>  drivers/Makefile                 |   1 +
>>>>  drivers/hwtracing/Kconfig        |   2 +
>>>>  drivers/hwtracing/ptt/Kconfig    |  12 +
>>>>  drivers/hwtracing/ptt/Makefile   |   2 +
>>>>  drivers/hwtracing/ptt/hisi_ptt.c | 874 +++++++++++++++++++++++++++++++
>>>>  drivers/hwtracing/ptt/hisi_ptt.h | 166 ++++++
>>>>  6 files changed, 1057 insertions(+)
>>>>  create mode 100644 drivers/hwtracing/ptt/Kconfig
>>>>  create mode 100644 drivers/hwtracing/ptt/Makefile
>>>>  create mode 100644 drivers/hwtracing/ptt/hisi_ptt.c
>>>>  create mode 100644 drivers/hwtracing/ptt/hisi_ptt.h
>>>>
>>>> diff --git a/drivers/Makefile b/drivers/Makefile
>>>> index 020780b6b4d2..662d50599467 100644
>>>> --- a/drivers/Makefile
>>>> +++ b/drivers/Makefile
>>>> @@ -175,6 +175,7 @@ obj-$(CONFIG_USB4)		+= thunderbolt/
>>>>  obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
>>>>  obj-y				+= hwtracing/intel_th/
>>>>  obj-$(CONFIG_STM)		+= hwtracing/stm/
>>>> +obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
>>>>  obj-$(CONFIG_ANDROID)		+= android/
>>>>  obj-$(CONFIG_NVMEM)		+= nvmem/
>>>>  obj-$(CONFIG_FPGA)		+= fpga/
>>>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>>>> index 13085835a636..911ee977103c 100644
>>>> --- a/drivers/hwtracing/Kconfig
>>>> +++ b/drivers/hwtracing/Kconfig
>>>> @@ -5,4 +5,6 @@ source "drivers/hwtracing/stm/Kconfig"
>>>>  
>>>>  source "drivers/hwtracing/intel_th/Kconfig"
>>>>  
>>>> +source "drivers/hwtracing/ptt/Kconfig"
>>>> +
>>>>  endmenu
>>>> diff --git a/drivers/hwtracing/ptt/Kconfig b/drivers/hwtracing/ptt/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..8902a6f27563
>>>> --- /dev/null
>>>> +++ b/drivers/hwtracing/ptt/Kconfig
>>>> @@ -0,0 +1,12 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +config HISI_PTT
>>>> +	tristate "HiSilicon PCIe Tune and Trace Device"
>>>> +	depends on ARM64 || (COMPILE_TEST && 64BIT)
>>>> +	depends on PCI && HAS_DMA && HAS_IOMEM && PERF_EVENTS
>>>> +	help
>>>> +	  HiSilicon PCIe Tune and Trace Device exists as a PCIe RCiEP
>>>> +	  device, and it provides support for PCIe traffic tuning and
>>>> +	  tracing TLP headers to the memory.
>>>> +
>>>> +	  This driver can also be built as a module. If so, the module
>>>> +	  will be called hisi_ptt.
>>>> diff --git a/drivers/hwtracing/ptt/Makefile b/drivers/hwtracing/ptt/Makefile
>>>> new file mode 100644
>>>> index 000000000000..908c09a98161
>>>> --- /dev/null
>>>> +++ b/drivers/hwtracing/ptt/Makefile
>>>> @@ -0,0 +1,2 @@
>>>> +# SPDX-License-Identifier: GPL-2.0
>>>> +obj-$(CONFIG_HISI_PTT) += hisi_ptt.o
>>>> diff --git a/drivers/hwtracing/ptt/hisi_ptt.c b/drivers/hwtracing/ptt/hisi_ptt.c
>>>> new file mode 100644
>>>> index 000000000000..242b41870380
>>>> --- /dev/null
>>>> +++ b/drivers/hwtracing/ptt/hisi_ptt.c
>>>> @@ -0,0 +1,874 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Driver for HiSilicon PCIe tune and trace device
>>>> + *
>>>> + * Copyright (c) 2022 HiSilicon Technologies Co., Ltd.
>>>> + * Author: Yicong Yang <yangyicong@hisilicon.com>
>>>> + */
>>>> +
>>>> +#include <linux/bitfield.h>
>>>> +#include <linux/bitops.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/dma-iommu.h>
>>>> +#include <linux/dma-mapping.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/iommu.h>
>>>> +#include <linux/iopoll.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/sysfs.h>
>>>> +#include <linux/vmalloc.h>
>>>> +
>>>> +#include "hisi_ptt.h"
>>>> +
>>>> +static u16 hisi_ptt_get_filter_val(struct pci_dev *pdev)
>>>> +{
>>>> +	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT)
>>>> +		return BIT(HISI_PCIE_CORE_PORT_ID(PCI_SLOT(pdev->devfn)));
>>>> +
>>>> +	return PCI_DEVID(pdev->bus->number, pdev->devfn);
>>>> +}
>>>> +
>>>> +static bool hisi_ptt_wait_trace_hw_idle(struct hisi_ptt *hisi_ptt)
>>>> +{
>>>> +	u32 val;
>>>> +
>>>> +	return !readl_poll_timeout_atomic(hisi_ptt->iobase + HISI_PTT_TRACE_STS,
>>>> +					  val, val & HISI_PTT_TRACE_IDLE,
>>>> +					  HISI_PTT_WAIT_POLL_INTERVAL_US,
>>>> +					  HISI_PTT_WAIT_TRACE_TIMEOUT_US);
>>>> +}
>>>> +
>>>> +static bool hisi_ptt_wait_dma_reset_done(struct hisi_ptt *hisi_ptt)
>>>> +{
>>>> +	u32 val;
>>>> +
>>>> +	return !readl_poll_timeout_atomic(hisi_ptt->iobase + HISI_PTT_TRACE_WR_STS,
>>>> +					  val, !val, HISI_PTT_RESET_POLL_INTERVAL_US,
>>>> +					  HISI_PTT_RESET_TIMEOUT_US);
>>>> +}
>>>> +
>>>> +static void hisi_ptt_free_trace_buf(struct hisi_ptt *hisi_ptt)
>>>> +{
>>>> +	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
>>>> +	struct device *dev = &hisi_ptt->pdev->dev;
>>>> +	int i;
>>>> +
>>>> +	if (!ctrl->trace_buf)
>>>> +		return;
>>>> +
>>>> +	for (i = 0; i < HISI_PTT_TRACE_BUF_CNT; i++) {
>>>> +		if (ctrl->trace_buf[i].addr)
>>>> +			dmam_free_coherent(dev, HISI_PTT_TRACE_BUF_SIZE,
>>>> +					   ctrl->trace_buf[i].addr,
>>>> +					   ctrl->trace_buf[i].dma);
>>>> +	}
>>>> +
>>>> +	devm_kfree(dev, ctrl->trace_buf);
>>>> +	ctrl->trace_buf = NULL;
>>>> +}
>>>> +
>>>> +static int hisi_ptt_alloc_trace_buf(struct hisi_ptt *hisi_ptt)
>>>> +{
>>>> +	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
>>>> +	struct device *dev = &hisi_ptt->pdev->dev;
>>>> +	int i;
>>>> +
>>>> +	hisi_ptt->trace_ctrl.buf_index = 0;
>>>> +
>>>> +	/* If the trace buffer has already been allocated, zero it. */
>>>> +	if (ctrl->trace_buf) {
>>>> +		for (i = 0; i < HISI_PTT_TRACE_BUF_CNT; i++)
>>>> +			memset(ctrl->trace_buf[i].addr, 0, HISI_PTT_TRACE_BUF_SIZE);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	ctrl->trace_buf = devm_kcalloc(dev, HISI_PTT_TRACE_BUF_CNT,
>>>> +				       sizeof(struct hisi_ptt_dma_buffer), GFP_KERNEL);
>>>> +	if (!ctrl->trace_buf)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	for (i = 0; i < HISI_PTT_TRACE_BUF_CNT; ++i) {
>>>> +		ctrl->trace_buf[i].addr = dmam_alloc_coherent(dev, HISI_PTT_TRACE_BUF_SIZE,
>>>> +							     &ctrl->trace_buf[i].dma,
>>>> +							     GFP_KERNEL);
>>>> +		if (!ctrl->trace_buf[i].addr) {
>>>> +			hisi_ptt_free_trace_buf(hisi_ptt);
>>>> +			return -ENOMEM;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void hisi_ptt_trace_end(struct hisi_ptt *hisi_ptt)
>>>> +{
>>>> +	writel(0, hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>>> +	hisi_ptt->trace_ctrl.started = false;
>>>> +}
>>>> +
>>>> +static int hisi_ptt_trace_start(struct hisi_ptt *hisi_ptt)
>>>> +{
>>>> +	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
>>>> +	u32 val;
>>>> +	int i;
>>>> +
>>>> +	/* Check device idle before start trace */
>>>> +	if (!hisi_ptt_wait_trace_hw_idle(hisi_ptt)) {
>>>> +		pci_err(hisi_ptt->pdev, "Failed to start trace, the device is still busy\n");
>>>> +		return -EBUSY;
>>>> +	}
>>>> +
>>>> +	ctrl->started = true;
>>>> +
>>>> +	/* Reset the DMA before start tracing */
>>>> +	val = readl(hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>>> +	val |= HISI_PTT_TRACE_CTRL_RST;
>>>> +	writel(val, hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>>> +
>>>> +	hisi_ptt_wait_dma_reset_done(hisi_ptt);
>>>> +
>>>> +	val = readl(hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>>> +	val &= ~HISI_PTT_TRACE_CTRL_RST;
>>>> +	writel(val, hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>>> +
>>>> +	/* Clear the interrupt status */
>>>> +	writel(HISI_PTT_TRACE_INT_STAT_MASK, hisi_ptt->iobase + HISI_PTT_TRACE_INT_STAT);
>>>> +	writel(0, hisi_ptt->iobase + HISI_PTT_TRACE_INT_MASK);
>>>> +
>>>> +	/* Configure the trace DMA buffer */
>>>> +	for (i = 0; i < HISI_PTT_TRACE_BUF_CNT; i++) {
>>>> +		writel(lower_32_bits(ctrl->trace_buf[i].dma),
>>>> +		       hisi_ptt->iobase + HISI_PTT_TRACE_ADDR_BASE_LO_0 +
>>>> +		       i * HISI_PTT_TRACE_ADDR_STRIDE);
>>>> +		writel(upper_32_bits(ctrl->trace_buf[i].dma),
>>>> +		       hisi_ptt->iobase + HISI_PTT_TRACE_ADDR_BASE_HI_0 +
>>>> +		       i * HISI_PTT_TRACE_ADDR_STRIDE);
>>>> +	}
>>>> +	writel(HISI_PTT_TRACE_BUF_SIZE, hisi_ptt->iobase + HISI_PTT_TRACE_ADDR_SIZE);
>>>> +
>>>> +	/* Set the trace control register */
>>>> +	val = FIELD_PREP(HISI_PTT_TRACE_CTRL_TYPE_SEL, ctrl->type);
>>>> +	val |= FIELD_PREP(HISI_PTT_TRACE_CTRL_RXTX_SEL, ctrl->direction);
>>>> +	val |= FIELD_PREP(HISI_PTT_TRACE_CTRL_DATA_FORMAT, ctrl->format);
>>>> +	val |= FIELD_PREP(HISI_PTT_TRACE_CTRL_TARGET_SEL, hisi_ptt->trace_ctrl.filter);
>>>> +	if (!hisi_ptt->trace_ctrl.is_port)
>>>> +		val |= HISI_PTT_TRACE_CTRL_FILTER_MODE;
>>>> +
>>>> +	/* Start the Trace */
>>>> +	val |= HISI_PTT_TRACE_CTRL_EN;
>>>> +	writel(val, hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int hisi_ptt_update_aux(struct hisi_ptt *hisi_ptt, int index, bool stop)
>>>> +{
>>>> +	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
>>>> +	struct perf_output_handle *handle = &ctrl->handle;
>>>> +	struct perf_event *event = handle->event;
>>>> +	struct hisi_ptt_pmu_buf *buf;
>>>> +	void *addr;
>>>> +
>>>> +	buf = perf_get_aux(handle);
>>>> +	if (!buf || !handle->size)
>>>> +		return -EINVAL;
>>>> +
>>>> +	addr = ctrl->trace_buf[ctrl->buf_index].addr;
>>>> +
>>>> +	memcpy(buf->base + buf->pos, addr, HISI_PTT_TRACE_BUF_SIZE);
>>>> +	memset(addr, 0, HISI_PTT_TRACE_BUF_SIZE);
>>>
>>> Hi Kicong,
>>>
>>> I also have the same comment as Leo here, I don't think the memset is
>>> required.
>>>
>>
>> It's necessary in the current approach as we always commit HISI_PTT_TRACE_BUF_SIZE
>> data but the buffer maybe partly filled (called when perf going to stopp, not by the
>> interrupt). The buffer is cleared so the unfilled part of the buffer will have
>> empty data (normal traced TLP headers won't be all 0), then the user can distinguish
>> the valid part of the data.
>>
>> I'm trying to only copy the traced data rather than the whole buffer then the
>> clear operation here will be unnecessary. The hardware provide a register indicating
>> which offset of which buffer it's currently writing to and it canbe used here.
> 
> If only the traced data is copied rather than the full buffer, isn't that what
> perf_aux_output_end() is for? Perf will only read up to the point where you
> say the buffer is filled to, it won't go and read the zeros if you didn't tell
> it to by emitting perf_aux_output_end() for more data than was written.
> 
> If you are having to write zeros to detect which bits of the buffer is filled
> or not it sounds like those zero parts are making it into the perf file and are
> wasting disk space and CPU cycles to copy them.
> 

For the approach in this version, you're right that we'll waste CPU cycles to copy
them. But this will only happens when the perf session is going stop, as in the
updating from interrupts we'll always have data of full buffer size (interrupt only
comes when the buffer is filled fully). The data will be like (perf report -D):

[...]
.  00000004: 00 00 00 00                                 Prefix
.  00000008: 01 80 00 60                                 Header DW0
.  0000000c: 0f 1e 00 01                                 Header DW1
.  00000010: c6 00 00 00                                 Header DW2
.  00000014: 40 00 01 60                                 Header DW3
.  0000001c: c5 94 d1 00                                 Time
.  0000005c: 14 00 00 00                                 Time
.  00000064: 00 00 00 00                                 Prefix
.  00000068: 00 00 00 00                                 Header DW0
.  0000006c: 00 00 00 00                                 Header DW1
.  00000070: 00 00 00 00                                 Header DW2
.  0000005c: 00 00 00 00                                 Time
[...zeroed data]

I'll change to only copy the valid data like below in next version. Then we won't
waste disk space and cpu time to copy it.

static int hisi_ptt_update_aux(struct hisi_ptt *hisi_ptt, int index, bool stop)
{
	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
	struct perf_output_handle *handle = &ctrl->handle;
	struct perf_event *event = handle->event;
	struct hisi_ptt_pmu_buf *buf;
	void *addr;
	size_t sz;

	buf = perf_get_aux(handle);
	if (!buf || !handle->size)
		return -EINVAL;

	addr = ctrl->trace_buf[ctrl->buf_index].addr;

	if (stop) {
		u32 reg;

		reg = readl(hisi_ptt->iobase + HISI_PTT_TRACE_WR_STS);
		sz = FIELD_GET(HISI_PTT_TRACE_WR_STS_WRITE, reg);
	} else {
		sz = HISI_PTT_TRACE_BUF_SIZE;
	}

	memcpy(buf->base + buf->pos, addr, sz);
	buf->pos += sz;

	/*
	 * Just commit the traced data if we're going to stop. Otherwise if the
	 * resident AUX buffer cannot contain data of next trace buffer, apply
	 * a new one.
	 */
	if (stop) {
		perf_aux_output_end(handle, buf->pos);
	} else if (buf->length - buf->pos < HISI_PTT_TRACE_BUF_SIZE) {
		perf_aux_output_end(handle, buf->pos);

		buf = perf_aux_output_begin(handle, event);
		if (!buf)
			return -EINVAL;

		buf->pos = handle->head % buf->length;
		if (buf->length - buf->pos < HISI_PTT_TRACE_BUF_SIZE) {
			perf_aux_output_end(handle, 0);
			return -EINVAL;
		}
	}

	return 0;
}

>>
>>>> +	buf->pos += HISI_PTT_TRACE_BUF_SIZE;
>>>> +
>>>> +	if (stop) {
>>>> +		perf_aux_output_end(handle, buf->pos);
>>>> +	} else if (buf->length - buf->pos < HISI_PTT_TRACE_BUF_SIZE) {
>>>> +		perf_aux_output_skip(handle, buf->length - buf->pos);
>>>
>>> perf_aux_output_skip() can also return an error so should probably also
>>> be checked like perf_aux_output_begin()
>>>
>>
>> ok it should be checked.
>>
>>> I'm also wondering why there is a skip for every output_end()? Is that
>>> to avoid having two memcpy calls to handle the wrap around if the data
>>> to be copied goes past the end of the aux buffer?
>>>
>>> For example if your buffers are 4MB each and the aux buffer that the
>>> user picked isn't a multiple of 4 I can see you needing to write the
>>> first part of the 4MB to the end of the aux buffer and then the last
>>> part to the beginning which would be two memcpy() calls. And then a
>>> skip wouldn't be required.
>>>
>>
>> I intended to handle the case that AUX buffer is not a multiple of 4 MiB.
>> When the resident AUX buffer size is less than 4MiB, we're not going to
>> commit data to it and will apply a new AUX buffer instead. I think you're
>> right that the perf_aux_output_skip() is unnecessary here. Thanks for
>> catching this.
>>
>>> I looked at all the other uses of perf_output_end() and perf_output_skip()
>>> in the kernel and didn't see a pattern like yours so it seems suspicous to
>>> me. Maybe at least some comments around this section are needed.
>>>
>>
>> Will add some comments of the handling here.
>>
>> Regards,
>> Yicong
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
