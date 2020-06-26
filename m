Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2620BAC2
	for <lists.iommu@lfdr.de>; Fri, 26 Jun 2020 22:56:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA80F86B09;
	Fri, 26 Jun 2020 20:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aw7J1d9wmvB0; Fri, 26 Jun 2020 20:56:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A8D6C86AF4;
	Fri, 26 Jun 2020 20:56:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B711C016F;
	Fri, 26 Jun 2020 20:56:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4490EC016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 20:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 398A087E6E
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 20:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pVloX6YGI-73 for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 20:51:35 +0000 (UTC)
X-Greylist: delayed 00:06:26 by SQLgrey-1.7.6
Received: from smtp3.emailarray.com (smtp3.emailarray.com [65.39.216.17])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 355DC87DE2
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 20:51:35 +0000 (UTC)
Received: (qmail 90924 invoked by uid 89); 26 Jun 2020 20:44:53 -0000
Received: from unknown (HELO localhost)
 (amxlbW9uQGZsdWdzdmFtcC5jb21AMTYzLjExNC4xMzIuMw==) (POLARISLOCAL) 
 by smtp3.emailarray.com with SMTP; 26 Jun 2020 20:44:53 -0000
Date: Fri, 26 Jun 2020 13:44:48 -0700
From: Jonathan Lemon <jonathan.lemon@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Subject: Re: [PATCH net] xsk: remove cheap_dma optimization
Message-ID: <20200626204448.bxvr35qaxkfj6chs@bsd-mbp>
References: <20200626134358.90122-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626134358.90122-1-bjorn.topel@gmail.com>
X-Mailman-Approved-At: Fri, 26 Jun 2020 20:56:36 +0000
Cc: maximmi@mellanox.com, konrad.wilk@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, hch@lst.de,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Jun 26, 2020 at 03:43:58PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn.topel@intel.com>
> =

> When the AF_XDP buffer allocation API was introduced it had an
> optimization, "cheap_dma". The idea was that when the umem was DMA
> mapped, the pool also checked whether the mapping required a
> synchronization (CPU to device, and vice versa). If not, it would be
> marked as "cheap_dma" and the synchronization would be elided.
> =

> In [1] Christoph points out that the optimization above breaks the DMA
> API abstraction, and should be removed. Further, Christoph points out
> that optimizations like this should be done within the DMA mapping
> core, and not elsewhere.
> =

> Unfortunately this has implications for the packet rate
> performance. The AF_XDP rxdrop scenario shows a 9% decrease in packets
> per second.
> =

> [1] https://lore.kernel.org/netdev/20200626074725.GA21790@lst.de/
> =

> Cc: Christoph Hellwig <hch@lst.de>
> Fixes: 2b43470add8c ("xsk: Introduce AF_XDP buffer allocation API")
> Signed-off-by: Bj=F6rn T=F6pel <bjorn.topel@intel.com>

Acked-by: Jonathan Lemon <jonathan.lemon@gmail.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
