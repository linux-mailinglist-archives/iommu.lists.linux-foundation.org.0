Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BF43B6B2C
	for <lists.iommu@lfdr.de>; Tue, 29 Jun 2021 01:09:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8405605E6;
	Mon, 28 Jun 2021 23:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZRFusK7fhG1M; Mon, 28 Jun 2021 23:09:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C3FF6607ED;
	Mon, 28 Jun 2021 23:09:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 986C6C000E;
	Mon, 28 Jun 2021 23:09:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9ED70C000E
 for <iommu@lists.linux-foundation.org>; Mon, 28 Jun 2021 23:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EFB760789
 for <iommu@lists.linux-foundation.org>; Mon, 28 Jun 2021 23:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJTAi0hIQ6Qp for <iommu@lists.linux-foundation.org>;
 Mon, 28 Jun 2021 23:09:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2009605E6
 for <iommu@lists.linux-foundation.org>; Mon, 28 Jun 2021 23:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624921746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bF2HoCO0rfuA3mB1G6ApBaoajgUkNbQLpTT4TzE0yAY=;
 b=U2FlwEr1oBDeQ4N5yBqrUtXEukUbED1OU5TqO4VNyKNkVvoA2puTl2CNnBYTO3EAbAfaR8
 ugDyLxCOWotNDoZ3vC42dBN/2vNeeYkqrV1Fd++IST5Zp/8I77Akwm1KBJJ5+jLSJAj639
 T9zH6zh7PJwbs6jc/8LQEi3dsHHggDM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-RzKE0CzOMzKZQE0h5hzy6g-1; Mon, 28 Jun 2021 19:09:05 -0400
X-MC-Unique: RzKE0CzOMzKZQE0h5hzy6g-1
Received: by mail-oi1-f199.google.com with SMTP id
 k11-20020a54440b0000b02901f3e6a011b4so9670778oiw.23
 for <iommu@lists.linux-foundation.org>; Mon, 28 Jun 2021 16:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bF2HoCO0rfuA3mB1G6ApBaoajgUkNbQLpTT4TzE0yAY=;
 b=BORql/U3izb/P6CzgXAntJBlbsW0WlgU6m/fxNEIdisE1Q2OetiJmLRiYiLJTMZYRU
 1cmXpAWNB8+WlvPIMzyTvb/Phpp62dnpWTYez61y/ft28eVdmtt1I2kcVtsKiFzj7kOe
 2K2leb+r5WtYbW2R36EAlYbBXc59EQlb2BG0mc+FTGW7cJWy8zpifN0LibESlYcm4cWI
 mYwVWen+tdU/Avpv1whWpJ7KObeFmrcoLWmp6d4Fi/RETirokBWW2GXbH/2dUX/dcV0Y
 AHkeeJ+maJtjFTkWtZjGfIlkdKZOavrX0Jr3P8P6YITH49mb+6+0CWJKZywU2FU2pH4t
 PQQw==
X-Gm-Message-State: AOAM5325naDms2Kf0G2qWAZbo+B/AR0HY8PHwdcE5cLqIaZFyHNyaIFM
 gIRfSwg+VvG3MJfzgZKILR73CDm6kxZKIozn17wy7nLEwCVVUP40JxuEfjjwSndUbsPO9hP71FF
 mPy0MT7pxajyQO12aR5GppCblJndObQ==
X-Received: by 2002:a9d:7610:: with SMTP id k16mr1750499otl.32.1624921744368; 
 Mon, 28 Jun 2021 16:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuuATEZpZywZp15nLfiJ8vJvsIoVIujDhp0c/KSUebMCjrJMYkGvLQVt9TLd7e8hFpk1nEUA==
X-Received: by 2002:a9d:7610:: with SMTP id k16mr1750476otl.32.1624921744164; 
 Mon, 28 Jun 2021 16:09:04 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id c14sm1164262oic.50.2021.06.28.16.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 16:09:03 -0700 (PDT)
Date: Mon, 28 Jun 2021 17:09:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: Plan for /dev/ioasid RFC v2
Message-ID: <20210628170902.61c0aa1d.alex.williamson@redhat.com>
In-Reply-To: <20210628224818.GJ4459@nvidia.com>
References: <20210616133937.59050e1a.alex.williamson@redhat.com>
 <MWHPR11MB18865DF9C50F295820D038798C0E9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210617151452.08beadae.alex.williamson@redhat.com>
 <20210618001956.GA1987166@nvidia.com>
 <MWHPR11MB1886A17124605251DF394E888C0D9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210618182306.GI1002214@nvidia.com>
 <BN9PR11MB5433B9C0577CF0BD8EFCC9BC8C069@BN9PR11MB5433.namprd11.prod.outlook.com>
 <20210625143616.GT2371267@nvidia.com>
 <BN9PR11MB5433D40116BC1939B6B297EA8C039@BN9PR11MB5433.namprd11.prod.outlook.com>
 <20210628163145.1a21cca9.alex.williamson@redhat.com>
 <20210628224818.GJ4459@nvidia.com>
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

On Mon, 28 Jun 2021 19:48:18 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Jun 28, 2021 at 04:31:45PM -0600, Alex Williamson wrote:
> 
> > I'd expect that /dev/iommu will be used by multiple subsystems.  All
> > will want to bind devices to address spaces, so shouldn't binding a
> > device to an iommufd be an ioctl on the iommufd, ie.
> > IOMMU_BIND_VFIO_DEVICE_FD.  Maybe we don't even need "VFIO" in there and
> > the iommufd code can figure it out internally.  
> 
> It wants to be the other way around because iommu_fd is the lower
> level subsystem. We don't/can't teach iommu_fd how to convert a fd
> number to a vfio/vdpa/etc/etc, we teach all the things building on
> iommu_fd how to change a fd number to an iommu - they already
> necessarily have an inter-module linkage.

These seem like peer subsystems, like vfio and kvm.  vfio shouldn't
have any hard dependencies on the iommufd module, especially so long as
we have the legacy type1 code.  Likewise iommufd shouldn't have any on
vfio.  As much as you dislike the symbol_get hack of the kvm-vfio
device, it would be reasonable for iommufd to reach for a vfio symbol
when an IOMMU_BIND_VFIO_DEVICE_FD ioctl is called.

> There is a certain niceness to what you are saying but it is not so
> practical without doing something bigger..
> 
> > Ideally vfio would also at least be able to register a type1 IOMMU
> > backend through the existing uapi, backed by this iommu code, ie. we'd
> > create a new "iommufd" (but without the user visible fd),   
> 
> It would be amazing to be able to achieve this, at least for me there
> are too many details be able to tell what that would look like
> exactly. I suggested once that putting the container ioctl interface
> in the drivers/iommu code may allow for this without too much trouble..

If we can't achieve this, then type1 legacy code is going to need to
live through an extended deprecation period.  I'm hoping that between
type1 and a native interface we'll have two paths into iommufd to vet
the design.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
