Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2331CE2A
	for <lists.iommu@lfdr.de>; Tue, 14 May 2019 19:41:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2961FE7A;
	Tue, 14 May 2019 17:41:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 53FC0E4F
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 17:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D1014837
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 17:41:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 May 2019 10:41:08 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga005.jf.intel.com with ESMTP; 14 May 2019 10:41:07 -0700
Date: Tue, 14 May 2019 10:44:01 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v3 02/16] iommu: Introduce cache_invalidate API
Message-ID: <20190514104401.79d563f4@jacob-builder>
In-Reply-To: <f319bd4c-3092-84e1-233a-34832551249e@arm.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-3-git-send-email-jacob.jun.pan@linux.intel.com>
	<d32d3d19-11c9-4af9-880b-bb8ebefd4f7f@redhat.com>
	<44d5ba37-a9e9-cc7a-2a3a-d32b840afa29@arm.com>
	<7807afe9-efab-9f48-4ca0-2332a7a54950@redhat.com>
	<1a5a5fad-ed21-5c79-9a9e-ff21fadfb95f@arm.com>
	<20190513151637.79c273e2@jacob-builder>
	<0da76e57-76f6-06fa-d34e-30cd0c294984@redhat.com>
	<f319bd4c-3092-84e1-233a-34832551249e@arm.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
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

Hi Thank you both for the explanation.

On Tue, 14 May 2019 11:41:24 +0100
Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:

> On 14/05/2019 08:36, Auger Eric wrote:
> > Hi Jacob,
> > 
> > On 5/14/19 12:16 AM, Jacob Pan wrote:  
> >> On Mon, 13 May 2019 18:09:48 +0100
> >> Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:
> >>  
> >>> On 13/05/2019 17:50, Auger Eric wrote:  
> >>>>> struct iommu_inv_pasid_info {
> >>>>> #define IOMMU_INV_PASID_FLAGS_PASID	(1 << 0)
> >>>>> #define IOMMU_INV_PASID_FLAGS_ARCHID	(1 << 1)
> >>>>> 	__u32	flags;
> >>>>> 	__u32	archid;
> >>>>> 	__u64	pasid;
> >>>>> };    
> >>>> I agree it does the job now. However it looks a bit strange to
> >>>> do a PASID based invalidation in my case - SMMUv3 nested stage -
> >>>> where I don't have any PASID involved.
> >>>>
> >>>> Couldn't we call it context based invalidation then? A context
> >>>> can be tagged by a PASID or/and an ARCHID.    
> >>>
> >>> I think calling it "context" would be confusing as well (I
> >>> shouldn't have used it earlier), since VT-d uses that name for
> >>> device table entries (=STE on Arm SMMU). Maybe "addr_space"?
> >>>  
> >> I am still struggling to understand what ARCHID is after scanning
> >> through SMMUv3.1 spec. It seems to be a constant for a given SMMU.
> >> Why do you need to pass it down every time? Could you point to me
> >> the document or explain a little more on ARCHID use cases.
> >> We have three fileds called pasid under this struct
> >> iommu_cache_invalidate_info{}
> >> Gets confusing :)  
> > archid is a generic term. That's why you did not find it in the
> > spec ;-)
> > 
> > On ARM SMMU the archid is called the ASID (Address Space ID, up to
> > 16 bits. The ASID is stored in the Context Descriptor Entry (your
> > PASID entry) and thus characterizes a given stage 1 translation
> > "context"/"adress space".  
> 
> Yes, another way to look at it is, for a given address space:
> * PASID tags device-IOTLB (ATC) entries.
> * ASID (here called archid) tags IOTLB entries.
> 
> They could have the same value, but it depends on the guest's
> allocation policy which isn't in our control. With my PASID patches
> for SMMUv3, they have different values. So we need both fields if we
> intend to invalidate both ATC and IOTLB with a single call.
> 
For ASID invalidation, there is also page/address selective within an
ASID, right? I guess it is CMD_TLBI_NH_VA?
So the single call to invalidate both ATC & IOTLB should share the same
address information. i.e.
struct iommu_inv_addr_info {}

Just out of curiosity, what is the advantage of having guest tag its
ATC with its own PASID? I thought you were planning to use custom
ioasid allocator to get PASID from host.

Also ASID is 16 bit as Eric said and PASID (substreamID?) is 20 bit,
right?

> Thanks,
> Jean
> 
> > 
> > At the moment the ASID is allocated per iommu domain. With aux
> > domains we should have one ASID per aux domain, Jean-Philippe said.
> > 
> > ASID tags IOTLB S1 entries. As the ASID is part of the "context
> > descriptor" which is owned by the guest, the API must pass it
> > somehow.
> > 
> > 4.4.1.2 CMD_TLBI_NH_ASID(VMID, ASID) invalidation command allows to
> > invalidate all IOTLB S1 entries for a given VMID/ASID and this is
> > the functionality which is currently missing in the API. This is
> > not an address based invalidation or a "pure" PASID based
> > invalidation. At the moment we don't support PASIDs on ARM and I
> > need this capability.
> > 
Got it.
> > Thanks
> > 
> > Eric
> > 
> > 
> >   
> >>> Thanks,
> >>> Jean
> >>>  
> >>>>
> >>>> Domain invalidation would invalidate all the contexts belonging
> >>>> to that domain.
> >>>>
> >>>> Thanks
> >>>>
> >>>> Eric    
> >>
> >> [Jacob Pan]
> >>  
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
