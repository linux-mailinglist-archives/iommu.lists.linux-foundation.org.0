Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8E625657C
	for <lists.iommu@lfdr.de>; Sat, 29 Aug 2020 08:57:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B716788454;
	Sat, 29 Aug 2020 06:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aw6mVamOekX; Sat, 29 Aug 2020 06:57:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2AC9988442;
	Sat, 29 Aug 2020 06:57:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 104D0C0051;
	Sat, 29 Aug 2020 06:57:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB0AFC0051
 for <iommu@lists.linux-foundation.org>; Sat, 29 Aug 2020 06:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A4DE9878BE
 for <iommu@lists.linux-foundation.org>; Sat, 29 Aug 2020 06:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hHUbQMbgV3M for <iommu@lists.linux-foundation.org>;
 Sat, 29 Aug 2020 06:57:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 65C8E866DD
 for <iommu@lists.linux-foundation.org>; Sat, 29 Aug 2020 06:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dr5JH0lgv6z4waLYIZjOlCHTsfO75mqbdWo74Ywkptc=; b=GvYwAFqqCC0427Cxpi+s9mzKFv
 FAbjjFYXssUdVGjzzXoxsZxEqSrVZepxxCmLfaUaynbQya4h0xFCEbMhNX/TbINETbx8OAQvdExil
 VdoX6y1iIBsZSQEGUZ+gEoC3jXpnp88llnUrAV/QNF9rK6/AJ5XUsbdp2kWttYxi27swhZxl8b/Pi
 pvbMQ83cmcav2unHo9YNmSB7jxiSJf93twhFCcw13hZoAenzcb2Uc5M8ia44AKWTnjhFmHggLzIFZ
 Xoq0PvzCVu7AaSOd6HBryU557ntbnGHr9tZMkrWCYWFaFoYQWoFn5TdLKixTkeihfP1PpGy4+Pk/w
 yj5prb2Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kBund-0000Bw-HS; Sat, 29 Aug 2020 06:57:17 +0000
Date: Sat, 29 Aug 2020 07:57:17 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] iommu/dma: Use DMA ops setter instead of direct
 assignment
Message-ID: <20200829065717.GA31681@infradead.org>
References: <20200828111310.8032-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828111310.8032-1-andriy.shevchenko@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Aug 28, 2020 at 02:13:10PM +0300, Andy Shevchenko wrote:
> Use DMA ops setter instead of direct assignment. Even we know that
> this module doesn't perform access to the dma_ops member of struct device,
> it's better to use setter to avoid potential problems in the future.

I as actually planning on killing off set_dma_ops (and get_dma_ops) for
the 5.10 merge window.  The rationale is that code that sets or gets
DMA ops per definition is deeply dependent on not just DMA support,
but also on DMA ops which have their own options as of 5.9.  Additional
that WIP series removes the dma_map_ops definition from dma-mapping.h
into a private header only used in the few places that do have a
business messing with DMA ops.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
