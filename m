Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B76262F
	for <lists.iommu@lfdr.de>; Mon,  8 Jul 2019 18:28:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AD9D428C7;
	Mon,  8 Jul 2019 16:28:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A6A7328B6
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 16:22:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1A564882
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 16:22:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 292AE227A81; Mon,  8 Jul 2019 18:22:30 +0200 (CEST)
Date: Mon, 8 Jul 2019 18:22:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [RFC PATCH v7 0/5] treewide: improve R-Car SDHI performance
Message-ID: <20190708162229.GA10311@lst.de>
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20190701083253.GA22719@lst.de>
	<CAPDyKFpg6zMRtnD89juuXR8Epas7qJOo8GgdTR=Q1kbZ0=69LA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFpg6zMRtnD89juuXR8Epas7qJOo8GgdTR=Q1kbZ0=69LA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
	Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, Jul 08, 2019 at 01:45:55PM +0200, Ulf Hansson wrote:
> On Mon, 1 Jul 2019 at 10:32, Christoph Hellwig <hch@lst.de> wrote:
> >
> > Any comments from the block, iommu and mmc maintainers?  I'd be happy
> > to queue this up in the dma-mapping tree, but I'll need some ACKs
> > for that fast.  Alternatively I can just queue up the DMA API bits,
> > leaving the rest for the next merge window, but would drag things
> > out far too long IMHO.
> 
> Apologize for the delay, the mmc parts looks good to me. If not too
> late, feel free to pick it up.
> 
> Otherwise, let's do it for the next cycle.

I was out the last couple days, so it has to be next cycle.  But it
would still make sense to get everything into a single tree.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
