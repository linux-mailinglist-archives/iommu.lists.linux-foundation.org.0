Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E31EE75D
	for <lists.iommu@lfdr.de>; Thu,  4 Jun 2020 17:06:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 696CD888C8;
	Thu,  4 Jun 2020 15:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DF-0tkWklYak; Thu,  4 Jun 2020 15:06:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8B39B888BD;
	Thu,  4 Jun 2020 15:06:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F6A9C016E;
	Thu,  4 Jun 2020 15:06:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD151C016E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 15:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9EA0A204E0
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 15:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYMm6clukLu7 for <iommu@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:06:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 5CE8320426
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mG7D+jRYpSS5Y4OVIdfZqG69AgF0Bh19MVMpT/Ilvms=; b=DwodH1gGIjv40L+PhfWicphFbx
 L5Z7b3GpAuWb46yYc5ODv3xP+8dgv15FmsYeJFocfnSI7z+I4gPK9mheD3eUZt6qcUTA3vG+E7ztE
 2AW5EznqM9mp1JesX5GoV7c1VvYvJkk2mz516slHkUVfO+DHtGJS4xZkBq4YiM9vW2uD8ZVjFCDK4
 JZogr9lWJ74maHopDVAhQp0uKdnPVBrZUQenuz/5mHQ1ZkKDvh43e5oCFL9NPq5AKozm4d269Vipk
 ctlqUTa3Bq68LHEsMO6yea9qAjPF3yP4s1rZmRV5v9mY3eZzGi5R/RVpxQor/Y4XugO5QlyuT2/Pe
 SQO0YF9A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jgrS7-0008Be-4R; Thu, 04 Jun 2020 15:06:43 +0000
Date: Thu, 4 Jun 2020 08:06:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] iommu/mediatek: Use totalram_pages to setup enable_4GB
Message-ID: <20200604150643.GA29193@infradead.org>
References: <20200604080120.2628-1-miles.chen@mediatek.com>
 <55820901-430b-14c4-9426-7a4991ca0eed@redhat.com>
 <1591264174.12661.17.camel@mtkswgap22>
 <f02c8c9d-ed75-6513-f8a9-a2fdbb11b750@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f02c8c9d-ed75-6513-f8a9-a2fdbb11b750@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: wsd_upstream@mediatek.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com
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

On Thu, Jun 04, 2020 at 01:32:40PM +0200, David Hildenbrand wrote:
> Just a thought: If memory hotplug is applicable as well, you might
> either want to always assume data->enable_4GB, or handle memory hotplug
> events from the memory notifier, when new memory gets onlined (not sure
> how tricky that is).

We probably want a highest_pfn_possible() or similar API instead of
having drivers poking into random VM internals.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
