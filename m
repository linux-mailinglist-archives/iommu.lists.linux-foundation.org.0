Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FA19A1DC
	for <lists.iommu@lfdr.de>; Wed,  1 Apr 2020 00:22:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E75D186DF8;
	Tue, 31 Mar 2020 22:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lgBSxmuxqjsM; Tue, 31 Mar 2020 22:22:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A50C386DF1;
	Tue, 31 Mar 2020 22:22:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87A3EC1D8A;
	Tue, 31 Mar 2020 22:22:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAE71C07FF
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 22:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 94ABE87B94
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 22:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POUrxZ0HjT8Y for <iommu@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 22:22:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 943BD87B69
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 22:22:21 +0000 (UTC)
IronPort-SDR: YiClP+zBLejcZOVPM6V15w6hIOA38XXjMp0KHaJDDtakM8xbpKIUlfFyOnRe9+RZQ9okz9nBQD
 RywXDl3T8fzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 15:22:20 -0700
IronPort-SDR: 8nvYeC3Rx96tmtKvP2kyJfijVgwTnDT10iu85JI4Fzda253tp9o5IELvccEZRj2s8rqP6krTAC
 anxi3CA258aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,329,1580803200"; d="scan'208";a="249202581"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga003.jf.intel.com with ESMTP; 31 Mar 2020 15:22:19 -0700
Date: Tue, 31 Mar 2020 15:28:07 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH V10 08/11] iommu/vt-d: Add svm/sva invalidate function
Message-ID: <20200331152807.2fe9b084@jacob-builder>
In-Reply-To: <6697b594-4ac1-e524-2ac6-5a0a0925ca3f@redhat.com>
References: <1584746861-76386-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1584746861-76386-9-git-send-email-jacob.jun.pan@linux.intel.com>
 <6697b594-4ac1-e524-2ac6-5a0a0925ca3f@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

