Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EAB3A2F7B
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 17:38:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F7394064D;
	Thu, 10 Jun 2021 15:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdhC7XBVsW8c; Thu, 10 Jun 2021 15:38:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 37E734064C;
	Thu, 10 Jun 2021 15:38:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06B4CC0022;
	Thu, 10 Jun 2021 15:38:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 378E3C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 15:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24FE44048D
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 15:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4YP-NbKeSC2 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 15:38:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF45A4048A
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623339528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5vCQsPxj9Rl4XFnBcjEoEFYRWMfJkRJOGwBf1rRHTk=;
 b=is/9f3h9zNaS0sUO9crmnoYyPT/qRd4qksHF2qseLCRQpuSrI6rwf/IY+A2jl85wo1JZV+
 AmyUMboUi6g3I3vVw0CcTk3yvgqJ5ZOaW0Er8jD8vRU/PmY4N1iRB4jNZQSS5mZ5MnlR3Z
 eLy9v6zU0bkikCG6+FtGIuak4HEprN0=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-CQcXwvycM9SRE8jn0Psusg-1; Thu, 10 Jun 2021 11:38:47 -0400
X-MC-Unique: CQcXwvycM9SRE8jn0Psusg-1
Received: by mail-oi1-f198.google.com with SMTP id
 v142-20020acaac940000b02901f80189ca30so190085oie.22
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 08:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5vCQsPxj9Rl4XFnBcjEoEFYRWMfJkRJOGwBf1rRHTk=;
 b=NDaeoUHGS4bUaEUjmeP/RHz99c47cKS4/ZEAvPnebByNinO02vdp2OdFTrKdgY8W0F
 ARYq/DaKbquOecRc6POEeaSWXbeolRUNDvY+7HTZKr893wohcXNvIGaq6BEvB/u3hCx5
 XJ8C6jYIkF0yuDnJzt2zwQbyO6uMNN45HhJbdo7/3Z7zYWE8cWIfc4C/tlbAoMpYU1sJ
 6dVbSotgZrtB4aX/krOGO4E1wU1lA99R1m8oO0kMifuc26NkT3THX6ZR2ivvIhJgdw0L
 ZdmBg+/aP/GIFCRe6lUOFdDEmSl1DqhffFo3T7w2eL6dReN+fjNUedPLMeN8osnJqMSq
 rCWw==
X-Gm-Message-State: AOAM530Va+5/gARDAxUjJEI+Qq0//vMuxC3bnR0oPm7WAgU1eUNMvuKI
 DTgvJjJ6ywJAK/7sjH1WI2jEaF5cYNIdhBDsXRX9M/vfiHCtM7inuN0k4yYUFrB0mNeVgiHQCN6
 z1TwaO8BPKbhPcoKqhTR9tdxriVWJyQ==
X-Received: by 2002:aca:b509:: with SMTP id e9mr10551711oif.66.1623339525573; 
 Thu, 10 Jun 2021 08:38:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1WqCo3KpeRMtYpynRYuPC4Ltn/l2lGkxqUYzCtd60e9V2qVA2O3E/wRwbwvaY4koN1So0ww==
X-Received: by 2002:aca:b509:: with SMTP id e9mr10551672oif.66.1623339525286; 
 Thu, 10 Jun 2021 08:38:45 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id q6sm586111oot.40.2021.06.10.08.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 08:38:44 -0700 (PDT)
Date: Thu, 10 Jun 2021 09:38:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: Plan for /dev/ioasid RFC v2
Message-ID: <20210610093842.6b9a4e5b.alex.williamson@redhat.com>
In-Reply-To: <20210609184940.GH1002214@nvidia.com>
References: <MWHPR11MB188699D0B9C10EB51686C4138C389@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YMCy48Xnt/aphfh3@8bytes.org> <20210609123919.GA1002214@nvidia.com>
 <YMDC8tOMvw4FtSek@8bytes.org> <20210609150009.GE1002214@nvidia.com>
 <YMDjfmJKUDSrbZbo@8bytes.org>
 <20210609101532.452851eb.alex.williamson@redhat.com>
 <20210609102722.5abf62e1.alex.williamson@redhat.com>
 <20210609184940.GH1002214@nvidia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Enrico Weigelt, metux IT
 consult" <lkml@metux.net>, David Gibson <david@gibson.dropbear.id.au>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Shenming Lu <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>
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

