Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F722A8123
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 15:41:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6B6AE1FC71;
	Thu,  5 Nov 2020 14:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkHNuv10cqir; Thu,  5 Nov 2020 14:41:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5975A231CB;
	Thu,  5 Nov 2020 14:41:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B9FEC0889;
	Thu,  5 Nov 2020 14:41:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7546C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 14:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B5AEB86FB6
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 14:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UdvWFC3VKx8q for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 14:41:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4A88886416
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 14:41:25 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 140so1341719qko.2
 for <iommu@lists.linux-foundation.org>; Thu, 05 Nov 2020 06:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BRRBZT8ySKIFRsUMyPGRaPv+NMBfsy6kK0WAjQoESxI=;
 b=BYnwWa1P88rlA3UDi6FSzwBMdDQPUUwP2XaWTm1vxRuPg19YVq+UV3c+8KvPaFJPIz
 I0Z2FL/+WwSfaeV1hcTdPGRCiVmcZcu9Vr6A+4aRK6zpSsBA9FFB/5iDEny9p6YTU/Kz
 KJb6K0ZjPjOHN6tbjYQNfYKmKJdjd06oWTwaPqk0oT/kG3E7yL+ouGO/Mbbb6T/60H4Z
 nww6Q0xXCcrq4NEWGdEP01YUsw66Bxu7ZDq7ag5N1uvRx+p5RCTCCQbjS8dIvcGfTj6X
 MVft2KMHswtIvmE7epRbA4kA1JJld+WMHXuCd3I4t29jX4TrD9Hi4HHQvuI0v7qWW1jz
 O+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BRRBZT8ySKIFRsUMyPGRaPv+NMBfsy6kK0WAjQoESxI=;
 b=RgEYAoAKhGn6cn4T89pCTsD+GEyVGlkIKs8vTY0+phAjY4qK38sE/2cJTeXMernJGM
 a/svQk3s+O4/3xibgdCzAKaZ2gmGU5mbdrp95T0vNK/1GRBPBzJo5azpCNIQ6TkMVEak
 ZZlB36K1yPzl2v5ST3sUv7yYQNA6+CogSEx2vtSNBfSA/h1S923RxuqrMcXSTIKAX7P5
 wbx5ZwzNVUHXK+VaWAAl0PAypfCZBEbwTqT44e3Lx37BoPQSHhv53MGa4E124S0i6v9L
 1PMCEnNWCNmCwT5Detcgvrts1TPdfvUz2gMNtbGwTcATL1iUjMtBe+qRLMyVzyEYUDp9
 y3Pg==
X-Gm-Message-State: AOAM532XC8YGsK9y+DzipKLWvNn5K5KVhb5vdlqv0GmM4X3DXVYBdZm9
 fBSTFdrSyd9hDU8WDHMavg6jYQ==
X-Google-Smtp-Source: ABdhPJwFColY0yT1w1m9snQuiX4vEjEAvWqS1IYW9nZwAHU7eHJgA48cXdx+o3zYeJbmlaWlKFEdKw==
X-Received: by 2002:a37:a903:: with SMTP id s3mr2319716qke.391.1604587284369; 
 Thu, 05 Nov 2020 06:41:24 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 9sm1162119qkv.110.2020.11.05.06.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:41:23 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kagS3-00HNt1-1F; Thu, 05 Nov 2020 10:41:23 -0400
Date: Thu, 5 Nov 2020 10:41:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/6] RMDA/sw: don't allow drivers using dma_virt_ops on
 highmem configs
Message-ID: <20201105144123.GB4142106@ziepe.ca>
References: <20201105074205.1690638-1-hch@lst.de>
 <20201105074205.1690638-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105074205.1690638-2-hch@lst.de>
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>
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

On Thu, Nov 05, 2020 at 08:42:00AM +0100, Christoph Hellwig wrote:
> dma_virt_ops requires that all pages have a kernel virtual address.
> Introduce a INFINIBAND_VIRT_DMA Kconfig symbol that depends on !HIGHMEM
> and a large enough dma_addr_t, and make all three driver depend on the
> new symbol.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>  drivers/infiniband/Kconfig           | 6 ++++++
>  drivers/infiniband/sw/rdmavt/Kconfig | 3 ++-
>  drivers/infiniband/sw/rxe/Kconfig    | 2 +-
>  drivers/infiniband/sw/siw/Kconfig    | 1 +
>  4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
> index 32a51432ec4f73..81acaf5fb5be67 100644
> +++ b/drivers/infiniband/Kconfig
> @@ -73,6 +73,12 @@ config INFINIBAND_ADDR_TRANS_CONFIGFS
>  	  This allows the user to config the default GID type that the CM
>  	  uses for each device, when initiaing new connections.
>  
> +config INFINIBAND_VIRT_DMA
> +	bool
> +	default y

Oh, I haven't seen this kconfig trick with default before..

> +	depends on !HIGHMEM
> +	depends on !64BIT || ARCH_DMA_ADDR_T_64BIT
> +
>  if INFINIBAND_USER_ACCESS || !INFINIBAND_USER_ACCESS
>  source "drivers/infiniband/hw/mthca/Kconfig"
>  source "drivers/infiniband/hw/qib/Kconfig"
> diff --git a/drivers/infiniband/sw/rdmavt/Kconfig b/drivers/infiniband/sw/rdmavt/Kconfig
> index 9ef5f5ce1ff6b0..c8e268082952b0 100644
> +++ b/drivers/infiniband/sw/rdmavt/Kconfig
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config INFINIBAND_RDMAVT
>  	tristate "RDMA verbs transport library"
> -	depends on X86_64 && ARCH_DMA_ADDR_T_64BIT
> +	depends on INFINIBAND_VIRT_DMA

Usually I would expect a non-menu item to be used with select not
'depends on' - is the use of default avoiding that?

This looks nice

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
