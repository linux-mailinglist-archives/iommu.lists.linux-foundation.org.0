Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D72C0508
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 12:57:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6C4B0204A4;
	Mon, 23 Nov 2020 11:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34oADhjJDvHt; Mon, 23 Nov 2020 11:57:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DE827203C9;
	Mon, 23 Nov 2020 11:57:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C38F7C0052;
	Mon, 23 Nov 2020 11:57:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17944C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 11:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1156186722
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 11:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgOMCemO67A8 for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 11:56:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4546B86714
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 11:56:59 +0000 (UTC)
IronPort-SDR: nZuzPSzZeTzqiT4WYYosa90JeVYW3pCgQ2M3W6QtsLKKI7mNweuvtt4PCuzFX5HNadcsYhOdZG
 j5cTaqDNc9pA==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="256456184"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="256456184"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 03:56:58 -0800
IronPort-SDR: uUAhuuDLymk4X95ffRIh+ONYkxifRwV2tVicLnk/PS+AlHXVaC4CQSGCTalMfaqxhe/zyR0GFA
 ZJLcTzPAivuQ==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="546385048"
Received: from kdinx-mobl.ccr.corp.intel.com (HELO [10.254.210.240])
 ([10.254.210.240])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 03:56:55 -0800
Subject: Re: [PATCH v5 3/7] iommu: Allow the dma-iommu api to use bounce
 buffers
To: Will Deacon <will@kernel.org>
References: <20201120101719.3172693-1-baolu.lu@linux.intel.com>
 <20201120101719.3172693-4-baolu.lu@linux.intel.com>
 <20201123100816.GA26619@infradead.org>
 <73ac6a6b-ede9-b306-6d8f-c73f22e1e8e3@linux.intel.com>
 <20201123114705.GA10233@willie-the-truck>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <fe4bed62-b056-07ef-1a1f-b68e92305e26@linux.intel.com>
Date: Mon, 23 Nov 2020 19:56:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123114705.GA10233@willie-the-truck>
Content-Language: en-US
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Logan Gunthorpe <logang@deltatee.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

Hi Will,

On 2020/11/23 19:47, Will Deacon wrote:
> On Mon, Nov 23, 2020 at 07:40:57PM +0800, Lu Baolu wrote:
>> On 2020/11/23 18:08, Christoph Hellwig wrote:
>>>> +	/*
>>>> +	 * If both the physical buffer start address and size are
>>>> +	 * page aligned, we don't need to use a bounce page.
>>>> +	 */
>>>> +	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev) &&
>>>> +	    iova_offset(iovad, phys | org_size)) {
>>>> +		aligned_size = iova_align(iovad, org_size);
>>>> +		phys = swiotlb_tbl_map_single(dev,
>>>> +				phys_to_dma(dev, io_tlb_start),
>>>> +				phys, org_size, aligned_size, dir, attrs);
>>>
>>> swiotlb_tbl_map_single takes one less argument in 5.10-rc now.
>>>
>>
>> Yes. But Will's iommu/next branch is based on 5.10-rc3. I synced with
>> him, we agreed to keep it 5.10-rc3 and resolve this conflict when
>> merging it.
> 
> That's right, although I failed to appreciate the conflict was due to a
> change in function prototype rather than just a context collision. So
> I've updated the vt-d branch to contain the stuff fron Konrad:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/iommu/vt-d
> 
> Sorry for messing you around!

It's okay. I will re-base the patch series later.

Best regards,
baolu


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
