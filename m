Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E548DACC
	for <lists.iommu@lfdr.de>; Thu, 13 Jan 2022 16:41:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B17580C9C;
	Thu, 13 Jan 2022 15:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiOxLvtOWbLr; Thu, 13 Jan 2022 15:41:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BC4C680C68;
	Thu, 13 Jan 2022 15:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F519C006E;
	Thu, 13 Jan 2022 15:41:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B44FC001E
 for <iommu@lists.linux-foundation.org>; Thu, 13 Jan 2022 15:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63C0D6FC18
 for <iommu@lists.linux-foundation.org>; Thu, 13 Jan 2022 15:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZ3OIzvJgmab for <iommu@lists.linux-foundation.org>;
 Thu, 13 Jan 2022 15:41:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CD8B60D9C
 for <iommu@lists.linux-foundation.org>; Thu, 13 Jan 2022 15:41:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 074301F45608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642088495;
 bh=BMHWWGEM16d3WzPZdxSB+d8Mct80ra3tr+9TJ/UQpa4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=J9kcGl/0J4V49lY6XnV5B2YY58lrFCZrLhH9srG8OOmu3iu2Ji/uZNRAzbDPI4K/l
 ET4Rrk0EWDPONpj/bF/RmKPz9FoMGsPdFGCG5QMguY2IYc1M5U2bseXaYZaFZXdc/c
 4Du16Z0SJC5S2islbnuoLd8D5SazLVR1cHkYsoL69mL2BxXBFf1KQSyOnbbn2+AVgY
 7ws0SD5/ilVL9C41kdbu0/F/SHqiWyhY+WIZbVn4kDyBWsU/0pECQ6rrZ/7uInzB25
 nD9jp8wIHFAPb2PzTelpQQOI7U33s98FZ3x7Hf3veMF2ouKR+8iSw+y9f5S2VlJCt9
 xl/vImRVS/gjw==
Subject: Re: [PATCH v3 1/7] dt-bindings: memory: mtk-smi: Rename clock to
 clocks
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220113111057.29918-1-yong.wu@mediatek.com>
 <20220113111057.29918-2-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c88b8a01-6048-77bc-b49d-dd58ddbe5d74@collabora.com>
Date: Thu, 13 Jan 2022 16:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113111057.29918-2-yong.wu@mediatek.com>
Content-Language: en-US
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 lc.kan@mediatek.com, anthony.huang@mediatek.com, anan.sun@mediatek.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Il 13/01/22 12:10, Yong Wu ha scritto:
> The property "clock" should be rename to "clocks", and delete the "items",
> the minItems/maxItems should not be put under "items".
> 
> Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
