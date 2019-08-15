Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0F8ECE4
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 15:32:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 45EE0B8E;
	Thu, 15 Aug 2019 13:32:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0250D265
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:32:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 90BC28A0
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:32:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AA62D68BFE; Thu, 15 Aug 2019 15:32:04 +0200 (CEST)
Date: Thu, 15 Aug 2019 15:32:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 6/6] driver core: initialize a default DMA mask for
	platform device
Message-ID: <20190815133204.GD12036@lst.de>
References: <20190811080520.21712-1-hch@lst.de>
	<20190811080520.21712-7-hch@lst.de>
	<fbea6e6d-7721-b51d-0501-582e8446e9c9@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbea6e6d-7721-b51d-0501-582e8446e9c9@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Gavin Li <git@thegavinli.com>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Olav Kongas <ok@artecdesign.ee>, Bin Liu <b-liu@ti.com>,
	linux-arm-kernel@lists.infradead.org, Geoff Levand <geoff@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tony Prisk <linux@prisktech.co.nz>, iommu@lists.linux-foundation.org,
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

On Wed, Aug 14, 2019 at 04:49:13PM +0100, Robin Murphy wrote:
>> because we have to support platform_device structures that are
>> statically allocated.
>
> This would be a good point to also get rid of the long-standing bodge in 
> platform_device_register_full().

platform_device_register_full looks odd to start with, especially
as the coumentation is rather lacking..

>>   +static void setup_pdev_archdata(struct platform_device *pdev)
>
> Bikeshed: painting the generic DMA API properties as "archdata" feels a bit 
> off-target :/
>
>> +{
>> +	if (!pdev->dev.coherent_dma_mask)
>> +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>> +	if (!pdev->dma_mask)
>> +		pdev->dma_mask = DMA_BIT_MASK(32);
>> +	if (!pdev->dev.dma_mask)
>> +		pdev->dev.dma_mask = &pdev->dma_mask;
>> +	arch_setup_pdev_archdata(pdev);
>
> AFAICS m68k's implementation of that arch hook becomes entirely redundant 
> after this change, so may as well go. That would just leave powerpc's 
> actual archdata, which at a glance looks like it could probably be cleaned 
> up with not *too* much trouble.

Actually I think we can just kill both off.  At the point archdata
is indeed entirely misnamed.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
