Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 701621AE1D5
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 18:08:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 259318790F;
	Fri, 17 Apr 2020 16:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJym3o2qj8z4; Fri, 17 Apr 2020 16:08:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF3F287820;
	Fri, 17 Apr 2020 16:08:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0FF4C0172;
	Fri, 17 Apr 2020 16:08:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53F03C0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 16:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4D8DF8773E
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 16:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHZB7rU7ZpYu for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 16:08:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A2EDD8771E
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 16:08:26 +0000 (UTC)
IronPort-SDR: kXxeOUJfQbLxBFiQWDWze3CJYb9/EdE25DYxnc+qdWiROt8YbATB2M2iz+PPFdbHzGbAWkZ9oG
 Y3nou+X89GPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 09:08:26 -0700
IronPort-SDR: x1yXukHxpXwBqfFqhGpgC0VsMHGzU8fWQNBTxcSzIj7Iyg+ZHQPMrRyn0/xdpJAJyY9mIYGc2F
 7/+EWtFz5Dow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="428271379"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 17 Apr 2020 09:08:25 -0700
Date: Fri, 17 Apr 2020 09:14:21 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v11 07/10] iommu/vt-d: Add svm/sva invalidate function
Message-ID: <20200417091421.77238a4b@jacob-builder>
In-Reply-To: <abee5ee3-ff7c-4849-4831-9591eb07ea63@redhat.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585939334-21396-8-git-send-email-jacob.jun.pan@linux.intel.com>
 <7867ade8-3e11-30af-b123-7f8ac3722b81@redhat.com>
 <20200410145621.30242b2d@jacob-builder>
 <abee5ee3-ff7c-4849-4831-9591eb07ea63@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Jonathan Cameron <jic23@kernel.org>
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

