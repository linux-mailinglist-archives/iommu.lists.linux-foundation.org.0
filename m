Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240D4B48F1
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 11:12:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75C6A404E0;
	Mon, 14 Feb 2022 10:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id En_97qnjy3u1; Mon, 14 Feb 2022 10:12:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1E0EE40522;
	Mon, 14 Feb 2022 10:12:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6052C0077;
	Mon, 14 Feb 2022 10:12:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FAD2C007E
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 10:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D56260E36
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 10:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkcQM9Kqfa8S for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 10:12:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B10EF60E2E
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 10:12:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A526C6102A;
 Mon, 14 Feb 2022 10:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDDFC340E9;
 Mon, 14 Feb 2022 10:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644833547;
 bh=M0BF1S8k6P4/h+amgHnnMxnmmzIHRn78qIWiqCZMTt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UptKleNcc93DXh/8y4no+0p/Hl1XMjhGS2P6HwvH72Ql1NOdZNhK9XngXZl8Yka7F
 VtmDV+JhrV/j6jL06nHWv0qvL3jHnPEvB9jfc+o2GYj/i76xty+/rY6wLh03YjI1KQ
 IiTVtb8hFbVl3YncHAyB2BfGYzLSu8S3+nPbDfhk=
Date: Mon, 14 Feb 2022 11:02:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 02/14] driver core: Add dma_cleanup callback in bus_type
Message-ID: <YgootGL4aL+XRE/J@kroah.com>
References: <20220104015644.2294354-1-baolu.lu@linux.intel.com>
 <20220104015644.2294354-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104015644.2294354-3-baolu.lu@linux.intel.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, Jan 04, 2022 at 09:56:32AM +0800, Lu Baolu wrote:
> The bus_type structure defines dma_configure() callback for bus drivers
> to configure DMA on the devices. This adds the paired dma_cleanup()
> callback and calls it during driver unbinding so that bus drivers can do
> some cleanup work.
> 
> One use case for this paired DMA callbacks is for the bus driver to check
> for DMA ownership conflicts during driver binding, where multiple devices
> belonging to a same IOMMU group (the minimum granularity of isolation and
> protection) may be assigned to kernel drivers or user space respectively.
> 
> Without this change, for example, the vfio driver has to listen to a bus
> BOUND_DRIVER event and then BUG_ON() in case of dma ownership conflict.
> This leads to bad user experience since careless driver binding operation
> may crash the system if the admin overlooks the group restriction. Aside
> from bad design, this leads to a security problem as a root user, even with
> lockdown=integrity, can force the kernel to BUG.
> 
> With this change, the bus driver could check and set the DMA ownership in
> driver binding process and fail on ownership conflicts. The DMA ownership
> should be released during driver unbinding.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
