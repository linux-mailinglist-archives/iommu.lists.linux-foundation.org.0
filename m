Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ECC4F5510
	for <lists.iommu@lfdr.de>; Wed,  6 Apr 2022 07:30:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50D2C610AF;
	Wed,  6 Apr 2022 05:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhdnoqO-2snN; Wed,  6 Apr 2022 05:30:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 81D0E60B5A;
	Wed,  6 Apr 2022 05:30:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3311BC0073;
	Wed,  6 Apr 2022 05:30:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38E22C0012;
 Wed,  6 Apr 2022 05:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15642408C5;
 Wed,  6 Apr 2022 05:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Az3ce594Jp8t; Wed,  6 Apr 2022 05:30:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E162402D2;
 Wed,  6 Apr 2022 05:30:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E913E68AFE; Wed,  6 Apr 2022 07:30:39 +0200 (CEST)
Date: Wed, 6 Apr 2022 07:30:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/5] iommu: Replace uses of IOMMU_CAP_CACHE_COHERENCY
 with dev_is_dma_coherent()
Message-ID: <20220406053039.GA10580@lst.de>
References: <0-v1-ef02c60ddb76+12ca2-intel_no_snoop_jgg@nvidia.com>
 <1-v1-ef02c60ddb76+12ca2-intel_no_snoop_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1-v1-ef02c60ddb76+12ca2-intel_no_snoop_jgg@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Nelson Escobar <neescoba@cisco.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-rdma@vger.kernel.org,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, "Tian, Kevin" <kevin.tian@intel.com>,
 linux-arm-msm@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, iommu@lists.linux-foundation.org,
 Christian Benvenuti <benve@cisco.com>, Robin Murphy <robin.murphy@arm.com>
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

On Tue, Apr 05, 2022 at 01:16:00PM -0300, Jason Gunthorpe wrote:
> diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
> index 760b254ba42d6b..24d118198ac756 100644
> --- a/drivers/infiniband/hw/usnic/usnic_uiom.c
> +++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
> @@ -42,6 +42,7 @@
>  #include <linux/list.h>
>  #include <linux/pci.h>
>  #include <rdma/ib_verbs.h>
> +#include <linux/dma-map-ops.h>
>  
>  #include "usnic_log.h"
>  #include "usnic_uiom.h"
> @@ -474,6 +475,12 @@ int usnic_uiom_attach_dev_to_pd(struct usnic_uiom_pd *pd, struct device *dev)
>  	struct usnic_uiom_dev *uiom_dev;
>  	int err;
>  
> +	if (!dev_is_dma_coherent(dev)) {

Which part of the comment at the top of dma-map-ops.h is not clear
enough to you?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
