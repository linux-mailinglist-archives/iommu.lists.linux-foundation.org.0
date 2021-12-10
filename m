Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A246F74E
	for <lists.iommu@lfdr.de>; Fri, 10 Dec 2021 00:17:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6634F056;
	Thu,  9 Dec 2021 23:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7LGvsPL8sjl; Thu,  9 Dec 2021 23:16:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3F1214F054;
	Thu,  9 Dec 2021 23:16:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F2C6C006E;
	Thu,  9 Dec 2021 23:16:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3206C0012
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 23:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D79D6FA38
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 23:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQRO0zuf37Cx for <iommu@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 23:16:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB8EE6FA37
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 23:16:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238169343"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="238169343"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:16:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="543771280"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:16:55 -0800
Date: Thu, 9 Dec 2021 15:21:13 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 3/4] iommu/vt-d: Support PASID DMA for in-kernel usage
Message-ID: <20211209152113.64b817b9@jacob-builder>
In-Reply-To: <9f724b3a-6028-43d7-b4fc-d8a939e7b2cf@linux.intel.com>
References: <1638884834-83028-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1638884834-83028-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20211208132255.GS6385@nvidia.com>
 <20211208111659.6de22e52@jacob-builder>
 <9f724b3a-6028-43d7-b4fc-d8a939e7b2cf@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tony Luck <tony.luck@intel.com>, Dave
 Jiang <dave.jiang@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Barry Song <21cnbao@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, "Zanussi,
 Tom" <tom.zanussi@intel.com>
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

Hi Lu,

On Thu, 9 Dec 2021 10:32:43 +0800, Lu Baolu <baolu.lu@linux.intel.com>
wrote:

> On 12/9/21 3:16 AM, Jacob Pan wrote:
> > Hi Jason,
> > 
> > On Wed, 8 Dec 2021 09:22:55 -0400, Jason Gunthorpe <jgg@nvidia.com>
> > wrote: 
> >> On Tue, Dec 07, 2021 at 05:47:13AM -0800, Jacob Pan wrote:  
> >>> Between DMA requests with and without PASID (legacy), DMA mapping APIs
> >>> are used indiscriminately on a device. Therefore, we should always
> >>> match the addressing mode of the legacy DMA when enabling kernel
> >>> PASID.
> >>>
> >>> This patch adds support for VT-d driver where the kernel PASID is
> >>> programmed to match RIDPASID. i.e. if the device is in pass-through,
> >>> the kernel PASID is also in pass-through; if the device is in IOVA
> >>> mode, the kernel PASID will also be using the same IOVA space.
> >>>
> >>> There is additional handling for IOTLB and device TLB flush w.r.t. the
> >>> kernel PASID. On VT-d, PASID-selective IOTLB flush is also on a
> >>> per-domain basis; whereas device TLB flush is per device. Note that
> >>> IOTLBs are used even when devices are in pass-through mode. ATS is
> >>> enabled device-wide, but the device drivers can choose to manage ATS
> >>> at per PASID level whenever control is available.
> >>>
> >>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> >>>   drivers/iommu/intel/iommu.c | 105
> >>> +++++++++++++++++++++++++++++++++++- drivers/iommu/intel/pasid.c |
> >>> 7 +++ include/linux/intel-iommu.h |   3 +-
> >>>   3 files changed, 113 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> >>> index 60253bc436bb..a2ef6b9e4bfc 100644
> >>> +++ b/drivers/iommu/intel/iommu.c
> >>> @@ -1743,7 +1743,14 @@ static void domain_flush_piotlb(struct
> >>> intel_iommu *iommu, if (domain->default_pasid)
> >>>   		qi_flush_piotlb(iommu, did, domain->default_pasid,
> >>>   				addr, npages, ih);
> >>> -
> >>> +	if (domain->kernel_pasid && !domain_type_is_si(domain)) {
> >>> +		/*
> >>> +		 * REVISIT: we only do PASID IOTLB inval for FL, we
> >>> could have SL
> >>> +		 * for PASID in the future such as vIOMMU PT. this
> >>> doesn't get hit.
> >>> +		 */
> >>> +		qi_flush_piotlb(iommu, did, domain->kernel_pasid,
> >>> +				addr, npages, ih);
> >>> +	}
> >>>   	if (!list_empty(&domain->devices))
> >>>   		qi_flush_piotlb(iommu, did, PASID_RID2PASID, addr,
> >>> npages, ih); }
> >>> @@ -5695,6 +5702,100 @@ static void intel_iommu_iotlb_sync_map(struct
> >>> iommu_domain *domain, }
> >>>   }
> >>>   
> >>> +static int intel_enable_pasid_dma(struct device *dev, u32 pasid)
> >>> +{  
> >>
> >> This seems like completely the wrong kind of op.
> >>
> >> At the level of the iommu driver things should be iommu_domain centric
> >>
> >> The op should be
> >>
> >> int attach_dev_pasid(struct iommu_domain *domain, struct device *dev,
> >> ioasid_t pasid)
> >>
> >> Where 'dev' purpose is to provide the RID
> >>
> >> The iommu_domain passed in should be the 'default domain' ie the table
> >> used for on-demand mapping, or the passthrough page table.
> >>  
> > Makes sense. DMA API is device centric, iommu API is domain centric. It
> > should be the common IOMMU code to get the default domain then pass to
> > vendor drivers. Then we can enforce default domain behavior across all
> > vendor drivers.
> > i.e. 	
> > 	dom = iommu_get_dma_domain(dev);
> > 	attach_dev_pasid(dom, dev, pasid);
> >   
> >>> +	struct intel_iommu *iommu = device_to_iommu(dev, NULL, NULL);
> >>> +	struct device_domain_info *info;  
> >>
> >> I don't even want to know why an iommu driver is tracking its own
> >> per-device state. That seems like completely wrong layering.
> >>  
> > This is for IOTLB and deTLB flush. IOTLB is flushed at per domain level,
> > devTLB is per device.
> > 
> > For multi-device groups, this is a need to track how many devices are
> > using the kernel DMA PASID.
> > 
> > Are you suggesting we add the tracking info in the generic layer? i.e.
> > iommu_group.
> > 
> > We could also have a generic device domain info to replace what is in
> > VT-d and FSL IOMMU driver, etc.  
> 
> The store place of per-device iommu driver private data has already been
> standardized. The iommu core provides below interfaces for this purpose:
> 
> void dev_iommu_priv_set(struct device *dev, void *priv);
> void *dev_iommu_priv_get(struct device *dev);
> 
> If we have anything generic among different vendor iommu drivers,
> perhaps we could move them into dev->iommu.
> 
Yes, good suggestion. DMA PASID should be a generic feature, not suitable
for the opaque private date. Can we agree on adding the following flag for
devTLB invalidation?

@@ -379,6 +379,7 @@ struct dev_iommu {
        struct iommu_fwspec             *fwspec;
        struct iommu_device             *iommu_dev;
        void                            *priv;
+       u32 pasid_dma_enabled           : 1;
 };

For DMA PASID storage, can we store it in the iommu_domain instead of
iommu_group? In the end, this PASID is only used for the default domain. It
will be easier to refcount how many attached devices are using the PASID.
Destroy the PASID when no devices in the group are using PASID DMA. IOTLB
flush is per domain also.

Jason, do you have guidance here?

> Best regards,
> baolu


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
