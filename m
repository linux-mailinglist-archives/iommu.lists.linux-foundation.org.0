Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6D619FB2D
	for <lists.iommu@lfdr.de>; Mon,  6 Apr 2020 19:17:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5F7B220116;
	Mon,  6 Apr 2020 17:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u+5aHdgbvMhQ; Mon,  6 Apr 2020 17:17:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1DCCA21532;
	Mon,  6 Apr 2020 17:17:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0215CC1AE2;
	Mon,  6 Apr 2020 17:17:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F16A1C0177
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 17:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DAD29885B9
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 17:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A+cdvL3VngQI for <iommu@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 17:17:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A8C888858D
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 17:17:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0319068BEB; Mon,  6 Apr 2020 19:17:06 +0200 (CEST)
Date: Mon, 6 Apr 2020 19:17:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200406171706.GA3231@lst.de>
References: <87sghz2ibh.fsf@linux.ibm.com> <20200323172256.GB31269@lst.de>
 <ffce1af6-a215-dee8-7b5c-2111f43accfd@ozlabs.ru>
 <20200324075402.GJ23447@lst.de>
 <41975da3-3a4a-fc3c-2b90-8d607cf220e6@ozlabs.ru>
 <20200325083740.GC21605@lst.de>
 <a705afc5-779d-baf4-e5d2-e2da04c82743@ozlabs.ru>
 <213b0c7d-f908-b4f4-466d-6240c3622cd6@ozlabs.ru>
 <20200406115016.GA10941@lst.de>
 <348046e7-7a38-62d6-4df0-e4a537b98926@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <348046e7-7a38-62d6-4df0-e4a537b98926@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
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

On Mon, Apr 06, 2020 at 11:25:09PM +1000, Alexey Kardashevskiy wrote:
> >> Do you see any serious problem with this approach? Thanks!
> > 
> > Do you have a link to the whole branch?  The github UI is unfortunately
> > unusable for that (or I'm missing something).
> 
> The UI shows the branch but since I rebased and forcepushed it, it does
> not. Here is the current one with:
> 
> https://github.com/aik/linux/commits/dma-bypass.3

Ok, so we use the core bypass without persistent memory, and then
have another bypass mode on top.  Not great, but I can't think
of anything better.  Note that your checks for the map_sg case
aren't very efficient - for one it would make sense to calculate
the limit only once, but also it would make sense to reuse the
calculted diecect mapping addresses instead of doing another pass
later on in the dma-direct code.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
