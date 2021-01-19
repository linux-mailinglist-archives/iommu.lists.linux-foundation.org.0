Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC832FBB11
	for <lists.iommu@lfdr.de>; Tue, 19 Jan 2021 16:27:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F4DD86C1D;
	Tue, 19 Jan 2021 15:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjVkZfQn3HQA; Tue, 19 Jan 2021 15:27:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34B4F86C03;
	Tue, 19 Jan 2021 15:27:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDB1C013A;
	Tue, 19 Jan 2021 15:27:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53307C013A
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4A112866E2
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MzeS0E4srXR9 for <iommu@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 15:26:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 19850866CE
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9SdVCTr5RtENV5upn/rU9VC9X6XHYMAQhYyklwuow6I=; b=r6y945BEZul6pRcpcA5ykCihA0
 Ae4HrojblkggZV3csM55ZIrdN9YR9ANUTWGDoK6/0BKH1ouP7Z9LquJ2d8pUvqLEfTkQJtTnc+Qxx
 VJkhYWjse4546XjYVeU1aAmAd1JDkfBwOcSQo1OuyUSspelmUHfNAxPt4n1VO+hMcpZ0YBGRrXaOM
 6T4Fa0Zx03mJzZPevgRNn7MBjvv/jxRC/mKFc2jEn5KUXJkwTJ3VmBlZCR3kZixm1skOEe9wNhzwW
 ejhwCOmjEzq74EfKbFOOxlVVYfUCJWX8YoSjiZaG+WMDlm3QVXYBw0U2GxJynTgCbDqUaQixiT5QP
 A7jshzNQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l1su1-00EUfP-Vk; Tue, 19 Jan 2021 15:26:46 +0000
Date: Tue, 19 Jan 2021 15:26:41 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Lianbo Jiang <lijiang@redhat.com>
Subject: Re: [PATCH 1/2 v2] dma-iommu: use static-key to minimize the impact
 in the fast-path
Message-ID: <20210119152641.GA3453587@infradead.org>
References: <20210119111616.12761-1-lijiang@redhat.com>
 <20210119111616.12761-2-lijiang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119111616.12761-2-lijiang@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: thomas.lendacky@amd.com, iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, robin.murphy@arm.com
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

On Tue, Jan 19, 2021 at 07:16:15PM +0800, Lianbo Jiang wrote:
> +static DEFINE_STATIC_KEY_FALSE(__deferred_attach);

Why the strange underscores?  Wouldn't iommu_deferred_attach_enabled
be a better name?

> -	if (unlikely(iommu_dma_deferred_attach(dev, domain)))
> +	if (static_branch_unlikely(&__deferred_attach) &&
> +	    iommu_dma_deferred_attach(dev, domain))

Also insted of duplicating this logic in three places, maybe rename
iommu_dma_deferred_attach to __iommu_dma_deferred_attach and create
a small inline wrapper for it?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
