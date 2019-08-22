Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CBE999E3
	for <lists.iommu@lfdr.de>; Thu, 22 Aug 2019 19:11:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C044B8E;
	Thu, 22 Aug 2019 17:11:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8578FB50
	for <iommu@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 17:11:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB3D067F
	for <iommu@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 17:11:08 +0000 (UTC)
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net [184.188.36.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 821062089E;
	Thu, 22 Aug 2019 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566493868;
	bh=Eu5zYHsgZr/DzgkYZtrV8Xf3yPbZrB6F/5Aa3SVutiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgpviCCuEYOqne1wsEWgd6l+Gzkw+5xYBwggmYQtDll2PjCPqB1qmScWDXN1P/B5K
	B/RNg/icssWR6AjcDPdeqSlGGxWCAS2rl4YBtOQnalt5AVfZm3e4ze3if6d5gFRY2x
	+KvCpV/lo8jNDpZObQ1PLinLdtTKiva/GCEIEsL4=
Date: Thu, 22 Aug 2019 10:11:08 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: next take at setting up a dma mask by default for platform
	devices v2
Message-ID: <20190822171108.GA17471@kroah.com>
References: <20190816062435.881-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816062435.881-1-hch@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-arch@vger.kernel.org, Gavin Li <git@thegavinli.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-usb@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>, iommu@lists.linux-foundation.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-m68k@lists.linux-m68k.org, Alan Stern <stern@rowland.harvard.edu>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Shawn Guo <shawnguo@kernel.org>, Bin Liu <b-liu@ti.com>,
	linux-arm-kernel@lists.infradead.org
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

On Fri, Aug 16, 2019 at 08:24:29AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this is another attempt to make sure the dma_mask pointer is always
> initialized for platform devices.  Not doing so lead to lots of
> boilerplate code, and makes platform devices different from all our
> major busses like PCI where we always set up a dma_mask.  In the long
> run this should also help to eventually make dma_mask a scalar value
> instead of a pointer and remove even more cruft.
> 
> The bigger blocker for this last time was the fact that the usb
> subsystem uses the presence or lack of a dma_mask to check if the core
> should do dma mapping for the driver, which is highly unusual.  So we
> fix this first.  Note that this has some overlap with the pending
> desire to use the proper dma_mmap_coherent helper for mapping usb
> buffers.  The first two patches have already been queued up by Greg
> and are only included for completeness.

Note to everyone.  The first two patches in this series is already in
5.3-rc5.

I've applied the rest of the series to my usb-next branch (with the 6th
patch landing there later today.)  They are scheduled to be merge to
Linus in 5.4-rc1.

Christoph, thanks so much for these cleanups.

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
