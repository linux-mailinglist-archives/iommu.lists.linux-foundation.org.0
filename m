Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165C19A1E4
	for <lists.iommu@lfdr.de>; Wed,  1 Apr 2020 00:27:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 96A9E24BE6;
	Tue, 31 Mar 2020 22:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDqm1bf10Q9I; Tue, 31 Mar 2020 22:27:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5667B21FA8;
	Tue, 31 Mar 2020 22:27:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D5F6C07FF;
	Tue, 31 Mar 2020 22:27:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CBC1C07FF
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 22:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 35A4C21FA8
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 22:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmfmFg2HsssG for <iommu@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 22:27:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 9A64C204D7
 for <iommu@lists.linux-foundation.org>; Tue, 31 Mar 2020 22:27:40 +0000 (UTC)
IronPort-SDR: wbin6NZJiXl6dtoWz/zv6XHgobvHs6mZFqssXNaXqiZA054vUhdb5uPVWW9E9KtW9GJk5zEuYI
 zjwyBYeM/Olg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 15:27:40 -0700
IronPort-SDR: sm5w+8Oj3UiLPWOp2oWKzbwK5CAF0dUl41izCr8bm23fIOz9KrC7KNrS8TCcWxaCU/TdyyK92T
 0eu547XSuAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,329,1580803200"; d="scan'208";a="295144707"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2020 15:27:39 -0700
Date: Tue, 31 Mar 2020 15:33:27 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V10 09/11] iommu/vt-d: Cache virtual command capability
 register
Message-ID: <20200331153327.50219c12@jacob-builder>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7FA0E7@SHSMSX104.ccr.corp.intel.com>
References: <1584746861-76386-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1584746861-76386-10-git-send-email-jacob.jun.pan@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7FA0E7@SHSMSX104.ccr.corp.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
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

On Sat, 28 Mar 2020 10:04:38 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Sent: Saturday, March 21, 2020 7:28 AM
> > 
> > Virtual command registers are used in the guest only, to prevent
> > vmexit cost, we cache the capability and store it during
> > initialization.
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> > 
> > ---
> > v7 Reviewed by Eric & Baolu
> > ---
> > ---
> >  drivers/iommu/dmar.c        | 1 +
> >  include/linux/intel-iommu.h | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
> > index 4d6b7b5b37ee..3b36491c8bbb 100644
> > --- a/drivers/iommu/dmar.c
> > +++ b/drivers/iommu/dmar.c
> > @@ -963,6 +963,7 @@ static int map_iommu(struct intel_iommu *iommu,
> > u64 phys_addr)
> >  		warn_invalid_dmar(phys_addr, " returns all ones");
> >  		goto unmap;
> >  	}
> > +	iommu->vccap = dmar_readq(iommu->reg + DMAR_VCCAP_REG);
> > 
> >  	/* the registers might be more than one page */
> >  	map_size = max_t(int, ecap_max_iotlb_offset(iommu->ecap),
> > diff --git a/include/linux/intel-iommu.h
> > b/include/linux/intel-iommu.h index 43539713b3b3..ccbf164fb711
> > 100644 --- a/include/linux/intel-iommu.h
> > +++ b/include/linux/intel-iommu.h
> > @@ -194,6 +194,9 @@
> >  #define ecap_max_handle_mask(e) ((e >> 20) & 0xf)
> >  #define ecap_sc_support(e)	((e >> 7) & 0x1) /* Snooping
> > Control */
> > 
> > +/* Virtual command interface capabilities */  
> 
> capabilities -> capability
Will do, I was thinking the future :)

Thanks,

Jacob
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> 
> > +#define vccap_pasid(v)		((v & DMA_VCS_PAS)) /* PASID
> > allocation */
> > +
> >  /* IOTLB_REG */
> >  #define DMA_TLB_FLUSH_GRANU_OFFSET  60
> >  #define DMA_TLB_GLOBAL_FLUSH (((u64)1) << 60)
> > @@ -287,6 +290,7 @@
> > 
> >  /* PRS_REG */
> >  #define DMA_PRS_PPR	((u32)1)
> > +#define DMA_VCS_PAS	((u64)1)
> > 
> >  #define IOMMU_WAIT_OP(iommu, offset, op, cond, sts)
> > 	\
> >  do
> > {
> > \ @@ -537,6 +541,7 @@ struct intel_iommu { u64
> > reg_size; /* size of hw register set */ u64		cap;
> >  	u64		ecap;
> > +	u64		vccap;
> >  	u32		gcmd; /* Holds TE, EAFL. Don't need
> > SRTP, SFL, WBF */
> >  	raw_spinlock_t	register_lock; /* protect register
> > handling */ int		seq_id;	/* sequence id of the
> > iommu */ --
> > 2.7.4  
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
