Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C5C315329
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 16:51:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 20BD285F5B;
	Tue,  9 Feb 2021 15:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGdUaxGdT0eR; Tue,  9 Feb 2021 15:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 718D785F4D;
	Tue,  9 Feb 2021 15:51:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54609C013A;
	Tue,  9 Feb 2021 15:51:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38930C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 15:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 27B6687171
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 15:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tqcIiPRtkBqB for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 15:51:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C274887135
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 15:51:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9E5D467373; Tue,  9 Feb 2021 16:50:58 +0100 (CET)
Date: Tue, 9 Feb 2021 16:50:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: DMA direct mapping fix for 5.4 and earlier stable branches
Message-ID: <20210209155058.GA8912@lst.de>
References: <CAFA6WYNazCmYN20irLdNV+2vcv5dqR+grvaY-FA7q2WOBMs__g@mail.gmail.com>
 <YCIym62vHfbG+dWf@kroah.com>
 <CAFA6WYM+xJ0YDKenWFPMHrTz4gLWatnog84wyk31Xy2dTiT2RA@mail.gmail.com>
 <YCJCDZGa1Dhqv6Ni@kroah.com>
 <27bbe35deacb4ca49f31307f4ed551b5@SOC-EX02V.e01.socionext.com>
 <YCJUgKDNVjJ4dUqM@kroah.com> <20210209093642.GA1006@lst.de>
 <CAFA6WYO59w=wif8W16sG6BnzSjFhaY6PmRUTdSCu9A+zA7gzBw@mail.gmail.com>
 <e36b8a7d-a999-da09-d7d9-cc26579a65d1@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e36b8a7d-a999-da09-d7d9-cc26579a65d1@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>, obayashi.yoshimasa@socionext.com,
 stable <stable@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>
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

On Tue, Feb 09, 2021 at 12:45:11PM +0000, Robin Murphy wrote:
> It's not a bug, it's a fundamental design failure. dma_get_sgtable() has 
> only ever sort-of-worked for DMA buffers that come from CMA or regular page 
> allocations. In particular, a "no-map" DMA pool is not backed by kernel 
> memory, so does not have any corresponding page structs, so it's impossible 
> to generate a *valid* scatterlist to represent memory from that pool, 
> regardless of what you might get away with provided you don't poke too hard 
> at it.
>
> It is not a good API...

Yes, I don't think anyone should add new users of the API.

That being said the commit he is trying to backport fixes a bug in
the implementation that at least in theory could also affect in-tree
drivers.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
