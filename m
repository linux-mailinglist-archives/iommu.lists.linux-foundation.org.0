Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7BF8ECBB
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 15:25:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 82921109E;
	Thu, 15 Aug 2019 13:25:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1FE09B6D
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:25:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B3498711
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:25:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5010F68AFE; Thu, 15 Aug 2019 15:25:31 +0200 (CEST)
Date: Thu, 15 Aug 2019 15:25:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: next take at setting up a dma mask by default for platform devices
Message-ID: <20190815132531.GA12036@lst.de>
References: <20190811080520.21712-1-hch@lst.de>
	<20190815132318.GA27208@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815132318.GA27208@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Gavin Li <git@thegavinli.com>, Fabio Estevam <festevam@gmail.com>,
	Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>,
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

On Thu, Aug 15, 2019 at 03:23:18PM +0200, Greg Kroah-Hartman wrote:
> I've taken the first 2 patches for 5.3-final.  Given that patch 3 needs
> to be fixed, I'll wait for a respin of these before considering them.

I have a respun version ready, but I'd really like to hear some
comments from usb developers about the approach before spamming
everyone again..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
