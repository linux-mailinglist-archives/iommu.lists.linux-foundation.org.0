Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4FA2016B3
	for <lists.iommu@lfdr.de>; Fri, 19 Jun 2020 18:38:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9057889570;
	Fri, 19 Jun 2020 16:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTJS9hHTYL7A; Fri, 19 Jun 2020 16:38:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D9A84882A7;
	Fri, 19 Jun 2020 16:38:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC5F2C016E;
	Fri, 19 Jun 2020 16:38:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CBC1C016E
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 16:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 88091882A7
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 16:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ie6YCH-K8Kwv for <iommu@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 16:38:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 384CC82753
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592584691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5y5O2UGhcEuhsZzsW3Xt2bN7Ia5UKTuojeOlpzqAqk=;
 b=DCJpQCp5hPzaF/VbWitDxWkD8e813q83hVTVzBcRmzA2Bqsj9hU2h0uG7B9TvxiREWzOkr
 fYkiCwpIlN4SARku7XjhjI4/KxH4RUvTpZQ4gd1mEfdAVSYb0GlPQhuj7gKRIqyxukHseN
 Bp6C3uskrvL3wR23p9GsgyMGGggPONc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203--mUZnEh4OsOIWvZZdWtDHQ-1; Fri, 19 Jun 2020 12:38:06 -0400
X-MC-Unique: -mUZnEh4OsOIWvZZdWtDHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1A65107B266;
 Fri, 19 Jun 2020 16:38:02 +0000 (UTC)