On Sun, 29 Mar 2020 18:05:47 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Jacob,
> 
> On 3/21/20 12:27 AM, Jacob Pan wrote:
> > When Shared Virtual Address (SVA) is enabled for a guest OS via
> > vIOMMU, we need to provide invalidation support at IOMMU API and
> > driver level. This patch adds Intel VT-d specific function to
> > implement iommu passdown invalidate API for shared virtual address.
> > 
> > The use case is for supporting caching structure invalidation
> > of assigned SVM capable devices. Emulated IOMMU exposes queue
> > invalidation capability and passes down all descriptors from the
> > guest to the physical IOMMU.
> > 
> > The assumption is that guest to host device ID mapping should be
> > resolved prior to calling IOMMU driver. Based on the device handle,
> > host IOMMU driver can replace certain fields before submit to the
> > invalidation queue.
> > 
> > ---
> > v7 review fixed in v10
> > ---
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Signed-off-by: Ashok Raj <ashok.raj@intel.com>
> > Signed-off-by: Liu, Yi L <yi.l.liu@intel.com>
> > ---
> >  drivers/iommu/intel-iommu.c | 182
> > ++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 182
> > insertions(+)
> > 
> > diff --git a/drivers/iommu/intel-iommu.c
> > b/drivers/iommu/intel-iommu.c index b1477cd423dd..a76afb0fd51a
> > 100644 --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -5619,6 +5619,187 @@ static void
> > intel_iommu_aux_detach_device(struct iommu_domain *domain,
> > aux_domain_remove_dev(to_dmar_domain(domain), dev); }
> >  
> > +/*
> > + * 2D array for converting and sanitizing IOMMU generic TLB
> > granularity to
> > + * VT-d granularity. Invalidation is typically included in the
> > unmap operation
> > + * as a result of DMA or VFIO unmap. However, for assigned devices
> > guest
> > + * owns the first level page tables. Invalidations of translation
> > caches in the
> > + * guest are trapped and passed down to the host.
> > + *
> > + * vIOMMU in the guest will only expose first level page tables,
> > therefore
> > + * we do not include IOTLB granularity for request without PASID
> > (second level).
> > + *
> > + * For example, to find the VT-d granularity encoding for IOTLB
> > + * type and page selective granularity within PASID:
> > + * X: indexed by iommu cache type
> > + * Y: indexed by enum iommu_inv_granularity
> > + * [IOMMU_CACHE_INV_TYPE_IOTLB][IOMMU_INV_GRANU_ADDR]
> > + *
> > + * Granu_map array indicates validity of the table. 1: valid, 0:
> > invalid
> > + *
> > + */
> > +const static int
> > inv_type_granu_map[IOMMU_CACHE_INV_TYPE_NR][IOMMU_INV_GRANU_NR] = {
> > +	/*
> > +	 * PASID based IOTLB invalidation: PASID selective (per
> > PASID),
> > +	 * page selective (address granularity)
> > +	 */
> > +	{0, 1, 1},
> > +	/* PASID based dev TLBs, only support all PASIDs or single
> > PASID */
> > +	{1, 1, 0},
> > +	/* PASID cache */
> > +	{1, 1, 0}
> > +};
> > +
> > +const static int
> > inv_type_granu_table[IOMMU_CACHE_INV_TYPE_NR][IOMMU_INV_GRANU_NR] =
> > {
> > +	/* PASID based IOTLB */
> > +	{0, QI_GRAN_NONG_PASID, QI_GRAN_PSI_PASID},
> > +	/* PASID based dev TLBs */
> > +	{QI_DEV_IOTLB_GRAN_ALL, QI_DEV_IOTLB_GRAN_PASID_SEL, 0},
> > +	/* PASID cache */
> > +	{QI_PC_ALL_PASIDS, QI_PC_PASID_SEL, 0},
> > +};
> > +
> > +static inline int to_vtd_granularity(int type, int granu, int
> > *vtd_granu) +{
> > +	if (type >= IOMMU_CACHE_INV_TYPE_NR || granu >=
> > IOMMU_INV_GRANU_NR ||
> > +		!inv_type_granu_map[type][granu])
> > +		return -EINVAL;
> > +
> > +	*vtd_granu = inv_type_granu_table[type][granu];
> > +
> > +	return 0;
> > +}
> > +
> > +static inline u64 to_vtd_size(u64 granu_size, u64 nr_granules)
> > +{
> > +	u64 nr_pages = (granu_size * nr_granules) >>
> > VTD_PAGE_SHIFT; +
> > +	/* VT-d size is encoded as 2^size of 4K pages, 0 for 4k, 9
> > for 2MB, etc.
> > +	 * IOMMU cache invalidate API passes granu_size in bytes,
> > and number of
> > +	 * granu size in contiguous memory.
> > +	 */
> > +	return order_base_2(nr_pages);
> > +}
> > +
> > +#ifdef CONFIG_INTEL_IOMMU_SVM
> > +static int intel_iommu_sva_invalidate(struct iommu_domain *domain,
> > +		struct device *dev, struct
> > iommu_cache_invalidate_info *inv_info) +{
> > +	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
> > +	struct device_domain_info *info;
> > +	struct intel_iommu *iommu;
> > +	unsigned long flags;
> > +	int cache_type;
> > +	u8 bus, devfn;
> > +	u16 did, sid;
> > +	int ret = 0;
> > +	u64 size = 0;
> > +
> > +	if (!inv_info || !dmar_domain ||
> > +		inv_info->version !=
> > IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
> > +		return -EINVAL;
> > +
> > +	if (!dev || !dev_is_pci(dev))
> > +		return -ENODEV;
> > +
> > +	iommu = device_to_iommu(dev, &bus, &devfn);
> > +	if (!iommu)
> > +		return -ENODEV;
> > +
> > +	spin_lock_irqsave(&device_domain_lock, flags);
> > +	spin_lock(&iommu->lock);
> > +	info = iommu_support_dev_iotlb(dmar_domain, iommu, bus,
> > devfn);
> > +	if (!info) {
> > +		ret = -EINVAL;
> > +		goto out_unlock;
> > +	}
> > +	did = dmar_domain->iommu_did[iommu->seq_id];
> > +	sid = PCI_DEVID(bus, devfn);
> > +
> > +	/* Size is only valid in non-PASID selective invalidation
> > */
> > +	if (inv_info->granularity != IOMMU_INV_GRANU_PASID)
> > +		size =
> > to_vtd_size(inv_info->addr_info.granule_size,
> > +
> > inv_info->addr_info.nb_granules); +
> > +	for_each_set_bit(cache_type, (unsigned long
> > *)&inv_info->cache, IOMMU_CACHE_INV_TYPE_NR) {
> > +		int granu = 0;
> > +		u64 pasid = 0;
> > +
> > +		ret = to_vtd_granularity(cache_type,
> > inv_info->granularity, &granu);
> > +		if (ret) {
> > +			pr_err("Invalid cache type and granu
> > combination %d/%d\n", cache_type,
> > +				inv_info->granularity);
> > +			break;
> > +		}
> > +
> > +		/* PASID is stored in different locations based on
> > granularity */
> > +		if (inv_info->granularity == IOMMU_INV_GRANU_PASID
> > &&
> > +			inv_info->pasid_info.flags &
> > IOMMU_INV_PASID_FLAGS_PASID)
> > +			pasid = inv_info->pasid_info.pasid;
> > +		else if (inv_info->granularity ==
> > IOMMU_INV_GRANU_ADDR &&
> > +			inv_info->addr_info.flags &
> > IOMMU_INV_ADDR_FLAGS_PASID)
> > +			pasid = inv_info->addr_info.pasid;
> > +		else {
> > +			pr_err("Cannot find PASID for given cache
> > type and granularity\n");  
> I don't get this error msg. In case of domain-selective invalidation,
> PASID is not used so if I am not wrong you will end up here while
> there is no issue.
Right, I will remove the else.

> > +			break;
> > +		}
> > +
> > +		switch (BIT(cache_type)) {
> > +		case IOMMU_CACHE_INV_TYPE_IOTLB:
> > +			if ((inv_info->granularity !=
> > IOMMU_INV_GRANU_PASID) &&
> > +				size && (inv_info->addr_info.addr
> > & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
> > +				pr_err("Address out of range,
> > 0x%llx, size order %llu\n",
> > +					inv_info->addr_info.addr,
> > size);
> > +				ret = -ERANGE;
> > +				goto out_unlock;
> > +			}
> > +
> > +			qi_flush_piotlb(iommu, did,
> > +					pasid,
> > +
> > mm_to_dma_pfn(inv_info->addr_info.addr),
> > +					(granu ==
> > QI_GRAN_NONG_PASID) ? -1 : 1 << size,
> > +					inv_info->addr_info.flags
> > & IOMMU_INV_ADDR_FLAGS_LEAF); +
> > +			/*
> > +			 * Always flush device IOTLB if ATS is
> > enabled since guest
> > +			 * vIOMMU exposes CM = 1, no device IOTLB
> > flush will be passed
> > +			 * down.
> > +			 */
> > +			if (info->ats_enabled) {  
> nit {} not requested
Will fix. same for the remaining.

Thanks!

Jacob

> > +				qi_flush_dev_iotlb_pasid(iommu,
> > sid, info->pfsid,
> > +						pasid,
> > info->ats_qdep,
> > +
> > inv_info->addr_info.addr, size,
> > +						granu);
> > +			}
> > +			break;
> > +		case IOMMU_CACHE_INV_TYPE_DEV_IOTLB:
> > +			if (info->ats_enabled) {  
> nit {} not requested
> > +				qi_flush_dev_iotlb_pasid(iommu,
> > sid, info->pfsid,
> > +
> > inv_info->addr_info.pasid, info->ats_qdep,
> > +
> > inv_info->addr_info.addr, size,
> > +						granu);
> > +			} else
> > +				pr_warn("Passdown device IOTLB
> > flush w/o ATS!\n");
> > +  
> nit: extra line
> > +			break;
> > +		case IOMMU_CACHE_INV_TYPE_PASID:
> > +			qi_flush_pasid_cache(iommu, did, granu,
> > inv_info->pasid_info.pasid);
> > +  
> nit: extra line
> > +			break;
> > +		default:
> > +			dev_err(dev, "Unsupported IOMMU
> > invalidation type %d\n",
> > +				cache_type);
> > +			ret = -EINVAL;
> > +		}
> > +	}
> > +out_unlock:
> > +	spin_unlock(&iommu->lock);
> > +	spin_unlock_irqrestore(&device_domain_lock, flags);
> > +
> > +	return ret;
> > +}
> > +#endif
> > +
> >  static int intel_iommu_map(struct iommu_domain *domain,
> >  			   unsigned long iova, phys_addr_t hpa,
> >  			   size_t size, int iommu_prot, gfp_t gfp)
> > @@ -6204,6 +6385,7 @@ const struct iommu_ops intel_iommu_ops = {
> >  	.is_attach_deferred	=
> > intel_iommu_is_attach_deferred, .pgsize_bitmap		=
> > INTEL_IOMMU_PGSIZES, #ifdef CONFIG_INTEL_IOMMU_SVM
> > +	.cache_invalidate	= intel_iommu_sva_invalidate,
> >  	.sva_bind_gpasid	= intel_svm_bind_gpasid,
> >  	.sva_unbind_gpasid	= intel_svm_unbind_gpasid,
> >  #endif
> >   
> Thanks
> 
> Eric
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
