Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9961A0FFC
	for <lists.iommu@lfdr.de>; Tue,  7 Apr 2020 17:14:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4439E20418;
	Tue,  7 Apr 2020 15:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9EnOq2B3opx; Tue,  7 Apr 2020 15:14:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE6E620035;
	Tue,  7 Apr 2020 15:14:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA541C1D7E;
	Tue,  7 Apr 2020 15:14:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE02FC0177
 for <iommu@lists.linux-foundation.org>; Tue,  7 Apr 2020 15:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DCA0087E9D
 for <iommu@lists.linux-foundation.org>; Tue,  7 Apr 2020 15:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pS0VOhtcHBJP for <iommu@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 15:14:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BEDAF87E9C
 for <iommu@lists.linux-foundation.org>; Tue,  7 Apr 2020 15:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586272489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3HE0reSfCDr1VSx9qdVWqxSYEu9yuUyo1SXBoLYuvY=;
 b=EHXEUI9U2Dj5SfHFPSoQVqpoZcpfHLCe/SOJnaq9cb9bVJt+jfWWhCX9+xVKvKAcFvUMbw
 Av/wRrfdpkhX2aQLWnPqqw3fftip/3D6uqV+WyyHbQbhpub0/eZvbLi3CG1CIBCDWjunYn
 zjXjlxPcMvsIDz6gYWL/TX+wwDVN/7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-aQ0w5x38MQqrakDLAtHK7g-1; Tue, 07 Apr 2020 11:14:45 -0400
X-MC-Unique: aQ0w5x38MQqrakDLAtHK7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97653107ACCA;
 Tue,  7 Apr 2020 15:14:43 +0000 (UTC)
Received: from w520.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFDFA114819;
 Tue,  7 Apr 2020 15:14:36 +0000 (UTC)
Date: Tue, 7 Apr 2020 09:14:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
Message-ID: <20200407091436.76e980f8@w520.home>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D80E1AD@SHSMSX104.ccr.corp.intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-2-git-send-email-yi.l.liu@intel.com>
 <20200402115017.0a0f55e2@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D807BB9@SHSMSX104.ccr.corp.intel.com>
 <20200403091424.39383958@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D80E1AD@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun, 
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

On Tue, 7 Apr 2020 04:42:02 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Alex Williamson
> > Sent: Friday, April 3, 2020 11:14 PM
> > 
> > On Fri, 3 Apr 2020 05:58:55 +0000
> > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Friday, April 3, 2020 1:50 AM
> > > >
> > > > On Sun, 22 Mar 2020 05:31:58 -0700
> > > > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> > > >  
> > > > > From: Liu Yi L <yi.l.liu@intel.com>
> > > > >
> > > > > For a long time, devices have only one DMA address space from  
> > platform  
> > > > > IOMMU's point of view. This is true for both bare metal and directed-
> > > > > access in virtualization environment. Reason is the source ID of DMA in
> > > > > PCIe are BDF (bus/dev/fnc ID), which results in only device granularity
> > > > > DMA isolation. However, this is changing with the latest advancement in
> > > > > I/O technology area. More and more platform vendors are utilizing the  
> > > > PCIe  
> > > > > PASID TLP prefix in DMA requests, thus to give devices with multiple  
> > DMA  
> > > > > address spaces as identified by their individual PASIDs. For example,
> > > > > Shared Virtual Addressing (SVA, a.k.a Shared Virtual Memory) is able to
> > > > > let device access multiple process virtual address space by binding the
> > > > > virtual address space with a PASID. Wherein the PASID is allocated in
> > > > > software and programmed to device per device specific manner.  
> > Devices  
> > > > > which support PASID capability are called PASID-capable devices. If such
> > > > > devices are passed through to VMs, guest software are also able to bind
> > > > > guest process virtual address space on such devices. Therefore, the  
> > guest  
> > > > > software could reuse the bare metal software programming model,  
> > which  
> > > > > means guest software will also allocate PASID and program it to device
> > > > > directly. This is a dangerous situation since it has potential PASID
> > > > > conflicts and unauthorized address space access. It would be safer to
> > > > > let host intercept in the guest software's PASID allocation. Thus PASID
> > > > > are managed system-wide.  
> > > >
> > > > Providing an allocation interface only allows for collaborative usage
> > > > of PASIDs though.  Do we have any ability to enforce PASID usage or can
> > > > a user spoof other PASIDs on the same BDF?  
> > >
> > > An user can access only PASIDs allocated to itself, i.e. the specific IOASID
> > > set tied to its mm_struct.  
> > 
> > A user is only _supposed_ to access PASIDs allocated to itself.  AIUI
> > the mm_struct is used for managing the pool of IOASIDs from which the
> > user may allocate that PASID.  We also state that programming the PASID
> > into the device is device specific.  Therefore, are we simply trusting
> > the user to use a PASID that's been allocated to them when they program
> > the device?  If a user can program an arbitrary PASID into the device,
> > then what prevents them from attempting to access data from another
> > user via the device?   I think I've asked this question before, so if
> > there's a previous explanation or spec section I need to review, please
> > point me to it.  Thanks,
> >   
> 
> There are two scenarios:
> 
> (1) for PF/VF, the iommu driver maintains an individual PASID table per
> PDF. Although the PASID namespace is global, the per-BDF PASID table
> contains only valid entries for those PASIDs which are allocated to the
> mm_struct. The user is free to program arbitrary PASID into the assigned
> device, but using invalid PASIDs simply hit iommu fault.
> 
> (2) for mdev, multiple mdev instances share the same PASID table of
> the parent BDF. However, PASID programming is a privileged operation
> in multiplexing usage, thus must be mediated by mdev device driver. 
> The mediation logic will guarantee that only allocated PASIDs are 
> forwarded to the device. 

Thanks, I was confused about multiple tenants sharing a BDF when PASID
programming to the device is device specific, and therefore not
something we can virtualize.  However, the solution is device specific
virtualization via mdev.  Thus, any time we're sharing a BDF between
tenants, we must virtualize the PASID programming and therefore it must
be an mdev device currently.  If a tenant is the exclusive user of the
BDF, then no virtualization of the PASID programming is required.  I
think it's clear now (again).  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
