Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A68232E3F1
	for <lists.iommu@lfdr.de>; Fri,  5 Mar 2021 09:51:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8324432E9;
	Fri,  5 Mar 2021 08:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtEXYnAtofpm; Fri,  5 Mar 2021 08:51:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EFBC432F7;
	Fri,  5 Mar 2021 08:51:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EB9AC0010;
	Fri,  5 Mar 2021 08:51:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE3BBC0001
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 08:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C41868448C
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 08:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcFNnZorlNBL for <iommu@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 08:51:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5DA784484
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 08:51:09 +0000 (UTC)
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DsLqC0tQhz67pV2;
 Fri,  5 Mar 2021 16:43:19 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 5 Mar 2021 09:51:06 +0100
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Mar 2021 08:51:05 +0000
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2106.006; Fri, 5 Mar 2021 08:51:05 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: RE: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned VMID for NESTED
 stage with BTM
Thread-Topic: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned VMID for NESTED
 stage with BTM
Thread-Index: AQHXERlrJofV4Zjw70Ci8icDpSKnl6p1D4hA
Date: Fri, 5 Mar 2021 08:51:05 +0000
Message-ID: <8c80d31a56aa4d268f4e98d5692325f1@huawei.com>
References: <20210222155338.26132-1-shameerali.kolothum.thodi@huawei.com>
 <20210222155338.26132-5-shameerali.kolothum.thodi@huawei.com>
 <YEEUocRn3IfIDpLj@myrica>
In-Reply-To: <YEEUocRn3IfIDpLj@myrica>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.160.120]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "maz@kernel.org" <maz@kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

Hi Jean,

