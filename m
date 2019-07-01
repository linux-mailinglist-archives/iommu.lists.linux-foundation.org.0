Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B62D127
	for <lists.iommu@lfdr.de>; Tue, 28 May 2019 23:45:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6BFF01C79;
	Tue, 28 May 2019 21:45:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F3A67230D
	for <iommu@lists.linux-foundation.org>;
	Tue, 28 May 2019 21:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8BBA2D0
	for <iommu@lists.linux-foundation.org>;
	Tue, 28 May 2019 21:43:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4695300194A;
	Tue, 28 May 2019 21:43:43 +0000 (UTC)
Received: from x1.home (ovpn-116-22.phx2.redhat.com [10.3.116.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DD485C241;
	Tue, 28 May 2019 21:43:43 +0000 (UTC)
Date: Tue, 28 May 2019 15:43:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] vfio: zpci: defining the VFIO headers
Message-ID: <20190528154342.7b0f3946@x1.home>
In-Reply-To: <1558614326-24711-3-git-send-email-pmorel@linux.ibm.com>
References: <1558614326-24711-1-git-send-email-pmorel@linux.ibm.com>
	<1558614326-24711-3-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 28 May 2019 21:43:44 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, pasic@linux.vnet.ibm.com, kvm@vger.kernel.org,
	heiko.carstens@de.ibm.com, sebott@linux.vnet.ibm.com,
	walling@linux.ibm.com, linux-kernel@vger.kernel.org,
	borntraeger@de.ibm.com, iommu@lists.linux-foundation.org,
	schwidefsky@de.ibm.com, robin.murphy@arm.com, gerald.schaefer@de.ibm.com
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

On Thu, 23 May 2019 14:25:25 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> We define a new device region in vfio.h to be able to
> get the ZPCI CLP information by reading this region from
> userland.
> 
> We create a new file, vfio_zdev.h to define the structure
> of the new region we defined in vfio.h
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  include/uapi/linux/vfio.h      |  4 ++++
>  include/uapi/linux/vfio_zdev.h | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 include/uapi/linux/vfio_zdev.h
> 
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 8f10748..56595b8 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -306,6 +306,10 @@ struct vfio_region_info_cap_type {
>  #define VFIO_REGION_TYPE_GFX                    (1)
>  #define VFIO_REGION_SUBTYPE_GFX_EDID            (1)
>  
> +/* IBM Subtypes */
> +#define VFIO_REGION_TYPE_IBM_ZDEV		(1)

This one defines (but never uses) a conflicting region type to GFX
above.

> +#define VFIO_REGION_SUBTYPE_ZDEV_CLP		(1)

If we're using a PCI vendor type, which the next patch indicates we
are, this is the one you need.  But please also specify it as a PCI
vendor sub-type with the hex PCI vendor ID, and perhaps group it with
the Intel vendor sub-types.

> +
>  /**
>   * struct vfio_region_gfx_edid - EDID region layout.
>   *
> diff --git a/include/uapi/linux/vfio_zdev.h b/include/uapi/linux/vfio_zdev.h
> new file mode 100644
> index 0000000..84b1a82
> --- /dev/null
> +++ b/include/uapi/linux/vfio_zdev.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Region definition for ZPCI devices
> + *
> + * Copyright IBM Corp. 2019
> + *
> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> + */
> +
> +#ifndef _VFIO_ZDEV_H_
> +#define _VFIO_ZDEV_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct vfio_region_zpci_info - ZPCI information.
> + *
> + */
> +struct vfio_region_zpci_info {
> +	__u64 dasm;
> +	__u64 start_dma;
> +	__u64 end_dma;
> +	__u64 msi_addr;
> +	__u64 flags;
> +	__u16 pchid;
> +	__u16 mui;
> +	__u16 noi;
> +	__u8 gid;
> +	__u8 version;
> +#define VFIO_PCI_ZDEV_FLAGS_REFRESH 1
> +	__u8 util_str[CLP_UTIL_STR_LEN];

I don't see where CLP_UTIL_STR_LEN is defined in a uapi consumable
header.  Should this simply be [] where the string length is implied by
the remaining region size?  QEMU hard codes it, that doesn't validate
the vfio uapi.

> +} __packed;
> +
> +#endif

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
