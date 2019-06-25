Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E70952358
	for <lists.iommu@lfdr.de>; Tue, 25 Jun 2019 08:14:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8A15F255;
	Tue, 25 Jun 2019 06:14:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BDADF255
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 06:14:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5B221710
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 06:14:04 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 4350A68B02; Tue, 25 Jun 2019 08:13:32 +0200 (CEST)
Date: Tue, 25 Jun 2019 08:13:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH 1/7] arm-nommu: remove the partial
	DMA_ATTR_NON_CONSISTENT support
Message-ID: <20190625061332.GC28986@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
	<20190614144431.21760-2-hch@lst.de>
	<a017e704-c6c4-7718-7f8b-eb8a0eced14d@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a017e704-c6c4-7718-7f8b-eb8a0eced14d@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jonas Bonn <jonas@southpole.se>, linux-xtensa@linux-xtensa.org,
	linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
	Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
	Stafford Horne <shorne@gmail.com>, linux-snps-arc@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

On Mon, Jun 24, 2019 at 03:23:08PM +0100, Vladimir Murzin wrote:
> On 6/14/19 3:44 PM, Christoph Hellwig wrote:
> > The arm-nommu DMA code supports DMA_ATTR_NON_CONSISTENT allocations, but
> > does not provide a cache_sync operation.  This means any user of it
> > will never be able to actually transfer cache ownership and thus cause
> > coherency bugs.
> 
> By the way, Documentation/DMA-attributes.txt doesn't specify cache_sync() as
> requirement for DMA_ATTR_NON_CONSISTENT it only states that it is responsibility
> of the driver to have all the correct and necessary sync points.

True.  dma_cache_sync has always been a rather odd interface, as it
doesn't specify in what direction we need to sync and doesn't
participate in our ownership protocol.  So my mid-term plan is to kill
it off and replace it with the existing dma_sync_* helpers.  This
series is the first step towards that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
