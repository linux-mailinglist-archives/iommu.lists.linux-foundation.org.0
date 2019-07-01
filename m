Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD020CA0
	for <lists.iommu@lfdr.de>; Thu, 16 May 2019 18:11:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BCB59C6D;
	Thu, 16 May 2019 16:11:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E8A53BA0
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 16:11:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 80C388FF
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 16:11:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 09:11:34 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga007.jf.intel.com with ESMTP; 16 May 2019 09:11:34 -0700
Date: Thu, 16 May 2019 09:14:29 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v3 09/16] iommu: Introduce guest PASID bind function
Message-ID: <20190516091429.6d06f7e1@jacob-builder>
In-Reply-To: <d652546a-c6ca-1cc6-1924-b016bd81a792@arm.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-10-git-send-email-jacob.jun.pan@linux.intel.com>
	<d652546a-c6ca-1cc6-1924-b016bd81a792@arm.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
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

On Thu, 16 May 2019 15:14:40 +0100
Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:

> Hi Jacob,
> 
> On 03/05/2019 23:32, Jacob Pan wrote:
> > +/**
> > + * struct gpasid_bind_data - Information about device and guest
> > PASID binding
> > + * @gcr3:	Guest CR3 value from guest mm
> > + * @pasid:	Process address space ID used for the guest mm
> > + * @addr_width:	Guest address width. Paging mode can also
> > be derived.
> > + */
> > +struct gpasid_bind_data {
> > +	__u64 gcr3;
> > +	__u32 pasid;
> > +	__u32 addr_width;
> > +	__u32 flags;
> > +#define	IOMMU_SVA_GPASID_SRE	BIT(0) /* supervisor
> > request */
> > +	__u8 padding[4];
> > +};  
> 
> Could you wrap this structure into a generic one like we now do for
> bind_pasid_table? It would make the API easier to extend, because if
> we ever add individual PASID bind on Arm (something I'd like to do for
> virtio-iommu, eventually) it will have different parameters, as our
> PASID table entry has a lot of fields describing the page table
> format.
> 
> Maybe something like the following would do?
> 
> struct gpasid_bind_data {
> #define IOMMU_GPASID_BIND_VERSION_1 1
> 	__u32 version;
> #define IOMMU_GPASID_BIND_FORMAT_INTEL_VTD	1
> 	__u32 format;
> 	union {
> 		// the current gpasid_bind_data:
> 		struct gpasid_bind_intel_vtd vtd;
> 	};
> };
> 
OK, sounds great.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
