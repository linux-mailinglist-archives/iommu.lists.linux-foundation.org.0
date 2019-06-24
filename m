Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726951D25
	for <lists.iommu@lfdr.de>; Mon, 24 Jun 2019 23:33:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 976C0CB2;
	Mon, 24 Jun 2019 21:33:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C971A949
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 21:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 607B982C
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 21:33:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jun 2019 14:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,413,1557212400"; d="scan'208";a="244842879"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga001.jf.intel.com with ESMTP; 24 Jun 2019 14:33:11 -0700
Date: Mon, 24 Jun 2019 14:36:26 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v4 15/22] iommu/vt-d: Replace Intel specific PASID
	allocator with IOASID
Message-ID: <20190624143626.0dd8d46d@jacob-builder>
In-Reply-To: <20190618165709.00005dbf@huawei.com>
References: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1560087862-57608-16-git-send-email-jacob.jun.pan@linux.intel.com>
	<20190618165709.00005dbf@huawei.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
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

On Tue, 18 Jun 2019 16:57:09 +0100
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Sun, 9 Jun 2019 06:44:15 -0700
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
> > Make use of generic IOASID code to manage PASID allocation,
> > free, and lookup. Replace Intel specific code.
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>  
> Hi Jacob,
> 
> One question inline.
> 
Hi Jonathan,

Sorry, I got distracted and missed your review. My answer
below.

Thanks!

Jacob

> Jonathan
> 
> > ---
> >  drivers/iommu/intel-iommu.c | 11 +++++------
> >  drivers/iommu/intel-pasid.c | 36
> > ------------------------------------ drivers/iommu/intel-svm.c   |
> > 37 +++++++++++++++++++++---------------- 3 files changed, 26
> > insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-iommu.c
> > b/drivers/iommu/intel-iommu.c index 5b84994..39b63fe 100644
> > --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -5167,7 +5167,7 @@ static void auxiliary_unlink_device(struct
> > dmar_domain *domain, domain->auxd_refcnt--;
> >  
> >  	if (!domain->auxd_refcnt && domain->default_pasid > 0)
> > -		intel_pasid_free_id(domain->default_pasid);
> > +		ioasid_free(domain->default_pasid);
> >  }
> >  
> >  static int aux_domain_add_dev(struct dmar_domain *domain,
> > @@ -5185,10 +5185,9 @@ static int aux_domain_add_dev(struct
> > dmar_domain *domain, if (domain->default_pasid <= 0) {
> >  		int pasid;
> >  
> > -		pasid = intel_pasid_alloc_id(domain, PASID_MIN,
> > -
> > pci_max_pasids(to_pci_dev(dev)),
> > -					     GFP_KERNEL);
> > -		if (pasid <= 0) {
> > +		pasid = ioasid_alloc(NULL, PASID_MIN,
> > pci_max_pasids(to_pci_dev(dev)) - 1,
> > +				domain);  
> 
> Is there any point in passing the domain in as the private pointer
> here? I can't immediately see anywhere it is read back?
> 
Good point, I agree. There is no need for passing the domain. aux domain
and its defaul_pasid has 1:1 mapping.

> It is also rather confusing as the same driver stashes two different
> types of data in the same xarray.

On VT-d, there should be only one type of data for all PASID users that
needs private data. Whether it is native SVA or guest SVA. Only an
internal flag will tell them apart.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
