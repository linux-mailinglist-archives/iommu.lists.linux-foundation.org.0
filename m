Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AAE1BBB12
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 12:19:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 995F022668;
	Tue, 28 Apr 2020 10:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imKAbusKE1eg; Tue, 28 Apr 2020 10:19:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A67F422053;
	Tue, 28 Apr 2020 10:19:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B816C0172;
	Tue, 28 Apr 2020 10:19:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FFB9C0172
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 10:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8E64186F12
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 10:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNXKn7zRGO6o for <iommu@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4232784B6A
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 10:19:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E60A4AED6;
 Tue, 28 Apr 2020 10:19:41 +0000 (UTC)
Subject: Re: [PATCH] xen/swiotlb: correct the check for
 xen_destroy_contiguous_region
To: Peng Fan <peng.fan@nxp.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <1588059225-11245-1-git-send-email-peng.fan@nxp.com>
 <1c01e97a-adcd-a703-55b5-8975b4ce4d2c@suse.com>
 <DB6PR0402MB2760A05135338B0CBB28123488AC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dba804ea-4268-24ff-7447-ddef00e9e20c@suse.com>
Date: Tue, 28 Apr 2020 12:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760A05135338B0CBB28123488AC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
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

On 28.04.20 10:25, Peng Fan wrote:
>> Subject: Re: [PATCH] xen/swiotlb: correct the check for
>> xen_destroy_contiguous_region
>>
>> On 28.04.20 09:33, peng.fan@nxp.com wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> When booting xen on i.MX8QM, met:
>>> "
>>> [    3.602128] Unable to handle kernel paging request at virtual address
>> 0000000000272d40
>>> [    3.610804] Mem abort info:
>>> [    3.613905]   ESR = 0x96000004
>>> [    3.617332]   EC = 0x25: DABT (current EL), IL = 32 bits
>>> [    3.623211]   SET = 0, FnV = 0
>>> [    3.626628]   EA = 0, S1PTW = 0
>>> [    3.630128] Data abort info:
>>> [    3.633362]   ISV = 0, ISS = 0x00000004
>>> [    3.637630]   CM = 0, WnR = 0
>>> [    3.640955] [0000000000272d40] user address but active_mm is
>> swapper
>>> [    3.647983] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>>> [    3.654137] Modules linked in:
>>> [    3.677285] Hardware name: Freescale i.MX8QM MEK (DT)
>>> [    3.677302] Workqueue: events deferred_probe_work_func
>>> [    3.684253] imx6q-pcie 5f000000.pcie: PCI host bridge to bus 0000:00
>>> [    3.688297] pstate: 60000005 (nZCv daif -PAN -UAO)
>>> [    3.688310] pc : xen_swiotlb_free_coherent+0x180/0x1c0
>>> [    3.693993] pci_bus 0000:00: root bus resource [bus 00-ff]
>>> [    3.701002] lr : xen_swiotlb_free_coherent+0x44/0x1c0
>>> "
>>>
>>> In xen_swiotlb_alloc_coherent, if !(dev_addr + size - 1 <= dma_mask)
>>> or range_straddles_page_boundary(phys, size) are true, it will create
>>> contiguous region. So when free, we need to free contiguous region use
>>> upper check condition.
>>
>> No, this will break PV guests on x86.
> 
> Could you share more details why alloc and free not matching for the check?

xen_create_contiguous_region() is needed only in case:

- the bus address is not within dma_mask, or
- the memory region is not physically contiguous (can happen only for
   PV guests)

In any case it should arrange for the memory to be suitable for the
DMA operation, so to be contiguous and within dma_mask afterwards. So
xen_destroy_contiguous_region() should only ever called for areas
which match above criteria, as otherwise we can be sure
xen_create_contiguous_region() was not used for making the area DMA-able
in the beginning.

And this is very important in the PV case, as in those guests the page
tables are containing the host-PFNs, not the guest-PFNS, and
xen_create_contiguous_region() will fiddle with host- vs. guest-PFN
arrangements, and xen_destroy_contiguous_region() is reverting this
fiddling. Any call of xen_destroy_contiguous_region() for an area it
was not intended to be called for might swap physical pages beneath
random virtual addresses, which was the reason for this test to be
added by me.


Juergen

> 
> Thanks,
> Peng.
> 
>>
>> I think there is something wrong with your setup in combination with the ARM
>> xen_create_contiguous_region() implementation.
>>
>> Stefano?
>>
>>
>> Juergen
>>
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>    drivers/xen/swiotlb-xen.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
>>> index b6d27762c6f8..ab96e468584f 100644
>>> --- a/drivers/xen/swiotlb-xen.c
>>> +++ b/drivers/xen/swiotlb-xen.c
>>> @@ -346,8 +346,8 @@ xen_swiotlb_free_coherent(struct device *hwdev,
>> size_t size, void *vaddr,
>>>    	/* Convert the size to actually allocated. */
>>>    	size = 1UL << (order + XEN_PAGE_SHIFT);
>>>
>>> -	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
>>> -		     range_straddles_page_boundary(phys, size)) &&
>>> +	if (((dev_addr + size - 1 > dma_mask) ||
>>> +	    range_straddles_page_boundary(phys, size)) &&
>>>    	    TestClearPageXenRemapped(virt_to_page(vaddr)))
>>>    		xen_destroy_contiguous_region(phys, order);
>>>
>>>
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
