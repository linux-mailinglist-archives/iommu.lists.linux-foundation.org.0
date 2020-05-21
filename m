Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E128C1DD642
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 20:49:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8599C88888;
	Thu, 21 May 2020 18:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2k2RHtdkvjvd; Thu, 21 May 2020 18:49:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F03D8888F8;
	Thu, 21 May 2020 18:49:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D49BDC0176;
	Thu, 21 May 2020 18:49:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8324C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 18:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D8D4081ECF
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 18:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6AB4OStehEa for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 18:49:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5650B81AE8
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 18:49:07 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C68EB2088E;
 Thu, 21 May 2020 18:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590086947;
 bh=MQiydCJAeNQDDg6xvAARulcUycFi5vbJdxdeJlhzfDE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QKmNH2VvPf57Na/zQ2gmA79CWHOkhxYqCWUHTz8GymARd56PJRzMnMs2ugMmGlMSL
 lWg2YzYv8S365N3SrLlBdxy2pcfoDtWYkKRmnetUqoAv3ba8S13xoQ2kkTYRrFJYT0
 oG6yUhQgBGpz9WjQLfD8WBJ0b6BuVT+DUGET+qBQ=
Date: Thu, 21 May 2020 11:49:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Prakash Gupta <guptap@codeaurora.org>
Subject: Re: [PATCH] iommu/dma: limit iova free size to unmmaped iova
Message-Id: <20200521114906.2f38fc04d3600d41f3409bd9@linux-foundation.org>
In-Reply-To: <20200521113004.12438-1-guptap@codeaurora.org>
References: <20200521113004.12438-1-guptap@codeaurora.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: linux-mm@kvack.org, mhocko@suse.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On Thu, 21 May 2020 17:00:04 +0530 Prakash Gupta <guptap@codeaurora.org> wrote:

> Limit the iova size while freeing based on unmapped size. In absence of
> this even with unmap failure, invalid iova is pushed to iova rcache and
> subsequently can cause panic while rcache magazine is freed.
> 
> Signed-off-by: Prakash Gupta <guptap@codeaurora.org>
> 

I think we need a cc:stable here?

> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -472,7 +472,8 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
>  
>  	if (!cookie->fq_domain)
>  		iommu_tlb_sync(domain, &iotlb_gather);
> -	iommu_dma_free_iova(cookie, dma_addr, size);
> +	if (unmapped)
> +		iommu_dma_free_iova(cookie, dma_addr, unmapped);
>  }
>  
>  static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,

I'll assume that Joerg will handle this fix?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
