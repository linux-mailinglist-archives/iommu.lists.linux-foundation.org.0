Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE126BF59
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 10:32:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC01C87347;
	Wed, 16 Sep 2020 08:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zuS6msvRj9bM; Wed, 16 Sep 2020 08:32:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50F7E87343;
	Wed, 16 Sep 2020 08:32:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AF19C0051;
	Wed, 16 Sep 2020 08:32:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B5A2C0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 08:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E0DAD207A2
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 08:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuRJ5sYxdj0f for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 08:32:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by silver.osuosl.org (Postfix) with ESMTPS id E25B320784
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 08:32:37 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id lo4so9103240ejb.8
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lsTHEaMa7NWcCiDhQh+LAwtpF5hf7liWYfCO2nfxQUY=;
 b=Weqz4/aGFFZyyeuPB8AeHDH5MYDjqn1CD5KyBnY3YIxMqGv8uH8zataEVx7IPzu/t5
 UE6CNn4OHhrAkbP0ygegXzbgzv3tDgzt6VkRCErSvyYCxVJnhuJsOODoh0ZIJUQSTran
 znXRkdzuyfz+MUTCqc9qrJ7+QBgjP958NJ39KjIZ4kGHc14gnP0uKR26r31mWVmldktZ
 iuRN3yskbjWuLoecBPenGexvNHb+JjxTdqzgIvj4fRxtrP1P3rhRDYP3mByi08SAlcmC
 YniViRXWYSvEygaLvfzUc7KaSzn1JvNSR8cMCFz9kM4mlu1uDbRv9A8X/7iVNmB16eXQ
 2hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lsTHEaMa7NWcCiDhQh+LAwtpF5hf7liWYfCO2nfxQUY=;
 b=PaVDkJDN1aRynBFVcbSW6lHITV35nNUlarqCQeWaeZ2jFz4GndGjaVOwgza3+Msafg
 EFp8h2WKWgLUrBlKtbVNCWu3Z7rwsaUX7QBiS228NbewJR53/Khla2tjcC7nOLLDo59K
 12EhpBCDxn5yQmFQgyQm9f5mbdP2e6nGiuOq5J96xvFjEJudNd1xm3VZzbtthv55aHw1
 jCwuRT5VjOMJoll6SrEn50g7oVRrALSGo/I3SAXzCr+N21L5yw1CabUkwUGRAUMxU/N0
 0qhpV5v63VgTVpLYJ1t7juML6Ns3EjEPSGV3DcIhV40Ohr80zhCzAJeIiQKxTVavN9DR
 Lg7Q==
X-Gm-Message-State: AOAM532cl8VrtqBXedPo1HwgiskCpwHy9hUE1rZFWxHjJb/edaLZxVF7
 ZxDZE1C5vZoW51Uqe0gN+T2oUQ==
X-Google-Smtp-Source: ABdhPJxCMjyEvUmXkRyRWGahwWFRcdqvEJJ1mvM4W7oJWaX7Wi/HjXfv84eXyjZEt5oaWl9swiJlzQ==
X-Received: by 2002:a17:906:4cd6:: with SMTP id
 q22mr23775429ejt.139.1600245156191; 
 Wed, 16 Sep 2020 01:32:36 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k19sm12010499ejo.40.2020.09.16.01.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 01:32:35 -0700 (PDT)
Date: Wed, 16 Sep 2020 10:32:17 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v7 00/16] vfio: expose virtual Shared Virtual Addressing
 to VMs
Message-ID: <20200916083217.GA5316@myrica>
References: <20200914134738.GX904879@nvidia.com>
 <20200914162247.GA63399@otc-nc-03>
 <20200914163354.GG904879@nvidia.com>
 <20200914105857.3f88a271@x1.home>
 <20200914174121.GI904879@nvidia.com>
 <20200914122328.0a262a7b@x1.home>
 <20200914190057.GM904879@nvidia.com>
 <20200914163310.450c8d6e@x1.home>
 <20200915142906.GX904879@nvidia.com>
 <MWHPR11MB1645934DB27033011316059B8C210@MWHPR11MB1645.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR11MB1645934DB27033011316059B8C210@MWHPR11MB1645.namprd11.prod.outlook.com>
Cc: "Tian, Jun J" <jun.j.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Wu, Hao" <hao.wu@intel.com>
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

On Wed, Sep 16, 2020 at 01:19:18AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Tuesday, September 15, 2020 10:29 PM
> >
> > > Do they need a device at all?  It's not clear to me why RID based
> > > IOMMU management fits within vfio's scope, but PASID based does not.
> > 
> > In RID mode vfio-pci completely owns the PCI function, so it is more
> > natural that VFIO, as the sole device owner, would own the DMA mapping
> > machinery. Further, the RID IOMMU mode is rarely used outside of VFIO
> > so there is not much reason to try and disaggregate the API.
> 
> It is also used by vDPA.
> 
> > 
> > PASID on the other hand, is shared. vfio-mdev drivers will share the
> > device with other kernel drivers. PASID and DMA will be concurrent
> > with VFIO and other kernel drivers/etc.
> > 
> 
> Looks you are equating PASID to host-side sharing, while ignoring 
> another valid usage that a PASID-capable device is passed through
> to the guest through vfio-pci and then PASID is used by the guest 
> for guest-side sharing. In such case, it is an exclusive usage in host
> side and then what is the problem for VFIO to manage PASID given
> that vfio-pci completely owns the function?

And this is the only PASID model for Arm SMMU (and AMD IOMMU, I believe):
the PASID space of a PCI function cannot be shared between host and guest,
so we assign the whole PASID table along with the RID. Since we need the
BIND, INVALIDATE, and report APIs introduced here to support nested
translation, a /dev/sva interface would need to support this mode as well.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
