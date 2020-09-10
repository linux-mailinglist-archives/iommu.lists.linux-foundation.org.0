Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8762826454C
	for <lists.iommu@lfdr.de>; Thu, 10 Sep 2020 13:22:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13ECB86F51;
	Thu, 10 Sep 2020 11:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuCySr786-r4; Thu, 10 Sep 2020 11:22:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7FFA386F5A;
	Thu, 10 Sep 2020 11:22:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 647C9C0051;
	Thu, 10 Sep 2020 11:22:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 994F7C0051
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 11:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 80258875B9
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 11:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZ8lEjPdG259 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 11:22:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8106E875B6
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 11:22:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C95571045;
 Thu, 10 Sep 2020 04:22:49 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1938A3F68F;
 Thu, 10 Sep 2020 04:22:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] dma-mapping: remove the dma_dummy_ops export
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20200908163959.3177173-1-hch@lst.de>
 <20200908163959.3177173-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5b2dc452-7005-1ff3-6ab5-a9fc03345485@arm.com>
Date: Thu, 10 Sep 2020 12:22:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908163959.3177173-2-hch@lst.de>
Content-Language: en-GB
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

On 2020-09-08 17:39, Christoph Hellwig wrote:
> dma_dummy_ops is only used by the ACPI code, which can't be modular.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/dummy.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/kernel/dma/dummy.c b/kernel/dma/dummy.c
> index 05607642c888d9..6974b1bd7d0b88 100644
> --- a/kernel/dma/dummy.c
> +++ b/kernel/dma/dummy.c
> @@ -36,4 +36,3 @@ const struct dma_map_ops dma_dummy_ops = {
>   	.map_sg                 = dma_dummy_map_sg,
>   	.dma_supported          = dma_dummy_supported,
>   };
> -EXPORT_SYMBOL(dma_dummy_ops);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
