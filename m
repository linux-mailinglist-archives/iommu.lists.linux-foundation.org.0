Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB0484596
	for <lists.iommu@lfdr.de>; Tue,  4 Jan 2022 16:55:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56DE082890;
	Tue,  4 Jan 2022 15:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJYnBdf-36f6; Tue,  4 Jan 2022 15:55:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6B55A828A9;
	Tue,  4 Jan 2022 15:55:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4647CC001E;
	Tue,  4 Jan 2022 15:55:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54EB7C001E
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 15:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35C67414E2
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 15:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eYQ0PCeRmvT for <iommu@lists.linux-foundation.org>;
 Tue,  4 Jan 2022 15:55:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B6E5414C6
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 15:55:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6AD791F43595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311746;
 bh=qtsUEmGD51j+2uo99ESXu0PQjwuGLjPJy+zkSz7EjSE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JICc5cF8qNAmaxQsDW8LUiAiHhoETf7CyEZg6oD2u22vte6wYc3YwTwLW8iJT41Ox
 8Wq32QlhyYM2ayl0M1/5K4FhgV7lnyWT6yO3d0VMxAhz2NQxvTyfyzkQe0UfJkHrkk
 uwkwNdpwdD1bGGpCPLqMdIANj2ecRLmyvc7XN/uv31b/fTuo6SLJIHNMvTW+aAMARq
 pvUSH89KDRK68wTSI5gfwygf4HhnR0P6i32j5MbBN2IfgvKz/Cw84dxZhSmDxuk7gv
 xNkwOKeS6sXswvjMl2TcnjAI1pyCwKYCPLmnjcCpJwfKpvU5Cz5I21LtuIvFS8NpmZ
 JPtjpLKX1Myaw==
Subject: Re: [PATCH v3 05/33] iommu/mediatek: Adapt sharing and non-sharing
 pgtable case
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-6-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <06b124b3-fadc-da03-648f-907c622e2272@collabora.com>
Date: Tue, 4 Jan 2022 16:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-6-yong.wu@mediatek.com>
Content-Language: en-US
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, yen-chang.chen@mediatek.com,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
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

Il 23/09/21 13:58, Yong Wu ha scritto:
> In previous mt2712, Both IOMMUs are MM IOMMU, and they will share pgtable.
> However in the latest SoC, another is infra IOMMU, there is no reason to
> share pgtable between MM with INFRA IOMMU. This patch manage to
> implement the two case(sharing and non-sharing pgtable).
> 
> Currently we use for_each_m4u to loop the 2 HWs. Add the list_head into
> this macro.
> In the sharing pgtable case, the list_head is the global "m4ulist".
> In the non-sharing pgtable case, the list_head is hw_list_head which is a
> variable in the "data". then for_each_m4u will only loop itself.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