On Thu, 16 Apr 2020 12:59:14 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Jacob,
> On 4/10/20 11:56 PM, Jacob Pan wrote:
> > On Thu, 9 Apr 2020 10:50:34 +0200
> > Auger Eric <eric.auger@redhat.com> wrote:
> >   
> >> Hi Jacob,
> >>
> >> On 4/3/20 8:42 PM, Jacob Pan wrote:  
> >>> When Shared Virtual Address (SVA) is enabled for a guest OS via
> >>> vIOMMU, we need to provide invalidation support at IOMMU API and
> >>> driver level. This patch adds Intel VT-d specific function to
> >>> implement iommu passdown invalidate API for shared virtual
> >>> address.
> >>>
> >>> The use case is for supporting caching structure invalidation
> >>> of assigned SVM capable devices. Emulated IOMMU exposes queue
> >>> invalidation capability and passes down all descriptors from the
> >>> guest to the physical IOMMU.
> >>>
> >>> The assumption is that guest to host device ID mapping should be
> >>> resolved prior to calling IOMMU driver. Based on the device
> >>> handle, host IOMMU driver can replace certain fields before
> >>> submit to the invalidation queue.
> >>>
> >>> ---
> >>> v11 - Removed 2D map array, use -EINVAL in granularity lookup
> >>> array. Fixed devTLB invalidation granularity mapping. Disregard
> >>> G=1 case and use address selective invalidation only.
> >>>
> >>> v7 review fixed in v10
> >>> ---
> >>>
> >>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> >>> Signed-off-by: Ashok Raj <ashok.raj@intel.com>
> >>> Signed-off-by: Liu, Yi L <yi.l.liu@intel.com>
> >>> ---
> >>>  drivers/iommu/intel-iommu.c | 158
> >>> ++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 158
> >>> insertions(+)
> >>>
> >>> diff --git a/drivers/iommu/intel-iommu.c
> >>> b/drivers/iommu/intel-iommu.c index 94c7993dac6a..045c5c08d71d
> >>> 100644 --- a/drivers/iommu/intel-iommu.c
> >>> +++ b/drivers/iommu/intel-iommu.c
> >>> @@ -5594,6 +5594,163 @@ static void
> >>> intel_iommu_aux_detach_device(struct iommu_domain *domain,
> >>> aux_domain_remove_dev(to_dmar_domain(domain), dev); }
> >>>  
> >>> +/*
> >>> + * 2D array for converting and sanitizing IOMMU generic TLB
> >>> granularity to
> >>> + * VT-d granularity. Invalidation is typically included in the
> >>> unmap operation
> >>> + * as a result of DMA or VFIO unmap. However, for assigned
> >>> devices guest
> >>> + * owns the first level page tables. Invalidations of translation
> >>> caches in the
> >>> + * guest are trapped and passed down to the host.
> >>> + *
> >>> + * vIOMMU in the guest will only expose first level page tables,
> >>> therefore
> >>> + * we do not support IOTLB granularity for request without PASID
> >>> (second level).
> >>> + *
> >>> + * For example, to find the VT-d granularity encoding for IOTLB
> >>> + * type and page selective granularity within PASID:
> >>> + * X: indexed by iommu cache type
> >>> + * Y: indexed by enum iommu_inv_granularity
> >>> + * [IOMMU_CACHE_INV_TYPE_IOTLB][IOMMU_INV_GRANU_ADDR]
> >>> + */
> >>> +
> >>> +const static int
> >>> inv_type_granu_table[IOMMU_CACHE_INV_TYPE_NR][IOMMU_INV_GRANU_NR]
> >>> = {
> >>> +	/*
> >>> +	 * PASID based IOTLB invalidation: PASID selective (per
> >>> PASID),
> >>> +	 * page selective (address granularity)
> >>> +	 */
> >>> +	{-EINVAL, QI_GRAN_NONG_PASID, QI_GRAN_PSI_PASID},
> >>> +	/* PASID based dev TLBs */
> >>> +	{-EINVAL, -EINVAL, QI_DEV_IOTLB_GRAN_PASID_SEL},
> >>> +	/* PASID cache */
> >>> +	{-EINVAL, -EINVAL, -EINVAL}
> >>> +};
> >>> +
> >>> +static inline int to_vtd_granularity(int type, int granu)
> >>> +{
> >>> +	return inv_type_granu_table[type][granu];
> >>> +}
> >>> +
> >>> +static inline u64 to_vtd_size(u64 granu_size, u64 nr_granules)
> >>> +{
> >>> +	u64 nr_pages = (granu_size * nr_granules) >>
> >>> VTD_PAGE_SHIFT; +
> >>> +	/* VT-d size is encoded as 2^size of 4K pages, 0 for 4k,
> >>> 9 for 2MB, etc.
> >>> +	 * IOMMU cache invalidate API passes granu_size in bytes,
> >>> and number of
> >>> +	 * granu size in contiguous memory.
> >>> +	 */
> >>> +	return order_base_2(nr_pages);
> >>> +}
> >>> +
> >>> +#ifdef CONFIG_INTEL_IOMMU_SVM
> >>> +static int intel_iommu_sva_invalidate(struct iommu_domain
> >>> *domain,
> >>> +		struct device *dev, struct
> >>> iommu_cache_invalidate_info *inv_info) +{
> >>> +	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
> >>> +	struct device_domain_info *info;
> >>> +	struct intel_iommu *iommu;
> >>> +	unsigned long flags;
> >>> +	int cache_type;
> >>> +	u8 bus, devfn;
> >>> +	u16 did, sid;
> >>> +	int ret = 0;
> >>> +	u64 size = 0;
> >>> +
> >>> +	if (!inv_info || !dmar_domain ||
> >>> +		inv_info->version !=
> >>> IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
> >>> +		return -EINVAL;
> >>> +
> >>> +	if (!dev || !dev_is_pci(dev))
> >>> +		return -ENODEV;    
> >>
> >> Check (domain->flags & DOMAIN_FLAG_NESTING_MODE)?  
> > Good point
> >   
> >>> +
> >>> +	iommu = device_to_iommu(dev, &bus, &devfn);
> >>> +	if (!iommu)
> >>> +		return -ENODEV;
> >>> +
> >>> +	spin_lock_irqsave(&device_domain_lock, flags);
> >>> +	spin_lock(&iommu->lock);
> >>> +	info = iommu_support_dev_iotlb(dmar_domain, iommu, bus,
> >>> devfn);
> >>> +	if (!info) {
> >>> +		ret = -EINVAL;
> >>> +		goto out_unlock;
> >>> +	}
> >>> +	did = dmar_domain->iommu_did[iommu->seq_id];
> >>> +	sid = PCI_DEVID(bus, devfn);
> >>> +
> >>> +	/* Size is only valid in non-PASID selective invalidation
> >>> */
> >>> +	if (inv_info->granularity != IOMMU_INV_GRANU_PASID)
> >>> +		size =
> >>> to_vtd_size(inv_info->addr_info.granule_size,
> >>> +
> >>> inv_info->addr_info.nb_granules); +
> >>> +	for_each_set_bit(cache_type, (unsigned long
> >>> *)&inv_info->cache, IOMMU_CACHE_INV_TYPE_NR) {
> >>> +		int granu = 0;
> >>> +		u64 pasid = 0;
> >>> +
> >>> +		granu = to_vtd_granularity(cache_type,
> >>> inv_info->granularity);
> >>> +		if (granu == -EINVAL) {
> >>> +			pr_err("Invalid cache type and granu
> >>> combination %d/%d\n", cache_type,
> >>> +				inv_info->granularity);    
> >> rate unlimited traces here and after.  
> still to be fixed
Yes. will do.

> >> ret = -EINVAL?
> >> also related to the discussion we had on the VFIO series. What is
> >> the error policy?  
> > Invalidation should not fail, there is no way to tell the guest.
> > this can be a void function or VFIO can ignore it similar to what
> > is done to iommu_unmap.  
> OK it was just for reminder
It will also be documented in an IOMMU UAPI doc, I plan to send out
along with the feedback on UAPI version and sizing patchset.

Could you check if the following statement is true.

"TLB invalidations should always succeed from vIOMMU's
perspective. There is no architectual way to report back the vIOMMU if
the UAPI data is not compatible. For this reason the following IOMMU
UAPIs cannot fail:

1. Free PASID
2. Unbind guest PASID
3. Unbind guest PASID table (SMMU)
4. Cache invalidate
5. Page response
"

> > 
> >   
> >>> +			break;
> >>> +		}
> >>> +
> >>> +		/* PASID is stored in different locations based
> >>> on granularity */    
> >> not sure the above comment really is requested  
> > Just to explain the situation where PASID can be in pasid_info or
> > addr_info.
> >   
> >>> +		if (inv_info->granularity ==
> >>> IOMMU_INV_GRANU_PASID &&
> >>> +			inv_info->pasid_info.flags &
> >>> IOMMU_INV_PASID_FLAGS_PASID)
> >>> +			pasid = inv_info->pasid_info.pasid;
> >>> +		else if (inv_info->granularity ==
> >>> IOMMU_INV_GRANU_ADDR &&
> >>> +			inv_info->addr_info.flags &
> >>> IOMMU_INV_ADDR_FLAGS_PASID)
> >>> +			pasid = inv_info->addr_info.pasid;
> >>> +
> >>> +		switch (BIT(cache_type)) {
> >>> +		case IOMMU_CACHE_INV_TYPE_IOTLB:
> >>> +			if ((inv_info->granularity ==
> >>> IOMMU_INV_GRANU_ADDR) &&
> >>> +				size && (inv_info->addr_info.addr
> >>> & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
> >>> +				pr_err("Address out of range,
> >>> 0x%llx, size order %llu\n",
> >>> +					inv_info->addr_info.addr,
> >>> size);
> >>> +				ret = -ERANGE;
> >>> +				goto out_unlock;
> >>> +			}
> >>> +
> >>> +			qi_flush_piotlb(iommu, did,
> >>> +					pasid,
> >>> +
> >>> mm_to_dma_pfn(inv_info->addr_info.addr),    
> >> This does not sound correct to me:
> >> inv_info->addr_info.addr and inv_info->addr_info.flags are not
> >> valid in case of PASID-selective invalidation  
> > If granu is PASID-selective, this address is ignored. Since npages
> > = -1.  
> Ah OK. Maybe add a comment since it is a bit strange to see irrelevant
> fields to be called in PASID-selective case.
> 
OK, will do.

Thanks!
> Thanks
> 
> Eric
> >   
> >>> +					(granu ==
> >>> QI_GRAN_NONG_PASID) ? -1 : 1 << size,
> >>> +					inv_info->addr_info.flags
> >>> & IOMMU_INV_ADDR_FLAGS_LEAF); +
> >>> +			/*
> >>> +			 * Always flush device IOTLB if ATS is
> >>> enabled. vIOMMU
> >>> +			 * in the guest may assume IOTLB flush is
> >>> inclusive,
> >>> +			 * which is more efficient.
> >>> +			 */
> >>> +			if (info->ats_enabled)
> >>> +				qi_flush_dev_iotlb_pasid(iommu,
> >>> sid, info->pfsid,
> >>> +						pasid,
> >>> info->ats_qdep,
> >>> +
> >>> inv_info->addr_info.addr, size,    
> >> same  
> >>> +						granu);
> >>> +			break;
> >>> +		case IOMMU_CACHE_INV_TYPE_DEV_IOTLB:
> >>> +			if (info->ats_enabled)
> >>> +				qi_flush_dev_iotlb_pasid(iommu,
> >>> sid, info->pfsid,
> >>> +
> >>> inv_info->addr_info.pasid, info->ats_qdep,    
> >> nit: use pasid directly  
> > will do.
> >   
> >>> +
> >>> inv_info->addr_info.addr, size,
> >>> +						granu);
> >>> +			else
> >>> +				pr_warn("Passdown device IOTLB
> >>> flush w/o ATS!\n");
> >>> +			break;
> >>> +		case IOMMU_CACHE_INV_TYPE_PASID:
> >>> +			qi_flush_pasid_cache(iommu, did, granu,
> >>> inv_info->pasid_info.pasid);
> >>> +			break;
> >>> +		default:
> >>> +			dev_err(dev, "Unsupported IOMMU
> >>> invalidation type %d\n",
> >>> +				cache_type);
> >>> +			ret = -EINVAL;
> >>> +		}
> >>> +	}
> >>> +out_unlock:
> >>> +	spin_unlock(&iommu->lock);
> >>> +	spin_unlock_irqrestore(&device_domain_lock, flags);
> >>> +
> >>> +	return ret;
> >>> +}
> >>> +#endif
> >>> +
> >>>  static int intel_iommu_map(struct iommu_domain *domain,
> >>>  			   unsigned long iova, phys_addr_t hpa,
> >>>  			   size_t size, int iommu_prot, gfp_t
> >>> gfp) @@ -6179,6 +6336,7 @@ const struct iommu_ops intel_iommu_ops
> >>> = { .is_attach_deferred	=
> >>> intel_iommu_is_attach_deferred, .pgsize_bitmap		=
> >>> INTEL_IOMMU_PGSIZES, #ifdef CONFIG_INTEL_IOMMU_SVM
> >>> +	.cache_invalidate	= intel_iommu_sva_invalidate,
> >>>  	.sva_bind_gpasid	= intel_svm_bind_gpasid,
> >>>  	.sva_unbind_gpasid	= intel_svm_unbind_gpasid,
> >>>  #endif
> >>>     
> >> Thanks
> >>
> >> Eric
> >>  
> > 
> > [Jacob Pan]
> >   
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
