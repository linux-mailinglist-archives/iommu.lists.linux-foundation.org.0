Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA614905ED
	for <lists.iommu@lfdr.de>; Mon, 17 Jan 2022 11:28:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C974033C;
	Mon, 17 Jan 2022 10:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id my-_t6Wd9Qhs; Mon, 17 Jan 2022 10:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C31DF40240;
	Mon, 17 Jan 2022 10:28:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0A37C007A;
	Mon, 17 Jan 2022 10:28:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3D6EC002F
 for <iommu@lists.linux-foundation.org>; Mon, 17 Jan 2022 10:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1B5C607D1
 for <iommu@lists.linux-foundation.org>; Mon, 17 Jan 2022 10:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mns1775JXeFg for <iommu@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 10:27:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F49F6079E
 for <iommu@lists.linux-foundation.org>; Mon, 17 Jan 2022 10:27:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 899521F436F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642415275;
 bh=Cmf+ki9Vk24rB2D48FhsSedDY9YmalEmBmnVGnqctrk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cZN2aNglRujf2txUQPNOsSikL1Qj/rX9KtqAToPUgaHafbV1bl8jpSDlXrQ9kPDP/
 lxOV7RCedjnOMCKGDws0KlV3uOr9EBMopUw/sqdwVIs0bSwjWGlLCf21WV/+eowj6G
 6xsQUvlB5N4oLr2dl8LZ7MJheM6rzHBLGXVOBEUmvKQpMfR7SKK1LhQrUiFevKoCAq
 wJz2h1UDAqFfJczhwAj4cdeTv0DFKYj1NBKIfi1+lfwzYeN5bbQi3OVZxdSlXNQ2ig
 NeweolKaAqHKnlm+PLVxKS0UnM6yk0QcvKXpWRz4AfKup1xfL6KJIr6W+FzAKVKO7s
 zEXZWrv9u8JjQ==
