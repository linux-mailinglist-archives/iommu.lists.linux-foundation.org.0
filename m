Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DF1E8C66
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 17:07:21 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 35DE2CAD;
	Tue, 29 Oct 2019 16:07:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 89407C3F
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:07:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 218B087C
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 16:07:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 09:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="283283458"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga001.jf.intel.com with ESMTP; 29 Oct 2019 09:07:14 -0700
Date: Tue, 29 Oct 2019 09:11:39 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v7 09/11] iommu/vt-d: Add bind guest PASID support
Message-ID: <20191029091139.7ddc155f@jacob-builder>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D5DE3D3@SHSMSX104.ccr.corp.intel.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-10-git-send-email-jacob.jun.pan@linux.intel.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D5CDDA6@SHSMSX104.ccr.corp.intel.com>
	<20191025103337.1e51c0c9@jacob-builder>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D5DB7B8@SHSMSX104.ccr.corp.intel.com>
	<20191028090231.4777c6a9@jacob-builder>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D5DE3D3@SHSMSX104.ccr.corp.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Raj, Ashok" <ashok.raj@intel.com>, David Woodhouse <dwmw2@infradead.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

On Tue, 29 Oct 2019 07:57:21 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jacob Pan [mailto:jacob.jun.pan@linux.intel.com]
> > Sent: Tuesday, October 29, 2019 12:03 AM
> > 
> > On Mon, 28 Oct 2019 06:03:36 +0000
> > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> >   
> > > > > > +	.sva_bind_gpasid	= intel_svm_bind_gpasid,
> > > > > > +	.sva_unbind_gpasid	=
> > > > > > intel_svm_unbind_gpasid, +#endif  
> > > > >
> > > > > again, pure PASID management logic should be separated from
> > > > > SVM. 
> > > > I am not following, these two functions are SVM functionality,
> > > > not pure PASID management which is already separated in
> > > > ioasid.c  
> > >
> > > I should say pure "scalable mode" logic. Above callbacks are not
> > > related to host SVM per se. They are serving gpasid requests from
> > > guest side, thus part of generic scalable mode capability.  
> > Got your point, but we are sharing data structures with host SVM,
> > it is very difficult and inefficient to separate the two.  
> 
> I don't think difficulty is the reason against such direction. We
> need do things right. :-) I'm fine with putting it in a TODO list,
> but at least need the right information in the 1st place to tell that
> current way is just a short-term approach, and we should revisit
> later.
I guess the fundamental question is: Should the scalable mode logic,
i.e. guest SVA at PASID granu device, be perceived as part of the
overall SVA functionality?

My view is yes, we shall share SVA and gSVA whenever we can.

The longer term, which I am working on right now, is to converge
intel_svm_bind_mm to the generic iommu_sva_bind_device() and use common
data structures as well. It is conceivable that these common structures
span across hardware architectures, also guest vs host SVA usages.

i.e. iommu_ops have
iommu_sva_bind_gpasid() for SM/gSVA
iommu_sva_bind_device() for native SVA

Or I am missing your point completely?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
