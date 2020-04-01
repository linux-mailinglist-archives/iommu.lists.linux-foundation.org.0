Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229A19B891
	for <lists.iommu@lfdr.de>; Thu,  2 Apr 2020 00:40:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA9C387E1B;
	Wed,  1 Apr 2020 22:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvOWEYdoV1IQ; Wed,  1 Apr 2020 22:40:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 81EE786717;
	Wed,  1 Apr 2020 22:40:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75C96C089F;
	Wed,  1 Apr 2020 22:40:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BEB7C089F
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 22:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A7E485D68
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 22:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7K49AcAKfDY for <iommu@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 22:40:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 42F0D85D59
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 22:40:03 +0000 (UTC)
IronPort-SDR: 4iLt2U4TkJBYn1TA5Imu/V1ZRaJwlx/1GPpaPGvDfbAIuD/opNQ76+QocWl0poYn97nmPuWNWk
 5ed+xeFlaYWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 15:40:02 -0700
IronPort-SDR: wON8Mv2Y7vmNMgxffq6zVTWfkWxEp8c5nNy1rnrGL8PZHtpcaJbZ8VCC4w+pQacKjCPq0zOzu2
 5Jrbr6onsAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,333,1580803200"; d="scan'208";a="328616975"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 01 Apr 2020 15:40:02 -0700
Date: Wed, 1 Apr 2020 15:45:50 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 06/10] iommu/ioasid: Convert to set aware allocations
Message-ID: <20200401154550.3775be8f@jacob-builder>
In-Reply-To: <20200401135525.GG882512@myrica>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-7-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200401135525.GG882512@myrica>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
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

On Wed, 1 Apr 2020 15:55:25 +0200
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> On Wed, Mar 25, 2020 at 10:55:27AM -0700, Jacob Pan wrote:
> > The current ioasid_alloc function takes a token/ioasid_set then
> > record it on the IOASID being allocated. There is no alloc/free on
> > the ioasid_set.
> > 
> > With the IOASID set APIs, callers must allocate an ioasid_set before
> > allocate IOASIDs within the set. Quota and other ioasid_set level
> > activities can then be enforced.
> > 
> > This patch converts existing API to the new ioasid_set model.
> > 
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>  
> 
> [...]
> 
> > @@ -379,6 +391,9 @@ ioasid_t ioasid_alloc(struct ioasid_set *set,
> > ioasid_t min, ioasid_t max, }
> >  	data->id = id;
> >  
> > +	/* Store IOASID in the per set data */
> > +	xa_store(&sdata->xa, id, data, GFP_KERNEL);  
> 
> I couldn't figure out why you're maintaining an additional xarray for
> each set. We're already storing that data in active_allocator->xa,
> why the duplication?  If it's for the gPASID -> hPASID translation
> mentioned by the cover letter, maybe you could add this xa when
> introducing that change?
> 
Sounds good. I will add that later. I was hoping to get common code in
place.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
