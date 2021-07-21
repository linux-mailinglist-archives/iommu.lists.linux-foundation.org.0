Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 699783D1059
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 16:00:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1981282F80;
	Wed, 21 Jul 2021 14:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnpmlkdeRdNd; Wed, 21 Jul 2021 14:00:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C5ED682FD5;
	Wed, 21 Jul 2021 14:00:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 934B5C000E;
	Wed, 21 Jul 2021 14:00:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7B74C000E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 13:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6B00606F6
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 13:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHhBi9X8dxLB for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 13:59:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C6C56067C
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 13:59:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 564F31FB;
 Wed, 21 Jul 2021 06:59:56 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B6C13F73D;
 Wed, 21 Jul 2021 06:59:54 -0700 (PDT)
Subject: Re: [PATCH -next] iommu/arm-smmu-v3: Add suspend and resume support
To: Marc Zyngier <maz@kernel.org>, Bixuan Cui <cuibixuan@huawei.com>
References: <20210721013350.17664-1-cuibixuan@huawei.com>
 <4e506481-5f6c-9c5e-eda3-300861581080@arm.com> <878s1z3j68.wl-maz@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <848befb0-7a9a-0b2b-8be9-3dfa02919488@arm.com>
Date: Wed, 21 Jul 2021 14:59:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <878s1z3j68.wl-maz@kernel.org>
Content-Language: en-GB
Cc: jean-philippe@linaro.org, guohanjun@huawei.com,
 linux-kernel@vger.kernel.org, john.wanghui@huawei.com,
 iommu@lists.linux-foundation.org, weiyongjun1@huawei.com,
 dingtianhong@huawei.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2021-07-21 14:12, Marc Zyngier wrote:
