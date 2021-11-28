Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C2346052C
	for <lists.iommu@lfdr.de>; Sun, 28 Nov 2021 09:03:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26023606F5;
	Sun, 28 Nov 2021 08:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YoH45wTZ8ZW2; Sun, 28 Nov 2021 08:03:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3394461C6E;
	Sun, 28 Nov 2021 08:03:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1847C000A;
	Sun, 28 Nov 2021 08:03:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED58BC000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Nov 2021 08:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAAB961C68
 for <iommu@lists.linux-foundation.org>; Sun, 28 Nov 2021 08:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75KNArJvdC_n for <iommu@lists.linux-foundation.org>;
 Sun, 28 Nov 2021 08:03:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1CDD606F5
 for <iommu@lists.linux-foundation.org>; Sun, 28 Nov 2021 08:03:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7DB660F77;
 Sun, 28 Nov 2021 08:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23BFC004E1;
 Sun, 28 Nov 2021 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638086583;
 bh=c1E12B24n2UtL0dGKDH+q6K5l5U1okMOFCx+76uFZHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=brdjryZqUIgLGgqgV7RXAsoWJa7Gj6kzflFAjHTU+uDtldSFpsqovul15jP5MJqvn
 AEHZY3urZnY/MXvBXTJcQtBEv/X5SXU+ukuKqYjYk7NFUScRq/I+5tl8yY8AxQz/SH
 iEMbnQNq5gAF+6EiGYtS9C4hzqDRuqwNwNqdualk=
Date: Sun, 28 Nov 2021 09:02:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 02/17] driver core: Add dma_unconfigure callback in
 bus_type
Message-ID: <YaM3slBGozqxsQ+m@kroah.com>
References: <20211128025051.355578-1-baolu.lu@linux.intel.com>
 <20211128025051.355578-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211128025051.355578-3-baolu.lu@linux.intel.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Will Deacon <will@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
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

On Sun, Nov 28, 2021 at 10:50:36AM +0800, Lu Baolu wrote:
> The bus_type structure defines dma_configure() callback for bus drivers
> to configure DMA on the devices. This adds the paired dma_unconfigure()
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
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Link: https://lore.kernel.org/linux-iommu/20210922123931.GI327412@nvidia.com/
> Link: https://lore.kernel.org/linux-iommu/20210928115751.GK964074@nvidia.com/
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/device/bus.h | 3 +++
>  drivers/base/dd.c          | 7 ++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
> index a039ab809753..ef54a71e5f8f 100644
> --- a/include/linux/device/bus.h
> +++ b/include/linux/device/bus.h
> @@ -59,6 +59,8 @@ struct fwnode_handle;
>   *		bus supports.
>   * @dma_configure:	Called to setup DMA configuration on a device on
>   *			this bus.
> + * @dma_unconfigure:	Called to cleanup DMA configuration on a device on
> + *			this bus.

"dma_cleanup()" is a better name for this, don't you think?

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
