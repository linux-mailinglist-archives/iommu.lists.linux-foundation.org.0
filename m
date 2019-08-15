Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C678EDAE
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 16:05:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B2A6DF01;
	Thu, 15 Aug 2019 14:05:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 445B0EE5
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 14:05:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0D8BB711
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 14:05:34 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6F9C020644;
	Thu, 15 Aug 2019 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565877933;
	bh=1kLslZhODIOulMF95Mp3GaT4eL4PAbLGzgh4kOzOGWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=au9iTmh4J8UTOc/8JXy+/eWQAjp7807F+MVsQsyk2FspuCs3ijzAs+yYvR79zYMXc
	z6XJ68TrNJvxhcbMetWA6k4e8L6wIipTDZxHLgzSqAEJT8wJEPhU68Kr+olj41dMuN
	+vDfTSqYffB6Z5lL4uyC4aStHyB4Elgi4sBLqCGw=
Date: Thu, 15 Aug 2019 16:05:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: next take at setting up a dma mask by default for platform devices
Message-ID: <20190815140531.GC7174@kroah.com>
References: <20190811080520.21712-1-hch@lst.de>
	<20190815132318.GA27208@kroah.com> <20190815132531.GA12036@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815132531.GA12036@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Gavin Li <git@thegavinli.com>, Fabio Estevam <festevam@gmail.com>,
	linux-arch@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Olav Kongas <ok@artecdesign.ee>, Bin Liu <b-liu@ti.com>,
	linux-arm-kernel@lists.infradead.org, Geoff Levand <geoff@infradead.org>,
	Shawn Guo <shawnguo@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
	iommu@lists.linux-foundation.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linuxppc-dev@lists.ozlabs.org
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

On Thu, Aug 15, 2019 at 03:25:31PM +0200, Christoph Hellwig wrote:
> On Thu, Aug 15, 2019 at 03:23:18PM +0200, Greg Kroah-Hartman wrote:
> > I've taken the first 2 patches for 5.3-final.  Given that patch 3 needs
> > to be fixed, I'll wait for a respin of these before considering them.
> 
> I have a respun version ready, but I'd really like to hear some
> comments from usb developers about the approach before spamming
> everyone again..

Spam away, we can take it :)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
