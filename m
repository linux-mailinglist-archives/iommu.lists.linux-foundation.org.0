Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B119C9D6
	for <lists.iommu@lfdr.de>; Mon, 26 Aug 2019 09:06:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 543BDFE0;
	Mon, 26 Aug 2019 07:06:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52D66FD3
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 07:06:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CF3248A2
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 07:06:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CF05868B02; Mon, 26 Aug 2019 09:06:33 +0200 (CEST)
Date: Mon, 26 Aug 2019 09:06:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 10/11] arm64: edit zone_dma_bits to fine tune
	dma-direct min mask
Message-ID: <20190826070633.GB11331@lst.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
	<20190820145821.27214-11-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820145821.27214-11-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: catalin.marinas@arm.com, eric@anholt.net, linux-riscv@lists.infradead.org,
	will@kernel.org, hch@lst.de, linux-arch@vger.kernel.org,
	f.fainelli@gmail.com, frowand.list@gmail.com,
	devicetree@vger.kernel.org, marc.zyngier@arm.com,
	robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, phill@raspberryi.org,
	mbrugger@suse.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	wahrenst@gmx.net, akpm@linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>
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

On Tue, Aug 20, 2019 at 04:58:18PM +0200, Nicolas Saenz Julienne wrote:
> -	if (IS_ENABLED(CONFIG_ZONE_DMA))
> +	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
>  		arm64_dma_phys_limit = max_zone_dma_phys();
> +		zone_dma_bits = ilog2((arm64_dma_phys_limit - 1) & GENMASK_ULL(31, 0)) + 1;

This adds a way too long line.  I also find the use of GENMASK_ULL
horribly obsfucating, but I know that opinion is't shared by everyone.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
