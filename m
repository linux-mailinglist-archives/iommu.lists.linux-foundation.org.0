Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D84787362B
	for <lists.iommu@lfdr.de>; Wed, 24 Jul 2019 19:55:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8A5151269;
	Wed, 24 Jul 2019 17:55:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41BC0EBD
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 17:55:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B6580FE
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 17:55:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4813E68B20; Wed, 24 Jul 2019 19:55:51 +0200 (CEST)
Date: Wed, 24 Jul 2019 19:55:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 2/2] arm: use swiotlb for bounce buffer on LPAE configs
Message-ID: <20190724175551.GA13073@lst.de>
References: <20190709142011.24984-1-hch@lst.de>
	<20190709142011.24984-3-hch@lst.de>
	<a447eae1bb46fe753f7a62fb8932e680b79b1635.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a447eae1bb46fe753f7a62fb8932e680b79b1635.camel@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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

On Wed, Jul 24, 2019 at 07:23:50PM +0200, Nicolas Saenz Julienne wrote:
> Out of curiosity, what is the reason stopping us from using dma-direct/swiotlb
> instead of arm_dma_ops altogether?

Nothing fundamental.  We just need to do a very careful piecemeal
migration as the arm code handles a ot of interesting corner case and
we need to ensure we don't break that.  I have various WIP patches
for the easier bits and we can work from there.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
