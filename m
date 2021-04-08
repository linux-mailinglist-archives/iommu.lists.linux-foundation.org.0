Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 20356358591
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 16:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD27607A4;
	Thu,  8 Apr 2021 14:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1zZ82AC5ltM; Thu,  8 Apr 2021 14:03:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD8156079D;
	Thu,  8 Apr 2021 14:03:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95138C000A;
	Thu,  8 Apr 2021 14:03:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF5C3C000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD60940117
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEz1v3OAdg_A for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 14:03:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C74F540115
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Wzp1tqb4dw0EqSQlc3CrRhCH0JS21BToDDTLM5xPt88=; b=s+A7GqlN1HqhXwAtTPX2IjQ3j1
 RxhMBRA3R7tKciW5COoAh9nZKfv+QCOrdQ53niSqSOeiHCARtsopYmEen0+q7yYOlcGd1+F/BILKy
 UvKQRjAR3igjcC4d6LwOYzLOroVSfzqLBzoqSGTg+B7P7u5cVXShRvF7LeX71ske9cKQq/jDXl38e
 /I9P+14ivQFhyUiLSHj4cWuAt5TWzLdKJQz9adqPxiSm9EzgQD/wPRCIJ2H27EEb6L0uOgTlod5s8
 5+Az/0kceMN0W2WqMuzLRuoSLZMtTnBaLTkEMIlJBWGaZPWEmKr0kS2fDzMFe18KJaGjq82cAwkg/
 au0srXCg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lUVEs-00GIfu-Ns; Thu, 08 Apr 2021 14:02:38 +0000
Date: Thu, 8 Apr 2021 15:02:30 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v4 09/15] iommu/io-pgtable-arm: Prepare PTE methods
 for handling multiple entries
Message-ID: <20210408140230.GA3884124@infradead.org>
References: <20210408045241.27316-1-isaacm@codeaurora.org>
 <20210408045241.27316-10-isaacm@codeaurora.org>
 <20210408135925.GC17998@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408135925.GC17998@willie-the-truck>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, pratikp@codeaurora.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Apr 08, 2021 at 02:59:26PM +0100, Will Deacon wrote:
> > -static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep,
> > +static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
> >  				struct io_pgtable_cfg *cfg)
> >  {
> >  	dma_sync_single_for_device(cfg->iommu_dev, __arm_lpae_dma_addr(ptep),
> > -				   sizeof(*ptep), DMA_TO_DEVICE);
> > +				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
> >  }
> 
> Have you tested this with CONFIG_DMA_API_DEBUG=y? I _think_ it should be
> ok as long as we don't attempt to sync across a page boundary, but it would
> be good to give it a spin just to check.

syncing over a page boundary is perfectly fine.  It just needs to say in
the bounds of the original mapping.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
