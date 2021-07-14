Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A213C830F
	for <lists.iommu@lfdr.de>; Wed, 14 Jul 2021 12:40:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9434066E;
	Wed, 14 Jul 2021 10:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BxgbmoUqXm0; Wed, 14 Jul 2021 10:40:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D5D4440654;
	Wed, 14 Jul 2021 10:40:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8A1BC000E;
	Wed, 14 Jul 2021 10:40:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E4CBC000E
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC4B83BB6
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7A7nFOF6aKl for <iommu@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 10:40:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9172F83BAC
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:40:10 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5C4CB352; Wed, 14 Jul 2021 12:40:08 +0200 (CEST)
Date: Wed, 14 Jul 2021 12:40:06 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3] iommu/rockchip: Fix physical address decoding
Message-ID: <YO6/BuhfxO3R5H0y@8bytes.org>
References: <20210712101232.318589-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712101232.318589-1-benjamin.gaignard@collabora.com>
Cc: heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>, will@kernel.org,
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

On Mon, Jul 12, 2021 at 12:12:32PM +0200, Benjamin Gaignard wrote:
> Restore bits 39 to 32 at correct position.
> It reverses the operation done in rk_dma_addr_dte_v2().
> 
> Fixes: c55356c534aa ("iommu: rockchip: Add support for iommu v2")
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 3:
>  - change commit header to match with IOMMU tree convention

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