Received: from w520.home (ovpn-112-195.phx2.redhat.com [10.3.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E0CF5D9E8;
 Fri, 19 Jun 2020 16:37:58 +0000 (UTC)
Date: Fri, 19 Jun 2020 10:37:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 1/3] docs: IOMMU user API
Message-ID: <20200619103758.3167d4f9@w520.home>
In-Reply-To: <DM5PR11MB14355A49810AA611DD8540D9C3980@DM5PR11MB1435.namprd11.prod.outlook.com>
References: <1591848735-12447-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1591848735-12447-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200611094741.6d118fa8@w520.home>
 <20200611125205.1e0280d3@jacob-builder>
 <20200611144047.79613c32@x1.home>
 <20200611172727.78dbb822@jacob-builder>
 <20200616082212.0c1611dd@jacob-builder>
 <DM5PR11MB1435DD578488DA08A1E699ACC39A0@DM5PR11MB1435.namprd11.prod.outlook.com>
 <MWHPR11MB164595B754BE441255902DCA8C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200618154805.049219db@w520.home>
 <DM5PR11MB1435FA1C517087E8C5DEACB3C3980@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20200618205457.6969f9a7@x1.home>
 <DM5PR11MB14355A49810AA611DD8540D9C3980@DM5PR11MB1435.namprd11.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

On Fri, 19 Jun 2020 03:30:24 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> Hi Alex,
> 
> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Friday, June 19, 2020 10:55 AM
> > 
> > On Fri, 19 Jun 2020 02:15:36 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > Hi Alex,
> > >  
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Friday, June 19, 2020 5:48 AM
> > > >
> > > > On Wed, 17 Jun 2020 08:28:24 +0000
> > > > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> > > >  
> > > > > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > > > > Sent: Wednesday, June 17, 2020 2:20 PM
> > > > > >  
> > > > > > > From: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > > > > > > Sent: Tuesday, June 16, 2020 11:22 PM
> > > > > > >
> > > > > > > On Thu, 11 Jun 2020 17:27:27 -0700 Jacob Pan
> > > > > > > <jacob.jun.pan@linux.intel.com> wrote:
> > > > > > >  
> > > > > > > > >
> > > > > > > > > But then I thought it even better if VFIO leaves the
> > > > > > > > > entire
> > > > > > > > > copy_from_user() to the layer consuming it.
> > > > > > > > >  
> > > > > > > > OK. Sounds good, that was what Kevin suggested also. I just
> > > > > > > > wasn't sure how much VFIO wants to inspect, I thought VFIO
> > > > > > > > layer wanted to do a sanity check.
> > > > > > > >
> > > > > > > > Anyway, I will move copy_from_user to iommu uapi layer.  
> > > > > > >
> > > > > > > Just one more point brought up by Yi when we discuss this offline.
> > > > > > >
> > > > > > > If we move copy_from_user to iommu uapi layer, then there will
> > > > > > > be  
> > > > > > multiple  
> > > > > > > copy_from_user calls for the same data when a VFIO container
> > > > > > > has  
> > > > > > multiple domains,  
> > > > > > > devices. For bind, it might be OK. But might be additional
> > > > > > > overhead for TLB  
> > > > > > flush  
> > > > > > > request from the guest.  
> > > > > >
> > > > > > I think it is the same with bind and TLB flush path. will be
> > > > > > multiple copy_from_user.  
> > > > >
> > > > > multiple copies is possibly fine. In reality we allow only one
> > > > > group per nesting container (as described in patch [03/15]), and
> > > > > usually there is just one SVA-capable device per group.
> > > > >  
> > > > > >
> > > > > > BTW. for moving data copy to iommy layer, there is another point
> > > > > > which need to consider. VFIO needs to do unbind in bind path if
> > > > > > bind failed, so it will assemble unbind_data and pass to iommu
> > > > > > layer. If iommu layer do the copy_from_user, I think it will be failed. any  
> > idea?  
> > > >
> > > > If a call into a UAPI fails, there should be nothing to undo.
> > > > Creating a partial setup for a failed call that needs to be undone
> > > > by the caller is not good practice.  
> > >
> > > is it still a problem if it's the VFIO to undo the partial setup
> > > before returning to user space?  
> > 
> > Yes.  If a UAPI function fails there should be no residual effect.  
> 
> ok. the iommu_sva_bind_gpasid() is per device call. There is no residual
> effect if it failed. so no partial setup will happen per device.
> 
> but VFIO needs to use iommu_group_for_each_dev() to do bind, so
> if iommu_group_for_each_dev() failed, I guess VFIO needs to undo
> the partial setup for the group. right?

Yes, each individual call should make no changes if it fails, but the
caller would need to unwind separate calls.  If this introduces too
much knowledge to the caller for the group case, maybe there should be
a group-level function in the iommu code to handle that.  Thanks,

Alex

> > > > > This might be mitigated if we go back to use the same bind_data
> > > > > for both bind/unbind. Then you can reuse the user object for unwinding.
> > > > >
> > > > > However there is another case where VFIO may need to assemble the
> > > > > bind_data itself. When a VM is killed, VFIO needs to walk
> > > > > allocated PASIDs and unbind them one-by-one. In such case
> > > > > copy_from_user doesn't work since the data is created by kernel.
> > > > > Alex, do you have a suggestion how this usage can be supported?
> > > > > e.g. asking IOMMU driver to provide two sets of APIs to handle user/kernel  
> > generated requests?  
> > > >
> > > > Yes, it seems like vfio would need to make use of a driver API to do
> > > > this, we shouldn't be faking a user buffer in the kernel in order to
> > > > call through to a UAPI.  Thanks,  
> > >
> > > ok, so if VFIO wants to issue unbind by itself, it should use an API
> > > which passes kernel buffer to IOMMU layer. If the unbind request is
> > > from user space, then VFIO should use another API which passes user
> > > buffer pointer to IOMMU layer. makes sense. will align with jacob.  
> > 
> > Sounds right to me.  Different approaches might be used for the driver API versus
> > the UAPI, perhaps there is no buffer.  Thanks,  
> 
> thanks for your coaching. It may require Jacob to add APIs in iommu layer
> for the two purposes.
> 
> Regards,
> Yi Liu
> 
> > Alex  
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
