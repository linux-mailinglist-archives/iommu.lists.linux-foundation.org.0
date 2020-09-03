Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFDA25C70E
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 18:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0366D87400;
	Thu,  3 Sep 2020 16:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9R3g6jrmxVSD; Thu,  3 Sep 2020 16:39:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 548F187388;
	Thu,  3 Sep 2020 16:39:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C24AC0051;
	Thu,  3 Sep 2020 16:39:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87792C0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 16:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 740C4867A3
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 16:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acmzqyEFGvCS for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 16:39:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2932F8679C
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GYkytVJ3w8/QX0GH4bMirJqpdv8hdhcNl96xhFqD6Zw=; b=t+KqJCDIRe8WMa6NMkknPczheE
 xcoqpwz0ZzMDtXOnHe2WhI9E/F7bVNoeI80txM/bVe45QWF60ND3yqlES4OZcjh/2WlTQYwBtLR8d
 0bs/d2C/KDOOPKAxFJzADyf+DbJ0DTx5UT9rgACbGy7btKXWtflnmDeOtoFw6znD40w9luewjtQFQ
 cUEiogmat2aLyh3dtnRQwaHQdmahfD6RSujQjFLAI48uqqXKR5yAVwcbksHBOoi7UIDuAkzvfBQIm
 5P7MUOuvuAmz85/HI36BD2XJumuV4C8Tv5e6vthhkIVK/kQNesFI/Q3kS/YeoySXpGkMNNgg4xlBz
 /41Ug7xg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kDsGG-0005Rb-LC; Thu, 03 Sep 2020 16:38:56 +0000
Date: Thu, 3 Sep 2020 17:38:56 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/dma: Remove broken huge page handling
Message-ID: <20200903163856.GA20737@infradead.org>
References: <e287dbe69aa0933abafd97c80631940fd188ddd1.1599132844.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e287dbe69aa0933abafd97c80631940fd188ddd1.1599132844.git.robin.murphy@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Roman Gushchin <guro@fb.com>
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

On Thu, Sep 03, 2020 at 12:34:04PM +0100, Robin Murphy wrote:
> The attempt to handle huge page allocations was originally added since
> the comments around stripping __GFP_COMP in other implementations were
> nonsensical, and we naively assumed that split_huge_page() could simply
> be called equivalently to split_page(). It turns out that this doesn't
> actually work correctly, so just get rid of it - there's little point
> going to the effort of allocating huge pages if we're only going to
> split them anyway.
> 
> Reported-by: Roman Gushchin <guro@fb.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

This looks sensibe.  We really need to clear it in generic code, but
last time I checked there were one or two buggy drivers that assumed
__GFP_COMP works and actually gives a compound page (iirc legacy
drm stuff).  All that stuff really needs fixing..

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
