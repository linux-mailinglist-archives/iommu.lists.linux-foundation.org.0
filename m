Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4D4548151
	for <lists.iommu@lfdr.de>; Mon, 13 Jun 2022 10:13:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBB73825E8;
	Mon, 13 Jun 2022 08:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CSnrHV9MtKY; Mon, 13 Jun 2022 08:13:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C43DE82503;
	Mon, 13 Jun 2022 08:13:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E833C0081;
	Mon, 13 Jun 2022 08:13:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D73EC002D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jun 2022 08:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3646825E8
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jun 2022 08:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjQL9IkrPEit for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jun 2022 08:13:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FD3482503
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jun 2022 08:13:19 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B924660163F;
 Mon, 13 Jun 2022 09:13:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655107997;
 bh=nngcLlLkWokhulYNje5MIUVohalGmGQRGzNdGDIqhOg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oUJLCpDwf6d8vCEwFuLYeiFLaqPJ3EL68/bcBr6sbAbGzc+N/DXSCCdHMIGrwe9ml
 bN1WxFu0/szl4ZkMs77VDe868k+7i2zq94TTq/sYBpB+AZLVdeyxCfWdHoRSvXvqfw
 78roJdyviEA8KQtMfXF3SN579GsYRv8qwbkHmrHXAFURrEC44PsMKIdobYnmyq9bLx
 PgY6B9oTiBQclhsLYbiZM1R55H+F7GMMsgy76kt8n5wNyz91LluFdLVpUH0HnoeQQe
 6Sb0GPrzbO1qFd5SeZVpBoCwqnt5uJOWy6RFQdX0NkmV2fN4m1diJhIc7Wzroyef2H
 PcqPencC5Of5g==
Message-ID: <80c7fa61-e25a-fc45-bdcb-60ac3796b96e@collabora.com>
Date: Mon, 13 Jun 2022 10:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 6/6] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to pericfg
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
 <20220609100802.54513-7-angelogioacchino.delregno@collabora.com>
 <db422fe4d0b5391ee2aacae989d7e48209e1095f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <db422fe4d0b5391ee2aacae989d7e48209e1095f.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, will@kernel.org,
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

Il 13/06/22 07:32, Yong Wu ha scritto:
> On Thu, 2022-06-09 at 12:08 +0200, AngeloGioacchino Del Regno wrote:
>> On some SoCs (of which only MT8195 is supported at the time of
>> writing),
>> the "R" and "W" (I/O) enable bits for the IOMMUs are in the
>> pericfg_ao
>> register space and not in the IOMMU space: as it happened already
>> with
>> infracfg, it is expected that this list will grow.
> 
> Currently I don't see the list will grow. As commented before, In the
> lastest SoC, The IOMMU enable bits for IOMMU will be in ATF, rather
> than in this pericfg register region. In this case, Is this patch
> unnecessary? or we could add this patch when there are 2 SoCs use this
> setting at least?  what's your opinion?
> 

Perhaps I've misunderstood... besides, can you please check if there's any
other SoC (not just chromebooks, also smartphone SoCs) that need this logic?

Thanks,
Angelo


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
