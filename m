Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C4486F9F
	for <lists.iommu@lfdr.de>; Fri,  7 Jan 2022 02:20:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DE283005;
	Fri,  7 Jan 2022 01:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qWhMBE9eBvLr; Fri,  7 Jan 2022 01:20:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C811B830C5;
	Fri,  7 Jan 2022 01:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD705C001E;
	Fri,  7 Jan 2022 01:20:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15995C001E
 for <iommu@lists.linux-foundation.org>; Fri,  7 Jan 2022 01:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E658A400E5
 for <iommu@lists.linux-foundation.org>; Fri,  7 Jan 2022 01:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMBwV1sFzcYY for <iommu@lists.linux-foundation.org>;
 Fri,  7 Jan 2022 01:19:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12972404BD
 for <iommu@lists.linux-foundation.org>; Fri,  7 Jan 2022 01:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641518399; x=1673054399;
 h=cc:subject:to:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Qmk7jfZS/XwH1zpKmsOoRjz7KHDFbSx87A5bcGdXK78=;
 b=I8Tuvt/qVsImLpXDp5z3f2/lVbPNuYa396vCs8pETFgPfOca6H3VbDt6
 RRoMdUsGNyzhYUkXmzovxdyE1A01WFGkk6mHE2G0uaF0fTmTCqWf6sVJJ
 n0IjW27lX4US2aRPDzb+P24NH9LntnsxY7hSGheUpdpTOAPZhA/EXRwGW
 EQuKvO+vNvsPLjJ536bNeCM66Ixdc/1YKMhPuRcCz7Ar7MsXSq9fmYpGk
 epdv8rXq17vC47Gci0ZWLgV0jBp5EhD+4t0TS9GIYa/B37dz0htFtgCu2
 23ofB8q+FZeacZ2wltUFcqx+nUjKRWYhvoDvsdwE6K5/aNgMbMZT8rLgk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242736631"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="242736631"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 17:19:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="527201423"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by orsmga008.jf.intel.com with ESMTP; 06 Jan 2022 17:19:50 -0800
Subject: Re: [PATCH v1 6/8] gpu/host1x: Use iommu_attach/detach_device()
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220106022053.2406748-1-baolu.lu@linux.intel.com>
 <20220106022053.2406748-7-baolu.lu@linux.intel.com>
 <20220106153543.GD2328285@nvidia.com>
 <2befad17-05fe-3768-6fbb-67440a5befa3@linux.intel.com>
 <20220107004825.GP2328285@nvidia.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0c80f52e-0529-b299-6f13-105f873be3a0@linux.intel.com>
Date: Fri, 7 Jan 2022 09:19:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107004825.GP2328285@nvidia.com>
Content-Language: en-US
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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

On 1/7/22 8:48 AM, Jason Gunthorpe wrote:
> On Fri, Jan 07, 2022 at 08:35:34AM +0800, Lu Baolu wrote:
>> On 1/6/22 11:35 PM, Jason Gunthorpe wrote:
>>> On Thu, Jan 06, 2022 at 10:20:51AM +0800, Lu Baolu wrote:
>>>> Ordinary drivers should use iommu_attach/detach_device() for domain
>>>> attaching and detaching.
>>>>
>>>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>>>>    drivers/gpu/host1x/dev.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>>>> index fbb6447b8659..6e08cb6202cc 100644
>>>> +++ b/drivers/gpu/host1x/dev.c
>>>> @@ -265,7 +265,7 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
>>>>    			goto put_cache;
>>>>    		}
>>>> -		err = iommu_attach_group(host->domain, host->group);
>>>> +		err = iommu_attach_device(host->domain, host->dev);
>>>>    		if (err) {
>>>>    			if (err == -ENODEV)
>>>>    				err = 0;
>>>> @@ -335,7 +335,7 @@ static void host1x_iommu_exit(struct host1x *host)
>>>>    {
>>>>    	if (host->domain) {
>>>>    		put_iova_domain(&host->iova);
>>>> -		iommu_detach_group(host->domain, host->group);
>>>> +		iommu_detach_device(host->domain, host->dev);
>>>>    		iommu_domain_free(host->domain);
>>>>    		host->domain = NULL;
>>>
>>> Shouldn't this add the flag to tegra_host1x_driver ?
>>
>> This is called for a single driver. The call trace looks like below:
>>
>> static struct platform_driver tegra_host1x_driver = {
>>          .driver = {
>>                  .name = "tegra-host1x",
>>                  .of_match_table = host1x_of_match,
>>          },
>>          .probe = host1x_probe,
>>          .remove = host1x_remove,
>> };
>>
>> host1x_probe(dev)
>> ->host1x_iommu_init(host)	//host is a wrapper of dev
>>       iommu_domain_alloc(&platform_bus_type)
>>       iommu_attach_group(domain, group);
> 
> The main question is if the iommu group is being shared with other
> drivers, not the call chain for this function.
> 
> For tegra you have to go look in each entry of the of_match_table:
> 
>          { .compatible = "nvidia,tegra114-host1x", .data = &host1x02_info, },
> 
> And find the DTS block:
> 
>          host1x@50000000 {
>                  compatible = "nvidia,tegra114-host1x";
>                  reg = <0x50000000 0x00028000>;
>                  interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
>                               <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
>                  interrupt-names = "syncpt", "host1x";
>                  clocks = <&tegra_car TEGRA114_CLK_HOST1X>;
>                  clock-names = "host1x";
>                  resets = <&tegra_car 28>;
>                  reset-names = "host1x";
>                  iommus = <&mc TEGRA_SWGROUP_HC>;
> 
> Then check if any other devices in the DTS use the same 'iommus' which
> is how the groups are setup.

Yes, exactly.

> 
> I checked everything and it does look like this is a single device
> group.

Okay, thanks!

> 
> Jason
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
