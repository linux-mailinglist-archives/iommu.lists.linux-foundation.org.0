Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB536737C
	for <lists.iommu@lfdr.de>; Wed, 21 Apr 2021 21:33:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EC9F40E4A;
	Wed, 21 Apr 2021 19:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xs0sgZoVP5LG; Wed, 21 Apr 2021 19:33:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id C160440E56;
	Wed, 21 Apr 2021 19:33:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90A26C001B;
	Wed, 21 Apr 2021 19:33:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 523A0C000B
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 19:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2088C83CA5
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 19:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAGB40ljBSX4 for <iommu@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 19:33:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B616B83B8E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 19:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619033603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSjUA9x97DB8V/G4wtzBrBvcZftae66qVvF3IBCBz10=;
 b=a/BwnT8gxonr4Hr2+hTilVChlClMDb3XTSkKbAkd4Rq1LLhrqj7cWAlOErVXcqteatRtSn
 zXLFua0wWu77Zt9USuDh5nj6RbT8olThUFCPCTG3Jzo9xiXo+COvoLQmy4zj8uch+34MwY
 nVwc4ETlQhH13ZOFpC3KqKsPf+8baAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-ELIYmNGbMHmkKloSLFszZA-1; Wed, 21 Apr 2021 15:33:19 -0400
X-MC-Unique: ELIYmNGbMHmkKloSLFszZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54079C7402;
 Wed, 21 Apr 2021 19:33:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-21.phx2.redhat.com [10.3.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75AF159442;
 Wed, 21 Apr 2021 19:33:12 +0000 (UTC)
Date: Wed, 21 Apr 2021 13:33:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210421133312.15307c44@redhat.com>
In-Reply-To: <20210421175203.GN1370958@nvidia.com>
References: <20210401134236.GF1463678@nvidia.com>
 <BN6PR11MB4068C4DE7AF43D44DE70F4C1C37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210401160337.GJ1463678@nvidia.com>
 <4bea6eb9-08ad-4b6b-1e0f-c97ece58a078@redhat.com>
 <20210415230732.GG1370958@nvidia.com>
 <20210416061258.325e762e@jacob-builder>
 <20210416094547.1774e1a3@redhat.com>
 <BN6PR11MB406854F56D18E1187A2C98ACC3479@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210421162307.GM1370958@nvidia.com>
 <20210421105451.56d3670a@redhat.com>
 <20210421175203.GN1370958@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj, 
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Li Zefan <lizefan@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Wu,
 Hao" <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

On Wed, 21 Apr 2021 14:52:03 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Apr 21, 2021 at 10:54:51AM -0600, Alex Williamson wrote:
> 
> > That's essentially replacing vfio-core, where I think we're more  
> 
> I am only talking about /dev/vfio here which is basically the IOMMU
> interface part.
> 
> I still expect that VFIO_GROUP_SET_CONTAINER will be used to connect
> /dev/{ioasid,vfio} to the VFIO group and all the group and device
> logic stays inside VFIO.

But that group and device logic is also tied to the container, where
the IOMMU backend is the interchangeable thing that provides the IOMMU
manipulation for that container.  If you're using
VFIO_GROUP_SET_CONTAINER to associate a group to a /dev/ioasid, then
you're really either taking that group outside of vfio or you're
re-implementing group management in /dev/ioasid.  I'd expect the
transition point at VFIO_SET_IOMMU.

> The appeal of unifying /dev/{ioasid,vfio} to a single fops is that it
> cleans up vfio a lot - we don't have to have two different code paths
> where one handles a vfio_container and the other a ioasid_container
> and the all the related different iommu ops and so on.

Currently vfio IOMMU backends don't know about containers either.
Setting the vfio IOMMU for a container creates an object within the
IOMMU backend representing that IOMMU context.  IOMMU groups are then
attached to that context, where the IOMMU backend can add to or create a
new IOMMU domain to include that group, or if no compatible IOMMU
context can be created, reject it.

> Everything can be switched to ioasid_container all down the line. If
> it wasn't for PPC this looks fairly simple.

At what point is it no longer vfio?  I'd venture to say that replacing
the container rather than invoking a different IOMMU backend is that
point.

> Since getting rid of PPC looks a bit hard, we'd be stuck with
> accepting a /dev/ioasid and then immediately wrappering it in a
> vfio_container an shimming it through a vfio_iommu_ops. It is not
> ideal at all, but in my look around I don't see a major problem if
> type1 implementation is moved to live under /dev/ioasid.

But type1 is \just\ an IOMMU backend, not "/dev/vfio".  Given that
nobody flinched at removing NVLink support, maybe just deprecate SPAPR
now and see if anyone objects ;)