On Wed, 9 Jun 2021 15:49:40 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Jun 09, 2021 at 10:27:22AM -0600, Alex Williamson wrote:
> 
> > > > It is a kernel decision, because a fundamental task of the kernel is to
> > > > ensure isolation between user-space tasks as good as it can. And if a
> > > > device assigned to one task can interfer with a device of another task
> > > > (e.g. by sending P2P messages), then the promise of isolation is broken.    
> > > 
> > > AIUI, the IOASID model will still enforce IOMMU groups, but it's not an
> > > explicit part of the interface like it is for vfio.  For example the
> > > IOASID model allows attaching individual devices such that we have
> > > granularity to create per device IOASIDs, but all devices within an
> > > IOMMU group are required to be attached to an IOASID before they can be
> > > used.    
> 
> Yes, thanks Alex
> 
> > > It's not entirely clear to me yet how that last bit gets
> > > implemented though, ie. what barrier is in place to prevent device
> > > usage prior to reaching this viable state.  
> 
> The major security checkpoint for the group is on the VFIO side.  We
> must require the group before userspace can be allowed access to any
> device registers. Obtaining the device_fd from the group_fd does this
> today as the group_fd is the security proof.
> 
> Actually, thinking about this some more.. If the only way to get a
> working device_fd in the first place is to get it from the group_fd
> and thus pass a group-based security check, why do we need to do
> anything at the ioasid level?
> 
> The security concept of isolation was satisfied as soon as userspace
> opened the group_fd. What do more checks in the kernel accomplish?

Opening the group is not the extent of the security check currently
required, the group must be added to a container and an IOMMU model
configured for the container *before* the user can get a devicefd.
Each devicefd creates a reference to this security context, therefore
access to a device does not exist without such a context.

This proposal has of course put the device before the group, which then
makes it more difficult for vfio to retroactively enforce security.

> Yes, we have the issue where some groups require all devices to use
> the same IOASID, but once someone has the group_fd that is no longer a
> security issue. We can fail VFIO_DEVICE_ATTACH_IOASID callss that
> don't make sense.

The groupfd only proves the user has an ownership claim to the devices,
it does not itself prove that the devices are in an isolated context.
Device access is not granted until that isolated context is configured.

vfio owns the device, so it would make sense for vfio to enforce the
security of device access only in a secure context, but how do we know
a device is in a secure context?

Is it sufficient to track the vfio device ioctls for attach/detach for
an IOASID or will the user be able to manipulate IOASID configuration
for a device directly via the IOASIDfd?

What happens on detach?  As we've discussed elsewhere in this thread,
revoking access is more difficult than holding a reference to the
secure context, but I'm under the impression that moving a device
between IOASIDs could be standard practice in this new model.  A device
that's detached from a secure context, even temporarily, is a problem.
Access to other devices in the same group as a device detached from a
secure context is a problem.

> > > > > Groups should be primarily about isolation security, not about IOASID
> > > > > matching.      
> > > > 
> > > > That doesn't make any sense, what do you mean by 'IOASID matching'?    
> > > 
> > > One of the problems with the vfio interface use of groups is that we
> > > conflate the IOMMU group for both isolation and granularity.  I think
> > > what Jason is referring to here is that we still want groups to be the
> > > basis of isolation, but we don't want a uAPI that presumes all devices
> > > within the group must use the same IOASID.    
> 
> Yes, thanks again Alex
> 
> > > For example, if a user owns an IOMMU group consisting of
> > > non-isolated functions of a multi-function device, they should be
> > > able to create a vIOMMU VM where each of those functions has its
> > > own address space.  That can't be done today, the entire group
> > > would need to be attached to the VM under a PCIe-to-PCI bridge to
> > > reflect the address space limitation imposed by the vfio group
> > > uAPI model.  Thanks,  
> > 
> > Hmm, likely discussed previously in these threads, but I can't come up
> > with the argument that prevents us from making the BIND interface
> > at the group level but the ATTACH interface at the device level?  For
> > example:
> > 
> >  - VFIO_GROUP_BIND_IOASID_FD
> >  - VFIO_DEVICE_ATTACH_IOASID
> > 
> > AFAICT that makes the group ownership more explicit but still allows
> > the device level IOASID granularity.  Logically this is just an
> > internal iommu_group_for_each_dev() in the BIND ioctl.  Thanks,  
> 
> At a high level it sounds OK.
> 
> However I think your above question needs to be answered - what do we
> want to enforce on the iommu_fd and why?
> 
> Also, this creates a problem with the device label idea, we still
> need to associate each device_fd with a label, so your above sequence
> is probably:
> 
>   VFIO_GROUP_BIND_IOASID_FD(group fd)
>   VFIO_BIND_IOASID_FD(device fd 1, device_label)
>   VFIO_BIND_IOASID_FD(device fd 2, device_label)
>   VFIO_DEVICE_ATTACH_IOASID(..)
> 
> And then I think we are back to where I had started, we can trigger
> whatever VFIO_GROUP_BIND_IOASID_FD does automatically as soon as all
> of the devices in the group have been bound.

How to label a device seems like a relatively mundane issue relative to
ownership and isolated contexts of groups and devices.  The label is
essentially just creating an identifier to device mapping, where the
identifier (label) will be used in the IOASID interface, right?  As I
note above, that makes it difficult for vfio to maintain that a user
only accesses a device in a secure context.  This is exactly why vfio
has the model of getting a devicefd from a groupfd only when that group
is in a secure context and maintaining references to that secure
context for each device.  Split ownership of the secure context in
IOASID vs device access in vfio and exposing devicefds outside the group
is still a big question mark for me.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
