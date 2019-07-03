Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 895E15EDAA
	for <lists.iommu@lfdr.de>; Wed,  3 Jul 2019 22:34:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 00A86EC4;
	Wed,  3 Jul 2019 20:34:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 80091C6F
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 20:34:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 211FD70D
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 20:34:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 918BC3091851;
	Wed,  3 Jul 2019 20:34:30 +0000 (UTC)
Received: from x1.home (ovpn-116-83.phx2.redhat.com [10.3.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E772E17F33;
	Wed,  3 Jul 2019 20:34:27 +0000 (UTC)
Date: Wed, 3 Jul 2019 14:34:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v7 2/6] vfio/type1: Check reserve region conflict and
	update iova list
Message-ID: <20190703143427.2d63c15f@x1.home>
In-Reply-To: <20190626151248.11776-3-shameerali.kolothum.thodi@huawei.com>
References: <20190626151248.11776-1-shameerali.kolothum.thodi@huawei.com>
	<20190626151248.11776-3-shameerali.kolothum.thodi@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 03 Jul 2019 20:34:40 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, pmorel@linux.vnet.ibm.com,
	linux-kernel@vger.kernel.org, xuwei5@hisilicon.com,
	linuxarm@huawei.com, iommu@lists.linux-foundation.org
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

On Wed, 26 Jun 2019 16:12:44 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This retrieves the reserved regions associated with dev group and
> checks for conflicts with any existing dma mappings. Also update
> the iova list excluding the reserved regions.
> 
> Reserved regions with type IOMMU_RESV_DIRECT_RELAXABLE are
> excluded from above checks as they are considered as directly
> mapped regions which are known to be relaxable.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 96 +++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 970d1ec06aed..b6bfdfa16c33 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1559,6 +1641,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  	phys_addr_t resv_msi_base;
>  	struct iommu_domain_geometry geo;
>  	LIST_HEAD(iova_copy);
> +	LIST_HEAD(group_resv_regions);
>  
>  	mutex_lock(&iommu->lock);
>  
> @@ -1644,6 +1727,13 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  		goto out_detach;
>  	}
>  
> +	iommu_get_group_resv_regions(iommu_group, &group_resv_regions);

This can fail and should have an error case.  I assume we'd fail the
group attach on failure.  Thanks,

Alex
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
