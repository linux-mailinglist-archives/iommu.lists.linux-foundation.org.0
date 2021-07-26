Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2733D59BA
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 14:46:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA42282542;
	Mon, 26 Jul 2021 12:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vM8hnmYdnKM5; Mon, 26 Jul 2021 12:46:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1A46482730;
	Mon, 26 Jul 2021 12:46:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCC2EC000E;
	Mon, 26 Jul 2021 12:46:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45A6FC000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D7A260786
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCh1aqhILozU for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 12:46:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E42B8600CD
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:46:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8BF072B0; Mon, 26 Jul 2021 14:46:10 +0200 (CEST)
Date: Mon, 26 Jul 2021 14:46:09 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 16/23] iommu/arm-smmu: Prepare for multiple DMA domain
 types
Message-ID: <YP6ukfewNVjgS/bt@8bytes.org>
References: <cover.1626888444.git.robin.murphy@arm.com>
 <04220b3420c2c513490450f37de109182364f235.1626888445.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04220b3420c2c513490450f37de109182364f235.1626888445.git.robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, will@kernel.org,
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

On Wed, Jul 21, 2021 at 07:20:27PM +0100, Robin Murphy wrote:
> -	if (type == IOMMU_DOMAIN_DMA && using_legacy_binding)
> +	if ((type & __IOMMU_DOMAIN_DMA_API) && using_legacy_binding)

Hmm, I wonder whether it is time to introduce helpers for these checks?

Something like iommu_domain_is_dma() is more readable.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
