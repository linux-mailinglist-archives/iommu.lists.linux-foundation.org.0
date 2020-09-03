Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D007C25BDA7
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 10:46:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B21486C1B;
	Thu,  3 Sep 2020 08:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NGao4pTV9FRG; Thu,  3 Sep 2020 08:46:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1768D86BFF;
	Thu,  3 Sep 2020 08:46:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01F54C07FF;
	Thu,  3 Sep 2020 08:46:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57DA7C0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 08:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 54C0D86B0B
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 08:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OH-rTxrpAUc5 for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 08:46:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1FA1A86B0A
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 08:46:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F0C1868CEE; Thu,  3 Sep 2020 10:46:43 +0200 (CEST)
Date: Thu, 3 Sep 2020 10:46:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 22/28] sgiseeq: convert from dma_cache_sync to
 dma_sync_single_for_device
Message-ID: <20200903084643.GA25111@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-23-hch@lst.de>
 <20200901152209.GA14288@alpha.franken.de>
 <20200901171241.GA20685@alpha.franken.de> <20200901171627.GA8255@lst.de>
 <20200901173810.GA25282@alpha.franken.de> <20200903084302.GB24410@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903084302.GB24410@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-nvme@lists.infradead.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-scsi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
 Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
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

On Thu, Sep 03, 2020 at 10:43:02AM +0200, Christoph Hellwig wrote:
> On Tue, Sep 01, 2020 at 07:38:10PM +0200, Thomas Bogendoerfer wrote:
> > this is the problem:
> > 
> >        /* Always check for received packets. */
> >         sgiseeq_rx(dev, sp, hregs, sregs);
> > 
> > so the driver will look at the rx descriptor on every interrupt, so
> > we cache the rx descriptor on the first interrupt and if there was
> > $no rx packet, we will only see it, if cache line gets flushed for
> > some other reason.
> 
> That means a transfer back to device ownership is missing after a
> (negative) check.

E.g. something like this for the particular problem, although there
might be other hiding elsewhere:

diff --git a/drivers/net/ethernet/seeq/sgiseeq.c b/drivers/net/ethernet/seeq/sgiseeq.c
index 8507ff2420143a..a1c7be8a0d1e5d 100644
--- a/drivers/net/ethernet/seeq/sgiseeq.c
+++ b/drivers/net/ethernet/seeq/sgiseeq.c
@@ -403,6 +403,8 @@ static inline void sgiseeq_rx(struct net_device *dev, struct sgiseeq_private *sp
 		rd = &sp->rx_desc[sp->rx_new];
 		dma_sync_desc_cpu(dev, rd);
 	}
+	dma_sync_desc_dev(dev, rd);
+
 	dma_sync_desc_cpu(dev, &sp->rx_desc[orig_end]);
 	sp->rx_desc[orig_end].rdma.cntinfo &= ~(HPCDMA_EOR);
 	dma_sync_desc_dev(dev, &sp->rx_desc[orig_end]);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
