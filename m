Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D914BD9D7
	for <lists.iommu@lfdr.de>; Mon, 21 Feb 2022 14:13:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C23EF404BE;
	Mon, 21 Feb 2022 13:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eSt0aKC-17R; Mon, 21 Feb 2022 13:13:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 48F2040562;
	Mon, 21 Feb 2022 13:13:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21EE0C0036;
	Mon, 21 Feb 2022 13:13:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3086AC0011
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 13:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DD6D80D8C
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 13:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fbYN6CgE1te for <iommu@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 13:13:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDF2680CC8
 for <iommu@lists.linux-foundation.org>; Mon, 21 Feb 2022 13:13:50 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K2N4N1Z4hz9sqs;
 Mon, 21 Feb 2022 21:12:04 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 21:13:45 +0800
Subject: Re: [PATCH v4 2/8] hwtracing: Add trace function support for
 HiSilicon PCIe Tune and Trace device
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Yicong Yang
 <yangyicong@hisilicon.com>
References: <20220221084307.33712-1-yangyicong@hisilicon.com>
 <20220221084307.33712-3-yangyicong@hisilicon.com>
 <20220221111812.00004c0f@Huawei.com>
Message-ID: <83ab91a5-f311-0f84-7e12-a1b40034edda@huawei.com>
Date: Mon, 21 Feb 2022 21:13:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220221111812.00004c0f@Huawei.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

Hi Jonathan,

On 2022/2/21 19:18, Jonathan Cameron wrote:
> On Mon, 21 Feb 2022 16:43:01 +0800
> Yicong Yang <yangyicong@hisilicon.com> wrote:
> 
>> HiSilicon PCIe tune and trace device(PTT) is a PCIe Root Complex
>> integrated Endpoint(RCiEP) device, providing the capability
>> to dynamically monitor and tune the PCIe traffic, and trace
>> the TLP headers.
>>
>> Add the driver for the device to enable the trace function.
>> This patch adds basic function of trace, including the device's
>> probe and initialization, functions for trace buffer allocation
>> and trace enable/disable, register an interrupt handler to
>> simply response to the DMA events. The user interface of trace
>> will be added in the following patch.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> Hi Yicong,
> 
> A few really minor things inline, particularly one place
> where you can improve the error handling.
> It's always fiddly to handle errors in a pci_walk_bus() but
> in this case it's not too difficult as you just need to store
> the retval somewhere in the private data then retrieve it
> after the pci_walk_bus() call.
> 

Thanks for the quick reply!

The pci_walk_bus() in this patch will fail only if the memory allocation
of filter struct fails. We won't allocate memory in the pci_bus_walk()
after Patch 4 so it will never fail. Maybe I can add some comments
mentioning this.

I also expressed this inline.

