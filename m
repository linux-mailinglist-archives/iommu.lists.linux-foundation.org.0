Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF03623DB
	for <lists.iommu@lfdr.de>; Fri, 16 Apr 2021 17:25:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1385C847EB;
	Fri, 16 Apr 2021 15:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VX3doaO1sOen; Fri, 16 Apr 2021 15:25:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44453846C6;
	Fri, 16 Apr 2021 15:25:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2576AC0011;
	Fri, 16 Apr 2021 15:25:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51E07C000A
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 15:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FC7960648
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 15:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HN7E-YqSPm5 for <iommu@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 15:24:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6243160605
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 15:24:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D3E01223; Fri, 16 Apr 2021 17:24:51 +0200 (CEST)
Date: Fri, 16 Apr 2021 17:24:50 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 0/8] iommu: fix a couple of spelling mistakes detected by
 codespell tool
Message-ID: <YHmsQtm4o5f7fAru@8bytes.org>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326062412.1262-1-thunder.leizhen@huawei.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Will Deacon <will@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, iommu <iommu@lists.linux-foundation.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>
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

On Fri, Mar 26, 2021 at 02:24:04PM +0800, Zhen Lei wrote:
> This detection and correction covers the entire driver/iommu directory.
> 
> Zhen Lei (8):
>   iommu/pamu: fix a couple of spelling mistakes
>   iommu/omap: Fix spelling mistake "alignement" -> "alignment"
>   iommu/mediatek: Fix spelling mistake "phyiscal" -> "physical"
>   iommu/sun50i: Fix spelling mistake "consits" -> "consists"
>   iommu: fix a couple of spelling mistakes
>   iommu/amd: fix a couple of spelling mistakes
>   iommu/arm-smmu: Fix spelling mistake "initally" -> "initially"
>   iommu/vt-d: fix a couple of spelling mistakes

This patch-set doesn't apply. Please re-send it as a single patch when
v5.13-rc1 is released.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
