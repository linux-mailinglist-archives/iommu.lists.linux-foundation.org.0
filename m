Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEDE1A2C83
	for <lists.iommu@lfdr.de>; Thu,  9 Apr 2020 01:42:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1737286B88;
	Wed,  8 Apr 2020 23:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daT70PO7tLDF; Wed,  8 Apr 2020 23:42:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5385785FCB;
	Wed,  8 Apr 2020 23:42:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31E87C0177;
	Wed,  8 Apr 2020 23:42:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42A23C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 23:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 31D8C85FCB
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 23:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RO5ucoaLRClA for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 23:42:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F04C85F52
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 23:42:12 +0000 (UTC)
IronPort-SDR: dc9rlfVFOtT6dbEenIQguH8gktcnrvWK9HrX0qCaSJOQ5/HHU8UP5J1khMlAGRhBzowPl2Ec06
 xfN3btLR3aew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 16:42:11 -0700
IronPort-SDR: tykVs9TctuQLBslfBqGSapkQN5yHP+UzA1hIM6p0f2VDUJOShWOuxwcCu/O6qAwt7V9qqDQNkr
 SvckWZwRTq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,360,1580803200"; d="scan'208";a="398368350"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga004.jf.intel.com with ESMTP; 08 Apr 2020 16:42:11 -0700
Date: Wed, 8 Apr 2020 16:48:02 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/2] iommu: Remove iommu_sva_ops::mm_exit()
Message-ID: <20200408164802.155a69e3@jacob-builder>
In-Reply-To: <20200408223218.GC11886@ziepe.ca>
References: <20200408140427.212807-1-jean-philippe@linaro.org>
 <20200408113552.7888bfee@jacob-builder>
 <20200408190226.GA11886@ziepe.ca>
 <20200408143552.57f5837c@jacob-builder>
 <20200408223218.GC11886@ziepe.ca>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, arnd@arndb.de, "Yu,
 Fenghua" <fenghua.yu@intel.com>, gregkh@linuxfoundation.org,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 linux-accelerators@lists.ozlabs.org
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

On Wed, 8 Apr 2020 19:32:18 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Wed, Apr 08, 2020 at 02:35:52PM -0700, Jacob Pan wrote:
> > > On Wed, Apr 08, 2020 at 11:35:52AM -0700, Jacob Pan wrote:  
> > > > Hi Jean,
> > > > 
> > > > On Wed,  8 Apr 2020 16:04:25 +0200
> > > > Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> > > >     
> > > > > The IOMMU SVA API currently requires device drivers to
> > > > > implement an mm_exit() callback, which stops device jobs that
> > > > > do DMA. This function is called in the release() MMU
> > > > > notifier, when an address space that is shared with a device
> > > > > exits.
> > > > > 
> > > > > It has been noted several time during discussions about SVA
> > > > > that cancelling DMA jobs can be slow and complex, and doing
> > > > > it in the release() notifier might cause synchronization
> > > > > issues (patch 2 has more background). Device drivers must in
> > > > > any case call unbind() to remove their bond, after stopping
> > > > > DMA from a more favorable context (release of a file
> > > > > descriptor).
> > > > > 
> > > > > So after mm exits, rather than notifying device drivers, we
> > > > > can hold on to the PASID until unbind(), ask IOMMU drivers to
> > > > > silently abort DMA and Page Requests in the meantime. This
> > > > > change should relieve the mmput() path.    
> > > >
> > > > I assume mm is destroyed after all the FDs are closed    
> > > 
> > > FDs do not hold a mmget(), but they may hold a mmgrab(), ie
> > > anything using mmu_notifiers has to hold a grab until the
> > > notifier is destroyed, which is often triggered by FD close.
> > >   
> > Sorry, I don't get this. Are you saying we have to hold a mmgrab()
> > between svm_bind/mmu_notifier_register and
> > svm_unbind/mmu_notifier_unregister?  
> 
> Yes. This is done automatically for the caller inside the mmu_notifier
> implementation. We now even store the mm_struct pointer inside the
> notifier.
> 
> Once a notifier is registered the mm_struct remains valid memory until
> the notifier is unregistered.
> 
> > Isn't the idea of mmu_notifier is to avoid holding the mm reference
> > and rely on the notifier to tell us when mm is going away?  
> 
> The notifier only holds a mmgrab(), not a mmget() - this allows
> exit_mmap to proceed, but the mm_struct memory remains.
> 
> This is also probably why it is a bad idea to tie the lifetime of
> something like a pasid to the mmdrop as a evil user could cause a
> large number of mm structs to be released but not freed, probably
> defeating cgroup limits and so forth (not sure)
> 
> > It seems both Intel and AMD iommu drivers don't hold mmgrab after
> > mmu_notifier_register.  
> 
> It is done internally to the implementation.
> 
> > > So the exit_mmap() -> release() may happen before the FDs are
> > > destroyed, but the final mmdrop() will be during some FD release
> > > when the final mmdrop() happens.  
> > 
> > Do you mean mmdrop() is after FD release?   
> 
> Yes, it will be done by the mmu_notifier_unregister(), which should be
> called during FD release if the iommu lifetime is linked to some FD.
> 
> > If so, unbind is called in FD release should take care of
> > everything, i.e. stops DMA, clear PASID context on IOMMU, flush PRS
> > queue etc.  
> 
> Yes, this is the proper way, when the DMA is stopped and no use of the
> PASID remains then you can drop the mmu notifier and release the PASID
> entirely. If that is linked to the lifetime of the FD then forget
> completely about the mm_struct lifetime, it doesn't matter..
> 
Got everything above, thanks a lot.

If everything is in order with the FD close. Why do we need to 
"ask IOMMU drivers to silently abort DMA and Page Requests in the
meantime." in mm_exit notifier? This will be done orderly in unbind
anyway.

> > Enforcing unbind upon FD close might be a precarious path, perhaps
> > that is why we have to deal with out of order situation?  
> 
> How so? You just put it in the FD release function :)
> 
I was thinking some driver may choose to defer unbind in some workqueue
etc.

> > > > In VT-d, because of enqcmd and lazy PASID free we plan to hold
> > > > on to the PASID until mmdrop.
> > > > https://lore.kernel.org/patchwork/patch/1217762/    
> > > 
> > > Why? The bind already gets a mmu_notifier which has refcounts and
> > > the right lifetime for PASID.. This code could already be
> > > simplified by using the mmu_notifier_get()/put() stuff.
> > >   
> > Yes, I guess mmu_notifier_get()/put() is new :)
> > +Fenghua  
> 
> I was going to convert the intel code when I did many other drivers,
> but it was a bit too complex..
> 
> But the approach is straightforward. Get rid of the mm search list and
> use mmu_notifier_get(). This returns a singlton notifier for the
> mm_struct and handles refcounting/etc
> 
> Use mmu_notifier_put() during a unbind, it will callback to
> free_notifier() to do the final frees (ie this is where the pasid
> should go away)
> 
> For the SVM_FLAG_PRIVATE_PASID continue to use mmu_notifier_register,
> however this can now be mixed with mmu_notifier_put() so the cleanup
> is the same. A separate ops static struct is needed to create a unique
> key though
> 
> Jason

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
