Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5282C04C1
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 12:41:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43A94860CD;
	Mon, 23 Nov 2020 11:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdZ2g8lj3N2o; Mon, 23 Nov 2020 11:41:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3ECB85FB4;
	Mon, 23 Nov 2020 11:41:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1E74C0052;
	Mon, 23 Nov 2020 11:41:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE8F9C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 11:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E1E11860C8
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 11:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aX-Xm07yG2b8 for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 11:41:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8310385FB4
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 11:41:03 +0000 (UTC)
IronPort-SDR: pZonZPEUhxzzs6ht2AIPBTC9moPHluoBBEMqfbDu0DlzfL+DyFCqc9hXxQufMWcbv3yE629fvQ
 GGG2FHYXe4cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="171842985"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="171842985"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 03:41:02 -0800
IronPort-SDR: VM/Y/pys1hbw4jESWb6trfxWGDg15evZIVcv6B6nIWzChUGTnNsgfRJ5QhDy4cm3U5MicLBemf
 4ILc9qY8NHZQ==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="546380585"
Received: from kdinx-mobl.ccr.corp.intel.com (HELO [10.254.210.240])
 ([10.254.210.240])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 03:40:59 -0800
To: Christoph Hellwig <hch@infradead.org>
References: <20201120101719.3172693-1-baolu.lu@linux.intel.com>
 <20201120101719.3172693-4-baolu.lu@linux.intel.com>
 <20201123100816.GA26619@infradead.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 3/7] iommu: Allow the dma-iommu api to use bounce
 buffers
Message-ID: <73ac6a6b-ede9-b306-6d8f-c73f22e1e8e3@linux.intel.com>
Date: Mon, 23 Nov 2020 19:40:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123100816.GA26619@infradead.org>
Content-Language: en-US
Cc: Logan Gunthorpe <logang@deltatee.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

Hi Christoph,

On 2020/11/23 18:08, Christoph Hellwig wrote:
>> +	/*
>> +	 * If both the physical buffer start address and size are
>> +	 * page aligned, we don't need to use a bounce page.
>> +	 */
>> +	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev) &&
>> +	    iova_offset(iovad, phys | org_size)) {
>> +		aligned_size = iova_align(iovad, org_size);
>> +		phys = swiotlb_tbl_map_single(dev,
>> +				phys_to_dma(dev, io_tlb_start),
>> +				phys, org_size, aligned_size, dir, attrs);
> 
> swiotlb_tbl_map_single takes one less argument in 5.10-rc now.
> 

Yes. But Will's iommu/next branch is based on 5.10-rc3. I synced with
him, we agreed to keep it 5.10-rc3 and resolve this conflict when
merging it.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