> Thanks,
> 
> Jonathan
> 
> 
> 
>> ---
>>  drivers/Makefile                 |   1 +
>>  drivers/hwtracing/Kconfig        |   2 +
>>  drivers/hwtracing/ptt/Kconfig    |  11 +
>>  drivers/hwtracing/ptt/Makefile   |   2 +
>>  drivers/hwtracing/ptt/hisi_ptt.c | 370 +++++++++++++++++++++++++++++++
>>  drivers/hwtracing/ptt/hisi_ptt.h | 149 +++++++++++++
>>  6 files changed, 535 insertions(+)
>>  create mode 100644 drivers/hwtracing/ptt/Kconfig
>>  create mode 100644 drivers/hwtracing/ptt/Makefile
>>  create mode 100644 drivers/hwtracing/ptt/hisi_ptt.c
>>  create mode 100644 drivers/hwtracing/ptt/hisi_ptt.h
>>
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index a110338c860c..ab3411e4eba5 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -175,6 +175,7 @@ obj-$(CONFIG_USB4)		+= thunderbolt/
>>  obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
>>  obj-y				+= hwtracing/intel_th/
>>  obj-$(CONFIG_STM)		+= hwtracing/stm/
>> +obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
>>  obj-$(CONFIG_ANDROID)		+= android/
>>  obj-$(CONFIG_NVMEM)		+= nvmem/
>>  obj-$(CONFIG_FPGA)		+= fpga/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 13085835a636..911ee977103c 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -5,4 +5,6 @@ source "drivers/hwtracing/stm/Kconfig"
>>  
>>  source "drivers/hwtracing/intel_th/Kconfig"
>>  
>> +source "drivers/hwtracing/ptt/Kconfig"
>> +
>>  endmenu
>> diff --git a/drivers/hwtracing/ptt/Kconfig b/drivers/hwtracing/ptt/Kconfig
>> new file mode 100644
>> index 000000000000..41fa83921a07
>> --- /dev/null
>> +++ b/drivers/hwtracing/ptt/Kconfig
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config HISI_PTT
>> +	tristate "HiSilicon PCIe Tune and Trace Device"
>> +	depends on ARM64 && PCI && HAS_DMA && HAS_IOMEM
>> +	help
>> +	  HiSilicon PCIe Tune and Trace Device exists as a PCIe RCiEP
>> +	  device, and it provides support for PCIe traffic tuning and
>> +	  tracing TLP headers to the memory.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called hisi_ptt.
>> diff --git a/drivers/hwtracing/ptt/Makefile b/drivers/hwtracing/ptt/Makefile
>> new file mode 100644
>> index 000000000000..908c09a98161
>> --- /dev/null
>> +++ b/drivers/hwtracing/ptt/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +obj-$(CONFIG_HISI_PTT) += hisi_ptt.o
>> diff --git a/drivers/hwtracing/ptt/hisi_ptt.c b/drivers/hwtracing/ptt/hisi_ptt.c
>> new file mode 100644
>> index 000000000000..a5b4f09ccd1e
>> --- /dev/null
>> +++ b/drivers/hwtracing/ptt/hisi_ptt.c
>> @@ -0,0 +1,370 @@
> 
> ...
> 
>> +static void hisi_ptt_free_trace_buf(struct hisi_ptt *hisi_ptt)
>> +{
>> +	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
>> +	struct device *dev = &hisi_ptt->pdev->dev;
>> +	int i;
>> +
>> +	if (!ctrl->trace_buf)
>> +		return;
>> +
>> +	for (i = 0; i < HISI_PTT_TRACE_BUF_CNT; i++)
>> +		if (ctrl->trace_buf[i].addr)
>> +			dma_free_coherent(dev, HISI_PTT_TRACE_BUF_SIZE,
>> +					  ctrl->trace_buf[i].addr,
>> +					  ctrl->trace_buf[i].dma);
>> +
>> +	kfree(ctrl->trace_buf);
>> +	ctrl->trace_buf = NULL;
>> +}
>> +
>> +static int hisi_ptt_alloc_trace_buf(struct hisi_ptt *hisi_ptt)
>> +{
>> +	struct hisi_ptt_trace_ctrl *ctrl = &hisi_ptt->trace_ctrl;
>> +	struct device *dev = &hisi_ptt->pdev->dev;
>> +	int i;
>> +
>> +	hisi_ptt->trace_ctrl.buf_index = 0;
>> +
>> +	/* If the trace buffer has already been allocated, zero it. */
>> +	if (ctrl->trace_buf) {
>> +		for (i = 0; i < HISI_PTT_TRACE_BUF_CNT; i++)
>> +			memset(ctrl->trace_buf[i].addr, 0, HISI_PTT_TRACE_BUF_SIZE);
>> +		return 0;
>> +	}
>> +
>> +	ctrl->trace_buf = kcalloc(HISI_PTT_TRACE_BUF_CNT, sizeof(struct hisi_ptt_dma_buffer),
> 
> Slight preference for sizeof(*ctrl->trace_buf) as it saves a reviewer from scrolling down
> to check the type is correct.
> 

will change to that.

>> +				  GFP_KERNEL);
>> +	if (!ctrl->trace_buf)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < HISI_PTT_TRACE_BUF_CNT; ++i) {
>> +		ctrl->trace_buf[i].addr = dma_alloc_coherent(dev, HISI_PTT_TRACE_BUF_SIZE,
>> +							     &ctrl->trace_buf[i].dma,
>> +							     GFP_KERNEL);
>> +		if (!ctrl->trace_buf[i].addr) {
>> +			hisi_ptt_free_trace_buf(hisi_ptt);
>> +			return -ENOMEM;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> 
> ...
> 
>> +
>> +static int hisi_ptt_init_filters(struct pci_dev *pdev, void *data)
>> +{
>> +	struct hisi_ptt_filter_desc *filter;
>> +	struct hisi_ptt *hisi_ptt = data;
>> +	struct list_head *target_list;
>> +
>> +	target_list = pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT ?
>> +		      &hisi_ptt->port_filters : &hisi_ptt->req_filters;
>> +
>> +	filter = kzalloc(sizeof(*filter), GFP_KERNEL);
>> +	if (!filter)
> 
> As below, if this happens we'll be left in an odd intermediate state
> where the error is not communicated up to the probe function but the
> filters are only partly set up.
> 

The memory allocation will be moved to workqueue function after patch 4
and the function won't fail anymore. I'd like to comment here to mention
that the allocation here is temporary and in the following patch this
function will always succeed.

Thanks,
Yicong

>> +		return -ENOMEM;
>> +
>> +	filter->pdev = pdev;
>> +	list_add_tail(&filter->list, target_list);
>> +
>> +	/* Update the available port mask */
>> +	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT)
>> +		hisi_ptt->port_mask |= hisi_ptt_get_filter_val(pdev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void hisi_ptt_release_filters(struct hisi_ptt *hisi_ptt)
>> +{
>> +	struct hisi_ptt_filter_desc *filter, *tfilter;
>> +
>> +	list_for_each_entry_safe(filter, tfilter, &hisi_ptt->req_filters, list) {
>> +		list_del(&filter->list);
>> +		kfree(filter);
>> +	}
>> +
>> +	list_for_each_entry_safe(filter, tfilter, &hisi_ptt->port_filters, list) {
>> +		list_del(&filter->list);
>> +		kfree(filter);
>> +	}
>> +}
>> +
>> +static void hisi_ptt_init_ctrls(struct hisi_ptt *hisi_ptt)
>> +{
>> +	struct pci_dev *pdev = hisi_ptt->pdev;
>> +	struct pci_bus *bus;
>> +	u32 reg;
>> +
>> +	INIT_LIST_HEAD(&hisi_ptt->port_filters);
>> +	INIT_LIST_HEAD(&hisi_ptt->req_filters);
>> +
>> +	/*
>> +	 * The device range register provides the information about the
>> +	 * root ports which the RCiEP can control and trace. The RCiEP
>> +	 * and the root ports it support are on the same PCIe core, with
>> +	 * same domain number but maybe different bus number. The device
>> +	 * range register will tell us which root ports we can support,
>> +	 * Bit[31:16] indicates the upper BDF numbers of the root port,
>> +	 * while Bit[15:0] indicates the lower.
>> +	 */
>> +	reg = readl(hisi_ptt->iobase + HISI_PTT_DEVICE_RANGE);
>> +	hisi_ptt->upper = FIELD_GET(HISI_PTT_DEVICE_RANGE_UPPER, reg);
>> +	hisi_ptt->lower = FIELD_GET(HISI_PTT_DEVICE_RANGE_LOWER, reg);
>> +
>> +	bus = pci_find_bus(pci_domain_nr(pdev->bus), PCI_BUS_NUM(hisi_ptt->upper));
>> +	if (bus)
>> +		pci_walk_bus(bus, hisi_ptt_init_filters, hisi_ptt);
> 
> Error handling needed for the hisi_ptt_init_filters call though that will require
> placing a retval somewhere in hisi_ptt so we can know there was an error.
> 
>> +
>> +	hisi_ptt->trace_ctrl.default_cpu = cpumask_first(cpumask_of_node(dev_to_node(&pdev->dev)));
>> +}
>> +
>> +/*
>> + * The DMA of PTT trace can only use direct mapping, due to some
>> + * hardware restriction. Check whether there is an IOMMU or the
>> + * policy of the IOMMU domain is passthrough, otherwise the trace
>> + * cannot work.
>> + *
>> + * The PTT device is supposed to behind the ARM SMMUv3, which
>> + * should have passthrough the device by a quirk.
> 
> Trivial but perhaps a clearer wording is:
> 
> The PTT Device is behind an ARM SMMUv3 which should be set to
> passthrough for this device using a quirk.
> 
> 
>> + */
>> +static int hisi_ptt_check_iommu_mapping(struct pci_dev *pdev)
>> +{
>> +	struct iommu_domain *iommu_domain;
>> +
>> +	iommu_domain = iommu_get_domain_for_dev(&pdev->dev);
>> +	if (!iommu_domain || iommu_domain->type == IOMMU_DOMAIN_IDENTITY)
>> +		return 0;
>> +
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int hisi_ptt_probe(struct pci_dev *pdev,
>> +			  const struct pci_device_id *id)
>> +{
>> +	struct hisi_ptt *hisi_ptt;
>> +	int ret;
>> +
>> +	ret = hisi_ptt_check_iommu_mapping(pdev);
>> +	if (ret) {
>> +		pci_err(pdev, "cannot work with non-direct DMA mapping.\n");
>> +		return ret;
>> +	}
>> +
>> +	hisi_ptt = devm_kzalloc(&pdev->dev, sizeof(*hisi_ptt), GFP_KERNEL);
>> +	if (!hisi_ptt)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&hisi_ptt->mutex);
>> +	hisi_ptt->pdev = pdev;
>> +	pci_set_drvdata(pdev, hisi_ptt);
>> +
>> +	ret = pcim_enable_device(pdev);
>> +	if (ret) {
>> +		pci_err(pdev, "failed to enable device, ret = %d.\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = pcim_iomap_regions(pdev, BIT(2), DRV_NAME);
>> +	if (ret) {
>> +		pci_err(pdev, "failed to remap io memory, ret = %d.\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	hisi_ptt->iobase = pcim_iomap_table(pdev)[2];
>> +
>> +	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
>> +	if (ret) {
>> +		pci_err(pdev, "failed to set 64 bit dma mask, ret = %d.\n", ret);
>> +		return ret;
>> +	}
>> +	pci_set_master(pdev);
>> +
>> +	ret = hisi_ptt_register_irq(hisi_ptt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	hisi_ptt_init_ctrls(hisi_ptt);
> 
> There are some elements of this call that can fail so probably should return an
> error code an have appropriate cleanup in here.
> 
>> +
>> +	return 0;
>> +}
> 
> ...
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
