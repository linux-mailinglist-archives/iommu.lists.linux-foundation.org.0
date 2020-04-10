Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A151A4B77
	for <lists.iommu@lfdr.de>; Fri, 10 Apr 2020 23:00:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 087CB876E7;
	Fri, 10 Apr 2020 21:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUW8R7BKTrvl; Fri, 10 Apr 2020 21:00:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBBD187593;
	Fri, 10 Apr 2020 21:00:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBF90C1D8D;
	Fri, 10 Apr 2020 21:00:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BB69C0177
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 83C5A20487
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8EaEuD4SFjEd for <iommu@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 21:00:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id 0E5FF2011B
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 21:00:14 +0000 (UTC)
IronPort-SDR: K44RfFFxNUQb7nF9VzD8QoJ+3OGcS5xvFDyVeIx78jsazTLJFgz7dORb6VE+LLEc1nRT740Uo+
 9/Vy3o7lYD4g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2020 14:00:12 -0700
IronPort-SDR: hw8vPaWSQRseTrREmDo4wEHF8666mtcHFEvvy/V5KhBxJx+IhmwkOEeDDxYKUMPmn9738D0XY4
 XhMcrt1ZGmBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,368,1580803200"; d="scan'208";a="331278002"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 10 Apr 2020 14:00:12 -0700
Date: Fri, 10 Apr 2020 14:06:04 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v11 05/10] iommu/vt-d: Add bind guest PASID support
Message-ID: <20200410140604.403cb5b2@jacob-builder>
In-Reply-To: <ab57b85b-235f-dc80-1c25-9b3d42dc5f4e@redhat.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585939334-21396-6-git-send-email-jacob.jun.pan@linux.intel.com>
 <ab57b85b-235f-dc80-1c25-9b3d42dc5f4e@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Yi L <yi.l.liu@linux.intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Jonathan Cameron <jic23@kernel.org>
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

Hi Eric,

Missed a few things in the last reply.

On Thu, 9 Apr 2020 09:41:32 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> > +			intel_pasid_tear_down_entry(iommu, dev,
> > svm->pasid);  
> intel_svm_unbind_mm() calls intel_flush_svm_range_dev(svm, sdev, 0,
> -1, 0); Don't we need to flush the (DEV-)IOTLBs as well?
Right, pasid tear down should always include (DEV-)IOTLB flush, I
initially thought it is taken care of by intel_pasid_tear_down_entry().

> > +			/* TODO: Drain in flight PRQ for the PASID
> > since it
> > +			 * may get reused soon, we don't want to
> > +			 * confuse with its previous life.
> > +			 * intel_svm_drain_prq(dev, pasid);
> > +			 */
> > +			kfree_rcu(sdev, rcu);
> > +
> > +			if (list_empty(&svm->devs)) {
> > +				/*
> > +				 * We do not free the IOASID here
> > in that
> > +				 * IOMMU driver did not allocate
> > it.  
> s/in/as?
I meant to say "in that" as "for the reason that"

> > +				 * Unlike native SVM, IOASID for
> > guest use was
> > +				 * allocated prior to the bind
> > call.> +				 * In any case, if the free
> > call comes before
> > +				 * the unbind, IOMMU driver will
> > get notified
> > +				 * and perform cleanup.
> > +				 */
> > +				ioasid_set_data(pasid, NULL);
> > +				kfree(svm);
> > +			}  
> nit: you may use intel_svm_free_if_empty()
True, but I meant to insert ioasid_notifier under the list_empty
condition in the following ioasid patch.


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
