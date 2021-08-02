Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C53DD367
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 11:51:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF37403D9;
	Mon,  2 Aug 2021 09:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0UKJ1t488GT; Mon,  2 Aug 2021 09:51:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DE0B8403D4;
	Mon,  2 Aug 2021 09:51:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFF84C0022;
	Mon,  2 Aug 2021 09:51:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E209AC000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 09:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0C58839D8
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 09:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-z-GIHM2o6S for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 09:51:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B0C7839CD
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 09:51:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0C338379; Mon,  2 Aug 2021 11:51:43 +0200 (CEST)
Date: Mon, 2 Aug 2021 11:51:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Message-ID: <YQfALZNWyw8VKODp@8bytes.org>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Tiffany Lin <tiffany.lin@mediatek.com>, yi.kuo@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Jul 30, 2021 at 10:52:26AM +0800, Yong Wu wrote:
>  .../display/mediatek/mediatek,disp.txt        |  9 ----
>  .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
>  .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
>  .../bindings/media/mediatek-mdp.txt           |  8 ----
>  .../bindings/media/mediatek-vcodec.txt        |  4 --
>  arch/arm/boot/dts/mt2701.dtsi                 |  2 -
>  arch/arm/boot/dts/mt7623n.dtsi                |  5 --
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  9 +++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
>  drivers/iommu/mtk_iommu.c                     | 24 +++++++++-
>  drivers/iommu/mtk_iommu_v1.c                  | 31 ++++++++++++-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +-----------------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 ++----------------
>  drivers/memory/mtk-smi.c                      | 14 ------
>  include/soc/mediatek/smi.h                    | 20 --------
>  28 files changed, 92 insertions(+), 321 deletions(-)

So this is likely not going through the IOMMU tree, given Matthias has
reviewed the IOMMU changes you can add my Acked-by: Joerg Roedel <jroedel@suse.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
