Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F8A1C487D
	for <lists.iommu@lfdr.de>; Mon,  4 May 2020 22:41:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A55A088845;
	Mon,  4 May 2020 20:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BU1FTxleb25; Mon,  4 May 2020 20:41:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98F2288836;
	Mon,  4 May 2020 20:41:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 754CEC0175;
	Mon,  4 May 2020 20:41:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 199D8C0175
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 20:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F1B7D25CBB
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 20:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXOpFquZK584 for <iommu@lists.linux-foundation.org>;
 Mon,  4 May 2020 20:41:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id ADB472050D
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 20:41:19 +0000 (UTC)
IronPort-SDR: sPALsNPNKWenkEjdG9tpeCLWzEE/omrVeolg75OzB6vu0RVEG4dthgAdAbQFNTR+0PnvbC6iNY
 Y0HPw80cMphg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 13:41:18 -0700
IronPort-SDR: b4DyWmhiDhy4qxtR8Pb8m1iBlCjvqLUinJbs4j14tT12w8H1CCchpLkLEJWAuUWDjBBLTawzxM
 Tb80S8PufxpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,353,1583222400"; d="scan'208";a="338437724"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 04 May 2020 13:41:18 -0700
Date: Mon, 4 May 2020 13:47:23 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v6 17/25] iommu/arm-smmu-v3: Implement
 iommu_sva_bind/unbind()
Message-ID: <20200504134723.54e2ebcd@jacob-builder>
In-Reply-To: <20200504164351.GJ170104@myrica>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-18-jean-philippe@linaro.org>
 <20200430141617.6ad4be4c@jacob-builder>
 <20200504164351.GJ170104@myrica>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, fenghua.yu@intel.com,
 hch@infradead.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, catalin.marinas@arm.com, felix.kuehling@amd.com,
 will@kernel.org, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 4 May 2020 18:43:51 +0200
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> On Thu, Apr 30, 2020 at 02:16:17PM -0700, Jacob Pan wrote:
> > > +static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
> > > +					 struct mm_struct *mm,
> > > +					 unsigned long start,
> > > unsigned long end) +{
> > > +	/* TODO: invalidate ATS */
> > > +}
> > > +
> > > +static void arm_smmu_mm_release(struct mmu_notifier *mn, struct
> > > mm_struct *mm) +{
> > > +	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
> > > +	struct arm_smmu_domain *smmu_domain;
> > > +
> > > +	mutex_lock(&arm_smmu_sva_lock);
> > > +	if (smmu_mn->cleared) {
> > > +		mutex_unlock(&arm_smmu_sva_lock);
> > > +		return;
> > > +	}
> > > +
> > > +	smmu_domain = smmu_mn->domain;
> > > +
> > > +	/*
> > > +	 * DMA may still be running. Keep the cd valid but
> > > disable
> > > +	 * translation, so that new events will still result in
> > > stall.
> > > +	 */  
> > Does "disable translation" also disable translated requests?  
> 
> No it doesn't disable translated requests, it only prevents the SMMU
> from accessing the pgd.
> 
OK. same as VT-d.

> > I guess
> > release is called after tlb invalidate range, so assuming no more
> > devTLB left to generate translated request?  
> 
> I'm counting on the invalidate below (here a TODO, implemented in next
> patch) to drop all devTLB entries. After that invalidate, the device:
> * issues a Translation Request, returns with R=W=0 because we disabled
>   translation (and it isn't present in the SMMU TLB).
> * issues a Page Request, returns with InvalidRequest because
>   mmget_not_zero() fails.
> 
Same flow. Thanks for the explanation.

> >   
> > > +	arm_smmu_write_ctx_desc(smmu_domain, mm->pasid,
> > > &invalid_cd); +
> > > +	arm_smmu_tlb_inv_asid(smmu_domain->smmu,
> > > smmu_mn->cd->asid);
> > > +	/* TODO: invalidate ATS */
> > > +  
> > If mm release is called after tlb invalidate range, is it still
> > necessary to invalidate again?  
> 
> No, provided all mappings from the address space are unmapped and
> invalidated. I'll double check, but in my tests invalidate range
> didn't seem to be called for all mappings on mm exit, so I believe we
> do need this.
> 
I think it is safe to invalidate again. There was a concern that mm
release may delete IOMMU driver from the notification list and miss tlb
invalidate range. I had a hard time to confirm that with ftrace while
killing a process, many lost events.


> Thanks,
> Jean
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
