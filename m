Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 122432683F2
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 07:07:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F4F58693C;
	Mon, 14 Sep 2020 05:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIWfuRLReQML; Mon, 14 Sep 2020 05:07:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 441C38693F;
	Mon, 14 Sep 2020 05:07:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23F80C0859;
	Mon, 14 Sep 2020 05:07:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FE51C0859
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 05:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 16CAA8693F
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 05:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGY6EQtLj3Hh for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 05:07:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B5BEF8693C
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 05:07:20 +0000 (UTC)
IronPort-SDR: XoW4ZYOaQ6q62wC+0M75NRggnFK2pfPdWBMp6aMejPCTYexnY2bIfAw/gNT/pJlBbFtMc5/DHQ
 3U0taqD8F9OA==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="243856109"
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; d="scan'208";a="243856109"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 22:07:20 -0700
IronPort-SDR: ZvRF2QjnvV0NLOwP+i5EthsmuoK18RpWKyWZYNLez5Vtiafbr8tV5cPsB2ij7c1kqKezq9oCnn
 /H0zr3Zjh5CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; d="scan'208";a="408752246"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2020 22:07:16 -0700
Subject: Re: [PATCH v4 5/5] iommu/vt-d: Add is_aux_domain support
To: Alex Williamson <alex.williamson@redhat.com>
References: <20200901033422.22249-1-baolu.lu@linux.intel.com>
 <20200901033422.22249-6-baolu.lu@linux.intel.com>
 <20200910160556.15fe7acd@w520.home>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <5c6a3e0e-f328-9b89-ff83-101cae920aef@linux.intel.com>
Date: Mon, 14 Sep 2020 13:01:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910160556.15fe7acd@w520.home>
Content-Language: en-US
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

Hi Alex,

