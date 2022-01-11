Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1590848ABCF
	for <lists.iommu@lfdr.de>; Tue, 11 Jan 2022 11:57:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BBE8827A9;
	Tue, 11 Jan 2022 10:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wX3IlsDVVonM; Tue, 11 Jan 2022 10:57:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A9CD5826A8;
	Tue, 11 Jan 2022 10:57:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F1E5C006E;
	Tue, 11 Jan 2022 10:57:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ABD7C001E
 for <iommu@lists.linux-foundation.org>; Tue, 11 Jan 2022 10:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAD7A401A2
 for <iommu@lists.linux-foundation.org>; Tue, 11 Jan 2022 10:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQPJf81UO-Hi for <iommu@lists.linux-foundation.org>;
 Tue, 11 Jan 2022 10:57:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3943840133
 for <iommu@lists.linux-foundation.org>; Tue, 11 Jan 2022 10:57:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ACD031F43A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898664;
 bh=c1xIViTzhE5aZjvh/zmxFPziUhaMBgmqtz0aUUQn0JE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lsCNh0Z5KQAYLXVr59xl7SpD7RMMSCr1N469L/eDLv2P6cgs6iZ+HGXN14kttTQnT
 8D5a/9Y28Iyz5j9/HHkBYTt2oPMqkjf0WTyBzPKlGyN4d3uq3gsY6swdMzaQ9joiCd
 5gbsfft0GRjb+Z9nx98aALuXSxNg4pinnIfd8on9qYblSkSGXrn+l+CtvzRGL2dKmj
 ICdPyvFoIsq9iG+TYrGLfeRvx7l4dlbn6JlTRnOG3+n1ZduDmU3Kkno4zfWH2JHOuJ
 PQYMFwa/bniKw9NLssT1raLg762KvGyAT0jg8i3jPZE+NrQQTN3jA/sUY5OMV4oBLt
 WrqgW2NhzTuBA==
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
Date: Tue, 11 Jan 2022 11:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-13-yong.wu@mediatek.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 anan.sun@mediatek.com, acourbot@chromium.org, srv_heupstream@mediatek.com,
 yf.wang@mediatek.com, iommu@lists.linux-foundation.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Robin Murphy <robin.murphy@arm.com>
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

Il 12/11/21 11:55, Yong Wu ha scritto:
> After this patchset, mtk_vcodec_release_enc_pm has only one line.
> then remove that function, use pm_runtime_disable instead.
> 
> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
> rename it from the _pm to _clk.
> 
> No functional change.
> 
> CC: Tiffany Lin <tiffany.lin@mediatek.com>
> CC: Irui Wang <irui.wang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
