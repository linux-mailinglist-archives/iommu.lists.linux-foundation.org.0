Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B32B20EB1
	for <lists.iommu@lfdr.de>; Thu, 16 May 2019 20:31:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48143C3F;
	Thu, 16 May 2019 18:31:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F007EC21
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 18:31:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A6BBF87E
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 18:31:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1DD5317914E;
	Thu, 16 May 2019 18:31:04 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2715D9CC;
	Thu, 16 May 2019 18:31:00 +0000 (UTC)
Date: Thu, 16 May 2019 12:31:00 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH 2/4] vfio: vfio_iommu_type1: Define
	VFIO_IOMMU_INFO_CAPABILITIES
Message-ID: <20190516123100.529f06be@x1.home>
In-Reply-To: <1557476555-20256-3-git-send-email-pmorel@linux.ibm.com>
References: <1557476555-20256-1-git-send-email-pmorel@linux.ibm.com>
	<1557476555-20256-3-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 16 May 2019 18:31:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, pasic@linux.vnet.ibm.com, kvm@vger.kernel.org,
	heiko.carstens@de.ibm.com, sebott@linux.vnet.ibm.com,
	walling@linux.ibm.com, linux-kernel@vger.kernel.org,
	borntraeger@de.ibm.com, iommu@lists.linux-foundation.org,
	schwidefsky@de.ibm.com, gerald.schaefer@de.ibm.com
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

On Fri, 10 May 2019 10:22:33 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> To use the VFIO_IOMMU_GET_INFO to retrieve IOMMU specific information,
> we define a new flag VFIO_IOMMU_INFO_CAPABILITIES in the
> vfio_iommu_type1_info structure and the associated capability
> information block.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  include/uapi/linux/vfio.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 8f10748..8f68e0f 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -715,6 +715,16 @@ struct vfio_iommu_type1_info {
>  	__u32	flags;
>  #define VFIO_IOMMU_INFO_PGSIZES (1 << 0)	/* supported page sizes info */
>  	__u64	iova_pgsizes;		/* Bitmap of supported page sizes */
> +#define VFIO_IOMMU_INFO_CAPABILITIES (1 << 1)  /* support capabilities info */
> +	__u64   cap_offset;     /* Offset within info struct of first cap */
> +};
> +
> +#define VFIO_IOMMU_INFO_CAP_QFN		1
> +#define VFIO_IOMMU_INFO_CAP_QGRP	2

Descriptions?

> +
> +struct vfio_iommu_type1_info_block {
> +	struct vfio_info_cap_header header;
> +	__u32 data[];
>  };
>  
>  #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)

This is just a blob of data, what's the API?  How do we revision it?
How does the user know how to interpret it?  Dumping kernel internal
structures out to userspace like this is not acceptable, define a user
API. Thanks,

Alex
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
