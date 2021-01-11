Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5FB2F1AAA
	for <lists.iommu@lfdr.de>; Mon, 11 Jan 2021 17:14:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9453C85BD3;
	Mon, 11 Jan 2021 16:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id er38Gjtrf6m0; Mon, 11 Jan 2021 16:14:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABB9D86055;
	Mon, 11 Jan 2021 16:14:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F54EC013A;
	Mon, 11 Jan 2021 16:14:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B54BC013A
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 16:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3978E21515
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 16:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPFZjaI5PfYU for <iommu@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 16:14:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id BB6B721514
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 16:14:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8DFE2247F;
 Mon, 11 Jan 2021 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610381688;
 bh=vU6H120stfuOQ5pc95UICs91NrCA+KFQFAToskWyZpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hoSh/oB7ljXzyLCi+dfAntUXnizW2+IZJheAzTKPcGNh23wFUFYgQUhq27SIW4LDx
 OY+DaAU2Jf/Ag6O/o111G7gj+To6ZlXDCHNfiy9FXxnQIwrlhfXWQJ/7M6PxWi8m98
 BNG+d/x4LtbzR9WHiAzpZNbY9j+SgRuaJV4Xaf3c=
Date: Mon, 11 Jan 2021 17:15:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Marc Orr <marcorr@google.com>
Subject: Re: [PATCH] dma: mark unmapped DMA scatter/gather invalid
Message-ID: <X/x5v4Gjretp4lii@kroah.com>
References: <20210111154335.23388-1-marcorr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111154335.23388-1-marcorr@google.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de,
 jxgao@google.com
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

On Mon, Jan 11, 2021 at 07:43:35AM -0800, Marc Orr wrote:
> This patch updates dma_direct_unmap_sg() to mark each scatter/gather
> entry invalid, after it's unmapped. This fixes two issues:
> 
> 1. It makes the unmapping code able to tolerate a double unmap.
> 2. It prevents the NVMe driver from erroneously treating an unmapped DMA
> address as mapped.
> 
> The bug that motivated this patch was the following sequence, which
> occurred within the NVMe driver, with the kernel flag `swiotlb=force`.
> 
> * NVMe driver calls dma_direct_map_sg()
> * dma_direct_map_sg() fails part way through the scatter gather/list
> * dma_direct_map_sg() calls dma_direct_unmap_sg() to unmap any entries
>   succeeded.
> * NVMe driver calls dma_direct_unmap_sg(), redundantly, leading to a
>   double unmap, which is a bug.
> 
> With this patch, a hadoop workload running on a cluster of three AMD
> SEV VMs, is able to succeed. Without the patch, the hadoop workload
> suffers application-level and even VM-level failures.
> 
> Tested-by: Jianxiong Gao <jxgao@google.com>
> Tested-by: Marc Orr <marcorr@google.com>
> Reviewed-by: Jianxiong Gao <jxgao@google.com>
> Signed-off-by: Marc Orr <marcorr@google.com>
> ---
>  kernel/dma/direct.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
