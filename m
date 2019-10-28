Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D1E7192
	for <lists.iommu@lfdr.de>; Mon, 28 Oct 2019 13:38:17 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0710310BE;
	Mon, 28 Oct 2019 12:38:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 953D2B1F
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 12:38:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2F03B87B
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 12:38:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id F170068B05; Mon, 28 Oct 2019 13:38:05 +0100 (CET)
Date: Mon, 28 Oct 2019 13:38:05 +0100
From: "hch@lst.de" <hch@lst.de>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH v2 1/3] dma-mapping: introduce new dma unmap and sync
	api variants
Message-ID: <20191028123805.GA25160@lst.de>
References: <20191024124130.16871-1-laurentiu.tudor@nxp.com>
	<20191024124130.16871-2-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024124130.16871-2-laurentiu.tudor@nxp.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leo Li <leoyang.li@nxp.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>
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

On Thu, Oct 24, 2019 at 12:41:41PM +0000, Laurentiu Tudor wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Introduce a few new dma unmap and sync variants that, on top of the
> original variants, return the virtual address corresponding to the
> input dma address.
> In order to implement this a new dma map op is added and used:
>     void *get_virt_addr(dev, dma_handle);
> It does the actual conversion of an input dma address to the output
> virtual address.

We'll definitively need an implementation for dma-direct at least as
well.  Also as said previously we need a dma_can_unmap_by_dma_addr()
or similar helper that tells the driver beforehand if this works, so
that the driver can either use a sub-optimal workaround or fail the
probe if this functionality isn't implemented.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
