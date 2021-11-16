Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CDD452F97
	for <lists.iommu@lfdr.de>; Tue, 16 Nov 2021 11:56:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F9E840102;
	Tue, 16 Nov 2021 10:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJ-pFxr9cgXt; Tue, 16 Nov 2021 10:56:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 554AA40227;
	Tue, 16 Nov 2021 10:56:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F797C0012;
	Tue, 16 Nov 2021 10:56:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F54BC0012
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 10:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70BE940227
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 10:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yk1FGi1XfmTP for <iommu@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 10:56:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 606E440102
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 10:56:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F3E01FB;
 Tue, 16 Nov 2021 02:56:49 -0800 (PST)
Received: from [10.57.82.45] (unknown [10.57.82.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E2673F766;
 Tue, 16 Nov 2021 02:56:45 -0800 (PST)
Message-ID: <0b67745c-13dd-1fea-1b8b-d55212bad232@arm.com>
Date: Tue, 16 Nov 2021 10:56:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/6] hwtracing: Add trace function support for
 HiSilicon PCIe Tune and Trace device
Content-Language: en-GB
To: Yicong Yang <yangyicong@hisilicon.com>, gregkh@linuxfoundation.org,
 helgaas@kernel.org, alexander.shishkin@linux.intel.com,
 lorenzo.pieralisi@arm.com, will@kernel.org, mark.rutland@arm.com,
 mathieu.poirier@linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org,
 leo.yan@linaro.org, jonathan.cameron@huawei.com, daniel.thompson@linaro.org,
 joro@8bytes.org, john.garry@huawei.com,
 shameerali.kolothum.thodi@huawei.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-pci@vger.kernel.org, linux-perf-users@vger.kernel.org,
 iommu@lists.linux-foundation.org
References: <20211116090625.53702-1-yangyicong@hisilicon.com>
 <20211116090625.53702-3-yangyicong@hisilicon.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211116090625.53702-3-yangyicong@hisilicon.com>
Cc: zhangshaokun@hisilicon.com, liuqi115@huawei.com, linuxarm@huawei.com,
 prime.zeng@huawei.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-11-16 09:06, Yicong Yang via iommu wrote:
[...]
> +/*
> + * Get RMR address if provided by the firmware.
> + * Return 0 if the IOMMU doesn't present or the policy of the
> + * IOMMU domain is passthrough or we get a usable RMR region.
> + * Otherwise a negative value is returned.
> + */
> +static int hisi_ptt_get_rmr(struct hisi_ptt *hisi_ptt)
> +{
> +	struct pci_dev *pdev = hisi_ptt->pdev;
> +	struct iommu_domain *iommu_domain;
> +	struct iommu_resv_region *region;
> +	LIST_HEAD(list);
> +
> +	/*
> +	 * Use direct DMA if IOMMU does not present or the policy of the
> +	 * IOMMU domain is passthrough.
> +	 */
> +	iommu_domain = iommu_get_domain_for_dev(&pdev->dev);
> +	if (!iommu_domain || iommu_domain->type == IOMMU_DOMAIN_IDENTITY)
> +		return 0;
> +
> +	iommu_get_resv_regions(&pdev->dev, &list);
> +	list_for_each_entry(region, &list, list)
> +		if (region->type == IOMMU_RESV_DIRECT &&
> +		    region->length >= HISI_PTT_TRACE_BUFFER_SIZE) {
> +			hisi_ptt->trace_ctrl.has_rmr = true;
> +			hisi_ptt->trace_ctrl.rmr_addr = region->start;
> +			hisi_ptt->trace_ctrl.rmr_length = region->length;
> +			break;
> +		}
> +
> +	iommu_put_resv_regions(&pdev->dev, &list);
> +	return hisi_ptt->trace_ctrl.has_rmr ? 0 : -ENOMEM;
> +}

No.

The whole point of RMRs is for devices that are already configured to 
access the given address range in a manner beyond the kernel's control. 
If you can do this, it proves that you should not have an RMR in the 
first place.

The notion of a kernel driver explicitly configuring its device to DMA 
into any random RMR that looks big enough is so egregiously wrong that 
I'm almost lost for words...

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
