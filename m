Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5100320F0AD
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 10:43:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 06EB086914;
	Tue, 30 Jun 2020 08:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7o4Qtbi7xF6Q; Tue, 30 Jun 2020 08:42:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B522286999;
	Tue, 30 Jun 2020 08:42:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1D33C016E;
	Tue, 30 Jun 2020 08:42:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55700C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 08:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 444988835C
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 08:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2pZovGTexjY for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 08:42:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 968AA88359
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 08:42:56 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E504F26B; Tue, 30 Jun 2020 10:42:52 +0200 (CEST)
Date: Tue, 30 Jun 2020 10:42:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/iova: Don't BUG on invalid PFNs
Message-ID: <20200630084251.GA28824@8bytes.org>
References: <acbd2d092b42738a03a21b417ce64e27f8c91c86.1591103298.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acbd2d092b42738a03a21b417ce64e27f8c91c86.1591103298.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Prakash Gupta <guptap@codeaurora.org>
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

On Tue, Jun 02, 2020 at 02:08:18PM +0100, Robin Murphy wrote:
> Unlike the other instances which represent a complete loss of
> consistency within the rcache mechanism itself, or a fundamental
> and obvious misconfiguration by an IOMMU driver, the BUG_ON() in
> iova_magazine_free_pfns() can be provoked at more or less any time
> in a "spooky action-at-a-distance" manner by any old device driver
> passing nonsense to dma_unmap_*() which then propagates through to
> queue_iova().
> 
> Not only is this well outside the IOVA layer's control, it's also
> nowhere near fatal enough to justify panicking anyway - all that
> really achieves is to make debugging the offending driver more
> difficult. Let's simply WARN and otherwise ignore bogus PFNs.
> 
> Reported-by: Prakash Gupta <guptap@codeaurora.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/iova.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied without stable tag, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
