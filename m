Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC4C20F221
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 12:05:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 78CCE227C1;
	Tue, 30 Jun 2020 10:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYhBe6ehLhfX; Tue, 30 Jun 2020 10:05:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 48BFF227A3;
	Tue, 30 Jun 2020 10:05:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3966CC0865;
	Tue, 30 Jun 2020 10:05:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 449E7C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 308A1227A3
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikmEGXJRbmvA for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 10:05:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 5A18C22744
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:05:39 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D4D6E2A7; Tue, 30 Jun 2020 12:05:37 +0200 (CEST)
Date: Tue, 30 Jun 2020 12:05:36 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] iommu/sun50i: Change the readl timeout to the atomic
 variant
Message-ID: <20200630100536.GK28824@8bytes.org>
References: <20200628180844.79205-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200628180844.79205-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Chen-Yu Tsai <wens@csie.org>, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
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

On Sun, Jun 28, 2020 at 08:08:43PM +0200, Maxime Ripard wrote:
> The flush_all_tlb call back can be called from an atomic context, so using
> readl_poll_timeout that embeds a udelay doesn't work.
> 
> Fixes: 4100b8c229b3 ("iommu: Add Allwinner H6 IOMMU driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied both for v5.8, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
