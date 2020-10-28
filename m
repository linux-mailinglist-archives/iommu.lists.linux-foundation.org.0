Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A729D149
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 18:21:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 546D986A4D;
	Wed, 28 Oct 2020 17:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1sUacKMQ5Hk; Wed, 28 Oct 2020 17:21:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B31486A46;
	Wed, 28 Oct 2020 17:21:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CA20C0051;
	Wed, 28 Oct 2020 17:21:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CE04C0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 37C3387322
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbW3xtvT2Nco for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 17:21:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D69658731A
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:21:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C423468B02; Wed, 28 Oct 2020 18:21:06 +0100 (CET)
Date: Wed, 28 Oct 2020 18:21:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2 1/2] dma: Allow mixing bypass and normal
 IOMMU operation
Message-ID: <20201028172106.GA10015@lst.de>
References: <20201027101841.96056-1-aik@ozlabs.ru>
 <20201027101841.96056-2-aik@ozlabs.ru> <20201027164858.GA30651@lst.de>
 <28147035-500d-f3cd-f283-257066343697@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28147035-500d-f3cd-f283-257066343697@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
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

On Wed, Oct 28, 2020 at 05:55:23PM +1100, Alexey Kardashevskiy wrote:
>
> It is passing an address of the end of the mapped area so passing a page 
> struct means passing page and offset which is an extra parameter and we do 
> not want to do anything with the page in those hooks anyway so I'd keep it 
> as is.
>
>
>> and
>>     maybe even hide the dma_map_direct inside it.
>
> Call dma_map_direct() from arch_dma_map_page_direct() if 
> arch_dma_map_page_direct() is defined? Seems suboptimal as it is going to 
> be bypass=true in most cases and we save one call by avoiding calling 
> arch_dma_map_page_direct(). Unless I missed something?

C does not even evaluate the right hand side of a || expression if the
left hand evaluates to true.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
