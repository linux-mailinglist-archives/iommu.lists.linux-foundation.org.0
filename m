Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A290130B8
	for <lists.iommu@lfdr.de>; Fri,  3 May 2019 16:53:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 28A7839BE;
	Fri,  3 May 2019 14:53:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC16F38F7
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 14:52:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2FCD588B
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 14:52:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E757E374;
	Fri,  3 May 2019 07:52:14 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD2DE3F5C1;
	Fri,  3 May 2019 07:52:12 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] irqchip/gic-v3-mbi: Don't map the MSI page in
	mbi_compose_m{b, s}i_msg()
To: Marc Zyngier <marc.zyngier@arm.com>, Julien Grall <julien.grall@arm.com>, 
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
References: <20190501135824.25586-1-julien.grall@arm.com>
	<20190501135824.25586-7-julien.grall@arm.com>
	<ebe2cfc4-44df-2c25-02c8-96b6b6d6bab1@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b339523b-4bab-02c8-7aea-56ac4c4f3023@arm.com>
Date: Fri, 3 May 2019 15:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ebe2cfc4-44df-2c25-02c8-96b6b6d6bab1@arm.com>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jason@lakedaemon.net, douliyangs@gmail.com, miquel.raynal@bootlin.com,
	tglx@linutronix.de, logang@deltatee.com, bigeasy@linutronix.de,
	linux-rt-users@vger.kernel.org
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

On 03/05/2019 15:27, Marc Zyngier wrote:
> On 01/05/2019 14:58, Julien Grall wrote:
>> The functions mbi_compose_m{b, s}i_msg may be called from non-preemptible
>> context. However, on RT, iommu_dma_map_msi_msg() requires to be called
>> from a preemptible context.
>>
>> A recent patch split iommu_dma_map_msi_msg in two new functions:
>> one that should be called in preemptible context, the other does
>> not have any requirement.
>>
>> The GICv3 MSI driver is reworked to avoid executing preemptible code in
>> non-preemptible context. This can be achieved by preparing the two MSI
>> mappings when allocating the MSI interrupt.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>
>> ---
>>      Changes in v2:
>>          - Rework the commit message to use imperative mood
>> ---
>>   drivers/irqchip/irq-gic-v3-mbi.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-mbi.c b/drivers/irqchip/irq-gic-v3-mbi.c
>> index fbfa7ff6deb1..d50f6cdf043c 100644
>> --- a/drivers/irqchip/irq-gic-v3-mbi.c
>> +++ b/drivers/irqchip/irq-gic-v3-mbi.c
>> @@ -84,6 +84,7 @@ static void mbi_free_msi(struct mbi_range *mbi, unsigned int hwirq,
>>   static int mbi_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>>   				   unsigned int nr_irqs, void *args)
>>   {
>> +	msi_alloc_info_t *info = args;
>>   	struct mbi_range *mbi = NULL;
>>   	int hwirq, offset, i, err = 0;
>>   
>> @@ -104,6 +105,16 @@ static int mbi_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>>   
>>   	hwirq = mbi->spi_start + offset;
>>   
>> +	err = iommu_dma_prepare_msi(info->desc,
>> +				    mbi_phys_base + GICD_CLRSPI_NSR);
>> +	if (err)
>> +		return err;
>> +
>> +	err = iommu_dma_prepare_msi(info->desc,
>> +				    mbi_phys_base + GICD_SETSPI_NSR);
>> +	if (err)
>> +		return err;
> 
> Nit here: The two registers are guaranteed to be in the same 4k page
> (respectively offsets 0x48 and 0x40), so the second call is at best
> useless. I'll fix it when applying it, no need to resend.

Ack; the second call will simply find the existing page and overwrite 
desc->iommu_cookie with the same value. And if the two calls *did* ever 
come back with different pages, that logic would be quietly broken anyway.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
