Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887D21B5A6
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 14:58:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C6978897E4;
	Fri, 10 Jul 2020 12:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ir-+NH6t2Led; Fri, 10 Jul 2020 12:58:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A34688973;
	Fri, 10 Jul 2020 12:58:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 470C0C016F;
	Fri, 10 Jul 2020 12:58:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56287C016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4165D20468
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JDdTZnKYe4D for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 12:58:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A8F520402
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 12:58:36 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7231920C; Fri, 10 Jul 2020 14:58:33 +0200 (CEST)
Date: Fri, 10 Jul 2020 14:58:32 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag
Message-ID: <20200710125831.GI27672@8bytes.org>
References: <20200703162548.19953-1-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703162548.19953-1-will@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Fri, Jul 03, 2020 at 05:25:48PM +0100, Will Deacon wrote:
> The IOMMU_SYS_CACHE_ONLY flag was never exposed via the DMA API and
> has no in-tree users. Remove it.
> 
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
> 
> As discussed in [1], sounds like this should be a domain attribute anyway
> when it's needed by the GPU.
> 
> [1] https://lore.kernel.org/r/CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com
> 
>  drivers/iommu/io-pgtable-arm.c | 3 ---
>  include/linux/iommu.h          | 6 ------
>  2 files changed, 9 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
