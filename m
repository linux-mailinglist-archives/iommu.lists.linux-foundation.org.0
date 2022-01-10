Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6866F4897C1
	for <lists.iommu@lfdr.de>; Mon, 10 Jan 2022 12:43:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ADC34092B;
	Mon, 10 Jan 2022 11:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XG4nf6VmjS5L; Mon, 10 Jan 2022 11:43:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1ED8F4092A;
	Mon, 10 Jan 2022 11:43:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAC32C001E;
	Mon, 10 Jan 2022 11:43:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C204C001E
 for <iommu@lists.linux-foundation.org>; Mon, 10 Jan 2022 11:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77BDF40562
 for <iommu@lists.linux-foundation.org>; Mon, 10 Jan 2022 11:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-hdvPZ3ZFNK for <iommu@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 11:43:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB6D1401F2
 for <iommu@lists.linux-foundation.org>; Mon, 10 Jan 2022 11:43:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 820AD1F41050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641815029;
 bh=uuV0Epzk3gnedbGM5nYSmM92AIVHPp2psXKWjNKXehw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=WREfHH3VNKZ3seg60JNQO3Fi3Dk/N7tcQ33MIfJeskUq2VJAqGKk7Udgz2sEjQp3i
 2e80eQSixi7eeAV7Z3NXxPVYylvhsRvqbKuPqa0kUNUmu1EaUr6zhIr7+a781648fM
 aPvHxOL7meGaspCUQ6woaS8+t74/0YJ40zPraeA1IIhSwNsXO8IcFS9jery6X4QaLi
 uG1Vo3JZ8TysSP1YaDmpUyWSlcUYSS6V5K6u8v/Eqwt/B+gasmiKhbD3B7k/IX2GhP
 H2kj3+sN9R20jQnWhJ91HGAX9m/pUlEs7W2zp6XBkzfnjV7VtTkXwSgEZx795Ii7nT
 JDU+TlY+gNUXQ==
Subject: Re: [PATCH v2 3/5] iommu/mediatek: Remove the power status checking
 in tlb flush all
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, kernel@collabora.com,
 linux-media@vger.kernel.org, sebastian.reichel@collabora.com
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
 <20211208120744.2415-4-dafna.hirschfeld@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <10ca4eae-2959-a697-6818-308e04f88e14@collabora.com>
Date: Mon, 10 Jan 2022 12:43:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208120744.2415-4-dafna.hirschfeld@collabora.com>
Content-Language: en-US
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

Il 08/12/21 13:07, Dafna Hirschfeld ha scritto:
> From: Yong Wu <yong.wu@mediatek.com>
> 
> To simplify the code, Remove the power status checking in the
> tlb_flush_all, remove this:
>     if (pm_runtime_get_if_in_use(data->dev) <= 0)
> 	    continue;
> 
> The mtk_iommu_tlb_flush_all is called from
> a) isr
> b) tlb flush range fail case
> c) iommu_create_device_direct_mappings
> 
> In first two cases, the power and clock are always enabled.
> In the third case tlb flush is unnecessary because in a later patch
> in the series a full flush from the pm_runtime_resume callback is added.
> 
> In addition, writing the tlb control register when the iommu is not resumed
> is ok and the write is ignored.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [refactor commit log]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
