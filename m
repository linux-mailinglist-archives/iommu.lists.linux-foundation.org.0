Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D42969EB
	for <lists.iommu@lfdr.de>; Fri, 23 Oct 2020 08:48:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1EB4870BA;
	Fri, 23 Oct 2020 06:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAuePQj-4eTw; Fri, 23 Oct 2020 06:48:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56C278777B;
	Fri, 23 Oct 2020 06:48:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 375F4C0051;
	Fri, 23 Oct 2020 06:48:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45D92C0051
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 429EE86F99
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1cowCR12YeF for <iommu@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 06:48:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F41C986F96
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=D9BSERH8ih1u+6l81BXwEfO3WbdwyDqTa0foZ95ppTs=; b=Tx5in8IS3ZrlOQR1hw4rSA2ItZ
 /EtjDvxk7ZQ4p7vDOinRhe9SCX6JstnBsBix456/AOjX8q9d6aIZ/SDs0MMTWPIt7hVmr6t8xAPZb
 GjcAbtIIqDtkWWHk1ma2q1E0ZeoZo+278v82AJ8CC9Qzmp8RCKv3hIvhpn5mTfemOgesu+qqsuOLQ
 Jwxaj85RBsyL2z0/vPWznuqpNAQNrgpf95kaIQ/TSmk2ZNoBZmk5CtuuoIgOLxVEqh7BLCSKgZSms
 g32q0VgMEMAETedrJ4nXop2B4UYhGdQmOwjE2apgCNizq6HILfk5Hw2BQ9c5C8ZRgEha3/BmPB8lO
 kRD4wbGw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kVqsK-00065i-DT; Fri, 23 Oct 2020 06:48:32 +0000
Date: Fri, 23 Oct 2020 07:48:32 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Christoph Hellwig <hch@infradead.org>, Robin Murphy <robin.murphy@arm.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 iommu@lists.linux-foundation.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201023064832.GA23355@infradead.org>
References: <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
 <20201015065532.GA15371@infradead.org>
 <20201015153334.GF438822@phenom.ffwll.local>
 <20201015154300.GA8047@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015154300.GA8047@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Oct 15, 2020 at 04:43:01PM +0100, Christoph Hellwig wrote:
> > Somewhat related, but is there a way to tell the dma-api to fail instead
> > of falling back to swiotlb? In many case for gpu drivers it's much better
> > if we fall back to dma_alloc_coherent and manage the copying ourselves
> > instead of abstracting this away in the dma-api. Currently that's "solved"
> > rather pessimistically by always allocating from dma_alloc_coherent if
> > swiotlb could be in the picture (at least for ttm based drivers, i915 just
> > falls over).
> 
> Is this for the alloc_pages plus manually map logic in various drivers?
> 
> They should switch to the new dma_alloc_pages API that I'll send to
> Linus for 5.10 soon.

Daniel, can you clarify this?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
