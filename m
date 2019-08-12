Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5710389D64
	for <lists.iommu@lfdr.de>; Mon, 12 Aug 2019 13:57:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0BFECCA1;
	Mon, 12 Aug 2019 11:57:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AD005C7D
	for <iommu@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 11:57:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 209CC2C6
	for <iommu@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 11:57:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9DBBD227A81; Mon, 12 Aug 2019 13:57:26 +0200 (CEST)
Date: Mon, 12 Aug 2019 13:57:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 3/6] usb: add a HCD_DMA flag instead of guestimating
	DMA capabilities
Message-ID: <20190812115726.GA9180@lst.de>
References: <20190811080520.21712-1-hch@lst.de>
	<20190811080520.21712-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811080520.21712-4-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-arch@vger.kernel.org, Gavin Li <git@thegavinli.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Geoff Levand <geoff@infradead.org>, Olav Kongas <ok@artecdesign.ee>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-usb@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>,
	linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
	iommu@lists.linux-foundation.org, Alan Stern <stern@rowland.harvard.edu>,
	NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Shawn Guo <shawnguo@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
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

> diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-ppc-of.c
> index 576f7d79ad4e..9d17e0695e35 100644
> --- a/drivers/usb/host/ehci-ppc-of.c
> +++ b/drivers/usb/host/ehci-ppc-of.c
> @@ -31,7 +31,7 @@ static const struct hc_driver ehci_ppc_of_hc_driver = {
>  	 * generic hardware linkage
>  	 */
>  	.irq			= ehci_irq,
> -	.flags			= HCD_MEMORY | HCD_USB2 | HCD_BH,
> +	.flags			= HCD_MEMORY | HC_DMA | HCD_USB2 | HCD_BH,

FYI, the kbuild bot found a little typo here, so even for the unlikely
case that the series is otherwise perfect I'll have to resend it at
least once.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
