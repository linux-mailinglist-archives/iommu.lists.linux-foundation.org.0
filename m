Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3655449E025
	for <lists.iommu@lfdr.de>; Thu, 27 Jan 2022 12:03:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE7BD40292;
	Thu, 27 Jan 2022 11:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAn6SbdtttY9; Thu, 27 Jan 2022 11:03:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C144D4026F;
	Thu, 27 Jan 2022 11:03:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95C95C000B;
	Thu, 27 Jan 2022 11:03:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AE55C000B
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FDC6610B6
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwrongX-bmxe for <iommu@lists.linux-foundation.org>;
 Thu, 27 Jan 2022 11:03:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C25B60FA2
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:03:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B63611F41701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643281378;
 bh=oRWo0Veii/RC5thoeHrP2GZT3yztnRxOcV4vMVuDWrw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DANWTO2FuWyYw+H4LLdsbFJmnTtEtz5IZacT9Oz68afHtrV7NRm06X0lo3vwg3UJm
 V1LZuevKoqhzsir9cBe8plY1suyuFyV7sLFfOgxuc21r/uzgpd02jWnsCHqmLiHZCP
 uR5XTKgXcOr1TL5PNucboFSqbHcRs9ABkmMQFjs8xQoHYsIPhgzhWT2maVE4l0K9s+
 ef1iScK99eK4ivp0lZGLoB2GEqZXSBcPJV9/Wcf0/Y/reJ5LwpgIMHW0YMqbkj6K4t
 R2mc4XPJiG5KMPSDuycY2bkNil4FYxSbh1VDKJgzorpeZBz3tYMsuAUK4IqQDu4/OY
 u8zz6qVVTth6w==
Subject: Re: [PATCH v4 07/35] iommu/mediatek: Add mutex for data in the
 mtk_iommu_domain
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-8-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8576a0c5-aa69-aaed-be48-125ae2004f47@collabora.com>
Date: Thu, 27 Jan 2022 12:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-8-yong.wu@mediatek.com>
Content-Language: en-US
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 chengci.xu@mediatek.com, xueqi.zhang@mediatek.com,
 linux-kernel@vger.kernel.org, libo.kang@mediatek.com,
 yen-chang.chen@mediatek.com, iommu@lists.linux-foundation.org,
 yf.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, mingyuan.ma@mediatek.com,
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

Il 25/01/22 09:56, Yong Wu ha scritto:
> Same with the previous patch, add a mutex for the "data" in the
> mtk_iommu_domain. Just improve the safety for multi devices
> enter attach_device at the same time. We don't get the real issue
> for this.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
