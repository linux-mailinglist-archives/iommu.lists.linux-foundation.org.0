Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF1747FB
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 09:18:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1751F1644;
	Thu, 25 Jul 2019 07:18:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C9511615
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 07:18:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BD9F17C
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 07:18:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2019 00:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="181373984"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga002.jf.intel.com with ESMTP; 25 Jul 2019 00:18:37 -0700
Subject: Re: [PATCH v5 02/10] iommu/vt-d: Use per-device dma_ops
To: Christoph Hellwig <hch@lst.de>
References: <20190725031717.32317-1-baolu.lu@linux.intel.com>
	<20190725031717.32317-3-baolu.lu@linux.intel.com>
	<20190725054413.GC24527@lst.de>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <bc831f88-5b19-7531-00aa-a7577dd5c1ac@linux.intel.com>
Date: Thu, 25 Jul 2019 15:18:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190725054413.GC24527@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Stefano Stabellini <sstabellini@kernel.org>,
	ashok.raj@intel.com, Jonathan Corbet <corbet@lwn.net>,
	pengfei.xu@intel.com, Ingo Molnar <mingo@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, kevin.tian@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, Robin Murphy <robin.murphy@arm.com>
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

Hi Christoph,

On 7/25/19 1:44 PM, Christoph Hellwig wrote:
>>   /* Check if the dev needs to go through non-identity map and unmap process.*/
>>   static bool iommu_need_mapping(struct device *dev)
>>   {
>> -	int ret;
>> -
>>   	if (iommu_dummy(dev))
>>   		return false;
>>   
>> -	ret = identity_mapping(dev);
>> -	if (ret) {
>> -		u64 dma_mask = *dev->dma_mask;
>> -
>> -		if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
>> -			dma_mask = dev->coherent_dma_mask;
>> -
>> -		if (dma_mask >= dma_get_required_mask(dev))
>> -			return false;
> 
> Don't we need to keep this bit so that we still allow the IOMMU
> to act if the device has a too small DMA mask to address all memory in
> the system, even if if it should otherwise be identity mapped?
> 

This checking happens only when device is using an identity mapped
domain. If the device has a small DMA mask, swiotlb will be used for
high memory access.

This is supposed to be handled in dma_direct_map_page():

         if (unlikely(!dma_direct_possible(dev, dma_addr, size)) &&
             !swiotlb_map(dev, &phys, &dma_addr, size, dir, attrs)) {
                 report_addr(dev, dma_addr, size);
                 return DMA_MAPPING_ERROR;
         }

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
