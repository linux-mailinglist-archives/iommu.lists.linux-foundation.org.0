Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 108743D36A7
	for <lists.iommu@lfdr.de>; Fri, 23 Jul 2021 10:28:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8070C4012C;
	Fri, 23 Jul 2021 08:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7azyHbC9U7F; Fri, 23 Jul 2021 08:28:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 98F05400E1;
	Fri, 23 Jul 2021 08:28:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B068C001C;
	Fri, 23 Jul 2021 08:28:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9506EC000E
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 08:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 818B4405B3
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 08:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7sxwL9BE6bN for <iommu@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 08:28:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2870405B2
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 08:28:01 +0000 (UTC)
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GWMfY0lnfz6G9D9;
 Fri, 23 Jul 2021 16:19:01 +0800 (CST)
Received: from lhreml712-chm.china.huawei.com (10.201.108.63) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 10:27:58 +0200
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml712-chm.china.huawei.com (10.201.108.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 09:27:58 +0100
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2176.012; Fri, 23 Jul 2021 09:27:58 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: RE: [Linuxarm]  Re: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned
 VMID for NESTED stage with BTM
Thread-Topic: [Linuxarm]  Re: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned
 VMID for NESTED stage with BTM
Thread-Index: AQHXERlrJofV4Zjw70Ci8icDpSKnl6tN8a9ggAINboCAAQu/4A==
Date: Fri, 23 Jul 2021 08:27:57 +0000
Message-ID: <55ca7f7d8ffc4e05a512252b75d111b7@huawei.com>
References: <20210222155338.26132-1-shameerali.kolothum.thodi@huawei.com>
 <20210222155338.26132-5-shameerali.kolothum.thodi@huawei.com>
 <YEEUocRn3IfIDpLj@myrica> <903a06a9db8c45fe88158e1c35f38c25@huawei.com>
 <YPmgw5fQ59rCw2I6@myrica>
In-Reply-To: <YPmgw5fQ59rCw2I6@myrica>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.86.132]
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



> -----Original Message-----
> From: Jean-Philippe Brucker [mailto:jean-philippe@linaro.org]
> Sent: 22 July 2021 17:46
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: linux-arm-kernel@lists.infradead.org; iommu@lists.linux-foundation.org;
> kvmarm@lists.cs.columbia.edu; maz@kernel.org;
> alex.williamson@redhat.com; eric.auger@redhat.com;
> zhangfei.gao@linaro.org; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Zengtao (B) <prime.zeng@hisilicon.com>;
> linuxarm@openeuler.org; Linuxarm <linuxarm@huawei.com>
> Subject: [Linuxarm] Re: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned
> VMID for NESTED stage with BTM
> 
> Hi Shameer,
> 
> On Wed, Jul 21, 2021 at 08:54:00AM +0000, Shameerali Kolothum Thodi
> wrote:
> > > More generally I think this pinned VMID set conflicts with that of
> > > stage-2-only domains (which is the default state until a guest attaches a
> > > PASID table). Say you have one guest using DOMAIN_NESTED without
> PASID
> > > table, just DMA to IPA using VMID 0x8000. Now another guest attaches a
> > > PASID table and obtains the same VMID from KVM. The stage-2 translation
> > > might use TLB entries from the other guest, no?  They'll both create
> > > stage-2 TLB entries with {StreamWorld=NS-EL1, VMID=0x8000}
> >
> > Now that we are trying to align the KVM VMID allocation algorithm similar
> to
> > that of the ASID allocator [1], I attempted to use that for the SMMU pinned
> > VMID allocation. But the issue you have mentioned above is still valid.
> >
> > And as a solution what I have tried now is follow what pinned ASID is doing
> > in SVA,
> >  -Use xarray for private VMIDs
> >  -Get pinned VMID from KVM for DOMAIN_NESTED with PASID table
> >  -If the new pinned VMID is in use by private, then update the private
> >   VMID(VMID update to a live STE).
> >
> > This seems to work, but still need to run more tests with this though.
> >
> > > It's tempting to allocate all VMIDs through KVM instead, but that will
> > > force a dependency on KVM to use VFIO_TYPE1_NESTING_IOMMU and
> might
> > > break
> > > existing users of that extension (though I'm not sure there are any).
> > > Instead we might need to restrict the SMMU VMID bitmap to match the
> > > private VMID set in KVM.
> >
> > Another solution I have in mind is, make the new KVM VMID allocator
> common
> > between SMMUv3 and KVM. This will help to avoid all the private and
> shared
> > VMID splitting, also no need for live updates to STE VMID. One possible
> drawback
> > is less number of available KVM VMIDs but with 16 bit VMID space I am not
> sure
> > how much that is a concern.
> 
> Yes I think that works too. In practice there shouldn't be many VMIDs on
> the SMMU side, the feature's only enabled when a user wants to assign
> devices with nesting translation (unlike ASIDs where each device in the
> system gets a private ASID by default).

Ok. What about implementations that supports only stage 2? Do we
need a private VMID allocator for those or can use the same common
KVM VMID allocator?

> Note that you still need to pin all VMIDs used by the SMMU, otherwise
> you'll have to update the STE after rollover.

Sure.

> The problem we have with VFIO_TYPE1_NESTING_IOMMU might be solved by
> the
> upcoming deprecation of VFIO_*_IOMMU [2]. We need a specific sequence
> from
> userspace:
> 1. Attach VFIO group to KVM (KVM_DEV_VFIO_GROUP_ADD)
> 2. Create nesting IOMMU domain and attach the group to it
>    (VFIO_GROUP_SET_CONTAINER, VFIO_SET_IOMMU becomes
>     IOMMU_IOASID_ALLOC, VFIO_DEVICE_ATTACH_IOASID)
> Currently QEMU does 2 then 1, which would cause the SMMU to allocate a
> separate VMID.

Yes. I have observed this with my current implementation. I have a check
to see the private S2 config VMID belongs to the same domain s2_cfg, then
skip the live update to the STE VMID.

> If we wanted to extend VFIO_TYPE1_NESTING_IOMMU with
> PASID
> tables we'd need to mandate 1-2 and may break existing users. In the new
> design we can require from the start that creating a nesting IOMMU
> container through /dev/iommu *must* come with a KVM context, that way
> we're sure to reuse the existing VMID.

Ok. That helps.

Thanks,
Shameer
 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
