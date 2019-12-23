Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E749129107
	for <lists.iommu@lfdr.de>; Mon, 23 Dec 2019 04:01:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 374CF87820;
	Mon, 23 Dec 2019 03:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkcPlNDA9T-W; Mon, 23 Dec 2019 03:01:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D39C877B3;
	Mon, 23 Dec 2019 03:01:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62839C1D88;
	Mon, 23 Dec 2019 03:01:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4255EC0881;
 Mon, 23 Dec 2019 03:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3BFAD8619A;
 Mon, 23 Dec 2019 03:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeVDXq3XeTil; Mon, 23 Dec 2019 03:01:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 88EE982157;
 Mon, 23 Dec 2019 03:01:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Dec 2019 19:01:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,346,1571727600"; d="scan'208";a="417121170"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by fmsmga005.fm.intel.com with ESMTP; 22 Dec 2019 19:01:43 -0800
Subject: Re: [PATCH 1/8] iommu/vt-d: clean up 32bit si_domain assignment
To: Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <20191221150402.13868-2-murphyt7@tcd.ie>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <e569e246-11a1-e8bd-9347-310284e96885@linux.intel.com>
Date: Mon, 23 Dec 2019 11:00:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191221150402.13868-2-murphyt7@tcd.ie>
Content-Language: en-US
Cc: Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

Hi,

On 12/21/19 11:03 PM, Tom Murphy wrote:
> @@ -5618,9 +5583,13 @@ static int intel_iommu_add_device(struct device *dev)
>   	struct iommu_domain *domain;
>   	struct intel_iommu *iommu;
>   	struct iommu_group *group;
> +	u64 dma_mask = *dev->dma_mask;
>   	u8 bus, devfn;
>   	int ret;
>   
> +	if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
> +		dma_mask = dev->coherent_dma_mask;
> +
>   	iommu = device_to_iommu(dev, &bus, &devfn);
>   	if (!iommu)
>   		return -ENODEV;
> @@ -5640,7 +5609,12 @@ static int intel_iommu_add_device(struct device *dev)
>   	domain = iommu_get_domain_for_dev(dev);
>   	dmar_domain = to_dmar_domain(domain);
>   	if (domain->type == IOMMU_DOMAIN_DMA) {
> -		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY) {
> +		/*
> +		 * We check dma_mask >= dma_get_required_mask(dev) because
> +		 * 32 bit DMA falls back to non-identity mapping.
> +		 */
> +		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY &&
> +				dma_mask >= dma_get_required_mask(dev)) {
>   			ret = iommu_request_dm_for_dev(dev);
>   			if (ret) {
>   				dmar_remove_one_dev_info(dev);

dev->dma_mask is set to 32bit by default. During loading driver, it sets
the real dma_mask with dma_set_mask() according to the real capability.
Here you will always see 32bit dma_mask for each device.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
