Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F7C1F6E5C
	for <lists.iommu@lfdr.de>; Thu, 11 Jun 2020 21:56:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59BF1887D1;
	Thu, 11 Jun 2020 19:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKm70Qo8acxy; Thu, 11 Jun 2020 19:56:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AC7B887C6;
	Thu, 11 Jun 2020 19:56:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DB07C016F;
	Thu, 11 Jun 2020 19:56:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 882C8C016F
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 19:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 700E189666
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 19:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKjrx9n04WzT for <iommu@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 19:56:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5C4748965E
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 19:56:00 +0000 (UTC)
IronPort-SDR: gvr9FSiDDT63UpYztaP9EFaFkL4uGiyzil+ocToODGIS20wMwNpYbkWA0GgP4zj9JNRkspKfOe
 PyOaxdmydtfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 12:56:00 -0700
IronPort-SDR: 6OGy0HphltOtwPAWMjEvQt1BpdA3Tm2x+SezYJPxYF3MxopRRS+nbZ9Tna88oZmNzyxbVnZasO
 tLzlLb8Tm40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,500,1583222400"; d="scan'208";a="259693290"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2020 12:55:59 -0700
Date: Thu, 11 Jun 2020 13:02:24 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 3/3] iommu/vt-d: Sanity check uapi argsz filled by users
Message-ID: <20200611130224.642ddde4@jacob-builder>
In-Reply-To: <20200611110816.4cea7204@x1.home>
References: <1591848735-12447-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1591848735-12447-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200611110816.4cea7204@x1.home>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph
 Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
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

On Thu, 11 Jun 2020 11:08:16 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Wed, 10 Jun 2020 21:12:15 -0700
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
> > IOMMU UAPI data has an argsz field which is filled by user. As the
> > data structures expands, argsz may change. As the UAPI data are
> > shared among different architectures, extensions of UAPI data could
> > be a result of one architecture which has no impact on another.
> > Therefore, these argsz santity checks are performed in the model
> > specific IOMMU drivers. This patch adds sanity checks in the VT-d
> > to ensure argsz passed by userspace matches feature flags and other
> > contents.
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  drivers/iommu/intel-iommu.c | 16 ++++++++++++++++
> >  drivers/iommu/intel-svm.c   | 12 ++++++++++++
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/iommu/intel-iommu.c
> > b/drivers/iommu/intel-iommu.c index 27ebf4b9faef..c98b5109684b
> > 100644 --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -5365,6 +5365,7 @@ intel_iommu_sva_invalidate(struct
> > iommu_domain *domain, struct device *dev, struct device_domain_info
> > *info; struct intel_iommu *iommu;
> >  	unsigned long flags;
> > +	unsigned long minsz;
> >  	int cache_type;
> >  	u8 bus, devfn;
> >  	u16 did, sid;
> > @@ -5385,6 +5386,21 @@ intel_iommu_sva_invalidate(struct
> > iommu_domain *domain, struct device *dev, if (!(dmar_domain->flags
> > & DOMAIN_FLAG_NESTING_MODE)) return -EINVAL;
> >  
> > +	minsz = offsetofend(struct iommu_cache_invalidate_info,
> > padding);  
> 
> Would it still be better to look for the end of the last field that's
> actually used to avoid the code churn and oversights if/when the
> padding field does get used and renamed?
> 
My thought was that if the padding gets partially re-purposed, the
remaining padding would still be valid for minsz check. The extension
rule ensures that there is no size change other the variable size union
at the end. So use padding would avoid the churn, or i am totally wrong?

> Per my comment on patch 1/, this also seems like where the device
> specific IOMMU driver should also have the responsibility of receiving
> a __user pointer to do the copy_from_user() here.  vfio can't know
> which flags require which fields to make a UAPI with acceptable
> compatibility guarantees otherwise.
> 
Right, VFIO cannot do compatibility guarantees, it is just seem to be
that VFIO has enough information to copy_from_user sanely & safely and
handle over to IOMMU. Please help define the roles/responsibilities in
my other email. Then I will follow the guideline.

> > +	if (inv_info->argsz < minsz)
> > +		return -EINVAL;
> > +
> > +	/* Sanity check user filled invalidation dat sizes */
> > +	if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
> > +		inv_info->argsz != offsetofend(struct
> > iommu_cache_invalidate_info,
> > +					addr_info))
> > +		return -EINVAL;
> > +
> > +	if (inv_info->granularity == IOMMU_INV_GRANU_PASID &&
> > +		inv_info->argsz != offsetofend(struct
> > iommu_cache_invalidate_info,
> > +					pasid_info))
> > +		return -EINVAL;
> > +
> >  	spin_lock_irqsave(&device_domain_lock, flags);
> >  	spin_lock(&iommu->lock);
> >  	info = get_domain_info(dev);
> > diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
> > index 35b43fe819ed..64dc2c66dfff 100644
> > --- a/drivers/iommu/intel-svm.c
> > +++ b/drivers/iommu/intel-svm.c
> > @@ -235,15 +235,27 @@ int intel_svm_bind_gpasid(struct iommu_domain
> > *domain, struct device *dev, struct dmar_domain *dmar_domain;
> >  	struct intel_svm_dev *sdev;
> >  	struct intel_svm *svm;
> > +	unsigned long minsz;
> >  	int ret = 0;
> >  
> >  	if (WARN_ON(!iommu) || !data)
> >  		return -EINVAL;
> >  
> > +	/*
> > +	 * We mandate that no size change in IOMMU UAPI data
> > before the
> > +	 * variable size union at the end.
> > +	 */
> > +	minsz = offsetofend(struct iommu_gpasid_bind_data,
> > padding);  
> 
> Same.  Thanks,
> 
> Alex
> 
> > +	if (data->argsz < minsz)
> > +		return -EINVAL;
> > +
> >  	if (data->version != IOMMU_GPASID_BIND_VERSION_1 ||
> >  	    data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
> >  		return -EINVAL;
> >  
> > +	if (data->argsz != offsetofend(struct
> > iommu_gpasid_bind_data, vtd))
> > +		return -EINVAL;
> > +
> >  	if (!dev_is_pci(dev))
> >  		return -ENOTSUPP;
> >    
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
