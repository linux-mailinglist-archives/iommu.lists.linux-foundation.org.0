Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B845351384F
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 17:27:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7C860F29;
	Thu, 28 Apr 2022 15:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goAUEl03qYzU; Thu, 28 Apr 2022 15:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 930A560E69;
	Thu, 28 Apr 2022 15:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A0F9C0081;
	Thu, 28 Apr 2022 15:27:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C321C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 15:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52C5F40374
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 15:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IV6goGJuOV_B for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 15:27:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A84D340198
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 15:27:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CBFB6374; Thu, 28 Apr 2022 17:27:32 +0200 (CEST)
Date: Thu, 28 Apr 2022 17:27:31 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 0/2] MT8186 IOMMU SUPPORT
Message-ID: <YmqyY7V5p2i2h6ZN@8bytes.org>
References: <20220407083230.18041-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407083230.18041-1-yong.wu@mediatek.com>
Cc: yf.wang@mediatek.com, yen-chang.chen@mediatek.com,
 Will Deacon <will@kernel.org>, xueqi.zhang@mediatek.com,
 Krzysztof Kozlowski <krzk@kernel.org>, mingyuan.ma@mediatek.com,
 devicetree@vger.kernel.org, chengci.xu@mediatek.com, libo.kang@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
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

On Thu, Apr 07, 2022 at 04:32:28PM +0800, Yong Wu wrote:
> Yong Wu (2):
>   dt-bindings: mediatek: mt8186: Add binding for MM iommu
>   iommu/mediatek: Add mt8186 iommu support
> 
>  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
>  drivers/iommu/mtk_iommu.c                     |  17 ++
>  .../dt-bindings/memory/mt8186-memory-port.h   | 217 ++++++++++++++++++
>  3 files changed, 238 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt8186-memory-port.h

This patch-set seems to apply cleanly only on 'MT8195 IOMMU SUPPORT',
please re-submit it together with the former when you made the changes
Matthias requested.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