> On Wed, 21 Jul 2021 12:42:14 +0100,
> Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> [ +Marc for MSI bits ]
>>
>> On 2021-07-21 02:33, Bixuan Cui wrote:
>>> Add suspend and resume support for arm-smmu-v3 by low-power mode.
>>>
>>> When the smmu is suspended, it is powered off and the registers are
>>> cleared. So saves the msi_msg context during msi interrupt initialization
>>> of smmu. When resume happens it calls arm_smmu_device_reset() to restore
>>> the registers.
>>>
>>> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
>>> Reviewed-by: Wei Yongjun <weiyongjun1@huawei.com>
>>> Reviewed-by: Zhen Lei <thunder.leizhen@huawei.com>
>>> Reviewed-by: Ding Tianhong <dingtianhong@huawei.com>
>>> Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
>>> ---
>>>
>>>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 72 ++++++++++++++++++---
>>>    1 file changed, 64 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>> index 235f9bdaeaf2..bf1163acbcb1 100644
>>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>> @@ -40,6 +40,7 @@ MODULE_PARM_DESC(disable_bypass,
>>>      static bool disable_msipolling;
>>>    module_param(disable_msipolling, bool, 0444);
>>> +static bool bypass;
>>>    MODULE_PARM_DESC(disable_msipolling,
>>>    	"Disable MSI-based polling for CMD_SYNC completion.");
>>>    @@ -3129,11 +3130,37 @@ static void arm_smmu_write_msi_msg(struct
>>> msi_desc *desc, struct msi_msg *msg)
>>>    	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
>>>    	doorbell &= MSI_CFG0_ADDR_MASK;
>>>    +	/* Saves the msg context for resume if desc->msg is empty */
>>> +	if (desc->msg.address_lo == 0 && desc->msg.address_hi == 0) {
>>> +		desc->msg.address_lo = msg->address_lo;
>>> +		desc->msg.address_hi = msg->address_hi;
>>> +		desc->msg.data = msg->data;
>>> +	}
>>
>> My gut feeling is that this is something a device driver maybe
>> shouldn't be poking into, but I'm not entirely familiar with the area
>> :/
> 
> Certainly not. If you rely on the message being stored into the
> descriptors, then implement this in the core code, like we do for PCI.

Ah, so it would be an acceptable compromise to *read* desc->msg (and 
thus avoid having to store our own copy of the message) if the core was 
guaranteed to cache it? That's good to know, thanks.

>>> +
>>>    	writeq_relaxed(doorbell, smmu->base + cfg[0]);
>>>    	writel_relaxed(msg->data, smmu->base + cfg[1]);
>>>    	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
>>>    }
>>>    +static void arm_smmu_resume_msis(struct arm_smmu_device *smmu)
>>> +{
>>> +	struct msi_desc *desc;
>>> +	struct device *dev = smmu->dev;
>>> +
>>> +	for_each_msi_entry(desc, dev) {
>>> +		switch (desc->platform.msi_index) {
>>> +		case EVTQ_MSI_INDEX:
>>> +		case GERROR_MSI_INDEX:
>>> +		case PRIQ_MSI_INDEX:
>>> +			arm_smmu_write_msi_msg(desc, &(desc->msg));
> 
> Consider using get_cached_msi_msg() instead of using the internals of
> the descriptor.

Oh, there's even a proper API for it, marvellous! I hadn't managed to 
dig that far myself :)

>>> +			break;
>>> +		default:
>>> +			continue;
>>> +
>>> +		}
>>> +	}
>>> +}
>>> +
>>>    static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>>>    {
>>>    	struct msi_desc *desc;
>>> @@ -3184,11 +3211,17 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>>>    	devm_add_action(dev, arm_smmu_free_msis, dev);
>>>    }
>>>    -static void arm_smmu_setup_unique_irqs(struct arm_smmu_device
>>> *smmu)
>>> +static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu, bool resume_mode)
>>>    {
>>>    	int irq, ret;
>>>    -	arm_smmu_setup_msis(smmu);
>>> +	if (!resume_mode)
>>> +		arm_smmu_setup_msis(smmu);
>>> +	else {
>>> +		/* The irq doesn't need to be re-requested during resume */
>>> +		arm_smmu_resume_msis(smmu);
>>> +		return;
>>
>> What about wired IRQs?
> 
> Yeah. I assume the SMMU needs to be told which event gets signalled
> using MSIs or IRQs? Or is that implied by the MSI being configured or
> not (I used to know the answer to that, but I have long paged it out).

My mistake there - I misread the rather convoluted existing flow to 
think that bailing here would fail to enable wired IRQs, but of course 
the signalling decision is based on whether the MSI address is non-zero, 
and the enables in ARM_SMMU_IRQ_CTRL still apply either way.

Given that, I think this is that point at which to refactor this whole 
part so that logically requesting and physically programming the 
interrupts are split into distinct stages, which can then be called 
seperately as appropriate. Personally I have a particular dislike of 
this general anti-pattern:

	int do_a_thing(bool but_only_do_part_of_it)

>>> +	}
>>>      	/* Request interrupt lines */
>>>    	irq = smmu->evtq.q.irq;
>>> @@ -3230,7 +3263,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>>>    	}
>>>    }
>>>    -static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>>> +static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu, bool resume_mode)
>>>    {
>>>    	int ret, irq;
>>>    	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
>>> @@ -3257,7 +3290,7 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>>>    		if (ret < 0)
>>>    			dev_warn(smmu->dev, "failed to enable combined irq\n");
>>>    	} else
>>> -		arm_smmu_setup_unique_irqs(smmu);
>>> +		arm_smmu_setup_unique_irqs(smmu, resume_mode);
>>>      	if (smmu->features & ARM_SMMU_FEAT_PRI)
>>>    		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
>>> @@ -3282,7 +3315,7 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
>>>    	return ret;
>>>    }
>>>    -static int arm_smmu_device_reset(struct arm_smmu_device *smmu,
>>> bool bypass)
>>> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume_mode)
>>
>> Er, what about the use of "bypass" towards the end of the
>> function. Have you even compiled this?
> 
> The author of the patch has conveniently made it a global value (see
> line 3 of the patch). I'm sure it doesn't break anything... :-(

Oh blimey, I hadn't even turned on my "things that make no flippin' 
sense" radar to notice that, thanks for the correction. Indeed that's 
pretty busted for SMMU instances probing concurrently.

As with interrupts, reset probably wants a bit of refactoring to 
separate out the probe-time concerns of cleaning up any left-over 
configuration from firmware/kdump/whatever, and the act of putting the 
hardware into the operational state we want. For instance, if it happens 
that state is *not* lost on suspend, subsequently warning about 
CR0_SMMUEN being enabled on resume would be bad.

>>>    {
>>>    	int ret;
>>>    	u32 reg, enables;
>>> @@ -3392,7 +3425,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>>>    		}
>>>    	}
>>>    -	ret = arm_smmu_setup_irqs(smmu);
>>> +	ret = arm_smmu_setup_irqs(smmu, resume_mode);
>>>    	if (ret) {
>>>    		dev_err(smmu->dev, "failed to setup irqs\n");
>>>    		return ret;
>>> @@ -3749,6 +3782,24 @@ static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size_t start,
>>>    	return devm_ioremap_resource(dev, &res);
>>>    }
>>>    +static int __maybe_unused arm_smmu_suspend(struct device *dev)
>>> +{
>>> +	/*
>>> +	 * The smmu is powered off and related registers are automatically
>>> +	 * cleared when suspend. No need to do anything.
>>> +	 */
>>
>> Is that guaranteed? What if suspend is only implemented by external
>> clock-gating?
> 
> +1. This seems awfully implementation/integration specific. I'd be
> more in favour of a controlled teardown.
> 
>>
>>> +	return 0;
>>> +}
>>> +
>>> +static int __maybe_unused arm_smmu_resume(struct device *dev)
>>> +{
>>> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>> +
>>> +	arm_smmu_device_reset(smmu, true);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>    static int arm_smmu_device_probe(struct platform_device *pdev)
>>>    {
>>>    	int irq, ret;
>>> @@ -3756,7 +3807,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>>    	resource_size_t ioaddr;
>>>    	struct arm_smmu_device *smmu;
>>>    	struct device *dev = &pdev->dev;
>>> -	bool bypass;
>>
>> Once again...
>>
>>>    	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>>>    	if (!smmu)
>>> @@ -3831,7 +3881,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>>    	platform_set_drvdata(pdev, smmu);
>>>      	/* Reset the device */
>>> -	ret = arm_smmu_device_reset(smmu, bypass);
>>
>> ...either this is based on some out-of-tree hack which introduced its
>> own uninitialised-usage bug here, or it doesn't even compile.

As above, apologies for the oversight there. It's not as badly wrong as 
I thought, but it's still not right.

Thanks,
Robin.

>>
>>> +	ret = arm_smmu_device_reset(smmu, false);
>>>    	if (ret)
>>>    		return ret;
>>>    @@ -3884,6 +3934,11 @@ static const struct of_device_id
>>> arm_smmu_of_match[] = {
>>>    };
>>>    MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
>>>    +static const struct dev_pm_ops arm_smmu_pm_ops = {
>>> +	.suspend = arm_smmu_suspend,
>>> +	.resume = arm_smmu_resume,
>>
>> Either use SET_SYSTEM_SLEEP_PM_OPS() here or drop the __maybe_unused
>> annmotations above - they're pointless if the callbacks are referenced
>> unconditionally.
> 
> Thanks,
> 
> 	M.
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
