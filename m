Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0511042C
	for <lists.iommu@lfdr.de>; Tue,  3 Dec 2019 19:23:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CDA93203B2;
	Tue,  3 Dec 2019 18:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LURoZPPQ4YMv; Tue,  3 Dec 2019 18:23:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2180320400;
	Tue,  3 Dec 2019 18:23:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18F1FC087F;
	Tue,  3 Dec 2019 18:23:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB5C5C087F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 18:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 958FA87D14
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 18:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRBWgiLTx3Df for <iommu@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 18:23:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C835B86CF0
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 18:23:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 10:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,274,1571727600"; d="scan'208";a="242509095"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by fmsmga002.fm.intel.com with ESMTP; 03 Dec 2019 10:23:13 -0800
Date: Tue, 3 Dec 2019 10:27:56 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v5 8/8] iommu/vt-d: Misc macro clean up for SVM
Message-ID: <20191203102756.73611444@jacob-builder>
In-Reply-To: <d3dd39dabf20814174c11f60dc22c2401490e4ca.camel@perches.com>
References: <1575316709-54903-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1575316709-54903-9-git-send-email-jacob.jun.pan@linux.intel.com>
 <d3dd39dabf20814174c11f60dc22c2401490e4ca.camel@perches.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
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

On Mon, 02 Dec 2019 12:10:45 -0800
Joe Perches <joe@perches.com> wrote:

> On Mon, 2019-12-02 at 11:58 -0800, Jacob Pan wrote:
> > Use combined macros for_each_svm_dev() to simplify SVM device
> > iteration and error checking.  
> []
> > diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c  
> []
> > @@ -427,40 +430,36 @@ int intel_svm_unbind_mm(struct device *dev,
> > int pasid)  
> []
> > +	for_each_svm_dev(sdev, svm, dev) {
> > +		ret = 0;
> > +		sdev->users--;
> > +		if (!sdev->users) {  
> 
> This might be better by reducing indentation here too
> 
> 		if (sdev->users)
> 			break;
> 
> > +			list_del_rcu(&sdev->list);  
> 
> to reduce indentation 1 level below this
Sounds good but perhaps we can do this in a separate patch.

> 
> > +			/* Flush the PASID cache and IOTLB for
> > this device.
> > +			 * Note that we do depend on the hardware
> > *not* using
> > +			 * the PASID any more. Just as we depend
> > on other
> > +			 * devices never using PASIDs that they
> > have no right
> > +			 * to use. We have a *shared* PASID table,
> > because it's
> > +			 * large and has to be physically
> > contiguous. So it's
> > +			 * hard to be as defensive as we might
> > like. */
> > +			intel_pasid_tear_down_entry(iommu, dev,
> > svm->pasid);
> > +			intel_flush_svm_range_dev(svm, sdev, 0,
> > -1, 0);
> > +			kfree_rcu(sdev, rcu);
> > +
> > +			if (list_empty(&svm->devs)) {
> > +				ioasid_free(svm->pasid);
> > +				if (svm->mm)
> > +
> > mmu_notifier_unregister(&svm->notifier, svm->mm);
> > +				list_del(&svm->list);
> > +				/* We mandate that no page faults
> > may be outstanding
> > +				 * for the PASID when
> > intel_svm_unbind_mm() is called.
> > +				 * If that is not obeyed, subtle
> > errors will happen.
> > +				 * Let's make them less subtle...
> > */
> > +				memset(svm, 0x6b, sizeof(*svm));
> > +				kfree(svm);
> >  			}
> > -			break;
> >  		}
> > +		break;
> >  	}
> >   out:
> >  	mutex_unlock(&pasid_mutex);  
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
