Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D23CB260
	for <lists.iommu@lfdr.de>; Fri, 16 Jul 2021 08:21:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55AF0400D7;
	Fri, 16 Jul 2021 06:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17wWY_P4ONJS; Fri, 16 Jul 2021 06:20:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0FC86402CB;
	Fri, 16 Jul 2021 06:20:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBAEBC000E;
	Fri, 16 Jul 2021 06:20:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F30FC000E
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D87760C03
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3CC2jYCIwXv for <iommu@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 06:20:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BF6860AF0
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ao7Cpu0iVFwUcba1ik2rm3b8jKcyGuEdr3idot7Y/eg=; b=BtORTbIfsqak7hFT1QBnYqesWS
 v6YEv0kfQVtPsWc0vF2dpo2f5voFl79ERvzdi+bZX5PTqXp/cnzbXwIMMwK+pY73ukWhzHeVys5w/
 BIXxIqKspjw9Js815jy7hCbcZsQ28eYACWJf8ncUdsXypNPLZkw+FA/aPhe4AqmE4MY+LOyPqoMQD
 yZieWl/AS8sgvTp80raczNj1ZHhPU7A0h1pW0DGK+juD1Kofd4s83Q2yVDxTrGQ9aKPYb5yGurozS
 5oOV4O2JhhOL26yOIh2k6vXcDvqSiEs8CcPXo2IV6SAImhCDQo8YNxQKmdnQiqonfjLiEEH3jy/7g
 DrWP6XDA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m4HBp-004CyV-Hh; Fri, 16 Jul 2021 06:19:28 +0000
Date: Fri, 16 Jul 2021 07:19:13 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu: Streamline iommu_iova_to_phys()
Message-ID: <YPEk4bZKOZntylOI@infradead.org>
References: <f564f3f6ff731b898ff7a898919bf871c2c7745a.1626354264.git.robin.murphy@arm.com>
 <YPBBJUWvFixPpFYF@infradead.org>
 <d4eb3346-2152-8a7c-619f-b8d5ee222410@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4eb3346-2152-8a7c-619f-b8d5ee222410@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Thu, Jul 15, 2021 at 03:16:08PM +0100, Robin Murphy wrote:
> On 2021-07-15 15:07, Christoph Hellwig wrote:
> > On Thu, Jul 15, 2021 at 02:04:24PM +0100, Robin Murphy wrote:
> > > If people are going to insist on calling iommu_iova_to_phys()
> > > pointlessly and expecting it to work,
> > 
> > Maybe we need to fix that?
> 
> Feel free to try, but we didn't have much luck pushing back on it
> previously, so playing whack-a-mole against netdev now is a game I'm
> personally happy to stay away from ;)

One thing I've done with symbols I want people to not use it to
unexport them.  But what about vfio?

While we're talking about iommu_iova_to_phys: __iommu_dma_unmap_swiotlb
calls it unconditionally, despite only needed ing the physical address.
Can we optimize that somehow by splitting out the bounce buffering case
out?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
