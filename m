Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8714BFE6E
	for <lists.iommu@lfdr.de>; Tue, 22 Feb 2022 17:24:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C1180EF1;
	Tue, 22 Feb 2022 16:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jbGKFFvKymx; Tue, 22 Feb 2022 16:24:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C5E2C8131F;
	Tue, 22 Feb 2022 16:24:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F84AC0073;
	Tue, 22 Feb 2022 16:24:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C342BC0011
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 16:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A26E7402C3
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 16:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-ENmVHzefHd for <iommu@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 16:24:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0002940153
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=orNwPadLyZMf1dU28nfIOtIad1J0UPF7cu+kVS+SXB4=; b=qe4lpTnNgBZVySRtcKlpB9P4wS
 cwDoiJwxuZOdS+saabUOIkzYZUV41PPWWbuJqZLkcEoQjIGNYmgD2B6WmbScT1vwsjJLMRmZgU94M
 swkrlzZh/4Bdp4AunBMnVTj2jCeH5ARtT5329KjDjsnCVbaTIrlWEHKS9Re5hxdM+oOQpJtDCCoqL
 K6Ru76oCv7p+KFlznfV1lTS0ppH/XOCQx2CORBcwciP0VtZ1VGPdinUjpi+X27Aepz0xYeV2ep2lr
 4fWm2cB3R0eftyPwX7HofBbcan+KhKUiCFkXQ7012S0za5OCvDg7tziO8W79x8PsXT7Cn+RYkuFkd
 uJKXShew==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nMXxR-00AcJa-Rg; Tue, 22 Feb 2022 16:24:09 +0000
Date: Tue, 22 Feb 2022 08:24:09 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 3/9] gpu: host1x: Add context device management code
Message-ID: <YhUOKaoCA7dyAZAh@infradead.org>
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-4-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218113952.3077606-4-mperttunen@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: devicetree@vger.kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, robin.murphy@arm.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Feb 18, 2022 at 01:39:46PM +0200, Mikko Perttunen wrote:
> +
> +/*
> + * Due to an issue with T194 NVENC, only 38 bits can be used.
> + * Anyway, 256GiB of IOVA ought to be enough for anyone.
> + */
> +static dma_addr_t context_device_dma_mask = DMA_BIT_MASK(38);

You need a mask per device.  Please don't share the same variable
for multiple masks.

> +EXPORT_SYMBOL(host1x_context_alloc);

All this low-level code really should be EXPORT_SYMBOL_GPL.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
