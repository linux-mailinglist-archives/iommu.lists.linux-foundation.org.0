Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A34CD1C4
	for <lists.iommu@lfdr.de>; Fri,  4 Mar 2022 10:57:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A11160B14;
	Fri,  4 Mar 2022 09:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NjLyA0XhMbs; Fri,  4 Mar 2022 09:57:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2144260ADE;
	Fri,  4 Mar 2022 09:57:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E69BBC0070;
	Fri,  4 Mar 2022 09:57:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EA78C000B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Mar 2022 09:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B4A83F76
 for <iommu@lists.linux-foundation.org>; Fri,  4 Mar 2022 09:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rELjRk7y18rA for <iommu@lists.linux-foundation.org>;
 Fri,  4 Mar 2022 09:57:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 967BA83F25
 for <iommu@lists.linux-foundation.org>; Fri,  4 Mar 2022 09:57:33 +0000 (UTC)
X-UUID: da42b50672434f5c9d725777bdbb6227-20220304
X-UUID: da42b50672434f5c9d725777bdbb6227-20220304
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 300480696; Fri, 04 Mar 2022 17:57:22 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 4 Mar 2022 17:57:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 17:57:20 +0800
Message-ID: <123cb154ca0e87504c2b663ebdca2ccad967776f.camel@mediatek.com>
Subject: Re: [PATCH v5 00/34] MT8195 IOMMU SUPPORT
To: Joerg Roedel <joro@8bytes.org>
Date: Fri, 4 Mar 2022 17:57:19 +0800
In-Reply-To: <YiHZ4lq2QClkdyxS@8bytes.org>
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <YhzBSsn/zUlGg5JE@8bytes.org>
 <7ba0ee87-c193-9834-d0b4-ff3e06ced82b@collabora.com>
 <5ed9278fa0b72b993512cff2316218ab88cafe50.camel@mediatek.com>
 <YiHZ4lq2QClkdyxS@8bytes.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: yf.wang@mediatek.com, yen-chang.chen@mediatek.com,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 xueqi.zhang@mediatek.com, mingyuan.ma@mediatek.com, devicetree@vger.kernel.org,
 chengci.xu@mediatek.com, libo.kang@mediatek.com, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
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
From: Yong Wu via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, 2022-03-04 at 10:20 +0100, Joerg Roedel wrote:
> On Tue, Mar 01, 2022 at 03:49:18PM +0800, Yong Wu wrote:
> > 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=592275
> 
> Okay, thanks for the clarification. So I can't include linux-next in
> my
> tree, so I think the best option is to wait until v5.18-rc1 (or
> rather
> -rc3, which is where I start merging new stuff) is out and merge it
> then.
> Another option would be if there is a branch which only contains the
> dependencies of this patch-set, which I could pull into my tree, but
> it
> is already pretty late in the cycle.
> So please re-send when the next -rc1 is out and I will pick it up
> then.

Thanks for this info. I will re-send this patchset after the next -rc1.

Could you help apply Dafna's patchset at this time? This patchset
depends on it and it won't conflict with the others.

Thanks.

> 
> Regards,
> 
> 	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
