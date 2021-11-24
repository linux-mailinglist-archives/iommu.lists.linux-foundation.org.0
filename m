Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D73A45CA2A
	for <lists.iommu@lfdr.de>; Wed, 24 Nov 2021 17:34:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 132C0401E4;
	Wed, 24 Nov 2021 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czYvZKROhPIh; Wed, 24 Nov 2021 16:34:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0D21D40496;
	Wed, 24 Nov 2021 16:34:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D46E6C0012;
	Wed, 24 Nov 2021 16:34:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82AFCC0012
 for <iommu@lists.linux-foundation.org>; Wed, 24 Nov 2021 16:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7117E40258
 for <iommu@lists.linux-foundation.org>; Wed, 24 Nov 2021 16:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DURLB_YIvr7U for <iommu@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 16:34:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F3FA40251
 for <iommu@lists.linux-foundation.org>; Wed, 24 Nov 2021 16:34:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6B7A9341; Wed, 24 Nov 2021 17:34:44 +0100 (CET)
Date: Wed, 24 Nov 2021 17:34:35 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH] iommu/rockchip: Fix PAGE_DESC_HI_MASKs for RK3568
Message-ID: <YZ5pm2kFM41OOu+Y@8bytes.org>
References: <20211124021325.858139-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211124021325.858139-1-knaerzche@gmail.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Wed, Nov 24, 2021 at 03:13:25AM +0100, Alex Bee wrote:
> With the submission of iommu driver for RK3568 a subtle bug was
> introduced: PAGE_DESC_HI_MASK1 and PAGE_DESC_HI_MASK2 have to be
> the other way arround - that leads to random errors, especially when
> addresses beyond 32 bit are used.
> 
> Fix it.
> 
> Fixes: c55356c534aa ("iommu: rockchip: Add support for iommu v2")
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Applied for v5.16, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
