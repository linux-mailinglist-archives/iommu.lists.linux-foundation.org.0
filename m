Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1987A476B53
	for <lists.iommu@lfdr.de>; Thu, 16 Dec 2021 09:02:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8FF4168A;
	Thu, 16 Dec 2021 08:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_L-yzKphkdP; Thu, 16 Dec 2021 08:02:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C96B241666;
	Thu, 16 Dec 2021 08:02:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A25BAC0012;
	Thu, 16 Dec 2021 08:02:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C39A8C0012
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 08:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A39754168A
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 08:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kaSMe2EFKccr for <iommu@lists.linux-foundation.org>;
 Thu, 16 Dec 2021 08:02:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 337E441666
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 08:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=DiiXT443TeBnZauQS1D5ozS2KE
 XRgjCxvFvetF86B3zKnvG6Cr6tK2W6tGD7JKrwinyVBMEt+sF4aX0JWgslNhd0HL/T6GqY9LPQXhD
 vzn3HexzPnsYwfIH+pLA5yhE9xgz/KnC3dpw1wbn9tTQjRq8L+S7H9mmVr6A2bmguUkJGOgMcToOU
 cw6JOwmFlpeZZUvQWCspdcRe5yAroJpnQsPKBiLCnBfXZe5lke+NuK9CTcYQUKOFN11sSOvtFSmvf
 7aWw2kiar7Vy9AZdz4ghvA2AS2G0WDpqQJjwWFBKRB4pJmMFbHz51O8vnJh/9iIvLl1gM1Zx+XhzP
 SawrPIdA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mxliN-0042Mr-L5; Thu, 16 Dec 2021 08:02:11 +0000
Date: Thu, 16 Dec 2021 00:02:11 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 04/11] iommu/iova: Squash entry_dtor abstraction
Message-ID: <Ybryg/EQ3EyvRRiD@infradead.org>
References: <cover.1639157090.git.robin.murphy@arm.com>
 <223ae26f3f40165008509182474483b10d421534.1639157090.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <223ae26f3f40165008509182474483b10d421534.1639157090.git.robin.murphy@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, will@kernel.org
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

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
