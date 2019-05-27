Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BB2B873
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 17:38:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1DE9619FF;
	Mon, 27 May 2019 15:38:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D99341705
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:37:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 76F7D6C5
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:37:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 3162D244; Mon, 27 May 2019 17:37:53 +0200 (CEST)
Date: Mon, 27 May 2019 17:37:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: implement generic dma_map_ops for IOMMUs v5
Message-ID: <20190527153751.GF12745@8bytes.org>
References: <20190520072948.11412-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520072948.11412-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Murphy <tmurphy@arista.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
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

Hi Christoph, Hi Robin,

On Mon, May 20, 2019 at 09:29:24AM +0200, Christoph Hellwig wrote:
> I think we are finally ready for the generic dma-iommu series.  I have
> various DMA API changes pending, and Tom has patches ready to convert
> the AMD and Intel iommu drivers over to it.  I'd love to have this
> in a stable branch shared between the dma-mapping and iommu trees
> the day after rc2 is released.  I volunteer to create the branch,
> but I'm fine with it living in the iommu tree as well.  Before that
> Will has already said he wants to send the first patch in the series
> to Linus for this merge window.

First a big "THANK YOU" for working on this and getting it ready. It is
an important step towards generic dma-ops for all iommu drivers,
something I wished to have for years and planned to work on myself, but
didn't find the time.

I applied this series to a new generic-dma-ops branch in the iommu
tree and plan to send it upstream in the next merge window.

Thanks again,

       Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
