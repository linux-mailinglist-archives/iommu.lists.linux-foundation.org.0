Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AB42C7FD1
	for <lists.iommu@lfdr.de>; Mon, 30 Nov 2020 09:27:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D17487365;
	Mon, 30 Nov 2020 08:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avtKB0SUHVdy; Mon, 30 Nov 2020 08:27:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6560787367;
	Mon, 30 Nov 2020 08:27:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54E46C1D9F;
	Mon, 30 Nov 2020 08:27:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDF1FC0052
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 08:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD5B822654
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 08:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzdShT3rc3oS for <iommu@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 08:27:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 0806121537
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 08:27:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 371E668AFE; Mon, 30 Nov 2020 09:27:47 +0100 (CET)
Date: Mon, 30 Nov 2020 09:27:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH 2/6] dma-direct: use __GFP_ZERO in dma_direct_alloc_pages
Message-ID: <20201130082746.GA32234@lst.de>
References: <20201124153845.132207-1-ribalda@chromium.org>
 <20201124153845.132207-2-ribalda@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124153845.132207-2-ribalda@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Nov 24, 2020 at 04:38:41PM +0100, Ricardo Ribalda wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> Prepare for supporting the DMA_ATTR_NO_KERNEL_MAPPING flag in
> dma_alloc_pages.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

FYI, this patch should be dropped as I've implemented the functionality
differently.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
