Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E6B4B50A0
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 13:51:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE33660F1D;
	Mon, 14 Feb 2022 12:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p1LEP2wXbdRx; Mon, 14 Feb 2022 12:51:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6CE9860EC0;
	Mon, 14 Feb 2022 12:51:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45EC1C0073;
	Mon, 14 Feb 2022 12:51:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A6F6C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 12:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16E304015E
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 12:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmVt5BSLNQF9 for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 12:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7CC1400E0
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 12:51:17 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Jy3wJ5Z4yzbkNY;
 Mon, 14 Feb 2022 20:50:08 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Feb 2022 20:51:13 +0800
Subject: Re: [PATCH v3 1/8] hwtracing: Add trace function support for
 HiSilicon PCIe Tune and Trace device
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Yicong Yang
 <yangyicong@hisilicon.com>
References: <20220124131118.17887-1-yangyicong@hisilicon.com>
 <20220124131118.17887-2-yangyicong@hisilicon.com>
 <20220207114223.00001d2a@Huawei.com>
 <5a095797-0e07-572f-700a-9c29fd5d4a1f@huawei.com>
Message-ID: <16318ce2-b8a5-6279-7e4b-c1c3288c6199@huawei.com>
Date: Mon, 14 Feb 2022 20:51:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <5a095797-0e07-572f-700a-9c29fd5d4a1f@huawei.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, prime.zeng@huawei.com,
 alexander.shishkin@linux.intel.com, linux-pci@vger.kernel.org,
 linuxarm@huawei.com, will@kernel.org, daniel.thompson@linaro.org,
 peterz@infradead.org, mingo@redhat.com, helgaas@kernel.org,
 liuqi115@huawei.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, acme@kernel.org, zhangshaokun@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
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

