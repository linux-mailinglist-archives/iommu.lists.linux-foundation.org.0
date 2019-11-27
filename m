Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBEC10B42C
	for <lists.iommu@lfdr.de>; Wed, 27 Nov 2019 18:13:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5602F85EFB;
	Wed, 27 Nov 2019 17:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TetrTdok9pW0; Wed, 27 Nov 2019 17:13:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 034AE856BF;
	Wed, 27 Nov 2019 17:13:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9062C1DE1;
	Wed, 27 Nov 2019 17:13:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6964C0881
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 17:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B32EC85BCC
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 17:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arIaBCQMzcsL for <iommu@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 17:13:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 25F62857CB
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pEDHHVwu6bn2JJ/YM1Ka+McvYISRwpXtn4e69OMZoRY=; b=FrHgGXXUzlnTbKjWArLd6PYTb
 ptGd/xSCW7mCL42n2ht9QnfSu5p+yMMhQbgamAE+g1fmA/BoB1cD9lWaBQkgtH0Bqtf6GRjG6Gl39
 UiuiXwouB1kkvbpo/tLm8ckMVYF2LkPIREf8Qu2ztxwlQiaGPF29U4Ed7+z/vn7ELN4Pgeh9j6Roh
 Uy3kJNDkasfGlq8LeWEYwZyanCh7RLCk/96vXOjaq4SqbEqJrPIndLN/f9lUZxtioe2OAv7dt8AWk
 25Az9q76OwMcN53IYSJEPANTwqzKuwqjDvRjJ7zlviJAH3BjqFvE2CG+iNKLdH3iGEoNOKTZFfxlr
 yopbuTodg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ia0sU-0005M9-Ce; Wed, 27 Nov 2019 17:13:22 +0000
Date: Wed, 27 Nov 2019 09:13:22 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] dma-mapping: move dma_addressing_limited out of line
Message-ID: <20191127171322.GE20752@bombadil.infradead.org>
References: <20191127144006.25998-1-hch@lst.de>
 <20191127144006.25998-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127144006.25998-2-hch@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
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

On Wed, Nov 27, 2019 at 03:40:05PM +0100, Christoph Hellwig wrote:
> +/**
> + * dma_addressing_limited - return if the device is addressing limited
> + * @dev:	device to check
> + *
> + * Return %true if the devices DMA mask is too small to address all memory in

Could I trouble you to use a : after Return?  That turns it into its
own section rather than making it part of the generic description.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
