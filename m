Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 55965435B99
	for <lists.iommu@lfdr.de>; Thu, 21 Oct 2021 09:22:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6FCD401D5;
	Thu, 21 Oct 2021 07:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2bBa-p712JP; Thu, 21 Oct 2021 07:22:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E2AEA401C8;
	Thu, 21 Oct 2021 07:22:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3F89C0036;
	Thu, 21 Oct 2021 07:22:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB13BC0011
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 07:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC97E4010A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 07:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-rv7FKxlE2S for <iommu@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 07:22:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 316D94007A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 07:22:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D34B168BEB; Thu, 21 Oct 2021 09:22:33 +0200 (CEST)
Date: Thu, 21 Oct 2021 09:22:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 2/4] dma-direct: leak memory that can't be re-encrypted
Message-ID: <20211021072233.GA29169@lst.de>
References: <20211019122916.2468032-1-hch@lst.de>
 <20211019122916.2468032-3-hch@lst.de>
 <c116b963-1a53-bb5a-feab-2abaee6fd86@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c116b963-1a53-bb5a-feab-2abaee6fd86@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Tue, Oct 19, 2021 at 12:56:36PM -0700, David Rientjes wrote:
> > -	dma_set_encrypted(dev, vaddr, 1 << page_order);
> > +	if (dma_set_encrypted(dev, vaddr, 1 << page_order)) {
> > +		pr_warn_ratelimited(
> > +			"leaking DMA memory that can't be re-encrypted\n");
> > +	}
> 
> Is this actually leaking the memory?

Yes, it should return here.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
