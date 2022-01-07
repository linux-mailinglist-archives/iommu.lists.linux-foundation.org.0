Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F5486FE7
	for <lists.iommu@lfdr.de>; Fri,  7 Jan 2022 02:51:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A4E5400E5;
	Fri,  7 Jan 2022 01:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-yTArh-M-sE; Fri,  7 Jan 2022 01:50:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D83BE41FBB;
	Fri,  7 Jan 2022 01:50:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B419FC006E;
	Fri,  7 Jan 2022 01:50:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6662BC001E
 for <iommu@lists.linux-foundation.org>; Fri,  7 Jan 2022 01:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 541B56FC3C
 for <iommu@lists.linux-foundation.org>; Fri,  7 Jan 2022 01:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GF6x-7o4xVC9 for <iommu@lists.linux-foundation.org>;
 Fri,  7 Jan 2022 01:50:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B065160D78
 for <iommu@lists.linux-foundation.org>; Fri,  7 Jan 2022 01:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641520253; x=1673056253;
 h=cc:subject:to:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Rk4TSsiNTO3YfMWheOgfWU447KggZGjywO0GgwnX7XY=;
 b=SSFMxT9FgoQy3lYRGFjXF9Y9jb6UguAW2C3JmtooaUCFyoow14vokMg8
 ugNHPPyZ+0VNWww82ZQ9nDFvKBZ9iXopx5S01hbkZRK1afBoMgDCT08pU
 Gfdxa+YR44M+wzKCrBC7Stzn3U3ME/V0q1XmRd1qh4B5s0VPWGr/fGbQt
 zjnFF8agYL0Z5qKrWXlfvXxQ2TvuSBE82nY6bXV78wnrIAYUP3xlnNm4E
 AJL1dsrTtb8yjoPN+4Cwntf/BNyAWnR5u1CkgvHvg4ueCVfR+7fGQ5Mv9
 NL1TSUp9vHjKKr9cPS+QHAECNZW58z5GTiZhp29RmDwUz7CUzToSli4UC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="240339960"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="240339960"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 17:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="527209322"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by orsmga008.jf.intel.com with ESMTP; 06 Jan 2022 17:50:45 -0800
Subject: Re: [PATCH v5 01/14] iommu: Add dma ownership management interfaces
To: Jason Gunthorpe <jgg@nvidia.com>
References: <YdQcgFhIMYvUwABV@infradead.org>
 <20220104164100.GA101735@bhelgaas> <20220104192348.GK2328285@nvidia.com>
 <9486face-0778-b8d0-6989-94c2e876446b@linux.intel.com>
 <20220106154635.GG2328285@nvidia.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b5fb659a-aa8b-587c-8bc1-20d7fd1ecd26@linux.intel.com>
Date: Fri, 7 Jan 2022 09:50:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106154635.GG2328285@nvidia.com>
Content-Language: en-US
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
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

On 1/6/22 11:46 PM, Jason Gunthorpe wrote:
> On Thu, Jan 06, 2022 at 11:54:06AM +0800, Lu Baolu wrote:
>> On 1/5/22 3:23 AM, Jason Gunthorpe wrote:
>>>>>> The device driver oriented interfaces are,
>>>>>>
>>>>>> 	int iommu_device_use_dma_api(struct device *dev);
>>>>>> 	void iommu_device_unuse_dma_api(struct device *dev);
>>>> Nit, do we care whether it uses the actual DMA API?  Or is it just
>>>> that iommu_device_use_dma_api() tells us the driver may program the
>>>> device to do DMA?
>>> As the main purpose, yes this is all about the DMA API because it
>>> asserts the group domain is the DMA API's domain.
>>>
>>> There is a secondary purpose that has to do with the user/kernel
>>> attack you mentioned above. Maintaining the DMA API domain also
>>> prevents VFIO from allowing userspace to operate any device in the
>>> group which blocks P2P attacks to MMIO of other devices.
>>>
>>> This is why, even if the driver doesn't use DMA, it should still do a
>>> iommu_device_use_dma_api(), except in the special cases where we don't
>>> care about P2P attacks (eg pci-stub, bridges, etc).
>>>
>>
>> By the way, use_dma_api seems hard to read. How about
>>
>> 	iommu_device_use_default_dma()?
> 
> You could just say "use default domain"
> 
> IMHO the way the iommu subsystem has its own wonky language is a
> little troublesome. In the rest of the kernel we call this the DMA
> API, while the iommu subsystem calls the domain that the DMA API uses
> the 'default domain' not the 'DMA API' domain.
> 
> Still, it is probably better to align to the iommu language - just be
> sure to put in the function comment that this API 'allows the driver
> to use the DMA API eg dma_map_sg()'

iommu_device_use_default_domain() reads better. And add some comments
to link "default domain" with "DMA API". Thanks!

> 
> Jason
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