On 2022/2/8 19:07, Yicong Yang wrote:
> On 2022/2/7 19:42, Jonathan Cameron wrote:
>> On Mon, 24 Jan 2022 21:11:11 +0800
>> Yicong Yang <yangyicong@hisilicon.com> wrote:
>>
>>> HiSilicon PCIe tune and trace device(PTT) is a PCIe Root Complex
>>> integrated Endpoint(RCiEP) device, providing the capability
>>> to dynamically monitor and tune the PCIe traffic, and trace
>>> the TLP headers.
>>>
>>> Add the driver for the device to enable the trace function.
>>> This patch adds basic function of trace, including the device's
>>> probe and initialization, functions for trace buffer allocation
>>> and trace enable/disable, register an interrupt handler to
>>> simply response to the DMA events. The user interface of trace
>>> will be added in the following patch.
>>>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> Hi Yicong,
>>
>> I've not been following all the earlier discussion on this driver closely
>> so I may well raise something that has already been addressed. If so
>> just ignore the comment.
> 
> Thanks for the comments. It's ok for me to clarify it :).
> Part replies inline and I need to do some test on the others.
> 
>>
>> Thanks,
>>
>> Jonathan
>>
>>> ---
>>>  drivers/Makefile                 |   1 +
>>>  drivers/hwtracing/Kconfig        |   2 +
>>>  drivers/hwtracing/ptt/Kconfig    |  11 +
>>>  drivers/hwtracing/ptt/Makefile   |   2 +
>>>  drivers/hwtracing/ptt/hisi_ptt.c | 398 +++++++++++++++++++++++++++++++
>>>  drivers/hwtracing/ptt/hisi_ptt.h | 159 ++++++++++++
>>>  6 files changed, 573 insertions(+)
>>>  create mode 100644 drivers/hwtracing/ptt/Kconfig
>>>  create mode 100644 drivers/hwtracing/ptt/Makefile
>>>  create mode 100644 drivers/hwtracing/ptt/hisi_ptt.c
>>>  create mode 100644 drivers/hwtracing/ptt/hisi_ptt.h
>>>
> [...]
>>> +
>>> +static int hisi_ptt_alloc_trace_buf(struct hisi_ptt *hisi_ptt)
>>> +{
>>> +	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
>>> +	struct device *dev = &hisi_ptt->pdev->dev;
>>> +	struct hisi_ptt_dma_buffer *buffer;
>>> +	int i, ret;
>>> +
>>> +	hisi_ptt->trace_ctrl.buf_index = 0;
>>> +
>>> +	/* Make sure the trace buffer is empty before allocating */
>>
>> This comment is misleading as it suggests it not being empty is
>> a bad thing but the code handles it as an acceptable path.
>> Perhaps:
>> 	/*
>> 	 * If the trace buffer has already been allocated, zero the
>> 	 * memory.
>> 	 */
>>
> 
> will make it less misleading. thanks.
> 
>>> +	if (!list_empty(&ctrl->trace_buf)) {
>>> +		list_for_each_entry(buffer, &ctrl->trace_buf, list)
>>> +			memset(buffer->addr, 0, buffer->size);
>>> +		return 0;
>>> +	}
>>> +
>>> +	for (i = 0; i < HISI_PTT_TRACE_BUF_CNT; ++i) {
>>> +		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
>>> +		if (!buffer) {
>>> +			ret = -ENOMEM;
>>> +			goto err;
>>> +		}
>>> +
>>> +		buffer->addr = dma_alloc_coherent(dev, ctrl->buffer_size,
>>> +						  &buffer->dma, GFP_KERNEL);
>>> +		if (!buffer->addr) {
>>> +			kfree(buffer);
>>> +			ret = -ENOMEM;
>>> +			goto err;
>>> +		}
>>> +
>>> +		memset(buffer->addr, 0, buffer->size);
>> See:
>> https://lore.kernel.org/lkml/20190108130701.14161-4-hch@lst.de/
>> dma_alloc_coherent() always zeros the memory for us hence there
>> is no longer a dma_kzalloc_coherent()
>>
> 
> thanks for the information. Then the memset here is redundant and will drop it.
> 
>>> +
>>> +		buffer->index = i;
>>
>> Carrying an index inside a list which corresponds directly
>> to the position in the list is not particularly nice.
>> Why can't we compute this index on the fly where the list
>> is walked?  Or am I misunderstanding and the order of the buffers
>> is changed in a later patch?
>>
> 
> The index is fixed once allocated and I stored it to avoid later
> computing. But seems it's highly recommended to compute these sort
> of things on the fly when necessary. John recommends the same things
> on some other places so I think I can get these addressed.
> 
>> As a side note, is a list actually appropriate when we always
>> have 4 of these buffers?  Feels like an array of buffer
>> structures might be cheaper.
>>

As suggested here and below, I tried to maintianed the buffers with
an array instead of a list and it looks more straightforward and some
fields of buffer structure can also be dropped. So I think I can change
to use an array.

Thanks for the suggestion!

Yicong

>>> +		buffer->size = ctrl->buffer_size;
>>> +		list_add_tail(&buffer->list, &ctrl->trace_buf);
>>> +	}
>>> +
>>> +	return 0;
>>> +err:
>>> +	hisi_ptt_free_trace_buf(hisi_ptt);
>>> +	return ret;
>>> +}
>>> +
>>> +static void hisi_ptt_trace_end(struct hisi_ptt *hisi_ptt)
>>> +{
>>> +	writel(0, hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>> +	hisi_ptt->trace_ctrl.status = HISI_PTT_TRACE_STATUS_OFF;
>>> +}
>>> +
>>> +static int hisi_ptt_trace_start(struct hisi_ptt *hisi_ptt)
>>> +{
>>> +	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
>>> +	struct hisi_ptt_dma_buffer *cur;
>>> +	u32 val;
>>> +
>>> +	/* Check device idle before start trace */
>>> +	if (hisi_ptt_wait_trace_hw_idle(hisi_ptt)) {
>>> +		pci_err(hisi_ptt->pdev, "Failed to start trace, the device is still busy.\n");
>>> +		return -EBUSY;
>>> +	}
>>> +
>>> +	/* Reset the DMA before start tracing */
>>> +	val = readl(hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>> +	val |= HISI_PTT_TRACE_CTRL_RST;
>>> +	writel(val, hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>> +
>>> +	/*
>>> +	 * We'll be in the perf context where preemption is disabled,
>>> +	 * so use busy loop here.
>>> +	 */
>>> +	mdelay(HISI_PTT_RESET_WAIT_MS);
>>
>> Busy look for 1 second?  Ouch.  If we can reduce this in any way
>> that would be great or if there is a means to do it before
>> we disable preemption.
>>
> 
> It's inherited from the previous version that was using msleep() and it's
> somehow unacceptable in an atomic context I think. The reset here is
> going to reset the write pointer of the hardware DMA so we can check the
> whether the pointer before dereset it. I confirmed with our hardware
> teams that it can be reduced to 10us. So I'll poll the write pointer register
> for about 10us before continue here.
> 
> thanks for catching this!
> 
>>> +
>>> +	val = readl(hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>> +	val &= ~HISI_PTT_TRACE_CTRL_RST;
>>> +	writel(val, hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>> +
>>> +	/* Clear the interrupt status */
>>> +	writel(HISI_PTT_TRACE_INT_STAT_MASK, hisi_ptt->iobase + HISI_PTT_TRACE_INT_STAT);
>>> +	writel(0, hisi_ptt->iobase + HISI_PTT_TRACE_INT_MASK);
>>> +
>>> +	/* Configure the trace DMA buffer */
>>> +	list_for_each_entry(cur, &ctrl->trace_buf, list) {
>>
>> I comment on the use of cur->index above.  Here it would be easy to compute
>> the index as we go for example assuming we never end up with holes
>> in the list.
>>
> 
> ok.
> 
>>> +		writel(lower_32_bits(cur->dma),
>>> +		       hisi_ptt->iobase + HISI_PTT_TRACE_ADDR_BASE_LO_0 +
>>> +		       cur->index * HISI_PTT_TRACE_ADDR_STRIDE);
>>> +		writel(upper_32_bits(cur->dma),
>>> +		       hisi_ptt->iobase + HISI_PTT_TRACE_ADDR_BASE_HI_0 +
>>> +		       cur->index * HISI_PTT_TRACE_ADDR_STRIDE);
>>> +	}
>>> +	writel(ctrl->buffer_size, hisi_ptt->iobase + HISI_PTT_TRACE_ADDR_SIZE);
>>> +
>>> +	/* Set the trace control register */
>>> +	val = FIELD_PREP(HISI_PTT_TRACE_CTRL_TYPE_SEL, ctrl->type);
>>> +	val |= FIELD_PREP(HISI_PTT_TRACE_CTRL_RXTX_SEL, ctrl->direction);
>>> +	val |= FIELD_PREP(HISI_PTT_TRACE_CTRL_DATA_FORMAT, ctrl->format);
>>> +	val |= FIELD_PREP(HISI_PTT_TRACE_CTRL_TARGET_SEL, hisi_ptt->trace_ctrl.filter);
>>> +	if (!hisi_ptt->trace_ctrl.is_port)
>>> +		val |= HISI_PTT_TRACE_CTRL_FILTER_MODE;
>>> +
>>> +	/* Start the Trace */
>>> +	val |= HISI_PTT_TRACE_CTRL_EN;
>>> +	writel(val, hisi_ptt->iobase + HISI_PTT_TRACE_CTRL);
>>> +
>>> +	ctrl->status = HISI_PTT_TRACE_STATUS_ON;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>
>> ...
>>
>>> +
>>> +static void hisi_ptt_init_ctrls(struct hisi_ptt *hisi_ptt)
>>> +{
>>> +	struct pci_dev *pdev = hisi_ptt->pdev;
>>> +	struct pci_bus *bus;
>>> +	u32 reg;
>>> +
>>> +	INIT_LIST_HEAD(&hisi_ptt->port_filters);
>>> +	INIT_LIST_HEAD(&hisi_ptt->req_filters);
>>> +
>>> +	/*
>>> +	 * The device range register provides the information about the
>>> +	 * root ports which the RCiEP can control and trace. The RCiEP
>>> +	 * and the root ports it support are on the same PCIe core, with
>>> +	 * same domain number but maybe different bus number. The device
>>> +	 * range register will tell us which root ports we can support,
>>> +	 * Bit[31:16] indicates the upper BDF numbers of the root port,
>>> +	 * while Bit[15:0] indicates the lower.
>>> +	 */
>>> +	reg = readl(hisi_ptt->iobase + HISI_PTT_DEVICE_RANGE);
>>> +	hisi_ptt->upper = reg >> 16;
>>> +	hisi_ptt->lower = reg & 0xffff;
>> Trivial:
>> Perhaps worthing define HISI_PTT_DEVICE_RANGE_UPPER_MASK etc adn using
>> FIELD_GET?
>>
> 
> sure.
> 
>>> +
>>> +	reg = readl(hisi_ptt->iobase + HISI_PTT_LOCATION);
>>> +	hisi_ptt->core_id = FIELD_GET(HISI_PTT_CORE_ID, reg);
>>> +	hisi_ptt->sicl_id = FIELD_GET(HISI_PTT_SICL_ID, reg);
>>> +
>>> +	bus = pci_find_bus(pci_domain_nr(pdev->bus), PCI_BUS_NUM(hisi_ptt->upper));
>>> +	if (bus)
>>> +		pci_walk_bus(bus, hisi_ptt_init_filters, hisi_ptt);
>>> +
>>> +	/* Initialize trace controls */
>>> +	INIT_LIST_HEAD(&hisi_ptt->trace_ctrl.trace_buf);
>>> +	hisi_ptt->trace_ctrl.buffer_size = HISI_PTT_TRACE_BUF_SIZE;
>>> +	hisi_ptt->trace_ctrl.default_cpu = cpumask_first(cpumask_of_node(dev_to_node(&pdev->dev)));
>>> +}
>>> +
> [...]
>>> +
>>> +#define HISI_PCIE_CORE_PORT_ID(devfn)	(PCI_FUNC(devfn) << 1)
>>> +
>>> +enum hisi_ptt_trace_status {
>>> +	HISI_PTT_TRACE_STATUS_OFF = 0,
>>> +	HISI_PTT_TRACE_STATUS_ON,
>>> +};
>>
>> Why not just use a boolean given we only have off and on states?
>>
> 
> An enum may make the code more readable I think.
> 
> Thanks,
> Yicong
> 
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
