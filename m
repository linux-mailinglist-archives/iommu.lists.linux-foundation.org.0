Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A0561DF7
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 16:31:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30F084240C;
	Thu, 30 Jun 2022 14:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30F084240C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CaiFV_IBjg6F; Thu, 30 Jun 2022 14:31:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1D1BC42408;
	Thu, 30 Jun 2022 14:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D1BC42408
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1569C0036;
	Thu, 30 Jun 2022 14:31:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DC29C0011
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 14:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 544B842408
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 14:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 544B842408
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lxpikd6Fb1gA for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 14:31:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D0142406
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34D0142406
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 14:31:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AF95368AA6; Thu, 30 Jun 2022 16:31:16 +0200 (CEST)
Date: Thu, 30 Jun 2022 16:31:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ren Zhijie <renzhijie2@huawei.com>
Subject: Re: [PATCH -next] dma-mapping: Fix build error unused-value
Message-ID: <20220630143116.GA6198@lst.de>
References: <20220630123528.251181-1-renzhijie2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220630123528.251181-1-renzhijie2@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: mathieu.poirier@linaro.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, hch@lst.de, mark-pk.tsai@mediatek.com
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

Thanks, this looks good with a minor nit below:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Mathieu, can you pick this up through your tree as that is where the
offending commit was merged through?

> Fixes: e61c451476e6("dma-mapping: Add dma_release_coherent_memory to DMA API")

missing space before the opening brace here.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
