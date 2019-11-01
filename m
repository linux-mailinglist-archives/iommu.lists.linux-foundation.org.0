Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4B7ECA35
	for <lists.iommu@lfdr.de>; Fri,  1 Nov 2019 22:24:41 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8F2A4DE0;
	Fri,  1 Nov 2019 21:24:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AAA0ADAB
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 21:24:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EE76C466
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 21:24:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2019 14:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,257,1569308400"; d="scan'208";a="284304360"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2019 14:24:33 -0700
Date: Fri, 1 Nov 2019 14:28:59 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v7 10/11] iommu/vt-d: Support flushing more translation
	cache types
Message-ID: <20191101142859.708a584d@jacob-builder>
In-Reply-To: <40776827-c053-2a30-5606-d4ccdbd35fc8@linux.intel.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-11-git-send-email-jacob.jun.pan@linux.intel.com>
	<40776827-c053-2a30-5606-d4ccdbd35fc8@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	Jonathan Cameron <jic23@kernel.org>
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

On Sat, 26 Oct 2019 10:22:43 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi,
> 
> On 10/25/19 3:55 AM, Jacob Pan wrote:
> > When Shared Virtual Memory is exposed to a guest via vIOMMU,
> > scalable IOTLB invalidation may be passed down from outside IOMMU
> > subsystems. This patch adds invalidation functions that can be used
> > for additional translation cache types.
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >   drivers/iommu/dmar.c        | 46
> > +++++++++++++++++++++++++++++++++++++++++++++
> > drivers/iommu/intel-pasid.c |  3 ++- include/linux/intel-iommu.h |
> > 21 +++++++++++++++++---- 3 files changed, 65 insertions(+), 5
> > deletions(-)
> > 
> > diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
> > index 49bb7d76e646..0ce2d32ff99e 100644
> > --- a/drivers/iommu/dmar.c
> > +++ b/drivers/iommu/dmar.c
> > @@ -1346,6 +1346,20 @@ void qi_flush_iotlb(struct intel_iommu
> > *iommu, u16 did, u64 addr, qi_submit_sync(&desc, iommu);
> >   }
> >   
> > +/* PASID-based IOTLB Invalidate */
> > +void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u64 addr,
> > u32 pasid,
> > +		unsigned int size_order, u64 granu, int ih)
> > +{
> > +	struct qi_desc desc = {.qw2 = 0, .qw3 = 0};
> > +
> > +	desc.qw0 = QI_EIOTLB_PASID(pasid) | QI_EIOTLB_DID(did) |
> > +		QI_EIOTLB_GRAN(granu) | QI_EIOTLB_TYPE;
> > +	desc.qw1 = QI_EIOTLB_ADDR(addr) | QI_EIOTLB_IH(ih) |
> > +		QI_EIOTLB_AM(size_order);
> > +
> > +	qi_submit_sync(&desc, iommu);
> > +}
> > +
> >   void qi_flush_dev_iotlb(struct intel_iommu *iommu, u16 sid, u16
> > pfsid, u16 qdep, u64 addr, unsigned mask)
> >   {
> > @@ -1369,6 +1383,38 @@ void qi_flush_dev_iotlb(struct intel_iommu
> > *iommu, u16 sid, u16 pfsid, qi_submit_sync(&desc, iommu);
> >   }
> >   
> > +/* PASID-based device IOTLB Invalidate */
> > +void qi_flush_dev_piotlb(struct intel_iommu *iommu, u16 sid, u16
> > pfsid,
> > +		u32 pasid,  u16 qdep, u64 addr, unsigned
> > size_order, u64 granu) +{
> > +	struct qi_desc desc;  
> 
> Do you need to set qw2 and qw3 to 0?
> 
right, forgot to add
	struct qi_desc desc = {.qw2 = 0, .qw3 = 0};

> > +
> > +	desc.qw0 = QI_DEV_EIOTLB_PASID(pasid) |
> > QI_DEV_EIOTLB_SID(sid) |
> > +		QI_DEV_EIOTLB_QDEP(qdep) | QI_DEIOTLB_TYPE |
> > +		QI_DEV_IOTLB_PFSID(pfsid);
> > +	desc.qw1 = QI_DEV_EIOTLB_GLOB(granu);
> > +
> > +	/* If S bit is 0, we only flush a single page. If S bit is
> > set,
> > +	 * The least significant zero bit indicates the
> > invalidation address
> > +	 * range. VT-d spec 6.5.2.6.
> > +	 * e.g. address bit 12[0] indicates 8KB, 13[0] indicates
> > 16KB.
> > +	 */
> > +	if (!size_order) {
> > +		desc.qw0 |= QI_DEV_EIOTLB_ADDR(addr) &
> > ~QI_DEV_EIOTLB_SIZE;
> > +	} else {
> > +		unsigned long mask = 1UL << (VTD_PAGE_SHIFT +
> > size_order);
> > +		desc.qw1 |= QI_DEV_EIOTLB_ADDR(addr & ~mask) |
> > QI_DEV_EIOTLB_SIZE;
> > +	}
> > +	qi_submit_sync(&desc, iommu);
> > +}
> > +
> > +void qi_flush_pasid_cache(struct intel_iommu *iommu, u16 did, u64
> > granu, int pasid) +{
> > +	struct qi_desc desc = {.qw1 = 0, .qw2 = 0, .qw3 = 0};
> > +
> > +	desc.qw0 = QI_PC_PASID(pasid) | QI_PC_DID(did) |
> > QI_PC_GRAN(granu) | QI_PC_TYPE;
> > +	qi_submit_sync(&desc, iommu);
> > +}
> >   /*
> >    * Disable Queued Invalidation interface.
> >    */
> > diff --git a/drivers/iommu/intel-pasid.c
> > b/drivers/iommu/intel-pasid.c index f846a907cfcf..6d7a701ef4d3
> > 100644 --- a/drivers/iommu/intel-pasid.c
> > +++ b/drivers/iommu/intel-pasid.c
> > @@ -491,7 +491,8 @@ pasid_cache_invalidation_with_pasid(struct
> > intel_iommu *iommu, {
> >   	struct qi_desc desc;
> >   
> > -	desc.qw0 = QI_PC_DID(did) | QI_PC_PASID_SEL |
> > QI_PC_PASID(pasid);
> > +	desc.qw0 = QI_PC_DID(did) | QI_PC_GRAN(QI_PC_PASID_SEL) |
> > +		QI_PC_PASID(pasid) | QI_PC_TYPE;
> >   	desc.qw1 = 0;
> >   	desc.qw2 = 0;
> >   	desc.qw3 = 0;
> > diff --git a/include/linux/intel-iommu.h
> > b/include/linux/intel-iommu.h index 6c74c71b1ebf..a25fb3a0ea5b
> > 100644 --- a/include/linux/intel-iommu.h
> > +++ b/include/linux/intel-iommu.h
> > @@ -332,7 +332,7 @@ enum {
> >   #define QI_IOTLB_GRAN(gran) 	(((u64)gran) >>
> > (DMA_TLB_FLUSH_GRANU_OFFSET-4)) #define QI_IOTLB_ADDR(addr)
> > (((u64)addr) & VTD_PAGE_MASK) #define
> > QI_IOTLB_IH(ih)		(((u64)ih) << 6) -#define
> > QI_IOTLB_AM(am)		(((u8)am)) +#define
> > QI_IOTLB_AM(am)		(((u8)am) & 0x3f) 
> >   #define QI_CC_FM(fm)		(((u64)fm) << 48)
> >   #define QI_CC_SID(sid)		(((u64)sid) << 32)
> > @@ -350,16 +350,21 @@ enum {
> >   #define QI_PC_DID(did)		(((u64)did) << 16)
> >   #define QI_PC_GRAN(gran)	(((u64)gran) << 4)
> >   
> > -#define QI_PC_ALL_PASIDS	(QI_PC_TYPE | QI_PC_GRAN(0))
> > -#define QI_PC_PASID_SEL		(QI_PC_TYPE | QI_PC_GRAN(1))
> > +/* PASID cache invalidation granu */
> > +#define QI_PC_ALL_PASIDS	0
> > +#define QI_PC_PASID_SEL		1
> >   
> >   #define QI_EIOTLB_ADDR(addr)	((u64)(addr) & VTD_PAGE_MASK)
> >   #define QI_EIOTLB_IH(ih)	(((u64)ih) << 6)
> > -#define QI_EIOTLB_AM(am)	(((u64)am))
> > +#define QI_EIOTLB_AM(am)	(((u64)am) & 0x3f)
> >   #define QI_EIOTLB_PASID(pasid) 	(((u64)pasid) << 32)
> >   #define QI_EIOTLB_DID(did)	(((u64)did) << 16)
> >   #define QI_EIOTLB_GRAN(gran) 	(((u64)gran) << 4)
> >   
> > +/* QI Dev-IOTLB inv granu */
> > +#define QI_DEV_IOTLB_GRAN_ALL		1
> > +#define QI_DEV_IOTLB_GRAN_PASID_SEL	0
> > +
> >   #define QI_DEV_EIOTLB_ADDR(a)	((u64)(a) & VTD_PAGE_MASK)
> >   #define QI_DEV_EIOTLB_SIZE	(((u64)1) << 11)
> >   #define QI_DEV_EIOTLB_GLOB(g)	((u64)g)
> > @@ -655,8 +660,16 @@ extern void qi_flush_context(struct
> > intel_iommu *iommu, u16 did, u16 sid, u8 fm, u64 type);
> >   extern void qi_flush_iotlb(struct intel_iommu *iommu, u16 did,
> > u64 addr, unsigned int size_order, u64 type);
> > +extern void qi_flush_piotlb(struct intel_iommu *iommu, u16 did,
> > u64 addr,
> > +			u32 pasid, unsigned int size_order, u64
> > type, int ih); extern void qi_flush_dev_iotlb(struct intel_iommu
> > *iommu, u16 sid, u16 pfsid, u16 qdep, u64 addr, unsigned mask);
> > +
> > +extern void qi_flush_dev_piotlb(struct intel_iommu *iommu, u16
> > sid, u16 pfsid,
> > +			u32 pasid, u16 qdep, u64 addr, unsigned
> > size_order, u64 granu); +
> > +extern void qi_flush_pasid_cache(struct intel_iommu *iommu, u16
> > did, u64 granu, int pasid); +
> >   extern int qi_submit_sync(struct qi_desc *desc, struct
> > intel_iommu *iommu); 
> >   extern int dmar_ir_support(void);
> >   
> 
> Best regards,
> baolu

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
