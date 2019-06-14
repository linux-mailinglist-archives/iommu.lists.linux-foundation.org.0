Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09A45592
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 09:18:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D445FF1E;
	Fri, 14 Jun 2019 07:18:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52088F18
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 07:18:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 54B1DE5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 07:18:29 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 7983A68B05; Fri, 14 Jun 2019 09:18:00 +0200 (CEST)
Date: Fri, 14 Jun 2019 09:18:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size()
	instead of a workaround
Message-ID: <20190614071800.GB8420@lst.de>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jens Axboe <axboe@kernel.dk>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linux IOMMU <iommu@lists.linux-foundation.org>
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

On Thu, Jun 13, 2019 at 10:35:44PM +0200, Geert Uytterhoeven wrote:
> I'm always triggered by the use of min_t() and other casts:
> mmc->max_blk_size and mmc->max_blk_count are both unsigned int.
> dma_max_mapping_size() returns size_t, which can be 64-bit.
> 
>  1) Can the multiplication overflow?
>     Probably not, as per commit 2a55c1eac7882232 ("mmc: renesas_sdhi:
>     prevent overflow for max_req_size"), but I thought I'd better ask.
>  2) In theory, dma_max_mapping_size() can return a number that doesn't
>     fit in 32-bit, and will be truncated (to e.g. 0), leading to max_req_size
>     is zero?

This really should use a min_t on size_t.  Otherwise the patch looks
fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
