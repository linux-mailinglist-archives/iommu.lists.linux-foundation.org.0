Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF63043E0
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 17:31:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 375568675C;
	Tue, 26 Jan 2021 16:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQ1BeUd9-wj5; Tue, 26 Jan 2021 16:31:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A44486763;
	Tue, 26 Jan 2021 16:31:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15A1DC013A;
	Tue, 26 Jan 2021 16:31:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64D0DC013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 16:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6084E86F6B
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 16:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sip3XjikLULM for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 16:31:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id ECD6086F3A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 16:31:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1102031B;
 Tue, 26 Jan 2021 08:31:39 -0800 (PST)
Received: from [10.57.43.46] (unknown [10.57.43.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AA543F66E;
 Tue, 26 Jan 2021 08:31:37 -0800 (PST)
Subject: Re: [PATCH v2 1/3] iommu/arm-smmu: Add support for driver IOMMU fault
 handlers
To: Rob Clark <robdclark@gmail.com>
References: <20201124191600.2051751-1-jcrouse@codeaurora.org>
 <20201124191600.2051751-2-jcrouse@codeaurora.org>
 <20210122124125.GA24102@willie-the-truck>
 <8ba2f53d-abbf-af7f-07f6-48ad7f383a37@arm.com>
 <20210125215107.GB16374@jcrouse1-lnx.qualcomm.com>
 <dc035204-ade7-03ec-0b82-2ecedc856d42@arm.com>
 <CAF6AEGtfm=vO6s3vQLNotz=spM9EdXbuNi_vfmCqVd7DmyEMCA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d8b870cd-b0c7-2f4a-697d-4de8d437fdc5@arm.com>
Date: Tue, 26 Jan 2021 16:31:36 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtfm=vO6s3vQLNotz=spM9EdXbuNi_vfmCqVd7DmyEMCA@mail.gmail.com>
Content-Language: en-GB
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On 2021-01-26 16:05, Rob Clark wrote:
> On Tue, Jan 26, 2021 at 3:41 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2021-01-25 21:51, Jordan Crouse wrote:
>>> On Fri, Jan 22, 2021 at 12:53:17PM +0000, Robin Murphy wrote:
>>>> On 2021-01-22 12:41, Will Deacon wrote:
>>>>> On Tue, Nov 24, 2020 at 12:15:58PM -0700, Jordan Crouse wrote:
>>>>>> Call report_iommu_fault() to allow upper-level drivers to register their
>>>>>> own fault handlers.
>>>>>>
>>>>>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>>>>>> ---
>>>>>>
>>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 16 +++++++++++++---
>>>>>>    1 file changed, 13 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> index 0f28a8614da3..7fd18bbda8f5 100644
>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> @@ -427,6 +427,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>>>>>     struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>>>>>>     struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>>     int idx = smmu_domain->cfg.cbndx;
>>>>>> +  int ret;
>>>>>>     fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
>>>>>>     if (!(fsr & ARM_SMMU_FSR_FAULT))
>>>>>> @@ -436,11 +437,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>>>>>     iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
>>>>>>     cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
>>>>>> -  dev_err_ratelimited(smmu->dev,
>>>>>> -  "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>>>>>> +  ret = report_iommu_fault(domain, dev, iova,
>>>>>> +          fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>>>>>> +
>>>>>> +  if (ret == -ENOSYS)
>>>>>> +          dev_err_ratelimited(smmu->dev,
>>>>>> +          "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>>>>>>                         fsr, iova, fsynr, cbfrsynra, idx);
>>>>>> -  arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>>>>>> +  /*
>>>>>> +   * If the iommu fault returns an error (except -ENOSYS) then assume that
>>>>>> +   * they will handle resuming on their own
>>>>>> +   */
>>>>>> +  if (!ret || ret == -ENOSYS)
>>>>>> +          arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>>>>>
>>>>> Hmm, I don't grok this part. If the fault handler returned an error and
>>>>> we don't clear the FSR, won't we just re-take the irq immediately?
>>>>
>>>> If we don't touch the FSR at all, yes. Even if we clear the fault indicator
>>>> bits, the interrupt *might* remain asserted until a stalled transaction is
>>>> actually resolved - that's that lovely IMP-DEF corner.
>>>>
>>>> Robin.
>>>>
>>>
>>> This is for stall-on-fault. The idea is that if the developer chooses to do so
>>> we would stall the GPU after a fault long enough to take a picture of it with
>>> devcoredump and then release the FSR. Since we can't take the devcoredump from
>>> the interrupt handler we schedule it in a worker and then return an error
>>> to let the main handler know that we'll come back around clear the FSR later
>>> when we are done.
>>
>> Sure, but clearing FSR is not writing to RESUME to resolve the stalled
>> transaction(s). You can already snarf the FSR contents from your
>> report_iommu_fault() handler if you want to, so either way I don't see
>> what's gained by not clearing it as expected at the point where we've
>> handled the *interrupt*, even if it will take longer to decide what to
>> do with the underlying *fault* that it signalled. I'm particularly not
>> keen on having unusual behaviour in the core interrupt handling which
>> callers may unwittingly trigger, for the sake of one
>> very-very-driver-specific flow having a slightly richer debugging
>> experience.
> 
> Tbf, "slightly" is an understatement.. it is a big enough improvement
> that I've hacked up deferred resume several times to debug various
> issues. ;-)

Oh, fear not, I fully appreciate that keeping the GPU stalled on a 
faulting transaction is a game-changer in itself ("almost like a real 
MMU!"). That comment was only aimed at whatever the perceived benefits 
are of deliberately not trying to clear the SMMU interrupt (even if it 
*would* stay clear). I have no issue with calling report_iommu_fault(), 
I'm just wary of doing anything weird with the result.

> (Which is always a bit of a PITA because of things moving around in
> arm-smmu as well as the drm side of things.)
> 
> But from my recollection, we can clear FSR immediately, all we need to
> do is defer writing ARM_SMMU_CB_RESUME

Phew! Thanks for the reassurance :)

Robin.

> 
> BR,
> -R
> 
>>
>> For actually *handling* faults, I thought we were going to need to hook
>> up the new IOPF fault queue stuff anyway?
>>
>> Robin.
>>
>>> It is assumed that we'll have to turn off interrupts in our handler to allow
>>> this to work. Its all very implementation specific, but then again we're
>>> assuming that if you want to do this then you know what you are doing.
>>>
>>> In that spirit the error that skips the FSR should probably be something
>>> specific instead of "all errors" - that way a well meaning handler that returns
>>> a -EINVAL doesn't accidentally break itself.
>>>
>>> Jordan
>>>
>>>>> I think
>>>>> it would be better to do this unconditionally, and print the "Unhandled
>>>>> context fault" message for any non-zero value of ret.
>>>
>>>>>
>>>>> Will
>>>>>
>>>
>> _______________________________________________
>> iommu mailing list
>> iommu@lists.linux-foundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
