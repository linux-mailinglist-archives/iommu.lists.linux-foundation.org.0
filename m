Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593D484584
	for <lists.iommu@lfdr.de>; Tue,  4 Jan 2022 16:55:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A90AB40928;
	Tue,  4 Jan 2022 15:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAUw8P_3DjLp; Tue,  4 Jan 2022 15:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B47A44090E;
	Tue,  4 Jan 2022 15:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E8EDC001E;
	Tue,  4 Jan 2022 15:55:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AF69C006E
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 15:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39F2960D52
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 15:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ev1npwgdo2L9 for <iommu@lists.linux-foundation.org>;
 Tue,  4 Jan 2022 15:55:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB35F60C01
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 15:55:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 595281F43595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311724;
 bh=mT55sEIhz+ZViNl1TjdLrnqAEkSGD0ha5i2STjrdvA0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZNbkj8e6y+LgMWHeFEfa+iWF8ALjy7AZee0LzFDih7hG97iQr1CXdNT6ACwpPNc6u
 n56MyNtfhzWCw6KNdIOa8fYIB+bMAc8ho5eetsvJ3Fc45BGlJk9IDQSkW0GGq7mFEK
 vOjZH3a/yqiZASpAWCQlJoTF9mmNYOUZHdGCEvuqzG7OCcXzHJ8WGji3ypr+AGvJYY
 IJJ5ALJxaoBRmcmWU8X0oTeYNN6iSzMNA6EyKgxQa+7vaO9LfXign1/KG8Qy3YotsR
 6Vb0+0+puysGL07M7LfolZMhpKjckvMyRkfJVxft9bDQYGzCZKwgLDqZCmV5qPvObw
 QrtuPyHD8nHzw==
Subject: Re: [PATCH v3 10/33] iommu/mediatek: Add tlb_lock in tlb_flush_all
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-11-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4444ddfd-c028-9549-0a1a-a3380fdd2d54@collabora.com>
Date: Tue, 4 Jan 2022 16:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-11-yong.wu@mediatek.com>
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
> The tlb_flush_all also touches the registers about tlb operations.
> Add spinlock in it to protect the tlb registers. since the tlb_range
> already hold the spinlock, move it a bit outside the spinlock to
> print log.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
