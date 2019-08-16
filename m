Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2390601
	for <lists.iommu@lfdr.de>; Fri, 16 Aug 2019 18:43:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6B1B2C96;
	Fri, 16 Aug 2019 16:43:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ABC42C21
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 16:43:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 26689E5
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 16:43:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 951D168B05; Fri, 16 Aug 2019 18:43:01 +0200 (CEST)
Date: Fri, 16 Aug 2019 18:43:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: Re: regression in ath10k dma allocation
Message-ID: <20190816164301.GA3629@lst.de>
References: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
	hch@lst.de, nicoleotsuka@gmail.com,
	iommu@lists.linux-foundation.org, tobias.klausmann@freenet.de,
	robin.murphy@arm.com, davem@davemloft.net, kvalo@codeaurora.org
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

Hi Tobias,

do you have CONFIG_DMA_CMA set in your config?  If not please make sure
you have this commit in your testing tree, and if the problem still
persists it would be a little odd and we'd have to dig deeper:

commit dd3dcede9fa0a0b661ac1f24843f4a1b1317fdb6
Author: Nicolin Chen <nicoleotsuka@gmail.com>
Date:   Wed May 29 17:54:25 2019 -0700

    dma-contiguous: fix !CONFIG_DMA_CMA version of dma_{alloc, free}_contiguous()

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
