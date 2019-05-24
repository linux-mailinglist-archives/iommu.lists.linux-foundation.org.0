Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE6329BEE
	for <lists.iommu@lfdr.de>; Fri, 24 May 2019 18:15:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24EA2DD2;
	Fri, 24 May 2019 16:15:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 98F69D95
	for <iommu@lists.linux-foundation.org>;
	Fri, 24 May 2019 16:14:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 24EBDF4
	for <iommu@lists.linux-foundation.org>;
	Fri, 24 May 2019 16:14:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D24F180D;
	Fri, 24 May 2019 09:14:56 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A3733F575;
	Fri, 24 May 2019 09:14:55 -0700 (PDT)
Subject: Re: [PATCH 2/4] iommu: Introduce device fault data
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>
References: <20190523180613.55049-1-jean-philippe.brucker@arm.com>
	<20190523180613.55049-3-jean-philippe.brucker@arm.com>
	<791fe9b1-5d85-fd2d-7cfb-c2fb3428deb6@arm.com>
	<20190524064924.0cc92ae3@jacob-builder>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <3f512c57-de7c-dc3b-049c-2c4745757636@arm.com>
Date: Fri, 24 May 2019 17:14:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524064924.0cc92ae3@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: yi.l.liu@linux.intel.com, iommu@lists.linux-foundation.org,
	alex.williamson@redhat.com, ashok.raj@intel.com,
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 24/05/2019 14:49, Jacob Pan wrote:
> On Thu, 23 May 2019 19:43:46 +0100
> Robin Murphy <robin.murphy@arm.com> wrote:
>>> +/**
>>> + * struct iommu_fault_event - Generic fault event
>>> + *
>>> + * Can represent recoverable faults such as a page requests or
>>> + * unrecoverable faults such as DMA or IRQ remapping faults.
>>> + *
>>> + * @fault: fault descriptor
>>> + * @iommu_private: used by the IOMMU driver for storing
>>> fault-specific
>>> + *                 data. Users should not modify this field before
>>> + *                 sending the fault response.  
>>
>> Sorry if I'm a bit late to the party, but given that description, if 
>> users aren't allowed to touch this then why expose it to them at all? 
>> I.e. why not have iommu_report_device_fault() pass just the fault
>> itself to the fault handler:
>>
>> 	ret = fparam->handler(&evt->fault, fparam->data);
>>
>> and let the IOMMU core/drivers decapsulate it again later if need be. 
>> AFAICS drivers could also just embed the entire generic event in
>> their own private structure anyway, just as we do for domains.
>>
> I can't remember all the discussion history but I think iommu_private
> is used similarly to the page request private data (device private).

Hm yes, we already have iommu_fault_page_request::private_data for that.
I think I used to stash flags in iommu_private (is_stall and
needs_pasid), so that the SMMUv3 driver doesn't need to go fetch them
from the device structure, but I removed them. If VT-d doesn't need
iommu_private either, maybe we can remove it entirely?

In any case I agree that device drivers should only need to know about
evt->fault.

> We
> need to inject the data to the guest and the guest will send the
> unmodified data back along with response.

By the way, does private_data need to go back through the
iommu_page_response() path? The current series doesn't do that.

> The private data can be used
> to tag internal device/iommu context.

> I think we can do the way you said by keeping them within iommu core
> and recover it based on the response but that would require tracking
> each fault report, right?

That's already the case: we decided in thread [1] to track recoverable
faults in the IOMMU core, in order to check that the response is sane
and to set a quota and/or timeout. (I didn't include your timeout
patches here because I think they need a little more work. They are on
my sva/api branch.)

I already dropped iommu_private from the iommu_page_response structure.
In patch 4 iommu_page_response() retrieves the fault event and pass the
corresponding iommu_private back to the IOMMU driver.

[1] https://lore.kernel.org/lkml/20171206112521.1edf8e9b@jacob-builder/

Thanks,
Jean

> 
> If we pass on the private data, we only need to check if the response
> belong to the device but not exact match of a specific fault since the
> damage is contained in the assigned device. In case of injection
> fault into the guest, the response will come asynchronously after the
> handler completes.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