> For concreteness if we look at the set container flow with ioasid I'd
> say something like:
> 
> vfio_group_fops_unl_ioctl()
>  VFIO_GROUP_SET_CONTAINER
>   vfio_group_set_container()
>      if (f.file->f_op == &vfio_fops) {
>           // Use a real vfio_container and vfio_iommu_driver
>           driver->ops->attach_group()
>              tce_iommu_attach_group()
>      }
> 
>      if (ioasid_container = ioasid_get_from_fd(container_fd)) {
>          // create a dummy vfio_container and use the ioasid driver
> 	 container = kzalloc()
>          container->iommu_driver = ioasid_shim
>          driver->ops->attach_group()
>              ioasid_shim_attach_group(ioasid_container, ...)
>                  ioasid_attach_group()
>                      // What used to be vfio_iommu_attach_group()

How do you handle multiple groups with the same container?  Again, I'd
expect some augmentation of VFIO_SET_IOMMU so that /dev/vfio continues
to exist and manage group to container mapping and /dev/ioasid manages
the IOMMU context of that container.
> 
> Broadly all the ops vfio need go through the ioasid_shim which relays
> them to the generic ioasid API.

/dev/vfio essentially already passes through all fops to the IOMMU
backend once the VFIO_SET_IOMMU is established.
 
> We end up with a ioasid.h that basically has the vfio_iommu_type1 code
> lightly recast into some 'struct iommu_container' and a set of
> ioasid_* function entry points that follow vfio_iommu_driver_ops_type1:
>   ioasid_attach_group
>   ioasid_detatch_group
>   ioasid_<something about user pages>
>   ioasid_read/ioasid_write

Again, this looks like a vfio IOMMU backend.  What are we accomplishing
by replacing /dev/vfio with /dev/ioasid versus some manipulation of
VFIO_SET_IOMMU accepting a /dev/ioasid fd?

> If we have this, and /dev/ioasid implements the legacy IOCTLs, then
> /dev/vfio == /dev/ioasid and we can compile out vfio_fops and related
> from vfio.c and tell ioasid.c to create /dev/vfio instead using the
> ops it owns.

Why would we want /dev/ioasid to implement legacy ioctls instead of
simply implementing an interface to allow /dev/ioasid to be used as a
vfio IOMMU backend?
 
> This is a very long winded way of saying ideally we'd do
> approximately:
>   git mv drivers/vfio/vfio_iommu_type1.c drivers/ioasid/ioasid.c
> 
> As the first step. Essentially we declare that what is type1 is really
> the user interface to the internal kernel IOMMU kAPI, which has been
> steadily evolving since type1 was created 10 years ago.

The pseudo code above really suggests you do want to remove
/dev/vfio/vfio, but this is only one of the IOMMU backends for vfio, so
I can't quite figure out if we're talking past each other.

As I expressed in another thread, type1 has a lot of shortcomings.  The
mapping interface leaves userspace trying desperately to use statically
mapped buffers because the map/unmap latency is too high.  We have
horrible issues with duplicate locked page accounting across
containers.  It suffers pretty hard from feature creep in various
areas.  A new IOMMU backend is an opportunity to redesign some of these
things.

> > The interface of making that selection might change to accept an
> > external /dev/ioasid file descriptor, of course.  Maybe you can
> > elaborate on how the vfio device and group uAPI live (or not) in
> > this new scheme were /dev/ioasid is the primary interface.  Thanks,  
> 
> They say in vfio. You'd still open a group and you'd still pass in
> either /dev/vfio or /dev/ioasid to define the container
> 
> Though, completely as an unrelated aside, I admit to not entirely
> understanding why the group is the central element of the uAPI.
> 
> It is weird that the vfio "drivers" all work on the struct vfio_device
> (at least after my series), and it has a file_operations presence via
> vfio_device_fops, but instead of struct vfio_device directly having a
> 'struct device' and cdev to access the FD we get it through a group FD
> and agroup chardev via VFIO_GROUP_GET_DEVICE_FD
> 
> If we were to revise this, and I don't see a huge reason to do so, I
> would put a struct device and cdev in struct vfio_device, attach the
> vfio_device directly to the ioasid and then forget about the group, at
> least as uapi, completely.
> 
> Or at least I don't see where that gets into trouble, but I'm not too
> familiar with the multi-vfio in a process scenario..

The vfio_group is the unit of userspace ownership as it reflects the
IOMMU group as the unit of isolation.  Ideally there's a 1:1 mapping
between device and group, but that is of course not always the case.

The IOMMU group also abstracts isolation and visibility relative to
DMA.  For example, in a PCIe topology a multi-function device may not
have isolation between functions, but each requester ID is visible to
the IOMMU.  This lacks isolation but not IOMMU granularity, or
visibility.  A conventional PCI topology however lacks both isolation
and visibility, all devices downstream use either the PCIe-to-PCI
bridge RID or a RID derived from the secondary bus.  We can also have
mixed topologies, for example PCIe-to-PCI<->PCI-to-PCIe, where the
grouping code needs to search upstream for the highest level where we
achieve both isolation and visibility.

To simplify this, we use the group as the unit of IOMMU context, again
favoring singleton group behavior.

An individual vfio_device doesn't know about these isolation
dependencies, thus while a vfio bus/device driver like vfio-pci can
expose a device, it's vfio-core than manages whether the isolated set
of devices which includes that device, ie. the group, meets the
requirements for userspace access.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
