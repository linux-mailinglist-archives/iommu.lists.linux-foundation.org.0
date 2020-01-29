Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006E14D2F5
	for <lists.iommu@lfdr.de>; Wed, 29 Jan 2020 23:20:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2E65E221B5;
	Wed, 29 Jan 2020 22:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LC2KikHfd2q; Wed, 29 Jan 2020 22:20:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BEA3B22128;
	Wed, 29 Jan 2020 22:20:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2FEFC0171;
	Wed, 29 Jan 2020 22:20:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 347A4C0171
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 22:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 217998835E
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 22:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-sYpgmwshmI for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 22:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6181D8835D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580336404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIYvl0tmkYl2W5NbGeqoNG1EfMAv05GtPw+8Aej3suc=;
 b=UqZk8mGzbPWDzYPuqkiOrkbrFlkGx++8JHLmhUYp8NHJ4KYixiGbeDB2zB/iVhfFcob4RC
 SjAsIykE+X+7nipOognLt67guDC8KFxlp/FO2rJOguKmVqPLvnGLoDgXUzEKdiaU4g06Kw
 uzUGlmeO2TePNNfoPaJPgiTTBEUxQ/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-kai5HUF3NEyuTLZxALeVFA-1; Wed, 29 Jan 2020 17:19:58 -0500
X-MC-Unique: kai5HUF3NEyuTLZxALeVFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932BF8010DB;
 Wed, 29 Jan 2020 22:19:56 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 165FE84BB8;
 Wed, 29 Jan 2020 22:19:52 +0000 (UTC)
Date: Wed, 29 Jan 2020 15:19:51 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 3/3] iommu/uapi: Add helper function for size lookup
Message-ID: <20200129151951.2e354e37@w520.home>
In-Reply-To: <20200129144046.3f91e4c1@w520.home>
References: <1580277724-66994-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1580277724-66994-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200129144046.3f91e4c1@w520.home>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
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

On Wed, 29 Jan 2020 14:40:46 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Tue, 28 Jan 2020 22:02:04 -0800
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
> > IOMMU UAPI can be extended in the future by adding new
> > fields at the end of each user data structure. Since we use
> > a unified UAPI version for compatibility checking, a lookup
> > function is needed to find the correct user data size to copy
> > from user.
> > 
> > This patch adds a helper function based on a 2D lookup with
> > version and type as input arguments.
> > 
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  drivers/iommu/iommu.c | 22 ++++++++++++++++++++++
> >  include/linux/iommu.h |  6 ++++++
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 7dd51c5d2ba1..9e5de9abebdf 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -1696,6 +1696,28 @@ int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
> >  
> > +
> > +/**
> > + * Maintain a UAPI version to user data structure size lookup for each
> > + * API function types we support. e.g. bind guest pasid, cache invalidation.
> > + * As data structures being extended with new members, the offsetofend()
> > + * will identify the new sizes.
> > + */
> > +const static int iommu_uapi_data_size[NR_IOMMU_UAPI_TYPE][IOMMU_UAPI_VERSION] = {
> > +	/* IOMMU_UAPI_BIND_GPASID */
> > +	{offsetofend(struct iommu_gpasid_bind_data, vtd)},
> > +	/* IOMMU_UAPI_CACHE_INVAL */
> > +	{offsetofend(struct iommu_cache_invalidate_info, addr_info)},

This seems prone to errors in future revisions.  Both of the above
reference the end of fields within an anonymous union.  When a new
field is added, it's not necessarily the newest field that needs to be
listed here, but the largest at the time.  So should the current
version always use sizeof instead (or name the union so we can
reference it)?  I'm not sure of an error proof way to make sure we keep
the N-1 version consistent when we add a new version though.  More
comments?

Also, is the 12-bytes of padding in struct iommu_gpasid_bind_data
excessive with this new versioning scheme?  Per rule #2 I'm not sure if
we're allowed to repurpose those padding bytes, but if we add fields to
the end of the structure as the scheme suggests, we're stuck with not
being able to expand the union for new fields.

Thanks,
Alex

> > +	/* IOMMU_UAPI_PAGE_RESP */
> > +	{offsetofend(struct iommu_page_response, code)},
> > +};
> > +
> > +int iommu_uapi_get_data_size(int type, int version)
> > +{  
> 
> Seems like this is asking for a bounds check,
> 
>   if (type >= NR_IOMMU_UAPI_TYPE || version > IOMMU_UAPI_VERSION)
>   	return -EINVAL;
> 
> If we add new types in future versions, I assume we'd back fill the
> table with -EINVAL as well (rather than zero).  Thanks,
> 
> Alex
> 
> > +	return iommu_uapi_data_size[type][version - 1];
> > +}
> > +EXPORT_SYMBOL_GPL(iommu_uapi_get_data_size);
> > +
> >  static void __iommu_detach_device(struct iommu_domain *domain,
> >  				  struct device *dev)
> >  {
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index 9718c109ea0a..416fe02160ba 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -500,6 +500,7 @@ extern int iommu_report_device_fault(struct device *dev,
> >  				     struct iommu_fault_event *evt);
> >  extern int iommu_page_response(struct device *dev,
> >  			       struct iommu_page_response *msg);
> > +extern int iommu_uapi_get_data_size(int type, int version);
> >  
> >  extern int iommu_group_id(struct iommu_group *group);
> >  extern struct iommu_group *iommu_group_get_for_dev(struct device *dev);
> > @@ -885,6 +886,11 @@ static inline int iommu_page_response(struct device *dev,
> >  	return -ENODEV;
> >  }
> >  
> > +static int iommu_uapi_get_data_size(int type, int version)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> >  static inline int iommu_group_id(struct iommu_group *group)
> >  {
> >  	return -ENODEV;  
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
