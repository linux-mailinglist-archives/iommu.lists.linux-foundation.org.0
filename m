Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF318DE81
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 22:13:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 43709DC5;
	Wed, 14 Aug 2019 20:13:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C93DC84
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 20:13:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5FAFF87E
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 20:13:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2019 13:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,386,1559545200"; d="scan'208";a="170894181"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga008.jf.intel.com with ESMTP; 14 Aug 2019 13:13:43 -0700
Date: Wed, 14 Aug 2019 13:17:26 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v4 21/22] iommu/vt-d: Support flushing more translation
	cache types
Message-ID: <20190814131726.06e7423c@jacob-builder>
In-Reply-To: <9d678164-219c-80f9-c1be-121c097c691a@redhat.com>
References: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1560087862-57608-22-git-send-email-jacob.jun.pan@linux.intel.com>
	<9d678164-219c-80f9-c1be-121c097c691a@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Thu, 18 Jul 2019 10:35:37 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Jacob,
> 
> On 6/9/19 3:44 PM, Jacob Pan wrote:
> > When Shared Virtual Memory is exposed to a guest via vIOMMU,
> > scalable IOTLB invalidation may be passed down from outside IOMMU
> > subsystems. This patch adds invalidation functions that can be used
> > for additional translation cache types.
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  drivers/iommu/dmar.c        | 50
> > +++++++++++++++++++++++++++++++++++++++++++++
> > include/linux/intel-iommu.h | 21 +++++++++++++++---- 2 files
> > changed, 67 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
> > index 6d969a1..0cda6fb 100644
> > --- a/drivers/iommu/dmar.c
> > +++ b/drivers/iommu/dmar.c
> > @@ -1357,6 +1357,21 @@ void qi_flush_iotlb(struct intel_iommu
> > *iommu, u16 did, u64 addr, qi_submit_sync(&desc, iommu);
> >  }
> >  
> > +/* PASID-based IOTLB Invalidate */
> > +void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u64 addr,
> > u32 pasid,
> > +		unsigned int size_order, u64 granu, int ih)
> > +{
> > +	struct qi_desc desc;  
> nit: you could also init to {};
> > +
> > +	desc.qw0 = QI_EIOTLB_PASID(pasid) | QI_EIOTLB_DID(did) |
> > +		QI_EIOTLB_GRAN(granu) | QI_EIOTLB_TYPE;
> > +	desc.qw1 = QI_EIOTLB_ADDR(addr) | QI_EIOTLB_IH(ih) |
> > +		QI_EIOTLB_AM(size_order);
> > +	desc.qw2 = 0;
> > +	desc.qw3 = 0;
> > +	qi_submit_sync(&desc, iommu);
> > +}
> > +
> >  void qi_flush_dev_iotlb(struct intel_iommu *iommu, u16 sid, u16
> > pfsid, u16 qdep, u64 addr, unsigned mask)
> >  {
> > @@ -1380,6 +1395,41 @@ void qi_flush_dev_iotlb(struct intel_iommu
> > *iommu, u16 sid, u16 pfsid, qi_submit_sync(&desc, iommu);
> >  }
> >  
> > +/* PASID-based device IOTLB Invalidate */
> > +void qi_flush_dev_piotlb(struct intel_iommu *iommu, u16 sid, u16
> > pfsid,
> > +		u32 pasid,  u16 qdep, u64 addr, unsigned size, u64
> > granu)  
> s/size/size_order
> > +{
> > +	struct qi_desc desc;
> > +
> > +	desc.qw0 = QI_DEV_EIOTLB_PASID(pasid) |
> > QI_DEV_EIOTLB_SID(sid) |
> > +		QI_DEV_EIOTLB_QDEP(qdep) | QI_DEIOTLB_TYPE |
> > +		QI_DEV_IOTLB_PFSID(pfsid);  
> maybe add a comment to remind MIP hint is sent to 0 as of now.
> > +	desc.qw1 = QI_DEV_EIOTLB_GLOB(granu);
> > +
> > +	/* If S bit is 0, we only flush a single page. If S bit is
> > set,
> > +	 * The least significant zero bit indicates the size. VT-d
> > spec
> > +	 * 6.5.2.6
> > +	 */
> > +	if (!size)
> > +		desc.qw0 |= QI_DEV_EIOTLB_ADDR(addr) &
> > ~QI_DEV_EIOTLB_SIZE;  
> this is qw1.
my mistake.
> > +	else {
> > +		unsigned long mask = 1UL << (VTD_PAGE_SHIFT +
> > size);  
> don't you miss a "- 1 " here?
your are right
> > +
> > +		desc.qw1 |= QI_DEV_EIOTLB_ADDR(addr & ~mask) |
> > QI_DEV_EIOTLB_SIZE;  
> desc.qw1 |= addr & ~mask | QI_DEV_EIOTLB_SIZE;
> ie. I don't think QI_DEV_EIOTLB_ADDR is useful here?
> 
> 
> So won't the following lines do the job?
> 
> unsigned long mask = 1UL << (VTD_PAGE_SHIFT + size) -1;
> desc.qw1 |= addr & ~mask;
> if (size)
>     desc.qw1 |= QI_DEV_EIOTLB_SIZE
that would work too, and simpler. thanks for the suggestion. will
change.
> > +	}
> > +	qi_submit_sync(&desc, iommu);
> > +}
> > +
> > +void qi_flush_pasid_cache(struct intel_iommu *iommu, u16 did, u64
> > granu, int pasid) +{
> > +	struct qi_desc desc;
> > +
> > +	desc.qw0 = QI_PC_TYPE | QI_PC_DID(did) | QI_PC_GRAN(granu)
> > | QI_PC_PASID(pasid);  
> nit: reorder the fields according to the spec, easier to check if any
> is missing.
sounds good.

> > +	desc.qw1 = 0;
> > +	desc.qw2 = 0;
> > +	desc.qw3 = 0;
> > +	qi_submit_sync(&desc, iommu);
> > +}
> >  /*
> >   * Disable Queued Invalidation interface.
> >   */
> > diff --git a/include/linux/intel-iommu.h
> > b/include/linux/intel-iommu.h index 94d3a9a..1cdb35b 100644
> > --- a/include/linux/intel-iommu.h
> > +++ b/include/linux/intel-iommu.h
> > @@ -339,7 +339,7 @@ enum {
> >  #define QI_IOTLB_GRAN(gran) 	(((u64)gran) >>
> > (DMA_TLB_FLUSH_GRANU_OFFSET-4)) #define QI_IOTLB_ADDR(addr)
> > (((u64)addr) & VTD_PAGE_MASK) #define
> > QI_IOTLB_IH(ih)		(((u64)ih) << 6) -#define
> > QI_IOTLB_AM(am)		(((u8)am)) +#define
> > QI_IOTLB_AM(am)		(((u8)am) & 0x3f) 
> >  #define QI_CC_FM(fm)		(((u64)fm) << 48)
> >  #define QI_CC_SID(sid)		(((u64)sid) << 32)
> > @@ -357,17 +357,22 @@ enum {
> >  #define QI_PC_DID(did)		(((u64)did) << 16)
> >  #define QI_PC_GRAN(gran)	(((u64)gran) << 4)
> >  
> > -#define QI_PC_ALL_PASIDS	(QI_PC_TYPE | QI_PC_GRAN(0))
> > -#define QI_PC_PASID_SEL		(QI_PC_TYPE | QI_PC_GRAN(1))
> > +/* PASID cache invalidation granu */
> > +#define QI_PC_ALL_PASIDS	0
> > +#define QI_PC_PASID_SEL		1
> >  
> >  #define QI_EIOTLB_ADDR(addr)	((u64)(addr) & VTD_PAGE_MASK)
> >  #define QI_EIOTLB_GL(gl)	(((u64)gl) << 7)
> >  #define QI_EIOTLB_IH(ih)	(((u64)ih) << 6)
> > -#define QI_EIOTLB_AM(am)	(((u64)am))
> > +#define QI_EIOTLB_AM(am)	(((u64)am) & 0x3f)
> >  #define QI_EIOTLB_PASID(pasid) 	(((u64)pasid) << 32)
> >  #define QI_EIOTLB_DID(did)	(((u64)did) << 16)
> >  #define QI_EIOTLB_GRAN(gran) 	(((u64)gran) << 4)
> >  
> > +/* QI Dev-IOTLB inv granu */
> > +#define QI_DEV_IOTLB_GRAN_ALL		1
> > +#define QI_DEV_IOTLB_GRAN_PASID_SEL	0
> > +
> >  #define QI_DEV_EIOTLB_ADDR(a)	((u64)(a) & VTD_PAGE_MASK)
> >  #define QI_DEV_EIOTLB_SIZE	(((u64)1) << 11)
> >  #define QI_DEV_EIOTLB_GLOB(g)	((u64)g)
> > @@ -658,8 +663,16 @@ extern void qi_flush_context(struct
> > intel_iommu *iommu, u16 did, u16 sid, u8 fm, u64 type);
> >  extern void qi_flush_iotlb(struct intel_iommu *iommu, u16 did, u64
> > addr, unsigned int size_order, u64 type);
> > +extern void qi_flush_piotlb(struct intel_iommu *iommu, u16 did,
> > u64 addr,
> > +			u32 pasid, unsigned int size_order, u64
> > type, int ih); extern void qi_flush_dev_iotlb(struct intel_iommu
> > *iommu, u16 sid, u16 pfsid, u16 qdep, u64 addr, unsigned mask);
> > +
> > +extern void qi_flush_dev_piotlb(struct intel_iommu *iommu, u16
> > sid, u16 pfsid,
> > +			u32 pasid, u16 qdep, u64 addr, unsigned
> > size, u64 granu);  
> s/size/size_order
> > +
> > +extern void qi_flush_pasid_cache(struct intel_iommu *iommu, u16
> > did, u64 granu, int pasid); +
> >  extern int qi_submit_sync(struct qi_desc *desc, struct intel_iommu
> > *iommu); 
> >  extern int dmar_ir_support(void);
> >   
> 
> Thanks
> 
> Eric

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
