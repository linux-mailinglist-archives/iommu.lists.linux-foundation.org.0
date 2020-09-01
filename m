Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DE927258F18
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 15:31:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 71B5B1FF98;
	Tue,  1 Sep 2020 13:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVMiKgqKihKY; Tue,  1 Sep 2020 13:31:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C762820409;
	Tue,  1 Sep 2020 13:31:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA760C0051;
	Tue,  1 Sep 2020 13:31:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8284EC0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 13:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7BF3586CAB
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 13:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPADid2xWcd9 for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 13:31:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6D58886CAF
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 13:31:23 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kD6NY-0001cg-00; Tue, 01 Sep 2020 15:31:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id A31F7C0E44; Tue,  1 Sep 2020 15:29:05 +0200 (CEST)
Date: Tue, 1 Sep 2020 15:29:05 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/28] lib82596: move DMA allocation into the callers of
 i82596_probe
Message-ID: <20200901132905.GA11506@alpha.franken.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819065555.1802761-7-hch@lst.de>
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

On Wed, Aug 19, 2020 at 08:55:33AM +0200, Christoph Hellwig wrote:
> This allows us to get rid of the LIB82596_DMA_ATTR defined and prepare
> for untangling the coherent vs non-coherent DMA allocation API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/net/ethernet/i825xx/lasi_82596.c | 24 ++++++++++------
>  drivers/net/ethernet/i825xx/lib82596.c   | 36 ++++++++----------------
>  drivers/net/ethernet/i825xx/sni_82596.c  | 19 +++++++++----
>  3 files changed, 40 insertions(+), 39 deletions(-)
> 
> [...]
> diff --git a/drivers/net/ethernet/i825xx/sni_82596.c b/drivers/net/ethernet/i825xx/sni_82596.c
> index 22f5887578b2bd..e80e790ffbd4d4 100644
> --- a/drivers/net/ethernet/i825xx/sni_82596.c
> +++ b/drivers/net/ethernet/i825xx/sni_82596.c
> @@ -24,8 +24,6 @@
>  
>  static const char sni_82596_string[] = "snirm_82596";
>  
> -#define LIB82596_DMA_ATTR	0
> -
>  #define DMA_WBACK(priv, addr, len)     do { } while (0)
>  #define DMA_INV(priv, addr, len)       do { } while (0)
>  #define DMA_WBACK_INV(priv, addr, len) do { } while (0)
> @@ -134,10 +132,19 @@ static int sni_82596_probe(struct platform_device *dev)
>  	lp->ca = ca_addr;
>  	lp->mpu_port = mpu_addr;
>  
> +	lp->dma = dma_alloc_coherent(dev->dev.parent, sizeof(struct i596_dma),
> +				     &lp->dma_addr, GFP_KERNEL);

this needs to use &dev->dev as device argument otherwise I get a

WARNING: CPU: 0 PID: 1 at linux/kernel/dma/mapping.c:416 dma_alloc_attrs+0x64/0x98

(coherent_dma_mask is set correctly).

dev->dev.parent was correct when going from netdevice to underlying device,
but now allocation is done via platform_device probe. I wonder why this works
for parisc.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
