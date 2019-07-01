Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 93048F80B
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 14:05:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1659611AD;
	Tue, 30 Apr 2019 12:05:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 33009105E
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 12:05:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id BBA79775
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 12:05:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82D9680D;
	Tue, 30 Apr 2019 05:05:00 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB4A83F5C1;
	Tue, 30 Apr 2019 05:04:56 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] iommu/dma-iommu: Use the dev->coherent_dma_mask
To: Christoph Hellwig <hch@infradead.org>
References: <20190430002952.18909-1-tmurphy@arista.com>
	<20190430002952.18909-4-tmurphy@arista.com>
	<20190430111222.GA3191@infradead.org>
	<da835ce2-f73e-3035-e1d7-d3028cc1a838@arm.com>
	<20190430113253.GA23210@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <96ebb6fc-a889-fa94-09ba-65d505b85724@arm.com>
Date: Tue, 30 Apr 2019 13:04:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430113253.GA23210@infradead.org>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Will Deacon <will.deacon@arm.com>,
	David Brown <david.brown@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tom Murphy <tmurphy@arista.com>, linux-kernel@vger.kernel.org,
	murphyt7@tcd.ie, iommu@lists.linux-foundation.org,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 30/04/2019 12:32, Christoph Hellwig wrote:
> On Tue, Apr 30, 2019 at 12:27:02PM +0100, Robin Murphy wrote:
>>> Hmm, I don't think we need the DMA mask for the MSI mapping, this
>>> should probably always use a 64-bit mask.
>>
>> If that were true then we wouldn't need DMA masks for regular mappings
>> either. If we have to map the MSI doorbell at all, then we certainly have to
>> place it at an IOVA that the relevant device is actually capable of
>> addressing.
> 
> Well, as shown by the patch below we don't even look at the DMA mask
> for the MSI page - we just allocate from bottom to top.

In the trivial cookie for unmanaged domains, yes, but in that case the 
responsibility is on VFIO to provide a suitable (i.e. sub-32-bit) 
address range for that cookie in the first place. In the managed case, 
allocation uses the streaming mask via iommu_dma_get_msi_page() calling 
__iommu_dma_map(). Admittedly the mask can then get overlooked when 
reusing an existing mapping, which strictly could pose a problem if you 
have multiple devices with incompatible masks in the same group (and 
such that the PCI stuff doesn't already mitigate it), but that's such an 
obscure corner case that I'm reticent to introduce the complication to 
handle it until it's actually proven necessary.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
