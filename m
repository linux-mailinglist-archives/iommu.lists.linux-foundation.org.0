Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A16E5C6
	for <lists.iommu@lfdr.de>; Fri, 19 Jul 2019 14:33:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 74C752607;
	Fri, 19 Jul 2019 12:33:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6DC4825EB
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 12:33:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 544A0180
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 12:33:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AD7C768B02; Fri, 19 Jul 2019 14:33:18 +0200 (CEST)
Date: Fri, 19 Jul 2019 14:33:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: add swiotlb support to arm32
Message-ID: <20190719123318.GA30713@lst.de>
References: <20190709142011.24984-1-hch@lst.de>
	<6a56eacd-d481-de93-e0d8-64d8385de214@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a56eacd-d481-de93-e0d8-64d8385de214@ti.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org,
	Russell King - ARM Linux admin <linux@armlinux.org.uk>,
	iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
	linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
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

On Wed, Jul 17, 2019 at 06:51:46PM +0530, Vignesh Raghavendra wrote:
> > This series adds swiotlb support to the 32-bit arm port to ensure
> > platforms with LPAE support can support DMA mapping for all devices
> > using 32-bit dma masks, just like we do on other ports that support
> >> 32-bit physical addressing and don't have an iommu.
> 
> 
> This series fixes SATA errors seen on TI platforms with LPAE like DRA7
> Rev H EVM.
> 
> Tested-by: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Thanks for the fix!

Thanks for testing!  Russell, do you want to pick this up via the
arm tree, or should I queue it up in the dma-mapping tree?

> 
> -- 
> Regards
> Vignesh
---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
