Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43E41AA6
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 05:17:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B3E7714FB;
	Wed, 12 Jun 2019 03:17:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4A3EE14F5
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 03:15:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C6B6B79
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 03:15:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2019 20:15:38 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga004.jf.intel.com with ESMTP; 11 Jun 2019 20:15:32 -0700
Subject: Re: [PATCH v4 3/9] swiotlb: Zero out bounce buffer for untrusted
	device
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190603011620.31999-1-baolu.lu@linux.intel.com>
	<20190603011620.31999-4-baolu.lu@linux.intel.com>
	<20190610154553.GT28796@char.us.oracle.com>
	<ec6ac2ba-7b88-2bcf-aa95-f8981b258c5c@linux.intel.com>
	<20190612010518.GB22479@char.us.oracle.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <8ad77caa-3245-4d06-314d-c4a92aa0f2ac@linux.intel.com>
Date: Wed, 12 Jun 2019 11:08:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612010518.GB22479@char.us.oracle.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Jonathan Corbet <corbet@lwn.net>, pengfei.xu@intel.com,
	Ingo Molnar <mingo@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, kevin.tian@intel.com,
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

Hi,

On 6/12/19 9:05 AM, Konrad Rzeszutek Wilk wrote:
> On Wed, Jun 12, 2019 at 08:43:40AM +0800, Lu Baolu wrote:
>> Hi Konrad,
>>
>> Thanks a lot for your reviewing.
>>
>> On 6/10/19 11:45 PM, Konrad Rzeszutek Wilk wrote:
>>> On Mon, Jun 03, 2019 at 09:16:14AM +0800, Lu Baolu wrote:
>>>> This is necessary to avoid exposing valid kernel data to any
>>>> milicious device.
>>>
>>> malicious
>>
>> Yes, thanks.
>>
>>>
>>>>
>>>> Suggested-by: Christoph Hellwig <hch@lst.de>
>>>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>>>> ---
>>>>    kernel/dma/swiotlb.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>>>> index f956f785645a..ed41eb7f6131 100644
>>>> --- a/kernel/dma/swiotlb.c
>>>> +++ b/kernel/dma/swiotlb.c
>>>> @@ -35,6 +35,7 @@
>>>>    #include <linux/scatterlist.h>
>>>>    #include <linux/mem_encrypt.h>
>>>>    #include <linux/set_memory.h>
>>>> +#include <linux/pci.h>
>>>>    #ifdef CONFIG_DEBUG_FS
>>>>    #include <linux/debugfs.h>
>>>>    #endif
>>>> @@ -560,6 +561,11 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
>>>>    	 */
>>>>    	for (i = 0; i < nslots; i++)
>>>>    		io_tlb_orig_addr[index+i] = orig_addr + (i << IO_TLB_SHIFT);
>>>> +
>>>> +	/* Zero out the bounce buffer if the consumer is untrusted. */
>>>> +	if (dev_is_untrusted(hwdev))
>>>> +		memset(phys_to_virt(tlb_addr), 0, alloc_size);
>>>
>>> What if the alloc_size is less than a PAGE? Should this at least have ALIGN or such?
>>
>> It's the consumer (iommu subsystem) who requires this to be page
>> aligned. For swiotlb, it just clears out all data in the allocated
>> bounce buffer.
> 
> I am thinking that the if you don't memset the full page the malicious hardware could read stale date from the rest of the page
> that hasn't been cleared?

Yes. My point is that this should be guaranteed by the bounce page
implementation in iommu.

Best regards,
Baolu

> 
>>
>> Best regards,
>> Baolu
>>
>>>
>>>> +
>>>>    	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
>>>>    	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
>>>>    		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
>>>> -- 
>>>> 2.17.1
>>>>
>>>
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
