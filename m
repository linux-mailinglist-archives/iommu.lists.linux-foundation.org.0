Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 20976258F94
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 15:55:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1577621538;
	Tue,  1 Sep 2020 13:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1m-2fEHWZIhw; Tue,  1 Sep 2020 13:55:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1843E204D6;
	Tue,  1 Sep 2020 13:55:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04E45C0051;
	Tue,  1 Sep 2020 13:55:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 000AEC0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 13:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DADF0204FD
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 13:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jv54HivUmSKb for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 13:55:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by silver.osuosl.org (Postfix) with ESMTP id CD5432152E
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 13:55:11 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kD6kf-0001nf-01; Tue, 01 Sep 2020 15:55:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 422A1C0E4C; Tue,  1 Sep 2020 15:49:49 +0200 (CEST)
Date: Tue, 1 Sep 2020 15:49:49 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/28] MIPS/jazzdma: decouple from dma-direct
Message-ID: <20200901134949.GB11944@alpha.franken.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819065555.1802761-11-hch@lst.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Wed, Aug 19, 2020 at 08:55:37AM +0200, Christoph Hellwig wrote:
> The jazzdma ops implement support for a very basic IOMMU.  Thus we really
> should not use the dma-direct code that takes physical address limits
> into account.  This survived through the great MIPS DMA ops cleanup mostly
> because I was lazy, but now it is time to fully split the implementations.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/jazz/jazzdma.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
