Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A857025
	for <lists.iommu@lfdr.de>; Wed, 26 Jun 2019 20:00:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2B580D4A;
	Wed, 26 Jun 2019 18:00:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E8846B2F
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 18:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 527C6710
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 18:00:05 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F23AF208E3;
	Wed, 26 Jun 2019 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561572005;
	bh=Yw+WNhu2uTH/tNxCYEnMhsKWbJMHkoSnvT9yxad1CYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBxCyhHD2cBAcSN2qEvsVo8wqPUOEcC/iX1A4kip5UJ/ExQik0trzTbSNlmE5QGfS
	ER9ioo+a/BMpevKUIClKM4Z178VZbr2b4CIJmITUu93R/WpWzbAKGvhHpk3p+6yidG
	jAx3yTXQMazq94naq2uX+Ea4dO32EIGsaHVXDOxQ=
Date: Wed, 26 Jun 2019 18:59:59 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 6/8] iommu/arm-smmu-v3: Support auxiliary domains
Message-ID: <20190626175959.ubxvb2qn4taclact@willie-the-truck>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-7-jean-philippe.brucker@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610184714.6786-7-jean-philippe.brucker@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, will.deacon@arm.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org
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

Hi Jean-Philippe,

On Mon, Jun 10, 2019 at 07:47:12PM +0100, Jean-Philippe Brucker wrote:
> In commit a3a195929d40 ("iommu: Add APIs for multiple domains per
> device"), the IOMMU API gained the concept of auxiliary domains (AUXD),
> which allows to control the PASID-tagged address spaces of a device. With
> AUXD the PASID address space are not shared with the CPU, but are instead
> modified with iommu_map() and iommu_unmap() calls on auxiliary domains.
> 
> Add auxiliary domain support to the SMMUv3 driver. Device drivers allocate
> an unmanaged IOMMU domain with iommu_domain_alloc(), and attach it to the
> device with iommu_aux_attach_domain().

[...]

> 
> The AUXD API is fairly permissive, and allows to attach an IOMMU domain in
> both normal and auxiliary mode at the same time - one device can be
> attached to the domain normally, and another device can be attached
> through one of its PASIDs. To avoid excessive complexity in the SMMU
> implementation we pose some restrictions on supported AUXD usage:
> 
> * A domain is either in auxiliary mode or normal mode. And that state is
>   sticky. Once detached the domain has to be re-attached in the same mode.
> 
> * An auxiliary domain can have a single parent domain. Two devices can be
>   attached to the same auxiliary domain only if they are attached to the
>   same parent domain.
> 
> In practice these shouldn't be problematic, since we have the same kind of
> restriction on normal domains and users have been able to cope so far: at
> the moment a domain cannot be attached to two devices behind different
> SMMUs. When VFIO puts two such devices in the same container, it simply
> falls back to allocating two separate IOMMU domains.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
>  drivers/iommu/Kconfig       |   1 +
>  drivers/iommu/arm-smmu-v3.c | 276 +++++++++++++++++++++++++++++++++---
>  2 files changed, 260 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 9b45f70549a7..d326fef3d3a6 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -393,6 +393,7 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
>  config ARM_SMMU_V3
>  	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
>  	depends on ARM64
> +	select IOASID
>  	select IOMMU_API
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select GENERIC_MSI_IRQ_DOMAIN
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 326b71793336..633d829f246f 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -19,6 +19,7 @@
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/io-pgtable.h>
> +#include <linux/ioasid.h>
>  #include <linux/iommu.h>
>  #include <linux/iopoll.h>
>  #include <linux/init.h>
> @@ -641,6 +642,7 @@ struct arm_smmu_master {
>  	unsigned int			num_sids;
>  	unsigned int			ssid_bits;
>  	bool				ats_enabled		:1;
> +	bool				auxd_enabled		:1;
>  };
>  
>  /* SMMU private data for an IOMMU domain */
> @@ -666,8 +668,14 @@ struct arm_smmu_domain {
>  
>  	struct iommu_domain		domain;
>  
> +	/* Unused in aux domains */
>  	struct list_head		devices;
>  	spinlock_t			devices_lock;
> +
> +	/* Auxiliary domain stuff */
> +	struct arm_smmu_domain		*parent;
> +	ioasid_t			ssid;
> +	unsigned long			aux_nr_devs;

Maybe use a union to avoid comments about what is used/unused?

> +static void arm_smmu_aux_detach_dev(struct iommu_domain *domain, struct device *dev)
> +{
> +	struct iommu_domain *parent_domain;
> +	struct arm_smmu_domain *parent_smmu_domain;
> +	struct arm_smmu_master *master = dev_to_master(dev);
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +
> +	if (!arm_smmu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX))
> +		return;
> +
> +	parent_domain = iommu_get_domain_for_dev(dev);
> +	if (!parent_domain)
> +		return;
> +	parent_smmu_domain = to_smmu_domain(parent_domain);
> +
> +	mutex_lock(&smmu_domain->init_mutex);
> +	if (!smmu_domain->aux_nr_devs)
> +		goto out_unlock;
> +
> +	if (!--smmu_domain->aux_nr_devs) {
> +		arm_smmu_write_ctx_desc(parent_smmu_domain, smmu_domain->ssid,
> +					NULL);
> +		/*
> +		 * TLB doesn't need invalidation since accesses from the device
> +		 * can't use this domain's ASID once the CD is clear.
> +		 *
> +		 * Sadly that doesn't apply to ATCs, which are PASID tagged.
> +		 * Invalidate all other devices as well, because even though
> +		 * they weren't 'officially' attached to the auxiliary domain,
> +		 * they could have formed ATC entries.
> +		 */
> +		arm_smmu_atc_inv_domain(smmu_domain, 0, 0);

I've been struggling to understand the locking here, since both
arm_smmu_write_ctx_desc and arm_smmu_atc_inv_domain take and release the
devices_lock for the domain. Is there not a problem with devices coming and
going in-between the two calls?

> +	} else {
> +		struct arm_smmu_cmdq_ent cmd;
> +
> +		/* Invalidate only this device's ATC */
> +		if (master->ats_enabled) {
> +			arm_smmu_atc_inv_to_cmd(smmu_domain->ssid, 0, 0, &cmd);
> +			arm_smmu_atc_inv_master(master, &cmd);
> +		}
> +	}
> +out_unlock:
> +	mutex_unlock(&smmu_domain->init_mutex);
> +}
> +
> +static int arm_smmu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
> +{
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +
> +	return smmu_domain->ssid ?: -EINVAL;
> +}
> +
>  static struct iommu_ops arm_smmu_ops = {
>  	.capable		= arm_smmu_capable,
>  	.domain_alloc		= arm_smmu_domain_alloc,
> @@ -2539,6 +2772,13 @@ static struct iommu_ops arm_smmu_ops = {
>  	.of_xlate		= arm_smmu_of_xlate,
>  	.get_resv_regions	= arm_smmu_get_resv_regions,
>  	.put_resv_regions	= arm_smmu_put_resv_regions,
> +	.dev_has_feat		= arm_smmu_dev_has_feature,
> +	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
> +	.dev_enable_feat	= arm_smmu_dev_enable_feature,
> +	.dev_disable_feat	= arm_smmu_dev_disable_feature,

Why can't we use the existing ->capable and ->dev_{get,set}_attr callbacks
for this?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