> -----Original Message-----
> From: Jean-Philippe Brucker [mailto:jean-philippe@linaro.org]
> Sent: 04 March 2021 17:11
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: linux-arm-kernel@lists.infradead.org; iommu@lists.linux-foundation.org;
> kvmarm@lists.cs.columbia.edu; maz@kernel.org;
> alex.williamson@redhat.com; eric.auger@redhat.com;
> zhangfei.gao@linaro.org; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Zengtao (B) <prime.zeng@hisilicon.com>;
> linuxarm@openeuler.org
> Subject: Re: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned VMID for
> NESTED stage with BTM
> 
> Hi Shameer,
> 
> On Mon, Feb 22, 2021 at 03:53:37PM +0000, Shameer Kolothum wrote:
> > If the SMMU supports BTM and the device belongs to NESTED domain
> > with shared pasid table, we need to use the VMID allocated by the
> > KVM for the s2 configuration. Hence, request a pinned VMID from KVM.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 49
> ++++++++++++++++++++-
> >  1 file changed, 47 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index 26bf7da1bcd0..04f83f7c8319 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/pci.h>
> >  #include <linux/pci-ats.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/kvm_host.h>
> >
> >  #include <linux/amba/bus.h>
> >
> > @@ -2195,6 +2196,33 @@ static void arm_smmu_bitmap_free(unsigned
> long *map, int idx)
> >  	clear_bit(idx, map);
> >  }
> >
> > +static int arm_smmu_pinned_vmid_get(struct arm_smmu_domain
> *smmu_domain)
> > +{
> > +	struct arm_smmu_master *master;
> > +
> > +	master = list_first_entry_or_null(&smmu_domain->devices,
> > +					  struct arm_smmu_master, domain_head);
> 
> This probably needs to hold devices_lock while using master.

Ok.

> 
> > +	if (!master)
> > +		return -EINVAL;
> > +
> > +	return kvm_pinned_vmid_get(master->dev);
> > +}
> > +
> > +static int arm_smmu_pinned_vmid_put(struct arm_smmu_domain
> *smmu_domain)
> > +{
> > +	struct arm_smmu_master *master;
> > +
> > +	master = list_first_entry_or_null(&smmu_domain->devices,
> > +					  struct arm_smmu_master, domain_head);
> > +	if (!master)
> > +		return -EINVAL;
> > +
> > +	if (smmu_domain->s2_cfg.vmid)
> > +		return kvm_pinned_vmid_put(master->dev);
> > +
> > +	return 0;
> > +}
> > +
> >  static void arm_smmu_domain_free(struct iommu_domain *domain)
> >  {
> >  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> > @@ -2215,8 +2243,11 @@ static void arm_smmu_domain_free(struct
> iommu_domain *domain)
> >  		mutex_unlock(&arm_smmu_asid_lock);
> >  	}
> >  	if (s2_cfg->set) {
> > -		if (s2_cfg->vmid)
> > -			arm_smmu_bitmap_free(smmu->vmid_map, s2_cfg->vmid);
> > +		if (s2_cfg->vmid) {
> > +			if (!(smmu->features & ARM_SMMU_FEAT_BTM) &&
> > +			    smmu_domain->stage != ARM_SMMU_DOMAIN_NESTED)
> > +				arm_smmu_bitmap_free(smmu->vmid_map,
> s2_cfg->vmid);
> > +		}
> >  	}
> >
> >  	kfree(smmu_domain);
> > @@ -3199,6 +3230,17 @@ static int arm_smmu_attach_pasid_table(struct
> iommu_domain *domain,
> >  				!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
> >  			goto out;
> >
> > +		if (smmu->features & ARM_SMMU_FEAT_BTM) {
> > +			ret = arm_smmu_pinned_vmid_get(smmu_domain);
> > +			if (ret < 0)
> > +				goto out;
> > +
> > +			if (smmu_domain->s2_cfg.vmid)
> > +				arm_smmu_bitmap_free(smmu->vmid_map,
> smmu_domain->s2_cfg.vmid);
> > +
> > +			smmu_domain->s2_cfg.vmid = (u16)ret;
> 
> That will require a TLB invalidation on the old VMID, once the STE is
> rewritten.

True. Will add that.

> More generally I think this pinned VMID set conflicts with that of
> stage-2-only domains (which is the default state until a guest attaches a
> PASID table). Say you have one guest using DOMAIN_NESTED without PASID
> table, just DMA to IPA using VMID 0x8000. Now another guest attaches a
> PASID table and obtains the same VMID from KVM. The stage-2 translation
> might use TLB entries from the other guest, no?  They'll both create
> stage-2 TLB entries with {StreamWorld=NS-EL1, VMID=0x8000}
> 
> It's tempting to allocate all VMIDs through KVM instead, but that will
> force a dependency on KVM to use VFIO_TYPE1_NESTING_IOMMU and might
> break
> existing users of that extension (though I'm not sure there are any).
> Instead we might need to restrict the SMMU VMID bitmap to match the
> private VMID set in KVM.

Right, that is indeed a problem. I will take a look at this suggestion.
 
> Besides we probably want to restrict this feature to systems supporting
> VMID16 on both SMMU and CPUs, or at least check that they are compatible.

Yes. Ideally I would like to detect that in the KVM code and enable/disable the
VMID splitting based on that. But I am yet to figure out an easy way to do that
in KVM.

> > +		}
> > +
> >  		smmu_domain->s1_cfg.cdcfg.cdtab_dma = cfg->base_ptr;
> >  		smmu_domain->s1_cfg.s1cdmax = cfg->pasid_bits;
> >  		smmu_domain->s1_cfg.s1fmt = cfg->vendor_data.smmuv3.s1fmt;
> > @@ -3221,6 +3263,7 @@ static int arm_smmu_attach_pasid_table(struct
> iommu_domain *domain,
> >  static void arm_smmu_detach_pasid_table(struct iommu_domain
> *domain)
> >  {
> >  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> > +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> >  	struct arm_smmu_master *master;
> >  	unsigned long flags;
> >
> > @@ -3237,6 +3280,8 @@ static void arm_smmu_detach_pasid_table(struct
> iommu_domain *domain)
> >  		arm_smmu_install_ste_for_dev(master);
> >  	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> >
> > +	if (smmu->features & ARM_SMMU_FEAT_BTM)
> > +		arm_smmu_pinned_vmid_put(smmu_domain);
> 
> Aliasing here as well: the VMID is still live but can be reallocated by
> KVM and another domain might obtain it.

Ok. Got it.

Thanks for the review,
Shameer

> 
> Thanks,
> Jean
> 
> >  unlock:
> >  	mutex_unlock(&smmu_domain->init_mutex);
> >  }
> > --
> > 2.17.1
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
