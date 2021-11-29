Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D298D4615FE
	for <lists.iommu@lfdr.de>; Mon, 29 Nov 2021 14:13:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FAB84014A;
	Mon, 29 Nov 2021 13:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Al5MOdidf6Rh; Mon, 29 Nov 2021 13:13:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 77FE840205;
	Mon, 29 Nov 2021 13:13:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D271AC003C;
	Mon, 29 Nov 2021 13:13:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D408C000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 13:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 249AD60A5C
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 13:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsNbnCZzZL3r for <iommu@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 13:13:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B24660809
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 13:13:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616131515;
 Mon, 29 Nov 2021 05:13:19 -0800 (PST)
Received: from [10.57.34.182] (unknown [10.57.34.182])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 317153F766;
 Mon, 29 Nov 2021 05:13:15 -0800 (PST)
Message-ID: <76a1b5c1-01c8-bb30-6105-b4073dc23065@arm.com>
Date: Mon, 29 Nov 2021 13:13:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [patch 33/37] iommu/arm-smmu-v3: Use msi_get_virq()
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20211126224100.303046749@linutronix.de>
 <20211126230525.885757679@linutronix.de>
 <20211129105506.GA22761@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211129105506.GA22761@willie-the-truck>
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zygnier <maz@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, x86@kernel.org, Sinan Kaya <okaya@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, dmaengine@vger.kernel.org,
 Tero Kristo <kristo@kernel.org>, Megha Dey <megha.dey@intel.com>
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

On 2021-11-29 10:55, Will Deacon wrote:
> Hi Thomas,
> 
> On Sat, Nov 27, 2021 at 02:20:59AM +0100, Thomas Gleixner wrote:
>> Let the core code fiddle with the MSI descriptor retrieval.
>>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> ---
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   19 +++----------------
>>   1 file changed, 3 insertions(+), 16 deletions(-)
>>
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -3154,7 +3154,6 @@ static void arm_smmu_write_msi_msg(struc
>>   
>>   static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>>   {
>> -	struct msi_desc *desc;
>>   	int ret, nvec = ARM_SMMU_MAX_MSIS;
>>   	struct device *dev = smmu->dev;
>>   
>> @@ -3182,21 +3181,9 @@ static void arm_smmu_setup_msis(struct a
>>   		return;
>>   	}
>>   
>> -	for_each_msi_entry(desc, dev) {
>> -		switch (desc->msi_index) {
>> -		case EVTQ_MSI_INDEX:
>> -			smmu->evtq.q.irq = desc->irq;
>> -			break;
>> -		case GERROR_MSI_INDEX:
>> -			smmu->gerr_irq = desc->irq;
>> -			break;
>> -		case PRIQ_MSI_INDEX:
>> -			smmu->priq.q.irq = desc->irq;
>> -			break;
>> -		default:	/* Unknown */
>> -			continue;
>> -		}
>> -	}
>> +	smmu->evtq.q.irq = msi_get_virq(dev, EVTQ_MSI_INDEX);
>> +	smmu->gerr_irq = msi_get_virq(dev, GERROR_MSI_INDEX);
>> +	smmu->priq.q.irq = msi_get_virq(dev, PRIQ_MSI_INDEX);
> 
> Prviously, if retrieval of the MSI failed then we'd fall back to wired
> interrupts. Now, I think we'll clobber the interrupt with 0 instead. Can
> we make the assignments to smmu->*irq here conditional on the MSI being
> valid, please?

I was just looking at that too, but reached the conclusion that it's 
probably OK, since consumption of this value later is gated on 
ARM_SMMU_FEAT_PRI, so the fact that it changes from 0 to an error value 
in the absence of PRI should make no practical difference. If we don't 
have MSIs at all, we'd presumably still fail earlier either at the 
dev->msi_domain check or upon trying to allocate the vectors, so we'll 
still fall back to any previously-set wired values before getting here. 
The only remaining case is if we've *successfully* allocated the 
expected number of vectors yet are then somehow unable to retrieve one 
or more of them - presumably the system has to be massively borked for 
that to happen, at which point do we really want to bother trying to 
reason about anything?

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