Subject: Re: [PATCH v10 00/13] Clean up "mediatek,larb"
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Joerg Roedel <jroedel@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20220117070510.17642-1-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <06e5e76c-557a-20a5-b8dd-37b25b3384a3@collabora.com>
Date: Mon, 17 Jan 2022 11:27:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220117070510.17642-1-yong.wu@mediatek.com>
Content-Language: en-US
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Il 17/01/22 08:04, Yong Wu ha scritto:
> MediaTek IOMMU block diagram always like below:
> 
>          M4U
>           |
>      smi-common
>           |
>    -------------
>    |         |  ...
>    |         |
> larb1     larb2
>    |         |
> vdec       venc
> 
> All the consumer connect with smi-larb, then connect with smi-common.
> 
> When the consumer works, it should enable the smi-larb's power which also
> need enable the smi-common's power firstly.
> 
> Thus, Firstly, use the device link connect the consumer and the
> smi-larbs. then add device link between the smi-larb and smi-common.
> 
> After adding the device_link, then "mediatek,larb" property can be removed.
> the iommu consumer don't need call the mtk_smi_larb_get/put to enable
> the power and clock of smi-larb and smi-common.
> 
> Base on the media branch [1] and a jpeg dtbinding patchset[2] that already got
> the necessary R-b.
> 
> [1] git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18d
> [2] https://lore.kernel.org/linux-mediatek/20211206130425.184420-1-hsinyi@chromium.org/
> 
> Change notes:
> v10: a) Rebase on the media tree. Respin the "media: mtk-vcodec:" patches.
>       b) Add Joerg's Ack for iommu patches.
> 
> v9: https://lore.kernel.org/linux-mediatek/20211112105509.12010-1-yong.wu@mediatek.com/
>      1) Add return -ENODEV when the dev is null.
>      2) Add more strict about the case that a iommu consume device use the ports in
>      different larbs. Don't allow this case.
>      3) Remove two codec interface: mtk_vcodec_release_enc/dec_pm since it only has one
>      line now.
> 
> v8: https://lore.kernel.org/linux-mediatek/20210929013719.25120-1-yong.wu@mediatek.com/
>      1) Rebase on v5.15-rc1.
>      2) Don't rebase the below mdp patchset that may still need more discuss.
>      https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/
>      3) Add Frank's Tested-by. Remove Dafna's Tested-by as he requested.
> 
> v7: https://lore.kernel.org/linux-mediatek/20210730025238.22456-1-yong.wu@mediatek.com/
>      1) Fix a arm32 boot fail issue. reported from Frank.
>      2) Add a return fail in the mtk drm. suggested by Dafna.
> 
> v6: https://lore.kernel.org/linux-mediatek/20210714025626.5528-1-yong.wu@mediatek.com/
>      1) rebase on v5.14-rc1.
>      2) Fix the issue commented in v5 from Dafna and Hsin-Yi.
>      3) Remove the patches about using pm_runtime_resume_and_get since they have
>         already been merged by other patches.
> 
> v5: https://lore.kernel.org/linux-mediatek/20210410091128.31823-1-yong.wu@mediatek.com/
>      1) Base v5.12-rc2.
>      2) Remove changing the mtk-iommu to module_platform_driver patch, It have already been a
>      independent patch.
> 
> v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/
>      base on v5.7-rc1.
>    1) Move drm PM patch before smi patchs.
>    2) Change builtin_platform_driver to module_platform_driver since we may need
>       build as module.
>    3) Rebase many patchset as above.
> 
> v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
>      1) rebase on v5.3-rc1 and the latest mt8183 patchset.
>      2) Use device_is_bound to check whether the driver is ready from Matthias.
>      3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
>     reason in the commit message[3/14].
>      4) Add a display patch[12/14] into this series. otherwise it may affect
>     display HW fastlogo even though it don't happen in mt8183.
>     
> v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
>     1) rebase on v5.2-rc1.
>     2) Move adding device_link between the consumer and smi-larb into
> iommu_add_device from Robin.
>     3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
>     4) Remove the shutdown callback in iommu.
> 
> v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/
> 
> Yong Wu (12):
>    dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
>    iommu/mediatek-v1: Free the existed fwspec if the master dev already
>      has
>    iommu/mediatek: Return ENODEV if the device is NULL
>    iommu/mediatek: Add probe_defer for smi-larb
>    iommu/mediatek: Add device_link between the consumer and the larb
>      devices
>    media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
>    media: mtk-mdp: Get rid of mtk_smi_larb_get/put
>    drm/mediatek: Get rid of mtk_smi_larb_get/put
>    media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
>    memory: mtk-smi: Get rid of mtk_smi_larb_get/put
>    arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
>    arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes
> 
> Yongqiang Niu (1):
>    drm/mediatek: Add pm runtime support for ovl and rdma
> 
>   .../display/mediatek/mediatek,disp.txt        |  9 ----
>   .../media/mediatek,vcodec-decoder.yaml        |  7 ---
>   .../media/mediatek,vcodec-encoder.yaml        |  8 ----
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
>   .../bindings/media/mediatek-mdp.txt           |  8 ----
>   arch/arm/boot/dts/mt2701.dtsi                 |  2 -
>   arch/arm/boot/dts/mt7623n.dtsi                |  5 ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  8 +++-
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 ++++---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +--
>   drivers/iommu/mtk_iommu.c                     | 34 ++++++++++++++
>   drivers/iommu/mtk_iommu_v1.c                  | 42 ++++++++++++++++-
>   .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +------------------
>   .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 40 -----------------
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>   drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  2 -
>   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  1 -
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 41 +++--------------
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  2 -
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 45 +++----------------
>   drivers/memory/mtk-smi.c                      | 14 ------
>   include/soc/mediatek/smi.h                    | 20 ---------
>   32 files changed, 115 insertions(+), 333 deletions(-)
> 

Hello Hans, Matthias,
on my side, this series is totally ready for merge, hence, green light from here.

Can you please take it for 5.18?

Thank you,
Angelo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
