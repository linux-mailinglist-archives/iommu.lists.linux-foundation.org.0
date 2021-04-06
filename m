Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E4C3552AE
	for <lists.iommu@lfdr.de>; Tue,  6 Apr 2021 13:50:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1177D404F5;
	Tue,  6 Apr 2021 11:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixItcdv4E1VZ; Tue,  6 Apr 2021 11:50:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29FE5404EF;
	Tue,  6 Apr 2021 11:50:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08504C0012;
	Tue,  6 Apr 2021 11:50:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99B6AC000A
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 11:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C1E86065D
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 11:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKWXQi0Y-hQQ for <iommu@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 11:50:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02B5260637
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 11:50:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 868926128A;
 Tue,  6 Apr 2021 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617709846;
 bh=lJ+TjE9jXejKLCTgbSxiyo5N5PBrFMk8ROc2tmk5kbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TB9kyka9JVkKCYSaaxOBc89WfQJv56gBmLYDOIQyApVo97w8hG2dQLzhovDpYeul7
 a4xUd+K9su490FkTHiT5fMbcmsnc3TxK0lvfi37OkmKzt2cd5u9c/vHFs6sduHITmW
 NGtxuBCmPdQkgY1K+k6h88N/K4uwRjOwP8F20Er8PzEPzcP8QJlksJIQFvFNLVY7vO
 qAFl2h+M09ymS197wAeLGuHf/soUMgjSKVowaIMIS7NrR0e5Y//oefIi0dCG+9CRDw
 pOK5DaYYIo4BalQDFjWR/UAwevhDFMs0V3wFd8L5px9MZ/8ILwmKyk/hQg6wvOBDps
 Mwou4+ZZahylA==
Date: Tue, 6 Apr 2021 12:50:41 +0100
From: Will Deacon <will@kernel.org>
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: Re: [RFC PATCH v3 05/12] iommu: Use bitmap to calculate page size in
 iommu_pgsize()
Message-ID: <20210406115040.GB13747@willie-the-truck>
References: <20210405191112.28192-1-isaacm@codeaurora.org>
 <20210405191112.28192-6-isaacm@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210405191112.28192-6-isaacm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pratikp@codeaurora.org, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On Mon, Apr 05, 2021 at 12:11:05PM -0700, Isaac J. Manjarres wrote:
> From: Will Deacon <will@kernel.org>
> 
> Avoid the potential for shifting values by amounts greater than the
> width of their type by using a bitmap to compute page size in
> iommu_pgsize().
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> ---
>  drivers/iommu/iommu.c | 31 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index d0b0a15dba84..9006397b6604 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> +#include <linux/bits.h>
>  #include <linux/bug.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
> @@ -2360,30 +2361,22 @@ static size_t iommu_pgsize(struct iommu_domain *domain,
>  			   unsigned long addr_merge, size_t size)
>  {
>  	unsigned int pgsize_idx;
> +	unsigned long pgsizes;
>  	size_t pgsize;
>  
> -	/* Max page size that still fits into 'size' */
> -	pgsize_idx = __fls(size);
> +	/* Page sizes supported by the hardware and small enough for @size */
> +	pgsizes = domain->pgsize_bitmap & GENMASK_ULL(__fls(size), 0);

See my comments on the other thread, but I don't think it's necessary to use
the _ULL versions everywhere.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
