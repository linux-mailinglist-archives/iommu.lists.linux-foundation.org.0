Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7AE361401
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 23:16:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B002A40349;
	Thu, 15 Apr 2021 21:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GH6e0VWODNNm; Thu, 15 Apr 2021 21:16:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD24940258;
	Thu, 15 Apr 2021 21:16:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AAFAC000A;
	Thu, 15 Apr 2021 21:16:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CAD7C000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 21:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B3860668
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 21:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0B5JoVz9qsgh for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 21:16:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CED056063A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 21:16:07 +0000 (UTC)
IronPort-SDR: oUQgVa/NDKAqFwD1YhkJNubQazCAUA1RPEzGLWuOzkkahUcTVI+K/tRVYiNpDgKkoCzEV+Wdzn
 74c+JGn35dfg==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="280259714"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="280259714"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 14:16:06 -0700
IronPort-SDR: q5op6QHfmrt3NbPHSPNKpJwGJNDmsFZ2z4LhgON7RFerF+9cnD82iJXQadzBHw5/coMOJnqkkU
 0cBuTmD4hyYg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="461754208"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 14:16:06 -0700
Date: Thu, 15 Apr 2021 14:18:45 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 2/2] iommu/sva: Remove mm parameter from SVA bind API
Message-ID: <20210415141845.06e5a1cf@jacob-builder>
In-Reply-To: <20210415064459.GB1938497@infradead.org>
References: <1618414077-28808-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1618414077-28808-3-git-send-email-jacob.jun.pan@linux.intel.com>
 <20210415064459.GB1938497@infradead.org>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vkoul@kernel.org, "Tian, Kevin" <kevin.tian@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, zhangfei.gao@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
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

Hi Christoph,

On Thu, 15 Apr 2021 07:44:59 +0100, Christoph Hellwig <hch@infradead.org>
wrote:

> >   *
> >   * Returns 0 on success and < 0 on error.
> > @@ -28,6 +28,9 @@ int iommu_sva_alloc_pasid(struct mm_struct *mm,
> > ioasid_t min, ioasid_t max) int ret = 0;
> >  	ioasid_t pasid;
> >  
> > +	if (mm != current->mm)
> > +		return -EINVAL;
> > +  
> 
> Why not remove the parameter entirely?
It was removed in my v1 but thought it would be cleaner if we treat
iommu_sva_alloc_pasid() as a leaf function of iommu_sva_bind_device(). Then
we don't have to do get_task_mm() every time. But to your point below, it
is better to get low-level driver handle it.
> 
> > @@ -2989,8 +2990,11 @@ iommu_sva_bind_device(struct device *dev, struct
> > mm_struct *mm, unsigned int fla return ERR_PTR(-ENODEV);
> >  
> >  	/* Supervisor SVA does not need the current mm */
> > -	if ((flags & IOMMU_SVA_BIND_SUPERVISOR) && mm)
> > -		return ERR_PTR(-EINVAL);
> > +	if (!(flags & IOMMU_SVA_BIND_SUPERVISOR)) {
> > +		mm = get_task_mm(current);
> > +		if (!mm)
> > +			return ERR_PTR(-EINVAL);
> > +	}  
> 
> I don't see why we need the reference.  I think we should just stop
> passing the mm to ->sva_bind and let the low-level driver deal with
> any reference to current->mm where needed.
The mm users reference is just for precaution, in case low level driver use
kthread etc.
I agree it is cleaner to just remove mm here, let the low-level driver deal
with it.
Let me give it a spin.

Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
