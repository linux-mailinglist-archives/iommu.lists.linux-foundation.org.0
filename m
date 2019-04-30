Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A8F950
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 14:54:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E173C165F;
	Tue, 30 Apr 2019 12:54:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4E3861445
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 12:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D42A95F4
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 12:53:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2CAB4307C947;
	Tue, 30 Apr 2019 12:53:35 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81256183E2;
	Tue, 30 Apr 2019 12:53:32 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] genirq/msi: Add a new field in msi_desc to store
	an IOMMU cookie
To: Julien Grall <julien.grall@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
References: <20190429144428.29254-1-julien.grall@arm.com>
	<20190429144428.29254-2-julien.grall@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a7edba11-e34c-047c-7852-28bbf87157e6@redhat.com>
Date: Tue, 30 Apr 2019 14:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190429144428.29254-2-julien.grall@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 30 Apr 2019 12:53:35 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jason@lakedaemon.net, douliyangs@gmail.com, marc.zyngier@arm.com,
	logang@deltatee.com, bigeasy@linutronix.de,
	miquel.raynal@bootlin.com, tglx@linutronix.de,
	robin.murphy@arm.com, linux-rt-users@vger.kernel.org
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

Hi

On 4/29/19 4:44 PM, Julien Grall wrote:
> When an MSI doorbell is located downstream of an IOMMU, it is required
> to swizzle the physical address with an appropriately-mapped IOVA for any
> device attached to one of our DMA ops domain.
> 
> At the moment, the allocation of the mapping may be done when composing
> the message. However, the composing may be done in non-preemtible
> context while the allocation requires to be called from preemptible
> context.
> 
> A follow-up change will split the current logic in two functions
> requiring to keep an IOMMU cookie per MSI.
> 
> A new field is introduced in msi_desc to store an IOMMU cookie. As the
> cookie may not be required in some configuration, the field is protected
> under a new config CONFIG_IRQ_MSI_IOMMU.
> 
> A pair of helpers has also been introduced to access the field.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
Besides other's comments
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> 
> ---
>     Changes in v2:
>         - Update the commit message to use imperative mood
>         - Protect the field with a new config that will be selected by
>         IOMMU_DMA later on
>         - Add a set of helpers to access the new field
> ---
>  include/linux/msi.h | 26 ++++++++++++++++++++++++++
>  kernel/irq/Kconfig  |  3 +++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index 7e9b81c3b50d..82a308c19222 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -77,6 +77,9 @@ struct msi_desc {
>  	struct device			*dev;
>  	struct msi_msg			msg;
>  	struct irq_affinity_desc	*affinity;
> +#ifdef CONFIG_IRQ_MSI_IOMMU
> +	const void			*iommu_cookie;
> +#endif
>  
>  	union {
>  		/* PCI MSI/X specific data */
> @@ -119,6 +122,29 @@ struct msi_desc {
>  #define for_each_msi_entry_safe(desc, tmp, dev)	\
>  	list_for_each_entry_safe((desc), (tmp), dev_to_msi_list((dev)), list)
>  
> +#ifdef CONFIG_IRQ_MSI_IOMMU
> +static inline const void *msi_desc_get_iommu_cookie(struct msi_desc *desc)
> +{
> +	return desc->iommu_cookie;
> +}
> +
> +static inline void msi_desc_set_iommu_cookie(struct msi_desc *desc,
> +					     const void *iommu_cookie)
> +{
> +	desc->iommu_cookie = iommu_cookie;
> +}
> +#else
> +static inline const void *msi_desc_get_iommu_cookie(struct msi_desc *desc)
> +{
> +	return NULL;
> +}
> +
> +static inline void msi_desc_set_iommu_cookie(struct msi_desc *desc,
> +					     const void *iommu_cookie)
> +{
> +}
> +#endif
> +
>  #ifdef CONFIG_PCI_MSI
>  #define first_pci_msi_entry(pdev)	first_msi_entry(&(pdev)->dev)
>  #define for_each_pci_msi_entry(desc, pdev)	\
> diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> index 5f3e2baefca9..8fee06625c37 100644
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -91,6 +91,9 @@ config GENERIC_MSI_IRQ_DOMAIN
>  	select IRQ_DOMAIN_HIERARCHY
>  	select GENERIC_MSI_IRQ
>  
> +config IRQ_MSI_IOMMU
> +	bool
> +
>  config HANDLE_DOMAIN_IRQ
>  	bool
>  
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
