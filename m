Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F09165526
	for <lists.iommu@lfdr.de>; Thu, 20 Feb 2020 03:38:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1B652203A8;
	Thu, 20 Feb 2020 02:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oK64m+WgRRVE; Thu, 20 Feb 2020 02:38:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 63149204A7;
	Thu, 20 Feb 2020 02:38:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 534C0C013E;
	Thu, 20 Feb 2020 02:38:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB5F9C013E
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 02:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ADB2C87852
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 02:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfHbo0+DLvVI for <iommu@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:38:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CA24887820
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 02:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9C4q1yiX55pfiM9NCjD/zDbj2x7HtQclnCikhie1s9w=; b=C3asFV71n6ErhE6wl1zS0sQGmt
 nYEpHJrdtFdbwGsv4hIIdrkS8TQsnvE3OttgX8UZdfcGBUZJDkf34Mg2ygoujwQZO94IAUzcAU960
 lLh0y6Uh1oKOeyNvQTRVCGrYhKS+Qd6oyZOPkrs6jHwIUsJkmChSMZKs3AT8wCjS4NHpoLs7xpbrw
 bUudegj8zUqubFQshNzrw6Zx8gryaDmsDgDWKbwPZMkMKxLdJBbV6DVBdh4k6bNVwV9fl37z6P4Ol
 PqImArEVySRJChZe6W2mvLCemtnQURXxTsGc6TVrda/2rA5Bz9am9UWLOztuipqXN4y1MhQQjo5Va
 qdIKXQlQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4bjL-00033H-CI; Thu, 20 Feb 2020 02:38:23 +0000
Date: Wed, 19 Feb 2020 18:38:23 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Liam Mark <lmark@codeaurora.org>
Subject: Re: [RFC PATCH] iommu/iova: Support limiting IOVA alignment
Message-ID: <20200220023823.GA11561@infradead.org>
References: <alpine.DEB.2.10.2002141223510.27047@lmark-linux.qualcomm.com>
 <e9ae618c-58d4-d245-be80-e62fbde4f907@arm.com>
 <20200219123704.GC19400@willie-the-truck>
 <alpine.DEB.2.10.2002191517150.636@lmark-linux.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.2002191517150.636@lmark-linux.qualcomm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kernel-team@android.com,
 Pratik Patel <pratikp@codeaurora.org>
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

On Wed, Feb 19, 2020 at 03:22:36PM -0800, Liam Mark wrote:
> I am looking into how much of our allocation pattern details I can share.

Well if you can't share the details it is by defintion completely
irrelevant.  Please don't waste our time.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
