Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E675268EA
	for <lists.iommu@lfdr.de>; Wed, 22 May 2019 19:12:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3ADA1D6A;
	Wed, 22 May 2019 17:12:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B96FECB1
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 17:12:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 11DF483A
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 17:12:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 May 2019 10:12:36 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga007.jf.intel.com with ESMTP; 22 May 2019 10:12:35 -0700
Date: Wed, 22 May 2019 10:15:33 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v3 09/16] iommu: Introduce guest PASID bind function
Message-ID: <20190522101533.335f155b@jacob-builder>
In-Reply-To: <37d1eee7-92c1-7e07-b73d-7af82fdb1652@arm.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-10-git-send-email-jacob.jun.pan@linux.intel.com>
	<d652546a-c6ca-1cc6-1924-b016bd81a792@arm.com>
	<20190516091429.6d06f7e1@jacob-builder>
	<20190520122241.0db13f14@jacob-builder>
	<7bf71437-d75b-c4f7-d705-fcd71fc75060@arm.com>
	<20190521155029.0ab0a462@jacob-builder>
	<37d1eee7-92c1-7e07-b73d-7af82fdb1652@arm.com>
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

On Wed, 22 May 2019 16:05:53 +0100
Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:

> On 21/05/2019 23:50, Jacob Pan wrote:
> >>> /**
> >>>  * struct gpasid_bind_data - Information about device and guest
> >>> PASID binding
> >>>  * @version:	Version of this data structure
> >>>  * @format:	PASID table entry format
> >>>  * @flags:	Additional information on guest bind request
> >>>  * @gpgd:	Guest page directory base of the guest mm to bind
> >>>  * @hpasid:	Process address space ID used for the guest mm
> >>> in host IOMMU
> >>>  * @gpasid:	Process address space ID used for the guest mm
> >>> in guest IOMMU    
> >>
> >> Trying to understand the full flow:
> >> * @gpasid is the one allocated by the guest using a virtual
> >> command. The guest writes @gpgd into the virtual PASID table at
> >> index @gpasid, then sends an invalidate command to QEMU.  
> > yes  
> >> * QEMU issues a gpasid_bind ioctl (on the mdev or its container?).
> >> VFIO forwards. The IOMMU driver installs @gpgd into the PASID table
> >> using @hpasid, which is associated with the auxiliary domain.
> >>
> >> But why do we need the @hpasid field here? Does userspace know
> >> about it at all, and does VFIO need to pass it to the IOMMU driver?
> >>  
> > We need to support two guest-host PASID mappings through this API.
> > Idea comes from Kevin & Yi.
> > 1. identity mapping between host and guest PASID
> > 2. guest owns its own pasid space
> > 
> > For option 1, which will plan to support first in this series.
> > There is no need for gpasid field since gpasid=hpasid. Guest
> > allocates PASID using virtual command interface which gets a host
> > PASID. Then PASID cache invalidation in the guest will result in
> > bind_gpasid(), @gpasid is not valid in the bind data (indicated by
> > the IOMMU_SVA_GPASID_VAL flag).
> > 
> > For option 2, guest still uses virtual command to allocate guest
> > pasid, but this time QEMU does the allocation for gpasid, at the
> > same time QEMU will allocate a host pasid then maintain a G->H
> > PASID lookup. When guest invalidate its PASID cache with GPASID,
> > QEMU will find the match host PASID then pass both gpasid and
> > hpasid down to the host IOMMU driver.
> > Host IOMMU driver will store the gpgd at the hpasid entry but keep
> > track of the gpasid->hpasid mapping. Host will never program gpasid
> > in the IOMMU HW. Host IOMMU driver provides G->H PASID translation
> > for PF device drivers that emulates mdev config space, i.e. virtual
> > device composition module
> > (https://events.linuxfoundation.org/wp-content/uploads/2017/12/Hardware-Assisted-Mediated-Pass-Through-with-VFIO-Kevin-Tian-Intel.pdf).
> > 
> > These two options is a per VM choice. Hopefully the two diagrams
> > below can help to explain. I will put them in the next patch
> > headers.  
> 
> Thanks for the explanation, makes sense to me now. So the host kernel
> needs to know G->H because the guest may write GPASID into the config
> space emulated by the host device driver, and device driver then
> retrieves the HPASID via an iommu_ops callback? But the device driver
> keeps track of aux domains so isn't HPASID retrievable with
> aux_get_pasid() already?
> 
aux_get_pasid() will get domain's default pasid, which is used for
non-svm traffic on mdev. Here the gpasid bind is for svm only.
> > 
> > Option 1. Identity G-H PASID mapping diagram.
> > 
> >     .-------------.  .---------------------------.
> >     |   vIOMMU    |  | Guest process mm, FL only |
> >     |             |  '---------------------------'
> >     .----------------/
> >     | PASID Entry |--- PASID cache flush -
> >     '-------------'\                      |
> >     |             | \                     |
> >     |             |  \                    |
> >     '-------------'   \________________   |
> >                         GPASID = HPASID   |
> > Guest                  ^      ^           |
> > ------| Shadow |-------| VCMD |-----------|------------
> >       v        v       |      |           |
> > QEMU                   v      v           |
> > ------------------------------------------|------------
> > Host             HPASID = ioasid_alloc()  |
> >                     |                     v
> >                     |       sva_bind_gpasid(HPASID)
> >                     |
> >     .-------------. |  .----------------------.
> >     |   pIOMMU    | |  | Bind FL for GVA-GPA  |
> >     |             | | /'----------------------'
> >     .----------------'  |
> >     | PASID Entry |     V (Nested xlate)
> >     '----------------..---------------------.
> >     |             |   |Set SL to GPA-HPA    |
> >     |             |   '---------------------'
> >     '-------------'
> > 
> > 
> > 
> > Option 2. Non-identity G-H PASID mapping diagram.
> > 
> >     .-------------.  .---------------------------.
> >     |   vIOMMU    |  | Guest process mm, FL only |
> >     |             |  '---------------------------'
> >     .----------------/
> >     | PASID Entry |--- PASID cache flush -
> >     '-------------'\                      | .-------------.
> >     |             | \                     | |Guest driver |
> >     |             |  \                    | |writes GPASID|
> >     '-------------'   \________________   | '-------------'
> >                         GPASID            |             |
> > Guest                  ^      ^           |             |
> > ------| Shadow |-------| VCMD |-----------|------------ |
> >       v        v       |      |           |             |
> > QEMU                   v      v           |             |
> > 	    GPASID = qemu_gpasid_alloc()  |             |
> >             keep G->H PASID lookup        |             |
> >                    ^                      v             |
> > 		   |                 lookup G->H PASID  |
> > -------------------|----------------------|------------ |
> > Host             HPASID = ioasid_alloc()  |             |
> >                     |                     v             |
> >                     |     sva_bind_gpasid(HPASID,GPASID)|
> >                     |     keep H-G PASID lookup         |
> >                     |                          \
> > -------------------. .-------------. |  .----------------------.
> > \|    VDCM           | |   pIOMMU    | |  | Bind FL for GVA-GPA  |
> > | H = lookup(GPASID)| |             | | /'----------------------'
> > | write H to dev    | .----------------'  |
> > '------------------' | PASID Entry |     V (Nested xlate)
> >     '----------------..---------------------.
> >     |             |   |Set SL to GPA-HPA    |
> >     |             |   '---------------------'
> >     '-------------'
> > There is also implications in G-H pasid lookup for PRQ, that would
> > be in the later series.
> >   
> >>>  * @addr_width:	Guest address width. Paging mode can also
> >>> be derived.    
> >>
> >> What does the last sentence mean? @addr_width should probably be in
> >> @vtd if it provides implicit information.
> >>  
> > Derive 4 or 5 level paging mode from the address width. It can be in
> > @vtd but i thought this can be generic.  
> 
> Yes I think it's generic enough. It may be worth stating that this is
> the *virtual* address width, and removing or clarifying what the
> paging mode is (the sentence could be confusing on Arm, as we have
> different page granules which cannot be derived from the address
> width)
>
OK, will keep addr_width as a generic field, then remove the paging
mode comment.

Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
