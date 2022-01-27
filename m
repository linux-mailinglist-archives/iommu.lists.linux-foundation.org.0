Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74F49E001
	for <lists.iommu@lfdr.de>; Thu, 27 Jan 2022 12:00:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8852B84F54;
	Thu, 27 Jan 2022 11:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXlPRcsop5yM; Thu, 27 Jan 2022 11:00:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DA18584F50;
	Thu, 27 Jan 2022 11:00:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B289C007A;
	Thu, 27 Jan 2022 11:00:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66E91C000B
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E03141C8A
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmrmtHe4XX89 for <iommu@lists.linux-foundation.org>;
 Thu, 27 Jan 2022 11:00:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DA7A41C89
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:00:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A55B71F45069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643281205;
 bh=ANnHQ3AW7cDcFPINFPyo+6Bw6O0a8MPJooTmRyKn1hE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Caw17/VTX8SU25VO7GP+5IiEs1dWo3oL/oYurRO63dZMfiD658/+0GTHMpC+GisE1
 lWS7UzOfaW8MWrVl7WYfDzdSQMNihCeu4FGO71j/YRQ/27J2ALxag45996kyXvtbSH
 QJJVIzvmiXDpWGMbTtKF5pWTD2V2fSI8LjekX7tdGRbgac5fjfWx9SgJCkNQnzF/vT
 NAgc1ZxUvsccvUC5S3aUN/TU8jU+o37BlVLMwllnO5CGAUXFoL1FIJ/Y410Cm1SZas
 9u5WQxsoYUbcohM2ohbOBvPOtb5G7Hn1UEhFk4tRNJwv2Ib6Zixedmhj7Jd5uM4lHE
 of0t90CtngClw==
Subject: Re: [PATCH v4 03/35] iommu/mediatek: Fix 2 HW sharing pgtable issue
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <fc505da2-809c-c466-2256-b5293f242128@collabora.com>
Date: Thu, 27 Jan 2022 11:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-4-yong.wu@mediatek.com>
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
> In the commit 4f956c97d26b ("iommu/mediatek: Move domain_finalise into
> attach_device"), I overlooked the sharing pgtable case.
> After that commit, the "data" in the mtk_iommu_domain_finalise always is
> the data of the current IOMMU HW. Fix this for the sharing pgtable case.
> 
> Only affect mt2712 which is the only SoC that share pgtable currently.
> 
> Fixes: 4f956c97d26b ("iommu/mediatek: Move domain_finalise into attach_device")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
