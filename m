Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9271AABF1
	for <lists.iommu@lfdr.de>; Wed, 15 Apr 2020 17:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 710F68680C;
	Wed, 15 Apr 2020 15:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCa+XcgvptKE; Wed, 15 Apr 2020 15:33:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C08B863E8;
	Wed, 15 Apr 2020 15:33:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EB82C1D8D;
	Wed, 15 Apr 2020 15:33:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74064C0172
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5EB6F86416
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjUFHOT-nXP7 for <iommu@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 15:33:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5ED8686408
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 15:33:00 +0000 (UTC)
IronPort-SDR: BH2+Sns9qhWnCmyAE0CgORGxBr0nGFxFqT8+WybQJTc6tBGXEZT6zlrG2A8/jTmkanmHIxYf61
 pfBCjrJpcM4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 08:32:59 -0700
IronPort-SDR: zAszhCrP0cBmRUBK375yX4GljVs7Z18jsJ86HFuEIjlqxcIX/EPEnOkPYGrkiVj40CsJOWBRfI
 9ZxQ4i8L2FjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="332530368"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 15 Apr 2020 08:32:59 -0700
Date: Wed, 15 Apr 2020 08:38:54 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/3] iommu/uapi: Define uapi version and capabilities
Message-ID: <20200415083854.6fefac01@jacob-builder>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D81F901@SHSMSX104.ccr.corp.intel.com>
References: <1585178227-17061-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200326092316.GA31648@infradead.org>
 <20200326094442.5be042ce@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECB45@SHSMSX104.ccr.corp.intel.com>
 <20200327074702.GA27959@infradead.org>
 <20200327165335.397f24a3@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7FE150@SHSMSX104.ccr.corp.intel.com>
 <20200330090746.23c5599c@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D8011A9@SHSMSX104.ccr.corp.intel.com>
 <20200331085444.44bee0bb@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D803AFF@SHSMSX104.ccr.corp.intel.com>
 <20200402113604.6eea1e6f@jacob-builder>
 <20200413134157.395981a6@jacob-builder>
 <20200413162129.313b3b5a@w520.home>
 <20200413220515.25a107b6@jacob-builder>
 <20200414101358.3ae66ac5@w520.home>
 <20200414101304.27e587eb@jacob-builder>
 <20200414153226.30d8cab3@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D81F901@SHSMSX104.ccr.corp.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
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

On Tue, 14 Apr 2020 23:47:40 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Sent: Wednesday, April 15, 2020 6:32 AM
> > 
> > On Tue, 14 Apr 2020 10:13:04 -0700
> > Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> >   
> > > > > >  In any of the proposed solutions, the
> > > > > > IOMMU driver is ultimately responsible for validating the
> > > > > > user data, so do we want vfio performing the
> > > > > > copy_from_user() to an object that could later be assumed
> > > > > > to be sanitized, or should vfio just pass a user pointer to
> > > > > > make it obvious that the consumer is responsible for all
> > > > > > the user protections?  Seems like the latter.  
> > > > > I like the latter as well.
> > > > >  
> > On a second thought, I think the former is better. Two reasons:
> > 
> > 1. IOMMU API such as page_response is also used in baremetal. So it
> > is not suitable to pass a __user *.
> > https://www.spinics.net/lists/arm-kernel/msg798677.html  
> 
> You can have a wrapped version accepting a __user* and an internal
> version for kernel pointers.
> 
I have thought about that also but the problem is that some of the
flags are processed in the vendor IOMMU ops so it is hard to do that in
a generic wrapper.

> > 
> > 2. Some data are in the mandatory (fixed offset, never removed or
> > extended) portion of the uAPI structure. It is simpler for VFIO to
> > extract that and pass it to IOMMU API. For example, the PASID value
> > used for unbind_gpasid(). VFIO also need to sanitize the PASID
> > value to make sure it belongs to the same VM that did the
> > allocation.  
> 
> I don't think this makes much difference. If anyway you still plan to
> let IOMMU driver parse some user pointers, why not making a clear
> split to have it sparse all IOMMU specific fields?
>
The plan is not to have IOMMU driver parse user pointers. This is the
"former" case in Alex's comment. I.e. vfio performing the
copy_from_user based on argsz in IOMMU uAPI.
 
> Thanks
> Kevin
> 
> > 
> >   
> > > > > >  That still really
> > > > > > doesn't address what's in that user data blob yet, but the
> > > > > > vfio interface could be:
> > > > > >
> > > > > > struct {
> > > > > > 	__u32 argsz;
> > > > > > 	__u32 flags;
> > > > > > 	__u8  data[];
> > > > > > }
> > > > > >
> > > > > > Where flags might be partitioned like we do for
> > > > > > DEVICE_FEATURE to indicate the format of data and what vfio
> > > > > > should do with it, and data might simply be defined as a
> > > > > > (__u64 __user *). 
> > > > > So, __user * will be passed to IOMMU driver if VFIO checks
> > > > > minsz include flags and they are valid.
> > > > > IOMMU driver can copy the rest based on the mandatory
> > > > > version/minsz and flags in the IOMMU uAPI structs.
> > > > > Does it sound right? This is really choice #2.  
> > > >
> > > > Sounds like each IOMMU UAPI struct just needs to have an
> > > > embedded size and flags field, but yes.
> > > >  
> > > Yes, an argsz field can be added to each UAPI. There are already
> > > flags or the equivalent. IOMMU driver can process the __user *
> > > based on the argsz, flags, check argsz against
> > > offsetofend(iommu_uapi_struct, last_element), etc.;  

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
