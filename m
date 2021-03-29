Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBDB34C300
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 07:29:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D01D402C7;
	Mon, 29 Mar 2021 05:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kU0HlXgskAQe; Mon, 29 Mar 2021 05:29:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED63940266;
	Mon, 29 Mar 2021 05:29:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA85BC0011;
	Mon, 29 Mar 2021 05:29:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31B75C000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 05:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13C3060616
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 05:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aw5SyVFrQeNZ for <iommu@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 05:29:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F095E605D7
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 05:29:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F142568BEB; Mon, 29 Mar 2021 07:29:10 +0200 (CEST)
Date: Mon, 29 Mar 2021 07:29:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 00/30] DMA: Mundane typo fixes
Message-ID: <20210329052910.GB26495@lst.de>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: dave.jiang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
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

I really don't think these typo patchbomb are that useful.  I'm all
for fixing typos when working with a subsystem, but I'm not sure these
patchbombs help anything.

On Mon, Mar 29, 2021 at 05:22:56AM +0530, Bhaskar Chowdhury wrote:
> This patch series fixes some trivial and rudimentary spellings in the COMMENT
> sections.
> 
> Bhaskar Chowdhury (30):
>   acpi-dma.c: Fix couple of typos
>   altera-msgdma.c: Couple of typos fixed
>   amba-pl08x.c: Fixed couple of typos
>   bcm-sba-raid.c: Few typos fixed
>   bcm2835-dma.c: Fix a typo
>   idma64.c: Fix couple of typos
>   iop-adma.c: Few typos fixed
>   mv_xor.c: Fix a typo
>   mv_xor.h: Fixed a typo
>   mv_xor_v2.c: Fix a typo
>   nbpfaxi.c: Fixed a typo
>   of-dma.c: Fixed a typo
>   s3c24xx-dma.c: Fix a typo
>   Revert "s3c24xx-dma.c: Fix a typo"
>   s3c24xx-dma.c: Few typos fixed
>   st_fdma.h: Fix couple of typos
>   ste_dma40_ll.h: Fix a typo
>   tegra20-apb-dma.c: Fixed a typo
>   xgene-dma.c: Few spello fixes
>   at_hdmac.c: Quite a few spello fixes
>   owl-dma.c: Fix a typo
>   at_hdmac_regs.h: Couple of typo fixes
>   dma-jz4780.c: Fix a typo
>   Kconfig: Change Synopsys to Synopsis
>   ste_dma40.c: Few spello fixes
>   dw-axi-dmac-platform.c: Few typos fixed
>   dpaa2-qdma.c: Fix a typo
>   usb-dmac.c: Fix a typo
>   edma.c: Fix a typo
>   xilinx_dma.c: Fix a typo
> 
>  drivers/dma/Kconfig                            |  8 ++++----
>  drivers/dma/acpi-dma.c                         |  4 ++--
>  drivers/dma/altera-msgdma.c                    |  4 ++--
>  drivers/dma/amba-pl08x.c                       |  4 ++--
>  drivers/dma/at_hdmac.c                         | 14 +++++++-------
>  drivers/dma/at_hdmac_regs.h                    |  4 ++--
>  drivers/dma/bcm-sba-raid.c                     |  8 ++++----
>  drivers/dma/bcm2835-dma.c                      |  2 +-
>  drivers/dma/dma-jz4780.c                       |  2 +-
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  8 ++++----
>  drivers/dma/idma64.c                           |  4 ++--
>  drivers/dma/iop-adma.c                         |  6 +++---
>  drivers/dma/mv_xor.c                           |  2 +-
>  drivers/dma/mv_xor.h                           |  2 +-
>  drivers/dma/mv_xor_v2.c                        |  2 +-
>  drivers/dma/nbpfaxi.c                          |  2 +-
>  drivers/dma/of-dma.c                           |  2 +-
>  drivers/dma/owl-dma.c                          |  2 +-
>  drivers/dma/s3c24xx-dma.c                      |  6 +++---
>  drivers/dma/sh/shdmac.c                        |  2 +-
>  drivers/dma/sh/usb-dmac.c                      |  2 +-
>  drivers/dma/st_fdma.h                          |  4 ++--
>  drivers/dma/ste_dma40.c                        | 10 +++++-----
>  drivers/dma/ste_dma40_ll.h                     |  2 +-
>  drivers/dma/tegra20-apb-dma.c                  |  2 +-
>  drivers/dma/ti/edma.c                          |  2 +-
>  drivers/dma/xgene-dma.c                        |  6 +++---
>  drivers/dma/xilinx/xilinx_dma.c                |  2 +-
>  28 files changed, 59 insertions(+), 59 deletions(-)
> 
> --
> 2.26.3
---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
