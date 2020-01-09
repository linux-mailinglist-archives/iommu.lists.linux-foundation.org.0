Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2A135F91
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 18:46:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1ECE986CF9;
	Thu,  9 Jan 2020 17:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTTfkuG707+N; Thu,  9 Jan 2020 17:46:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB3FE86D03;
	Thu,  9 Jan 2020 17:46:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2D4DC0881;
	Thu,  9 Jan 2020 17:46:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9C98C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 17:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D7F4F21539
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 17:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FewlgW575yXx for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 17:46:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id 491E621532
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 17:46:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 09:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="235592525"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga002.jf.intel.com with ESMTP; 09 Jan 2020 09:46:20 -0800
Date: Thu, 9 Jan 2020 09:51:23 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v8 02/10] iommu/vt-d: Add nested translation helper
 function
Message-ID: <20200109095123.17ed5e6b@jacob-builder>
In-Reply-To: <eeb67c06-a66c-fbbc-e273-09c4ab1f62b1@linux.intel.com>
References: <1576524252-79116-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1576524252-79116-3-git-send-email-jacob.jun.pan@linux.intel.com>
 <eeb67c06-a66c-fbbc-e273-09c4ab1f62b1@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

Hi Baolu,

Appreciate the review. Comments inline below.

On Wed, 18 Dec 2019 10:01:17 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi Jacob,
> 
> On 12/17/19 3:24 AM, Jacob Pan wrote:
> > Nested translation mode is supported in VT-d 3.0 Spec.CH 3.8.
> > With PASID granular translation type set to 0x11b, translation
> > result from the first level(FL) also subject to a second level(SL)
> > page table translation. This mode is used for SVA virtualization,
> > where FL performs guest virtual to guest physical translation and
> > SL performs guest physical to host physical translation.
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Signed-off-by: Liu, Yi L <yi.l.liu@linux.intel.com>
> > ---
> >   drivers/iommu/intel-pasid.c | 213
> > ++++++++++++++++++++++++++++++++++++++++++++
> > drivers/iommu/intel-pasid.h |  12 +++ include/linux/intel-iommu.h
> > |   3 + include/uapi/linux/iommu.h  |   5 +-
> >   4 files changed, 232 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/intel-pasid.c
> > b/drivers/iommu/intel-pasid.c index 3cb569e76642..b178ad9e47ae
> > 100644 --- a/drivers/iommu/intel-pasid.c
> > +++ b/drivers/iommu/intel-pasid.c
> > @@ -359,6 +359,76 @@ pasid_set_flpm(struct pasid_entry *pe, u64
> > value) pasid_set_bits(&pe->val[2], GENMASK_ULL(3, 2), value << 2);
> >   }
> >   
> > +/*
> > + * Setup the Extended Memory Type(EMT) field (Bits 91-93)
> > + * of a scalable mode PASID entry.
> > + */
> > +static inline void
> > +pasid_set_emt(struct pasid_entry *pe, u64 value)
> > +{
> > +	pasid_set_bits(&pe->val[1], GENMASK_ULL(29, 27), value <<
> > 27); +}
> > +
> > +/*
> > + * Setup the Page Attribute Table (PAT) field (Bits 96-127)
> > + * of a scalable mode PASID entry.
> > + */
> > +static inline void
> > +pasid_set_pat(struct pasid_entry *pe, u64 value)
> > +{
> > +	pasid_set_bits(&pe->val[1], GENMASK_ULL(63, 32), value <<
> > 27);  
> 
> The last input should be "value << 32".
> 
you are right. will fix.
> > +}
> > +
> > +/*
> > + * Setup the Cache Disable (CD) field (Bit 89)
> > + * of a scalable mode PASID entry.
> > + */
> > +static inline void
> > +pasid_set_cd(struct pasid_entry *pe)
> > +{
> > +	pasid_set_bits(&pe->val[1], 1 << 25, 1);  
> 
> The last input should be "1 << 25".
> 
right, i misunderstood the argument of pasid_set_bits(), same for the
other bits below.
> > +}
> > +
> > +/*
> > + * Setup the Extended Memory Type Enable (EMTE) field (Bit 90)
> > + * of a scalable mode PASID entry.
> > + */
> > +static inline void
> > +pasid_set_emte(struct pasid_entry *pe)
> > +{
> > +	pasid_set_bits(&pe->val[1], 1 << 26, 1);  
> 
> The last input should be "1 << 26".
> 
> > +}
> > +
> > +/*
> > + * Setup the Extended Access Flag Enable (EAFE) field (Bit 135)
> > + * of a scalable mode PASID entry.
> > + */
> > +static inline void
> > +pasid_set_eafe(struct pasid_entry *pe)
> > +{
> > +	pasid_set_bits(&pe->val[2], 1 << 7, 1);  
> 
> The last input should be "1 << 7".
> 
> > +}
> > +
> > +/*
> > + * Setup the Page-level Cache Disable (PCD) field (Bit 95)
> > + * of a scalable mode PASID entry.
> > + */
> > +static inline void
> > +pasid_set_pcd(struct pasid_entry *pe)
> > +{
> > +	pasid_set_bits(&pe->val[1], 1 << 31, 1);  
> 
> The last input should be "1 << 31".
> 
> > +}
> > +
> > +/*
> > + * Setup the Page-level Write-Through (PWT)) field (Bit 94)
> > + * of a scalable mode PASID entry.
> > + */
> > +static inline void
> > +pasid_set_pwt(struct pasid_entry *pe)
> > +{
> > +	pasid_set_bits(&pe->val[1], 1 << 30, 1);  
> 
> The last input should be "1 << 30".
> 
> > +}
> > +
> >   static void
> >   pasid_cache_invalidation_with_pasid(struct intel_iommu *iommu,
> >   				    u16 did, int pasid)
> > @@ -599,3 +669,146 @@ int intel_pasid_setup_pass_through(struct
> > intel_iommu *iommu, 
> >   	return 0;
> >   }
> > +
> > +static int intel_pasid_setup_bind_data(struct intel_iommu *iommu,
> > +				struct pasid_entry *pte,
> > +				struct iommu_gpasid_bind_data_vtd
> > *pasid_data) +{
> > +	/*
> > +	 * Not all guest PASID table entry fields are passed down
> > during bind,
> > +	 * here we only set up the ones that are dependent on
> > guest settings.
> > +	 * Execution related bits such as NXE, SMEP are not
> > meaningful to IOMMU,
> > +	 * therefore not set. Other fields, such as snoop related,
> > are set based
> > +	 * on host needs regardless of  guest settings.
> > +	 */
> > +	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_SRE) {
> > +		if (!ecap_srs(iommu->ecap)) {
> > +			pr_err("No supervisor request support on
> > %s\n",
> > +			       iommu->name);
> > +			return -EINVAL;
> > +		}
> > +		pasid_set_sre(pte);
> > +	}
> > +
> > +	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_EAFE) {
> > +		if (!ecap_eafs(iommu->ecap)) {
> > +			pr_err("No extended access flag support on
> > %s\n",
> > +				iommu->name);
> > +			return -EINVAL;
> > +		}
> > +		pasid_set_eafe(pte);
> > +	}
> > +
> > +	/*
> > +	 * Memory type is only applicable to devices inside
> > processor coherent
> > +	 * domain. PCIe devices are not included. We can skip the
> > rest of the
> > +	 * flags if IOMMU does not support MTS.
> > +	 */
> > +	if (ecap_mts(iommu->ecap)) {
> > +		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_EMTE)
> > {
> > +			pasid_set_emte(pte);
> > +			pasid_set_emt(pte, pasid_data->emt);
> > +		}
> > +		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_PCD)
> > +			pasid_set_pcd(pte);
> > +		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_PWT)
> > +			pasid_set_pwt(pte);
> > +		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_CD)
> > +			pasid_set_cd(pte);
> > +		pasid_set_pat(pte, pasid_data->pat);
> > +	} else if (pasid_data->flags &
> > IOMMU_SVA_VTD_GPASID_EMT_MASK) {
> > +		pr_warn("No memory type support for bind guest
> > PASID on %s\n",
> > +			iommu->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +
> > +}
> > +
> > +/**
> > + * intel_pasid_setup_nested() - Set up PASID entry for nested
> > translation
> > + * which is used for vSVA. The first level page tables are used
> > for  
> 
> Please remove "which is used for vSVA". It should be a generic
> interface for setting up nested translation mode?
> 
Right, perhaps just mention vSVA as an example such that readers can
have some idea of how nested translation can be used? e.g.
"
 * intel_pasid_setup_nested() - Set up PASID entry for nested translation.
 * This could be used for guest shared virtual address. In this case, the
 * first level page tables are used for GVA-GPA translation in the guest,
 * second level page tables are used for GPA-HPA translation.
"

> > + * GVA-GPA or GIOVA-GPA translation in the guest, second level
> > page tables
> > + *  are used for GPA-HPA translation.  
> 
> Nit: align with the last line.
> 
Will do.
> > + *
> > + * @iommu:      Iommu which the device belong to
> > + * @dev:        Device to be set up for translation
> > + * @gpgd:       FLPTPTR: First Level Page translation pointer in
> > GPA
> > + * @pasid:      PASID to be programmed in the device PASID table
> > + * @pasid_data: Additional PASID info from the guest bind request
> > + * @domain:     Domain info for setting up second level page tables
> > + * @addr_width: Address width of the first level (guest)
> > + */
> > +int intel_pasid_setup_nested(struct intel_iommu *iommu,
> > +			struct device *dev, pgd_t *gpgd,
> > +			int pasid, struct
> > iommu_gpasid_bind_data_vtd *pasid_data,
> > +			struct dmar_domain *domain,
> > +			int addr_width)
> > +{
> > +	struct pasid_entry *pte;
> > +	struct dma_pte *pgd;
> > +	u64 pgd_val;
> > +	int agaw;
> > +	u16 did;
> > +
> > +	if (!ecap_nest(iommu->ecap)) {
> > +		pr_err("IOMMU: %s: No nested translation
> > support\n",
> > +		       iommu->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	pte = intel_pasid_get_entry(dev, pasid);
> > +	if (WARN_ON(!pte))
> > +		return -EINVAL;
> > +
> > +	pasid_clear_entry(pte);
> > +
> > +	/* Sanity checking performed by caller to make sure address
> > +	 * width matching in two dimensions:
> > +	 * 1. CPU vs. IOMMU
> > +	 * 2. Guest vs. Host.
> > +	 */
> > +	switch (addr_width) {
> > +	case ADDR_WIDTH_5LEVEL:
> > +		pasid_set_flpm(pte, 1);
> > +		break;
> > +	case ADDR_WIDTH_4LEVEL:
> > +		pasid_set_flpm(pte, 0);
> > +		break;
> > +	default:
> > +		dev_err(dev, "Invalid paging mode %d\n",
> > addr_width);  
> 
> Invalid guest address width?
> 
Sounds better, will do.
> > +		return -EINVAL;
> > +	}
> > +
> > +	pasid_set_flptr(pte, (u64)gpgd);
> > +
> > +	intel_pasid_setup_bind_data(iommu, pte, pasid_data);  
> 
> Do you want to check and handle the errors returned from this
> function?
> 
yes, that would be necessary in case of unsupported bind data. Thanks!
> > +
> > +	/* Setup the second level based on the given domain */
> > +	pgd = domain->pgd;
> > +
> > +	for (agaw = domain->agaw; agaw != iommu->agaw; agaw--) {
> > +		pgd = phys_to_virt(dma_pte_addr(pgd));
> > +		if (!dma_pte_present(pgd)) {
> > +			pasid_clear_entry(pte);
> > +			dev_err(dev, "Invalid domain page
> > table\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> > +	pgd_val = virt_to_phys(pgd);
> > +	pasid_set_slptr(pte, pgd_val);
> > +	pasid_set_fault_enable(pte);
> > +
> > +	did = domain->iommu_did[iommu->seq_id];
> > +	pasid_set_domain_id(pte, did);
> > +
> > +	pasid_set_address_width(pte, agaw);
> > +	pasid_set_page_snoop(pte, !!ecap_smpwc(iommu->ecap));
> > +
> > +	pasid_set_translation_type(pte, PASID_ENTRY_PGTT_NESTED);
> > +	pasid_set_present(pte);
> > +	pasid_flush_caches(iommu, pte, pasid, did);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/iommu/intel-pasid.h
> > b/drivers/iommu/intel-pasid.h index fc8cd8f17de1..95ed160b1947
> > 100644 --- a/drivers/iommu/intel-pasid.h
> > +++ b/drivers/iommu/intel-pasid.h
> > @@ -36,6 +36,7 @@
> >    * to vmalloc or even module mappings.
> >    */
> >   #define PASID_FLAG_SUPERVISOR_MODE	BIT(0)
> > +#define PASID_FLAG_NESTED		BIT(1)
> >   
> >   struct pasid_dir_entry {
> >   	u64 val;
> > @@ -45,6 +46,11 @@ struct pasid_entry {
> >   	u64 val[8];
> >   };
> >   
> > +#define PASID_ENTRY_PGTT_FL_ONLY	(1)
> > +#define PASID_ENTRY_PGTT_SL_ONLY	(2)
> > +#define PASID_ENTRY_PGTT_NESTED		(3)
> > +#define PASID_ENTRY_PGTT_PT		(4)
> > +
> >   /* The representative of a PASID table */
> >   struct pasid_table {
> >   	void			*table;		/*
> > pasid table pointer */ @@ -93,6 +99,12 @@ int
> > intel_pasid_setup_second_level(struct intel_iommu *iommu, int
> > intel_pasid_setup_pass_through(struct intel_iommu *iommu, struct
> > dmar_domain *domain, struct device *dev, int pasid);
> > +int intel_pasid_setup_nested(struct intel_iommu *iommu,
> > +			struct device *dev, pgd_t *pgd,
> > +			int pasid,
> > +			struct iommu_gpasid_bind_data_vtd
> > *pasid_data,
> > +			struct dmar_domain *domain,
> > +			int addr_width);
> >   void intel_pasid_tear_down_entry(struct intel_iommu *iommu,
> >   				 struct device *dev, int pasid);
> >   
> > diff --git a/include/linux/intel-iommu.h
> > b/include/linux/intel-iommu.h index 74b79e2e6a73..19bf9ff180ae
> > 100644 --- a/include/linux/intel-iommu.h
> > +++ b/include/linux/intel-iommu.h
> > @@ -34,6 +34,9 @@
> >   #define VTD_STRIDE_SHIFT        (9)
> >   #define VTD_STRIDE_MASK         (((u64)-1) << VTD_STRIDE_SHIFT)
> >   
> > +#define ADDR_WIDTH_5LEVEL	(57)
> > +#define ADDR_WIDTH_4LEVEL	(48)
> > +
> >   #define DMA_PTE_READ (1)
> >   #define DMA_PTE_WRITE (2)
> >   #define DMA_PTE_LARGE_PAGE (1 << 7)
> > diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> > index 4ad3496e5c43..fcafb6401430 100644
> > --- a/include/uapi/linux/iommu.h
> > +++ b/include/uapi/linux/iommu.h
> > @@ -284,7 +284,10 @@ struct iommu_gpasid_bind_data_vtd {
> >   	__u32 pat;
> >   	__u32 emt;
> >   };
> > -
> > +#define IOMMU_SVA_VTD_GPASID_EMT_MASK
> > (IOMMU_SVA_VTD_GPASID_CD | \
> > +					 IOMMU_SVA_VTD_GPASID_EMTE
> > | \
> > +					 IOMMU_SVA_VTD_GPASID_PCD
> > |  \
> > +
> > IOMMU_SVA_VTD_GPASID_PWT)  
> 
> Might need a seperated patch?
> 
Sure. I have other uapi changes, may group them as a separate series.

> >   /**
> >    * struct iommu_gpasid_bind_data - Information about device and
> > guest PASID binding
> >    * @version:	Version of this data structure
> >   
> 
> Best regards,
> baolu

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
