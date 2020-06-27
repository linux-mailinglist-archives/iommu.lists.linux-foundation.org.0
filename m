Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B58920BF32
	for <lists.iommu@lfdr.de>; Sat, 27 Jun 2020 09:04:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D0A1688908;
	Sat, 27 Jun 2020 07:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ID0i3NjxspmV; Sat, 27 Jun 2020 07:04:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 62DBC8881A;
	Sat, 27 Jun 2020 07:04:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49D3EC016F;
	Sat, 27 Jun 2020 07:04:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E834C016F
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7ACAB868CB
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTTLGRVxr_8E for <iommu@lists.linux-foundation.org>;
 Sat, 27 Jun 2020 07:04:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E624685582
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:04:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 229C568B02; Sat, 27 Jun 2020 09:04:07 +0200 (CEST)
Date: Sat, 27 Jun 2020 09:04:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net] xsk: remove cheap_dma optimization
Message-ID: <20200627070406.GB11854@lst.de>
References: <20200626134358.90122-1-bjorn.topel@gmail.com>
 <c60dfb5a-2bf3-20bd-74b3-6b5e215f73f8@iogearbox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c60dfb5a-2bf3-20bd-74b3-6b5e215f73f8@iogearbox.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: maximmi@mellanox.com, konrad.wilk@oracle.com, jonathan.lemon@gmail.com,
 linux-kernel@vger.kernel.org, hch@lst.de, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>, davem@davemloft.net,
 magnus.karlsson@intel.com
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

On Sat, Jun 27, 2020 at 01:00:19AM +0200, Daniel Borkmann wrote:
> Given there is roughly a ~5 weeks window at max where this removal could
> still be applied in the worst case, could we come up with a fix / proposal
> first that moves this into the DMA mapping core? If there is something that
> can be agreed upon by all parties, then we could avoid re-adding the 9%
> slowdown. :/

I'd rather turn it upside down - this abuse of the internals blocks work
that has basically just missed the previous window and I'm not going
to wait weeks to sort out the API misuse.  But we can add optimizations
back later if we find a sane way.

That being said I really can't see how this would make so much of a
difference.  What architecture and what dma_ops are you using for
those measurements?  What is the workload?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
