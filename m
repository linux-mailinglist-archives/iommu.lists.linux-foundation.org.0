Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 582FD19B484
	for <lists.iommu@lfdr.de>; Wed,  1 Apr 2020 19:07:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0B0F9886AF;
	Wed,  1 Apr 2020 17:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NttEftmvAtBm; Wed,  1 Apr 2020 17:07:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 583928865B;
	Wed,  1 Apr 2020 17:07:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A388C089F;
	Wed,  1 Apr 2020 17:07:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5108AC089F
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 17:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 47B7A20526
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 17:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUt4IPfI3k5N for <iommu@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 17:07:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by silver.osuosl.org (Postfix) with ESMTPS id 520E220493
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 17:07:43 +0000 (UTC)
IronPort-SDR: RdotVfMBXrmelbNAK446cYkZc5Mg6xR+l7y+fkArLpS9U4cb582eI7p9V9GE0bY6ewI0NtofjE
 /z8Up0MSupow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 10:07:42 -0700
IronPort-SDR: oQipLpnApWd0p+CgyFBkSRZiHFTfxhOuwvsqHh1iQub51HAu+NxoD5fHDo9HsHXa60RzSslzN3
 Yx50zav9Uwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; d="scan'208";a="249528821"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga003.jf.intel.com with ESMTP; 01 Apr 2020 10:07:42 -0700
Date: Wed, 1 Apr 2020 10:13:30 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V10 06/11] iommu/vt-d: Add bind guest PASID support
Message-ID: <20200401101330.275f6e34@jacob-builder>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D800EEC@SHSMSX104.ccr.corp.intel.com>
References: <1584746861-76386-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1584746861-76386-7-git-send-email-jacob.jun.pan@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7F77B4@SHSMSX104.ccr.corp.intel.com>
 <20200330135138.556ea8a4@jacob-builder>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D800EEC@SHSMSX104.ccr.corp.intel.com>
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

On Tue, 31 Mar 2020 03:43:39 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > > >  struct intel_svm_dev {
> > > > @@ -698,9 +700,13 @@ struct intel_svm_dev {
> > > >  struct intel_svm {
> > > >  	struct mmu_notifier notifier;
> > > >  	struct mm_struct *mm;
> > > > +
> > > >  	struct intel_iommu *iommu;
> > > >  	int flags;
> > > >  	int pasid;
> > > > +	int gpasid; /* Guest PASID in case of vSVA bind with
> > > > non-identity host
> > > > +		     * to guest PASID mapping.
> > > > +		     */  
> > >
> > > we don't need to highlight identity or non-identity thing, since
> > > either way shares the same infrastructure here and it is not the
> > > knowledge that the kernel driver should assume
> > >  
> > Sorry, I don't get your point.
> > 
> > What I meant was that this field "gpasid" is only used for
> > non-identity case. For identity case, we don't have
> > SVM_FLAG_GUEST_PASID.  
> 
> what's the problem if a guest tries to set gpasid even in identity
> case? do you want to add check to reject it? Also I remember we
> discussed before that we want to provide a consistent interface 
> to other consumer e.g. KVM to setup VMCS PASID translation table.
> In that case, regardless of identity or non-identity, we need provide
> such mapping info.
The solution is in flux a little. For KVM to set up VMCS, we are
planning to use IOASID set private ID as guest PASID. So this part of
the code will go away, i.e. G-H PASID mapping will no longer stored in
IOMMU driver. Perhaps we can address this after the transition?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
