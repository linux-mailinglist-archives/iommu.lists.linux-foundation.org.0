Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6419805B
	for <lists.iommu@lfdr.de>; Mon, 30 Mar 2020 18:02:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 539B622882;
	Mon, 30 Mar 2020 16:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHf0LzutEVYM; Mon, 30 Mar 2020 16:02:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 31FE522DB0;
	Mon, 30 Mar 2020 16:02:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B7C6C07FF;
	Mon, 30 Mar 2020 16:02:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2592C07FF
 for <iommu@lists.linux-foundation.org>; Mon, 30 Mar 2020 16:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A931A2049A
 for <iommu@lists.linux-foundation.org>; Mon, 30 Mar 2020 16:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfhC181PDaya for <iommu@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 16:02:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id 6C71C20027
 for <iommu@lists.linux-foundation.org>; Mon, 30 Mar 2020 16:02:03 +0000 (UTC)
IronPort-SDR: PlrAV6CgIQuKmElTOq5/rYA/q4M8YXqEqtUFU6HhxBCM8d081g6KlNzakYvHP5y/PuDdHyJYkY
 bp0jE7DBTQ8A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 09:01:59 -0700
IronPort-SDR: Iau7ZpXWb62eiptV3lla/8YfmL6EwRsjJ7yHpysCOjjkyrTCUc9IOrfo9HZTMmp3d1y2TuDMx6
 d3a3GBNT+pUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="421972149"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 30 Mar 2020 09:01:59 -0700
Date: Mon, 30 Mar 2020 09:07:46 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/3] iommu/uapi: Define uapi version and capabilities
Message-ID: <20200330090746.23c5599c@jacob-builder>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7FE150@SHSMSX104.ccr.corp.intel.com>
References: <1585178227-17061-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585178227-17061-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200326092316.GA31648@infradead.org>
 <20200326094442.5be042ce@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECB45@SHSMSX104.ccr.corp.intel.com>
 <20200327074702.GA27959@infradead.org>
 <20200327165335.397f24a3@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7FE150@SHSMSX104.ccr.corp.intel.com>
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

On Mon, 30 Mar 2020 05:40:40 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Sent: Saturday, March 28, 2020 7:54 AM
> > 
> > On Fri, 27 Mar 2020 00:47:02 -0700
> > Christoph Hellwig <hch@infradead.org> wrote:
> >   
> > > On Fri, Mar 27, 2020 at 02:49:55AM +0000, Tian, Kevin wrote:  
> > > > If those API calls are inter-dependent for composing a feature
> > > > (e.g. SVA), shouldn't we need a way to check them together
> > > > before exposing the feature to the guest, e.g. through a
> > > > iommu_get_uapi_capabilities interface?  
> > >
> > > Yes, that makes sense.  The important bit is to have a capability
> > > flags and not version numbers.  
> > 
> > The challenge is that there are two consumers in the kernel for
> > this. 1. VFIO only look for compatibility, and size of each data
> > struct such that it can copy_from_user.
> > 
> > 2. IOMMU driver, the "real consumer" of the content.
> > 
> > For 2, I agree and we do plan to use the capability flags to check
> > content and maintain backward compatibility etc.
> > 
> > For VFIO, it is difficult to do size look up based on capability
> > flags. 
> 
> Can you elaborate the difficulty in VFIO? if, as Christoph Hellwig
> pointed out, version number is already avoided everywhere, it is 
> interesting to know whether this work becomes a real exception
> or just requires a different mindset.
> 
From VFIO p.o.v. the IOMMU UAPI data is opaque, it only needs to do two
things:
1. is the UAPI compatible?
2. what is the size to copy?

If you look at the version number, this is really a "version as size"
lookup, as provided by the helper function in this patch. An example
can be the newly introduced clone3 syscall.
https://lwn.net/Articles/792628/
In clone3, new version must have new size. The slight difference here
is that, unlike clone3, we have multiple data structures instead of a
single struct clone_args {}. And each struct has flags to enumerate its
contents besides size.

Besides breaching data abstraction, if VFIO has to check IOMMU flags to
determine the sizes, it has many combinations.

We also separate the responsibilities into two parts
1. compatibility - version, size by VFIO
2. sanity check - capability flags - by IOMMU

I think the latter matches what Christoph's comments. So we are in
agreement at the IOMMU level :)

For example:
During guest PASID bind, IOMMU driver operates on the data passed from
VFIO and check format & flags to take different code path.

#define IOMMU_PASID_FORMAT_INTEL_VTD	1
	__u32 format;
#define IOMMU_SVA_GPASID_VAL	(1 << 0) /* guest PASID valid */
	__u64 flags;

Jacob

> btw the most relevant discussion which I can find out now is here:
> 	https://lkml.org/lkml/2020/2/3/1126
> 
> It mentioned 3 options for handling extension:
> --
> 1. Disallow adding new members to each structure other than reuse
> padding bits or adding union members at the end.
> 2. Allow extension of the structures beyond union, but union size has
> to be fixed with reserved spaces
> 3. Adopt VFIO argsz scheme, I don't think we need version for each
> struct anymore. argsz implies the version that user is using assuming
> UAPI data is extension only.
> --
> 
> the first two are both version-based. Looks most guys agreed with 
> option-1 (in this v2), but Alex didn't give his opinion at the
> moment. The last response from him was the raise of option-3 using
> argsz to avoid version. So, we also need hear from him. Alex?
> 
> Thanks
> Kevin

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
