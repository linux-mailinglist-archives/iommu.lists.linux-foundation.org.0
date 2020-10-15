Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AB36128F03A
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 12:31:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3FF051FB6B;
	Thu, 15 Oct 2020 10:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yyIoNZfHSWmg; Thu, 15 Oct 2020 10:31:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 258E520434;
	Thu, 15 Oct 2020 10:31:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A08DC0051;
	Thu, 15 Oct 2020 10:31:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AAB6C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 10:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3DAFC2041F
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 10:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UADF-u4Z5Yzk for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 10:31:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id A4D2B1FB6B
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 10:31:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08B94D6E;
 Thu, 15 Oct 2020 03:31:14 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF34F3F66B;
 Thu, 15 Oct 2020 03:31:11 -0700 (PDT)
Date: Thu, 15 Oct 2020 11:31:06 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v3 7/8] arm64: mm: Set ZONE_DMA size based on early IORT
 scan
Message-ID: <20201015103106.GA24739@e121166-lin.cambridge.arm.com>
References: <20201014191211.27029-1-nsaenzjulienne@suse.de>
 <20201014191211.27029-8-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014191211.27029-8-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
 Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com, ardb@kernel.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
 Hanjun Guo <guohanjun@huawei.com>, robin.murphy@arm.com, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Oct 14, 2020 at 09:12:09PM +0200, Nicolas Saenz Julienne wrote:

[...]

> +unsigned int __init acpi_iort_get_zone_dma_size(void)
> +{
> +	struct acpi_table_iort *iort;
> +	struct acpi_iort_node *node, *end;
> +	acpi_status status;
> +	u8 limit = 32;
> +	int i;
> +
> +	if (acpi_disabled)
> +		return limit;
> +
> +	status = acpi_get_table(ACPI_SIG_IORT, 0,
> +				(struct acpi_table_header **)&iort);
> +	if (ACPI_FAILURE(status))
> +		return limit;
> +
> +	node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
> +	end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
> +
> +	for (i = 0; i < iort->node_count; i++) {
> +		if (node >= end)
> +			break;
> +
> +		switch (node->type) {
> +			struct acpi_iort_named_component *ncomp;
> +			struct acpi_iort_root_complex *rc;
> +
> +		case ACPI_IORT_NODE_NAMED_COMPONENT:
> +			ncomp = (struct acpi_iort_named_component *)node->node_data;
> +			if (ncomp->memory_address_limit)
> +				limit = min(limit, ncomp->memory_address_limit);
> +			break;
> +
> +		case ACPI_IORT_NODE_PCI_ROOT_COMPLEX:
> +			rc = (struct acpi_iort_root_complex *)node->node_data;
> +			if (rc->memory_address_limit)

You need to add a node revision check here, see rc_dma_get_range() in
drivers/acpi/arm64/iort.c, otherwise we may be reading junk data
in older IORT tables - acpica structures are always referring to the
latest specs.

Thanks,
Lorenzo

> +				limit = min(limit, rc->memory_address_limit);
> +			break;
> +		}
> +		node = ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
> +	}
> +	acpi_put_table(&iort->header);
> +	return limit;
> +}
> +#endif
> diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
> index 20a32120bb88..7d2e184f0d4d 100644
> --- a/include/linux/acpi_iort.h
> +++ b/include/linux/acpi_iort.h
> @@ -38,6 +38,7 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr, u64 *size);
>  const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
>  						const u32 *id_in);
>  int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
> +unsigned int acpi_iort_get_zone_dma_size(void);
>  #else
>  static inline void acpi_iort_init(void) { }
>  static inline u32 iort_msi_map_id(struct device *dev, u32 id)
> @@ -55,6 +56,9 @@ static inline const struct iommu_ops *iort_iommu_configure_id(
>  static inline
>  int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
>  { return 0; }
> +
> +static inline unsigned int acpi_iort_get_zone_dma_size(void)
> +{ return 32; }
>  #endif
>  
>  #endif /* __ACPI_IORT_H__ */
> -- 
> 2.28.0
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
