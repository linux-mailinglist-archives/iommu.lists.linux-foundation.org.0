Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76035CFD
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 14:38:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9D07FAD7;
	Wed,  5 Jun 2019 12:38:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3313986D
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 12:38:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B76EA4C3
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 12:38:38 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id AF30A227A81; Wed,  5 Jun 2019 14:38:09 +0200 (CEST)
Date: Wed, 5 Jun 2019 14:38:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
Message-ID: <20190605123808.GA12529@lst.de>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org, hch@lst.de,
	linux-renesas-soc@vger.kernel.org, wsa+renesas@sang-engineering.com,
	iommu@lists.linux-foundation.org
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

On Wed, Jun 05, 2019 at 01:21:59PM +0100, Robin Murphy wrote:
> And if the problem is really that you're not getting merging because of 
> exposing the wrong parameters to the DMA API and/or the block layer, or 
> that you just can't quite express your requirement to the block layer in 
> the first place, then that should really be tackled at the source rather 
> than worked around further down in the stack.

The problem is that we need a way to communicate to the block layer
that more than a single segment is ok IFF the DMA API instance supports
merging.  And of course the answer will depend on futher parameters
like the maximum merged segment size and alignment for the segement.

We'll need some way to communicate that, but I don't really think this
is series is the way to go.

We'd really need something hanging off the device (or through a query
API) how the dma map ops implementation exposes under what circumstances
it can merge.  The driver can then communicate that to the block layer
so that the block layer doesn't split requests up when reaching the
segement limit.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
