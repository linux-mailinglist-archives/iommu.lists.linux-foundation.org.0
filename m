Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF1D38807
	for <lists.iommu@lfdr.de>; Fri,  7 Jun 2019 12:35:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 72B37EB2;
	Fri,  7 Jun 2019 10:35:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BF78CE9B
	for <iommu@lists.linux-foundation.org>;
	Fri,  7 Jun 2019 10:33:57 +0000 (UTC)
X-Greylist: delayed 00:05:36 by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 320FD623
	for <iommu@lists.linux-foundation.org>;
	Fri,  7 Jun 2019 10:33:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 622EF802;
	Fri,  7 Jun 2019 03:28:20 -0700 (PDT)
Received: from [192.168.0.4] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A11773F246;
	Fri,  7 Jun 2019 03:29:56 -0700 (PDT)
Subject: Re: [PATCH v8 26/29] vfio-pci: Register an iommu fault handler
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20190526161004.25232-1-eric.auger@redhat.com>
	<20190526161004.25232-27-eric.auger@redhat.com>
	<20190603163139.70fe8839@x1.home>
	<10dd60d9-4af0-c0eb-08c9-a0db7ee1925e@redhat.com>
	<20190605154553.0d00ad8d@jacob-builder>
	<2753d192-1c46-d78e-c425-0c828e48cde2@arm.com>
	<20190606132903.064f7ac4@jacob-builder>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <dc051424-67d7-02ff-9b8e-0d7a8a4e59eb@arm.com>
Date: Fri, 7 Jun 2019 11:28:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606132903.064f7ac4@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"ashok.raj@intel.com" <ashok.raj@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Marc Zyngier <Marc.Zyngier@arm.com>, Will Deacon <Will.Deacon@arm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Vincent Stehle <Vincent.Stehle@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
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

On 06/06/2019 21:29, Jacob Pan wrote:
>>>>>> iommu_unregister_device_fault_handler(&vdev->pdev->dev);    
>>>>>
>>>>>
>>>>> But this can fail if there are pending faults which leaves a
>>>>> device reference and then the system is broken :(    
>>>> This series only features unrecoverable errors and for those the
>>>> unregistration cannot fail. Now unrecoverable errors were added I
>>>> admit this is confusing. We need to sort this out or clean the
>>>> dependencies.  
>>> As Alex pointed out in 4/29, we can make
>>> iommu_unregister_device_fault_handler() never fail and clean up all
>>> the pending faults in the host IOMMU belong to that device. But the
>>> problem is that if a fault, such as PRQ, has already been injected
>>> into the guest, the page response may come back after handler is
>>> unregistered and registered again.  
>>
>> I'm trying to figure out if that would be harmful in any way. I guess
>> it can be a bit nasty if we handle the page response right after
>> having injected a new page request that uses the same PRGI. In any
>> other case we discard the page response, but here we forward it to
>> the endpoint and:
>>
>> * If the response status is success, endpoint retries the
>> translation. The guest probably hasn't had time to handle the new
>> page request and translation will fail, which may lead the endpoint
>> to give up (two unsuccessful translation requests). Or send a new
>> request
>>
> Good point, there shouldn't be any harm if the page response is a
> "fake" success. In fact it could happen in the normal operation when
> PRQs to two devices share the same non-leaf translation structure. The
> worst case is just a retry. I am not aware of the retry limit, is it in
> the PCIe spec? I cannot find it.

I don't think so, it's the implementation's choice. In general I don't
think devices will have a retry limit, but it doesn't seem like the PCI
spec prevents them from implementing one either. It could be useful to
stop retrying after a certain number of faults, for preventing livelocks
when the OS doesn't fix up the page tables and the device would just
repeat the fault indefinitely.

> I think we should just document it, similar to having a spurious
> interrupt. The PRQ trace event should capture that as well.
> 
>> * otherwise the endpoint won't retry the access, and could also
>> disable PRI if the status is failure.
>>
> That would be true regardless this race condition with handler
> registration. So should be fine.

We do give an invalid response for the old PRG (because of unregistering),
but also for the new one, which has a different address that the guest
might be able to page in and would normally return success.

>>> We need a way to reject such page response belong
>>> to the previous life of the handler. Perhaps a sync call to the
>>> guest with your fault queue eventfd? I am not sure.  
>>
>> We could simply expect the device driver not to send any page response
>> after unregistering the fault handler. Is there any reason VFIO would
>> need to unregister and re-register the fault handler on a live guest?
>>
> There is no reason for VFIO to unregister and register again, I was
> just thinking from security perspective. Someone could write a VFIO app
> do this attack. But I agree the damage is within the device, may get
> PRI disabled as a result.

Yes I think the damage would always be contained within the misbehaving
software

> So it seems we agree on the following:
> - iommu_unregister_device_fault_handler() will never fail
> - iommu driver cleans up all pending faults when handler is unregistered
> - assume device driver or guest not sending more page response _after_
>   handler is unregistered.
> - system will tolerate rare spurious response
> 
> Sounds right?

Yes, I'll add that to the fault series

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
