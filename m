Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB23BF7B2
	for <lists.iommu@lfdr.de>; Thu,  8 Jul 2021 11:39:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D24B440242;
	Thu,  8 Jul 2021 09:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id noNhzOnO2HAt; Thu,  8 Jul 2021 09:39:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0D47740232;
	Thu,  8 Jul 2021 09:39:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7D2BC001F;
	Thu,  8 Jul 2021 09:39:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2A7AC000E
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADC73606D6
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Z1Q8VfX9cX5 for <iommu@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 09:39:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C74A6069A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:39:49 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 236A7312; Thu,  8 Jul 2021 11:39:47 +0200 (CEST)
Date: Thu, 8 Jul 2021 11:39:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2] iommu: rockchip: Fix physical address decoding
Message-ID: <YObH4cb4vji/IvF5@8bytes.org>
References: <20210618130047.547986-1-benjamin.gaignard@collabora.com>
 <e2c3d5c2-3f45-90b9-1b55-54df133a952f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2c3d5c2-3f45-90b9-1b55-54df133a952f@collabora.com>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, will@kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 robin.murphy@arm.com, dan.carpenter@oracle.com
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

Hi Benjamin,

On Mon, Jul 05, 2021 at 01:40:24PM +0200, Benjamin Gaignard wrote:
> Gentle ping on this patch :-)

Please fix the subject to match the IOMMU tree conventions. This would
be:

	iommu/rockchip: Fix physical address decoding

Re-send the patch after the merge window is closed.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
