Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9751AF9F6
	for <lists.iommu@lfdr.de>; Sun, 19 Apr 2020 14:25:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F1318203D8;
	Sun, 19 Apr 2020 12:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kN-MrAnEfHnY; Sun, 19 Apr 2020 12:25:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 98ED42010B;
	Sun, 19 Apr 2020 12:25:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81AFEC1D89;
	Sun, 19 Apr 2020 12:25:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C76FEC0177
 for <iommu@lists.linux-foundation.org>; Sun, 19 Apr 2020 12:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B50A2875BE
 for <iommu@lists.linux-foundation.org>; Sun, 19 Apr 2020 12:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHSpsgBaGtyW for <iommu@lists.linux-foundation.org>;
 Sun, 19 Apr 2020 12:25:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 055F9872A6
 for <iommu@lists.linux-foundation.org>; Sun, 19 Apr 2020 12:25:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id EB734342; Sun, 19 Apr 2020 14:25:03 +0200 (CEST)
Date: Sun, 19 Apr 2020 14:25:02 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200419122502.GI21900@8bytes.org>
References: <20200414122506.438134-1-hch@lst.de>
 <20200414122506.438134-4-hch@lst.de>
 <20200418124205.GD6113@8bytes.org> <20200419080058.GB12222@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200419080058.GB12222@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
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

On Sun, Apr 19, 2020 at 10:00:58AM +0200, Christoph Hellwig wrote:
> The difference is that NULL ops mean imply the direct mapping is always
> used, dma_ops_bypass means a direct mapping is used if no bounce buffering
> using swiotlb is needed, which should also answer your first question.
> The idea is to consolidate code in the core to use an opportunistic
> direct mapping instead of the dynamic iommu mapping.  I though the cover
> letter and commit log explained this well enough, but maybe I need to
> do a better job.

Ah right, now I see it, when dma_ops_bypass is set it will only use
direct mapping when the available memory fits into the device's
dma_masks, and calls into dma_ops otherwise.

I wonder how that will interact with an IOMMU driver, which has to make
sure that the direct mapping is accessible for the device at all.  It
can either put the device into a passthrough domain for direct mapping
or into a re-mapped domain, but then all DMA-API calls need to use dma-ops.
When the dma_mask covers available memory but coherent_mask doesn't,
the streaming calls will use dma-direct and alloc_coherent() calls into
dma-ops. There is no way for the IOMMU driver to ensure both works.

So what are the conditions under which an IOMMU driver would set
dma_ops_bypass to 1 and get a different result as to when setting
dev->dma_ops to NULL?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
