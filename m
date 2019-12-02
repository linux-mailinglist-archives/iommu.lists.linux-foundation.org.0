Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEB910EEF7
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 19:11:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE57686196;
	Mon,  2 Dec 2019 18:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShAkgxAi-8gA; Mon,  2 Dec 2019 18:11:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78C008627E;
	Mon,  2 Dec 2019 18:11:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E6BEC1DD9;
	Mon,  2 Dec 2019 18:11:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E76B8C087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 18:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE15E87E91
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 18:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRd4PtlWXjtX for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 18:11:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 92E7A87E79
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 18:11:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 10:11:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="213113529"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga006.jf.intel.com with ESMTP; 02 Dec 2019 10:11:10 -0800
Date: Mon, 2 Dec 2019 10:15:53 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 8/8] iommu/vt-d: Misc macro clean up for SVM
Message-ID: <20191202101553.079898a3@jacob-builder>
In-Reply-To: <38d4586f3aeb21bb08028525db89868acb34e9fd.camel@perches.com>
References: <1574371588-65634-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1574371588-65634-9-git-send-email-jacob.jun.pan@linux.intel.com>
 <38d4586f3aeb21bb08028525db89868acb34e9fd.camel@perches.com>
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

On Thu, 21 Nov 2019 13:37:10 -0800
Joe Perches <joe@perches.com> wrote:

> On Thu, 2019-11-21 at 13:26 -0800, Jacob Pan wrote:
> > Use combined macros for_each_svm_dev() to simplify SVM device
> > iteration and error checking.  
> []
> > diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c  
> []
> > +#define for_each_svm_dev(sdev, svm, d)			\
> > +	list_for_each_entry((sdev), &(svm)->devs, list)	\
> > +		if ((d) != (sdev)->dev) {} else
> > +
> >  int intel_svm_bind_mm(struct device *dev, int *pasid, int flags,
> > struct svm_dev_ops *ops) {
> >  	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
> > @@ -274,15 +278,13 @@ int intel_svm_bind_mm(struct device *dev, int
> > *pasid, int flags, struct svm_dev_ goto out;
> >  			}
> >  
> > -			list_for_each_entry(sdev, &svm->devs,
> > list) {
> > -				if (dev == sdev->dev) {
> > -					if (sdev->ops != ops) {
> > -						ret = -EBUSY;
> > -						goto out;
> > -					}
> > -					sdev->users++;
> > -					goto success;
> > +			for_each_svm_dev(sdev, svm, dev) {
> > +				if (sdev->ops != ops) {
> > +					ret = -EBUSY;
> > +					goto out;
> >  				}
> > +				sdev->users++;
> > +				goto success;
> >  			}  
> 
> I think this does not read better as this is now a
> for_each loop that exits the loop on the first match.
> 
I think one of the benefits is reduced indentation. What do you
recommend?

> >  
> >  			break;
> > @@ -427,43 +429,36 @@ int intel_svm_unbind_mm(struct device *dev,
> > int pasid) goto out;
> >  	}
> >  
> > -	if (!svm)
> > -		goto out;
> > -
> > -	list_for_each_entry(sdev, &svm->devs, list) {  
> []
> > +	for_each_svm_dev(sdev, svm, dev) {  
> 
> I think this should not remove the !svm test above.
> 
Yeah, !svm test should have been part of 6/8. I will fix that.

Thanks,

Jacob 
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
