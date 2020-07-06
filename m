Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416C215F91
	for <lists.iommu@lfdr.de>; Mon,  6 Jul 2020 21:42:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A808426FDC;
	Mon,  6 Jul 2020 19:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W29oKcpPAy77; Mon,  6 Jul 2020 19:42:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0359627124;
	Mon,  6 Jul 2020 19:42:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E58D3C016F;
	Mon,  6 Jul 2020 19:42:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BAE2C016F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 19:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94B6D88A5A
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 19:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHBUe0CVtf7v for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 19:42:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp6.emailarray.com (smtp6.emailarray.com [65.39.216.46])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 827638887F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 19:42:44 +0000 (UTC)
Received: (qmail 3254 invoked by uid 89); 6 Jul 2020 19:42:30 -0000
Received: from unknown (HELO localhost)
 (amxlbW9uQGZsdWdzdmFtcC5jb21AMTYzLjExNC4xMzIuMw==) (POLARISLOCAL) 
 by smtp6.emailarray.com with SMTP; 6 Jul 2020 19:42:30 -0000
Date: Mon, 6 Jul 2020 12:42:27 -0700
From: Jonathan Lemon <jonathan.lemon@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/4] dma-mapping: add a new dma_need_sync API
Message-ID: <20200706194227.vfhv5o4lporxjxmq@bsd-mbp.dhcp.thefacebook.com>
References: <20200629130359.2690853-1-hch@lst.de>
 <20200629130359.2690853-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629130359.2690853-2-hch@lst.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

On Mon, Jun 29, 2020 at 03:03:56PM +0200, Christoph Hellwig wrote:
> Add a new API to check if calls to dma_sync_single_for_{device,cpu} are
> required for a given DMA streaming mapping.
> 
> +::
> +
> +	bool
> +	dma_need_sync(struct device *dev, dma_addr_t dma_addr);
> +
> +Returns %true if dma_sync_single_for_{device,cpu} calls are required to
> +transfer memory ownership.  Returns %false if those calls can be skipped.

Hi Christoph -

Thie call above is for a specific dma_addr.  For correctness, would I
need to check every addr, or can I assume that for a specific memory
type (pages returned from malloc), that the answer would be identical?
-- 
Jonathan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
