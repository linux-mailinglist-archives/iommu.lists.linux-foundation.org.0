Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB883D0ABD
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 10:54:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65B960883;
	Wed, 21 Jul 2021 08:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yrzd-JNmVK8C; Wed, 21 Jul 2021 08:54:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B1A876077B;
	Wed, 21 Jul 2021 08:54:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8273BC000E;
	Wed, 21 Jul 2021 08:54:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A98CC000E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 08:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 267AD607A6
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 08:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gL9slaNBmmC for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 08:54:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A97FB6077B
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 08:54:05 +0000 (UTC)
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GV8Kd3ykkz6G982;
 Wed, 21 Jul 2021 16:45:09 +0800 (CST)
Received: from lhreml720-chm.china.huawei.com (10.201.108.71) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 10:54:00 +0200
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml720-chm.china.huawei.com (10.201.108.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 09:54:00 +0100
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2176.012; Wed, 21 Jul 2021 09:54:00 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: RE: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned VMID for NESTED
 stage with BTM
Thread-Topic: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned VMID for NESTED
 stage with BTM
Thread-Index: AQHXERlrJofV4Zjw70Ci8icDpSKnl6tN8a9g
Date: Wed, 21 Jul 2021 08:54:00 +0000
Message-ID: <903a06a9db8c45fe88158e1c35f38c25@huawei.com>
References: <20210222155338.26132-1-shameerali.kolothum.thodi@huawei.com>
 <20210222155338.26132-5-shameerali.kolothum.thodi@huawei.com>
 <YEEUocRn3IfIDpLj@myrica>
In-Reply-To: <YEEUocRn3IfIDpLj@myrica>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.86.152]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "maz@kernel.org" <maz@kernel.org>, Linuxarm <linuxarm@huawei.com>,
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

[...]

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
> 
> More generally I think this pinned VMID set conflicts with that of
> stage-2-only domains (which is the default state until a guest attaches a
> PASID table). Say you have one guest using DOMAIN_NESTED without PASID
> table, just DMA to IPA using VMID 0x8000. Now another guest attaches a
> PASID table and obtains the same VMID from KVM. The stage-2 translation
> might use TLB entries from the other guest, no?  They'll both create
> stage-2 TLB entries with {StreamWorld=NS-EL1, VMID=0x8000}

Now that we are trying to align the KVM VMID allocation algorithm similar to
that of the ASID allocator [1], I attempted to use that for the SMMU pinned 
VMID allocation. But the issue you have mentioned above is still valid. 

And as a solution what I have tried now is follow what pinned ASID is doing 
in SVA,
 -Use xarray for private VMIDs
 -Get pinned VMID from KVM for DOMAIN_NESTED with PASID table
 -If the new pinned VMID is in use by private, then update the private
  VMID(VMID update to a live STE).

This seems to work, but still need to run more tests with this though.  

> It's tempting to allocate all VMIDs through KVM instead, but that will
> force a dependency on KVM to use VFIO_TYPE1_NESTING_IOMMU and might
> break
> existing users of that extension (though I'm not sure there are any).
> Instead we might need to restrict the SMMU VMID bitmap to match the
> private VMID set in KVM.

Another solution I have in mind is, make the new KVM VMID allocator common
between SMMUv3 and KVM. This will help to avoid all the private and shared
VMID splitting, also no need for live updates to STE VMID. One possible drawback
is less number of available KVM VMIDs but with 16 bit VMID space I am not sure
how much that is a concern.

Please let me know your thoughts.

Thanks,
Shameer

[1]. https://lore.kernel.org/kvmarm/20210616155606.2806-1-shameerali.kolothum.thodi@huawei.com/

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
