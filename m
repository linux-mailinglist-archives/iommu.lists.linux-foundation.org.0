Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF64F4F13
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 16:15:26 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AEF80DC6;
	Fri,  8 Nov 2019 15:15:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2A7AFDB5
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 15:15:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id ECA3187D
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573226118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=8oIf/3htwKpE4sAQMa7BRja9vrs2bYVGKXmtLB4Q5+M=;
	b=CvgSb69HgOT1F1KzgWPaAgonMiJa4txXbvsywo7T7IWwNTTvLpI31yWzMsOiP5D+Xu1Mso
	Xy9x6MWgGuWp1pk/k1FOKIPSsXLNyT/Pk+S9BIh9XV45L63y1EnSqq8s2Nvk1IMxsZK3sW
	AaQ1zjocTpGWjOyho87iD9JEry0dwF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-FGOcwi7qMOK45l5HBBK2sA-1; Fri, 08 Nov 2019 10:15:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFBBE8017DE;
	Fri,  8 Nov 2019 15:15:12 +0000 (UTC)
Received: from x1.home (ovpn-116-138.phx2.redhat.com [10.3.116.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADC021001B35;
	Fri,  8 Nov 2019 15:15:03 +0000 (UTC)
Date: Fri, 8 Nov 2019 08:15:03 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [RFC v2 2/3] vfio/type1: VFIO_IOMMU_PASID_REQUEST(alloc/free)
Message-ID: <20191108081503.29a7a800@x1.home>
In-Reply-To: <A2975661238FB949B60364EF0F2C25743A0F305A@SHSMSX104.ccr.corp.intel.com>
References: <1571919983-3231-1-git-send-email-yi.l.liu@intel.com>
	<1571919983-3231-3-git-send-email-yi.l.liu@intel.com>
	<20191105163537.1935291c@x1.home>
	<A2975661238FB949B60364EF0F2C25743A0EF41B@SHSMSX104.ccr.corp.intel.com>
	<20191107150659.05fa7548@x1.home>
	<A2975661238FB949B60364EF0F2C25743A0F305A@SHSMSX104.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: FGOcwi7qMOK45l5HBBK2sA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	"Tian, Jun J" <jun.j.tian@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"Sun, Yi Y" <yi.y.sun@intel.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Fri, 8 Nov 2019 12:23:41 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson [mailto:alex.williamson@redhat.com]
> > Sent: Friday, November 8, 2019 6:07 AM
> > To: Liu, Yi L <yi.l.liu@intel.com>
> > Subject: Re: [RFC v2 2/3] vfio/type1: VFIO_IOMMU_PASID_REQUEST(alloc/free)
> > 
> > On Wed, 6 Nov 2019 13:27:26 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Wednesday, November 6, 2019 7:36 AM
> > > > To: Liu, Yi L <yi.l.liu@intel.com>
> > > > Subject: Re: [RFC v2 2/3] vfio/type1: VFIO_IOMMU_PASID_REQUEST(alloc/free)
> > > >
> > > > On Thu, 24 Oct 2019 08:26:22 -0400
> > > > Liu Yi L <yi.l.liu@intel.com> wrote:
> > > >  
> > > > > This patch adds VFIO_IOMMU_PASID_REQUEST ioctl which aims
> > > > > to passdown PASID allocation/free request from the virtual
> > > > > iommu. This is required to get PASID managed in system-wide.
> > > > >
> > > > > Cc: Kevin Tian <kevin.tian@intel.com>
> > > > > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > > > > Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
> > > > > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > > > > ---
> > > > >  drivers/vfio/vfio_iommu_type1.c | 114  
> > > > ++++++++++++++++++++++++++++++++++++++++  
> > > > >  include/uapi/linux/vfio.h       |  25 +++++++++
> > > > >  2 files changed, 139 insertions(+)
> > > > >
> > > > > diff --git a/drivers/vfio/vfio_iommu_type1.c  
> > b/drivers/vfio/vfio_iommu_type1.c  
> > > > > index cd8d3a5..3d73a7d 100644
> > > > > --- a/drivers/vfio/vfio_iommu_type1.c
> > > > > +++ b/drivers/vfio/vfio_iommu_type1.c
> > > > > @@ -2248,6 +2248,83 @@ static int vfio_cache_inv_fn(struct device *dev,  
> > void  
> > > > *data)  
> > > > >  	return iommu_cache_invalidate(dc->domain, dev, &ustruct->info);
> > > > >  }
> > > > >
> > > > > +static int vfio_iommu_type1_pasid_alloc(struct vfio_iommu *iommu,
> > > > > +					 int min_pasid,
> > > > > +					 int max_pasid)
> > > > > +{
> > > > > +	int ret;
> > > > > +	ioasid_t pasid;
> > > > > +	struct mm_struct *mm = NULL;
> > > > > +
> > > > > +	mutex_lock(&iommu->lock);
> > > > > +	if (!IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)) {
> > > > > +		ret = -EINVAL;
> > > > > +		goto out_unlock;
> > > > > +	}
> > > > > +	mm = get_task_mm(current);
> > > > > +	/* Track ioasid allocation owner by mm */
> > > > > +	pasid = ioasid_alloc((struct ioasid_set *)mm, min_pasid,
> > > > > +				max_pasid, NULL);  
> > > >
> > > > Are we sure we want to tie this to the task mm vs perhaps the
> > > > vfio_iommu pointer?  
> > >
> > > Here we want to have a kind of per-VM mark, which can be used to do
> > > ownership check on whether a pasid is held by a specific VM. This is
> > > very important to prevent across VM affect. vfio_iommu pointer is
> > > competent for vfio as vfio is both pasid alloc requester and pasid
> > > consumer. e.g. vfio requests pasid alloc from ioasid and also it will
> > > invoke bind_gpasid(). vfio can either check ownership before invoking
> > > bind_gpasid() or pass vfio_iommu pointer to iommu driver. But in future,
> > > there may be other modules which are just consumers of pasid. And they
> > > also want to do ownership check for a pasid. Then, it would be hard for
> > > them as they are not the pasid alloc requester. So here better to have
> > > a system wide structure to perform as the per-VM mark. task mm looks
> > > to be much competent.  
> > 
> > Ok, so it's intentional to have a VM-wide token.  Elsewhere in the
> > type1 code (vfio_dma_do_map) we record the task_struct per dma mapping
> > so that we can get the task mm as needed.  Would the task_struct
> > pointer provide any advantage?  
> 
> I think we may use task_struct pointer to make type1 code consistent.
> How do you think?

If it has the same utility, sure.
 
> > Also, an overall question, this provides userspace with pasid alloc and
> > free ioctls, (1) what prevents a userspace process from consuming every
> > available pasid, and (2) if the process exits or crashes without
> > freeing pasids, how are they recovered aside from a reboot?  
> 
> For question (1), I think we only need to take care about malicious
> userspace process. As vfio usage is under privilege mode, so we may
> be safe on it so far.

No, where else do we ever make this assumption?  vfio requires a
privileged entity to configure the system for vfio, bind devices for
user use, and grant those devices to the user, but the usage of the
device is always assumed to be by an unprivileged user.  It is
absolutely not acceptable require a privileged user.  It's vfio's
responsibility to protect the system from the user.

> However, we may need to introduce a kind of credit
> mechanism to protect it. I've thought it, but no good idea yet. Would be
> happy to hear from you.

It's a limited system resource and it's unclear how many might
reasonably used by a user.  I don't have an easy answer.

> For question (2), I think we need to reclaim the allocated pasids when
> the vfio container fd is released just like what vfio does to the domain
> mappings. I didn't add it yet. But I can add it in next version if you think
> it would make the pasid alloc/free be much sound.

Consider it required, the interface is susceptible to abuse without it.

> > > > > +	if (pasid == INVALID_IOASID) {
> > > > > +		ret = -ENOSPC;
> > > > > +		goto out_unlock;
> > > > > +	}
> > > > > +	ret = pasid;
> > > > > +out_unlock:
> > > > > +	mutex_unlock(&iommu->lock);  
> > 
> > What does holding this lock protect?  That the vfio_iommu remains
> > backed by an iommu during this operation, even though we don't do
> > anything to release allocated pasids when that iommu backing is removed?  
> 
> yes, it is unnecessary to hold the lock here. At least for the operations in
> this patch. will remove it. :-)
> 
> > > > > +	if (mm)
> > > > > +		mmput(mm);
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int vfio_iommu_type1_pasid_free(struct vfio_iommu *iommu,
> > > > > +				       unsigned int pasid)
> > > > > +{
> > > > > +	struct mm_struct *mm = NULL;
> > > > > +	void *pdata;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	mutex_lock(&iommu->lock);
> > > > > +	if (!IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)) {
> > > > > +		ret = -EINVAL;
> > > > > +		goto out_unlock;
> > > > > +	}
> > > > > +
> > > > > +	/**
> > > > > +	 * REVISIT:
> > > > > +	 * There are two cases free could fail:
> > > > > +	 * 1. free pasid by non-owner, we use ioasid_set to track mm, if
> > > > > +	 * the set does not match, caller is not permitted to free.
> > > > > +	 * 2. free before unbind all devices, we can check if ioasid private
> > > > > +	 * data, if data != NULL, then fail to free.
> > > > > +	 */
> > > > > +	mm = get_task_mm(current);
> > > > > +	pdata = ioasid_find((struct ioasid_set *)mm, pasid, NULL);
> > > > > +	if (IS_ERR(pdata)) {
> > > > > +		if (pdata == ERR_PTR(-ENOENT))
> > > > > +			pr_err("PASID %u is not allocated\n", pasid);
> > > > > +		else if (pdata == ERR_PTR(-EACCES))
> > > > > +			pr_err("Free PASID %u by non-owner, denied", pasid);
> > > > > +		else
> > > > > +			pr_err("Error searching PASID %u\n", pasid);  
> > > >
> > > > This should be removed, errno is sufficient for the user, this just
> > > > provides the user with a trivial DoS vector filling logs.  
> > >
> > > sure, will fix it. thanks.
> > >  
> > > > > +		ret = -EPERM;  
> > > >
> > > > But why not return PTR_ERR(pdata)?  
> > >
> > > aha, would do it.
> > >  
> > > > > +		goto out_unlock;
> > > > > +	}
> > > > > +	if (pdata) {
> > > > > +		pr_debug("Cannot free pasid %d with private data\n", pasid);
> > > > > +		/* Expect PASID has no private data if not bond */
> > > > > +		ret = -EBUSY;
> > > > > +		goto out_unlock;
> > > > > +	}
> > > > > +	ioasid_free(pasid);  
> > > >
> > > > We only ever get here with pasid == NULL?!  
> > >
> > > I guess you meant only when pdata==NULL.
> > >  
> > > > Something is wrong.  Should
> > > > that be 'if (!pdata)'?  (which also makes that pr_debug another DoS
> > > > vector)  
> > >
> > > Oh, yes, just do it as below:
> > >
> > > if (!pdata) {
> > > 	ioasid_free(pasid);
> > > 	ret = SUCCESS;
> > > } else
> > > 	ret = -EBUSY;
> > >
> > > Is it what you mean?  
> > 
> > No, I think I was just confusing pdata and pasid, but I am still
> > confused about testing pdata.  We call ioasid_alloc() with private =
> > NULL, and I don't see any of your patches calling ioasid_set_data() to
> > change the private data after allocation, so how could this ever be
> > set?  Should this just be a BUG_ON(pdata) as the integrity of the
> > system is in question should this state ever occur?  Thanks,  
> 
> ioasid_set_data() was called  in one patch from Jacob's vSVA patchset.
> [PATCH v6 08/10] iommu/vt-d: Add bind guest PASID support
> https://lkml.org/lkml/2019/10/22/946
> 
> The basic idea is to allocate pasid with private=NULL, and set it when the
> pasid is actually bind to a device (bind_gpasid()). Each bind_gpasid() will
> increase the ref_cnt in the private data, and each unbind_gpasid() will
> decrease the ref_cnt. So if bind/unbind_gpasid() is called in mirror, the
> private data should be null when comes to free operation. If not, vfio can
> believe that the pasid is still in use.

So this is another opportunity to leak pasids.  What's a user supposed
to do when their attempt to free a pasid fails?  It invites leaks to
allow this path to fail.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