On 9/11/20 6:05 AM, Alex Williamson wrote:
> On Tue,  1 Sep 2020 11:34:22 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>> With subdevice information opt-in through iommu_ops.aux_at(de)tach_dev()
>> interfaces, the vendor iommu driver is able to learn the knowledge about
>> the relationships between the subdevices and the aux-domains. Implement
>> is_aux_domain() support based on the relationship knowledges.
>>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel/iommu.c | 125 ++++++++++++++++++++++++++----------
>>   include/linux/intel-iommu.h |  17 +++--
>>   2 files changed, 103 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>> index 3c12fd06856c..50431c7b2e71 100644
>> --- a/drivers/iommu/intel/iommu.c
>> +++ b/drivers/iommu/intel/iommu.c
>> @@ -334,6 +334,8 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
>>   				     struct device *dev);
>>   static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
>>   					    dma_addr_t iova);
>> +static bool intel_iommu_dev_feat_enabled(struct device *dev,
>> +					 enum iommu_dev_features feat);
>>   
>>   #ifdef CONFIG_INTEL_IOMMU_DEFAULT_ON
>>   int dmar_disabled = 0;
>> @@ -1832,6 +1834,7 @@ static struct dmar_domain *alloc_domain(int flags)
>>   		domain->flags |= DOMAIN_FLAG_USE_FIRST_LEVEL;
>>   	domain->has_iotlb_device = false;
>>   	INIT_LIST_HEAD(&domain->devices);
>> +	INIT_LIST_HEAD(&domain->subdevices);
>>   
>>   	return domain;
>>   }
>> @@ -2580,7 +2583,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
>>   	info->iommu = iommu;
>>   	info->pasid_table = NULL;
>>   	info->auxd_enabled = 0;
>> -	INIT_LIST_HEAD(&info->auxiliary_domains);
>> +	INIT_LIST_HEAD(&info->subdevices);
>>   
>>   	if (dev && dev_is_pci(dev)) {
>>   		struct pci_dev *pdev = to_pci_dev(info->dev);
>> @@ -5137,21 +5140,28 @@ static void intel_iommu_domain_free(struct iommu_domain *domain)
>>   		domain_exit(to_dmar_domain(domain));
>>   }
>>   
>> -/*
>> - * Check whether a @domain could be attached to the @dev through the
>> - * aux-domain attach/detach APIs.
>> - */
>> -static inline bool
>> -is_aux_domain(struct device *dev, struct iommu_domain *domain)
>> +/* Lookup subdev_info in the domain's subdevice siblings. */
>> +static struct subdev_info *
>> +subdev_lookup_domain(struct dmar_domain *domain, struct device *dev,
>> +		     struct device *subdev)
>>   {
>> -	struct device_domain_info *info = get_domain_info(dev);
>> +	struct subdev_info *sinfo = NULL, *tmp;
>>   
>> -	return info && info->auxd_enabled &&
>> -			domain->type == IOMMU_DOMAIN_UNMANAGED;
>> +	assert_spin_locked(&device_domain_lock);
>> +
>> +	list_for_each_entry(tmp, &domain->subdevices, link_domain) {
>> +		if ((!dev || tmp->pdev == dev) && tmp->dev == subdev) {
>> +			sinfo = tmp;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return sinfo;
>>   }
>>   
>> -static void auxiliary_link_device(struct dmar_domain *domain,
>> -				  struct device *dev)
>> +static void
>> +subdev_link_device(struct dmar_domain *domain, struct device *dev,
>> +		   struct subdev_info *sinfo)
>>   {
>>   	struct device_domain_info *info = get_domain_info(dev);
>>   
>> @@ -5159,12 +5169,13 @@ static void auxiliary_link_device(struct dmar_domain *domain,
>>   	if (WARN_ON(!info))
>>   		return;
>>   
>> -	domain->auxd_refcnt++;
>> -	list_add(&domain->auxd, &info->auxiliary_domains);
>> +	list_add(&info->subdevices, &sinfo->link_phys);
>> +	list_add(&domain->subdevices, &sinfo->link_domain);
>>   }
>>   
>> -static void auxiliary_unlink_device(struct dmar_domain *domain,
>> -				    struct device *dev)
>> +static void
>> +subdev_unlink_device(struct dmar_domain *domain, struct device *dev,
>> +		     struct subdev_info *sinfo)
>>   {
>>   	struct device_domain_info *info = get_domain_info(dev);
>>   
>> @@ -5172,24 +5183,30 @@ static void auxiliary_unlink_device(struct dmar_domain *domain,
>>   	if (WARN_ON(!info))
>>   		return;
>>   
>> -	list_del(&domain->auxd);
>> -	domain->auxd_refcnt--;
>> +	list_del(&sinfo->link_phys);
>> +	list_del(&sinfo->link_domain);
>> +	kfree(sinfo);
>>   
>> -	if (!domain->auxd_refcnt && domain->default_pasid > 0)
>> +	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
>>   		ioasid_free(domain->default_pasid);
>>   }
>>   
>> -static int aux_domain_add_dev(struct dmar_domain *domain,
>> -			      struct device *dev)
>> +static int aux_domain_add_dev(struct dmar_domain *domain, struct device *dev,
>> +			      struct device *subdev)
>>   {
>>   	int ret;
>>   	unsigned long flags;
>>   	struct intel_iommu *iommu;
>> +	struct subdev_info *sinfo;
>>   
>>   	iommu = device_to_iommu(dev, NULL, NULL);
>>   	if (!iommu)
>>   		return -ENODEV;
>>   
>> +	sinfo = kzalloc(sizeof(*sinfo), GFP_KERNEL);
>> +	if (!sinfo)
>> +		return -ENOMEM;
>> +
>>   	if (domain->default_pasid <= 0) {
>>   		int pasid;
>>   
>> @@ -5199,7 +5216,8 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
>>   				     NULL);
>>   		if (pasid == INVALID_IOASID) {
>>   			pr_err("Can't allocate default pasid\n");
>> -			return -ENODEV;
>> +			ret = -ENODEV;
>> +			goto pasid_failed;
>>   		}
>>   		domain->default_pasid = pasid;
>>   	}
>> @@ -5225,7 +5243,10 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
>>   		goto table_failed;
>>   	spin_unlock(&iommu->lock);
>>   
>> -	auxiliary_link_device(domain, dev);
>> +	sinfo->dev = subdev;
>> +	sinfo->domain = domain;
>> +	sinfo->pdev = dev;
>> +	subdev_link_device(domain, dev, sinfo);
> 
> 
> The unlink path frees sinfo, would it make more sense to pass subdev,
> domain, and dev to the link function and let it allocate the sinfo
> struct and return it on success?  I'm not sure if you're pre-allocating
> it to avoid something hard to unwind, but it feels asymmetric between
> the link and unlink semantics.  Thanks,

You are right. I should make the link and unlink helpers symmetric. I
will move free() out to the caller.

Best regards,
baolu

> 
> Alex
> 
> 
>>   
>>   	spin_unlock_irqrestore(&device_domain_lock, flags);
>>   
>> @@ -5236,27 +5257,36 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
>>   attach_failed:
>>   	spin_unlock(&iommu->lock);
>>   	spin_unlock_irqrestore(&device_domain_lock, flags);
>> -	if (!domain->auxd_refcnt && domain->default_pasid > 0)
>> +	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
>>   		ioasid_free(domain->default_pasid);
>> +pasid_failed:
>> +	kfree(sinfo);
>>   
>>   	return ret;
>>   }
>>   
>> -static void aux_domain_remove_dev(struct dmar_domain *domain,
>> -				  struct device *dev)
>> +static void
>> +aux_domain_remove_dev(struct dmar_domain *domain, struct device *dev,
>> +		      struct device *subdev)
>>   {
>>   	struct device_domain_info *info;
>>   	struct intel_iommu *iommu;
>> +	struct subdev_info *sinfo;
>>   	unsigned long flags;
>>   
>> -	if (!is_aux_domain(dev, &domain->domain))
>> +	if (!intel_iommu_dev_feat_enabled(dev, IOMMU_DEV_FEAT_AUX) ||
>> +	    domain->domain.type != IOMMU_DOMAIN_UNMANAGED)
>>   		return;
>>   
>>   	spin_lock_irqsave(&device_domain_lock, flags);
>>   	info = get_domain_info(dev);
>>   	iommu = info->iommu;
>> -
>> -	auxiliary_unlink_device(domain, dev);
>> +	sinfo = subdev_lookup_domain(domain, dev, subdev);
>> +	if (!sinfo) {
>> +		spin_unlock_irqrestore(&device_domain_lock, flags);
>> +		return;
>> +	}
>> +	subdev_unlink_device(domain, dev, sinfo);
>>   
>>   	spin_lock(&iommu->lock);
>>   	intel_pasid_tear_down_entry(iommu, dev, domain->default_pasid, false);
>> @@ -5319,7 +5349,8 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
>>   		return -EPERM;
>>   	}
>>   
>> -	if (is_aux_domain(dev, domain))
>> +	if (intel_iommu_dev_feat_enabled(dev, IOMMU_DEV_FEAT_AUX) &&
>> +	    domain->type == IOMMU_DOMAIN_UNMANAGED)
>>   		return -EPERM;
>>   
>>   	/* normally dev is not mapped */
>> @@ -5344,14 +5375,15 @@ intel_iommu_aux_attach_device(struct iommu_domain *domain,
>>   {
>>   	int ret;
>>   
>> -	if (!is_aux_domain(dev, domain))
>> +	if (!intel_iommu_dev_feat_enabled(dev, IOMMU_DEV_FEAT_AUX) ||
>> +	    domain->type != IOMMU_DOMAIN_UNMANAGED)
>>   		return -EPERM;
>>   
>>   	ret = prepare_domain_attach_device(domain, dev);
>>   	if (ret)
>>   		return ret;
>>   
>> -	return aux_domain_add_dev(to_dmar_domain(domain), dev);
>> +	return aux_domain_add_dev(to_dmar_domain(domain), dev, subdev);
>>   }
>>   
>>   static void intel_iommu_detach_device(struct iommu_domain *domain,
>> @@ -5364,7 +5396,7 @@ static void
>>   intel_iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev,
>>   			      struct device *subdev)
>>   {
>> -	aux_domain_remove_dev(to_dmar_domain(domain), dev);
>> +	aux_domain_remove_dev(to_dmar_domain(domain), dev, subdev);
>>   }
>>   
>>   /*
>> @@ -6020,6 +6052,32 @@ static bool intel_iommu_is_attach_deferred(struct iommu_domain *domain,
>>   	return attach_deferred(dev);
>>   }
>>   
>> +static int
>> +intel_iommu_domain_get_attr(struct iommu_domain *domain,
>> +			    enum iommu_attr attr, void *data)
>> +{
>> +	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
>> +		return -EINVAL;
>> +
>> +	switch (attr) {
>> +	case DOMAIN_ATTR_IS_AUX:
>> +		spin_lock_irqsave(&device_domain_lock, flags);
>> +		ret = !IS_ERR_OR_NULL(subdev_lookup_domain(dmar_domain,
>> +							   NULL, data));
>> +		spin_unlock_irqrestore(&device_domain_lock, flags);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static int
>>   intel_iommu_domain_set_attr(struct iommu_domain *domain,
>>   			    enum iommu_attr attr, void *data)
>> @@ -6073,6 +6131,7 @@ const struct iommu_ops intel_iommu_ops = {
>>   	.domain_alloc		= intel_iommu_domain_alloc,
>>   	.domain_free		= intel_iommu_domain_free,
>>   	.domain_set_attr	= intel_iommu_domain_set_attr,
>> +	.domain_get_attr	= intel_iommu_domain_get_attr,
>>   	.attach_dev		= intel_iommu_attach_device,
>>   	.detach_dev		= intel_iommu_detach_device,
>>   	.aux_attach_dev		= intel_iommu_aux_attach_device,
>> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
>> index b1ed2f25f7c0..47ba1904c691 100644
>> --- a/include/linux/intel-iommu.h
>> +++ b/include/linux/intel-iommu.h
>> @@ -526,11 +526,9 @@ struct dmar_domain {
>>   					/* Domain ids per IOMMU. Use u16 since
>>   					 * domain ids are 16 bit wide according
>>   					 * to VT-d spec, section 9.3 */
>> -	unsigned int	auxd_refcnt;	/* Refcount of auxiliary attaching */
>> -
>>   	bool has_iotlb_device;
>>   	struct list_head devices;	/* all devices' list */
>> -	struct list_head auxd;		/* link to device's auxiliary list */
>> +	struct list_head subdevices;	/* all subdevices' list */
>>   	struct iova_domain iovad;	/* iova's that belong to this domain */
>>   
>>   	struct dma_pte	*pgd;		/* virtual address */
>> @@ -603,14 +601,21 @@ struct intel_iommu {
>>   	struct dmar_drhd_unit *drhd;
>>   };
>>   
>> +/* Per subdevice private data */
>> +struct subdev_info {
>> +	struct list_head link_phys;	/* link to phys device siblings */
>> +	struct list_head link_domain;	/* link to domain siblings */
>> +	struct device *pdev;		/* physical device derived from */
>> +	struct device *dev;		/* subdevice node */
>> +	struct dmar_domain *domain;	/* aux-domain */
>> +};
>> +
>>   /* PCI domain-device relationship */
>>   struct device_domain_info {
>>   	struct list_head link;	/* link to domain siblings */
>>   	struct list_head global; /* link to global list */
>>   	struct list_head table;	/* link to pasid table */
>> -	struct list_head auxiliary_domains; /* auxiliary domains
>> -					     * attached to this device
>> -					     */
>> +	struct list_head subdevices; /* subdevices sibling */
>>   	u32 segment;		/* PCI segment number */
>>   	u8 bus;			/* PCI bus number */
>>   	u8 devfn;		/* PCI devfn number */
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
