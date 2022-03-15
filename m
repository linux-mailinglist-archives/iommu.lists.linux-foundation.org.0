Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E37C84D995D
	for <lists.iommu@lfdr.de>; Tue, 15 Mar 2022 11:49:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 904C960F9E;
	Tue, 15 Mar 2022 10:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44xXF92i281L; Tue, 15 Mar 2022 10:49:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 888AF60FA9;
	Tue, 15 Mar 2022 10:49:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FABAC000B;
	Tue, 15 Mar 2022 10:49:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88C39C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 10:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E4B8404B6
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 10:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ii0M7S9w2DPZ for <iommu@lists.linux-foundation.org>;
 Tue, 15 Mar 2022 10:49:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87F85404A6
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 10:49:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 945BE1474;
 Tue, 15 Mar 2022 03:49:11 -0700 (PDT)
Received: from [10.57.42.204] (unknown [10.57.42.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B3C03F66F;
 Tue, 15 Mar 2022 03:49:06 -0700 (PDT)
Message-ID: <a9637631-c23b-4158-d2cb-597a36b09a6b@arm.com>
Date: Tue, 15 Mar 2022 10:49:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 14/32] iommu: introduce iommu_domain_alloc_type and the
 KVM type
Content-Language: en-GB
To: Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org
References: <20220314194451.58266-1-mjrosato@linux.ibm.com>
 <20220314194451.58266-15-mjrosato@linux.ibm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220314194451.58266-15-mjrosato@linux.ibm.com>
Cc: kvm@vger.kernel.org, david@redhat.com, farman@linux.ibm.com,
 oberpar@linux.ibm.com, vneethv@linux.ibm.com, agordeev@linux.ibm.com,
 imbrenda@linux.ibm.com, will@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, frankja@linux.ibm.com,
 corbet@lwn.net, linux-doc@vger.kernel.org, pasic@linux.ibm.com, jgg@nvidia.com,
 gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, thuth@redhat.com,
 gor@linux.ibm.com, schnelle@linux.ibm.com, hca@linux.ibm.com,
 alex.williamson@redhat.com, freude@linux.ibm.com, pmorel@linux.ibm.com,
 cohuck@redhat.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, svens@linux.ibm.com, pbonzini@redhat.com
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

On 2022-03-14 19:44, Matthew Rosato wrote:
> s390x will introduce an additional domain type that is used for
> managing IOMMU owned by KVM.  Define the type here and add an
> interface for allocating a specified type vs the default type.

I'm also not a huge fan of adding a new domain_alloc interface like 
this, however if it is justifiable, then please make it take struct 
device rather than struct bus_type as an argument.

It also sounds like there may be a degree of conceptual overlap here 
with what Jean-Philippe is working on for sharing pagetables between KVM 
and SMMU for Android pKVM, so it's probably worth some thought over 
whether there's any scope for common interfaces in terms of actual 
implementation.

Thanks,
Robin.

> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   drivers/iommu/iommu.c |  7 +++++++
>   include/linux/iommu.h | 12 ++++++++++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index f2c45b85b9fc..8bb57e0e3945 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1976,6 +1976,13 @@ void iommu_domain_free(struct iommu_domain *domain)
>   }
>   EXPORT_SYMBOL_GPL(iommu_domain_free);
>   
> +struct iommu_domain *iommu_domain_alloc_type(struct bus_type *bus,
> +					     unsigned int t)
> +{
> +	return __iommu_domain_alloc(bus, t);
> +}
> +EXPORT_SYMBOL_GPL(iommu_domain_alloc_type);
> +
>   static int __iommu_attach_device(struct iommu_domain *domain,
>   				 struct device *dev)
>   {
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 9208eca4b0d1..b427bbb9f387 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -63,6 +63,7 @@ struct iommu_domain_geometry {
>   					      implementation              */
>   #define __IOMMU_DOMAIN_PT	(1U << 2)  /* Domain is identity mapped   */
>   #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
> +#define __IOMMU_DOMAIN_KVM	(1U << 4)  /* Domain is controlled by KVM */
>   
>   /*
>    * This are the possible domain-types
> @@ -77,6 +78,7 @@ struct iommu_domain_geometry {
>    *				  certain optimizations for these domains
>    *	IOMMU_DOMAIN_DMA_FQ	- As above, but definitely using batched TLB
>    *				  invalidation.
> + *	IOMMU_DOMAIN_KVM	- DMA mappings managed by KVM, used for VMs
>    */
>   #define IOMMU_DOMAIN_BLOCKED	(0U)
>   #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
> @@ -86,6 +88,8 @@ struct iommu_domain_geometry {
>   #define IOMMU_DOMAIN_DMA_FQ	(__IOMMU_DOMAIN_PAGING |	\
>   				 __IOMMU_DOMAIN_DMA_API |	\
>   				 __IOMMU_DOMAIN_DMA_FQ)
> +#define IOMMU_DOMAIN_KVM	(__IOMMU_DOMAIN_PAGING |	\
> +				 __IOMMU_DOMAIN_KVM)
>   
>   struct iommu_domain {
>   	unsigned type;
> @@ -421,6 +425,8 @@ extern bool iommu_capable(struct bus_type *bus, enum iommu_cap cap);
>   extern struct iommu_domain *iommu_domain_alloc(struct bus_type *bus);
>   extern struct iommu_group *iommu_group_get_by_id(int id);
>   extern void iommu_domain_free(struct iommu_domain *domain);
> +extern struct iommu_domain *iommu_domain_alloc_type(struct bus_type *bus,
> +						    unsigned int t);
>   extern int iommu_attach_device(struct iommu_domain *domain,
>   			       struct device *dev);
>   extern void iommu_detach_device(struct iommu_domain *domain,
> @@ -708,6 +714,12 @@ static inline void iommu_domain_free(struct iommu_domain *domain)
>   {
>   }
>   
> +static inline struct iommu_domain *iommu_domain_alloc_type(struct bus_type *bus,
> +							   unsigned int t)
> +{
> +	return NULL;
> +}
> +
>   static inline int iommu_attach_device(struct iommu_domain *domain,
>   				      struct device *dev)
>   {
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
