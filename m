Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DC3D33E9
	for <lists.iommu@lfdr.de>; Fri, 23 Jul 2021 07:09:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38CC0607BD;
	Fri, 23 Jul 2021 05:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrvsmPUoEXxk; Fri, 23 Jul 2021 05:09:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7B9896069A;
	Fri, 23 Jul 2021 05:09:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C212C000E;
	Fri, 23 Jul 2021 05:09:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB442C000E
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 05:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D073B6064B
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 05:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEYSbrMPcE_j for <iommu@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 05:09:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9D1660646
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 05:09:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1B43C68AFE; Fri, 23 Jul 2021 07:09:03 +0200 (CEST)
Date: Fri, 23 Jul 2021 07:09:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] iommu/dma: Fix leak in non-contiguous API
Message-ID: <20210723050902.GA31187@lst.de>
References: <20210723010552.50969-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723010552.50969-1-ezequiel@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: stable@vger.kernel.org, iommu@lists.linux-foundation.org,
 Ricardo Ribalda <ribalda@chromium.org>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-media@vger.kernel.org
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

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

> As a side note, it appears the struct dma_sgt_handle type is exposed
> to users of the DMA-API by linux/dma-map-ops.h, but is has no users
> or functions returning the type explicitly.
> 
> This may indicate it's a good idea to move the struct dma_sgt_handle type
> to drivers/iommu/dma-iommu.c. The decision is left to maintainers :-)

linux/dma-map-ops.h is a helper header for the dma_ops implementations,
not for users of the DMA API.  sgt_handle, which references
dma_sgt_handle is used in kernel/dma/mapping.c
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
