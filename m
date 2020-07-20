Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7E9225780
	for <lists.iommu@lfdr.de>; Mon, 20 Jul 2020 08:20:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 304ED85DD1;
	Mon, 20 Jul 2020 06:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KluF6Zga39X; Mon, 20 Jul 2020 06:20:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54BC585DC7;
	Mon, 20 Jul 2020 06:20:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FAC7C016F;
	Mon, 20 Jul 2020 06:20:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91A82C016F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 06:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7656386C02
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 06:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3H+wYDDaNQE for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 06:20:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DAE4086C12
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 06:20:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 324A068BFE; Mon, 20 Jul 2020 08:20:24 +0200 (CEST)
Date: Mon, 20 Jul 2020 08:20:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/5] dma-mapping: make support for dma ops optional
Message-ID: <20200720062024.GA10878@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-4-hch@lst.de> <20200718171714.GA237687@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718171714.GA237687@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Sat, Jul 18, 2020 at 10:17:14AM -0700, Guenter Roeck wrote:
> On Wed, Jul 08, 2020 at 05:24:47PM +0200, Christoph Hellwig wrote:
> > Avoid the overhead of the dma ops support for tiny builds that only
> > use the direct mapping.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> For ppc:pmac32_defconfig and other configurations, this patch results in:

Fixed and force pushed.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
