Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0B2D0DF2
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 11:25:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E5D832E136;
	Mon,  7 Dec 2020 10:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxXfUwHWLGS5; Mon,  7 Dec 2020 10:25:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5972A2E0E5;
	Mon,  7 Dec 2020 10:25:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35E93C013B;
	Mon,  7 Dec 2020 10:25:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6919DC013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 10:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5D8E786E01
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 10:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kuQRgL9tpLpw for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 10:25:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D8F6586E00
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 10:25:03 +0000 (UTC)
Date: Mon, 7 Dec 2020 10:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607336703;
 bh=D4jvLiuo5MBwNTSdal71W3VOvzvsyAS1r5K6BlDOzNU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cy4Whju3D3VrIcAcqnFEQuLw3LvJoXbI4U4WtTfD47xpDQx2xYnP3hkF8/mIWL/sA
 YFZ+iaFHLh3pPvHkebEHDl+19UwZPL3UdCY1ofbUv1jqxV82sTg4sqwArY5IPTVSQj
 lnE6ntCsmo7KEz2WvbKkOn4nAPEZXdUQk9oFz8m33uQ23C09LcTvU3lsCBfP0BM29X
 kSj8wmY73QVOHVJuR2t2exNhVEL3sSPa289ORAx7hb4CuJex5SFKjY08S1xJVPfVCH
 mgzoLMcwigRd0mA8vMs67wnu5wCeT5IJmf2r6/QK3OOKMoP3DhFDi2n3YDBuRzzGrm
 4L3LjjjFHgytA==
From: Will Deacon <will@kernel.org>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH] iommu/io-pgtalbe-arm: Remove "iopte_type(pte, l)" extra
 parameter "l"
Message-ID: <20201207102458.GB3825@willie-the-truck>
References: <20201207081404.1699-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207081404.1699-1-jiangkunkun@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Keqian Zhu <zhukeqian1@huawei.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 wanghaibin.wang@huawei.com, Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
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

On Mon, Dec 07, 2020 at 04:14:04PM +0800, Kunkun Jiang wrote:
> Knowing from the code, the macro "iopte_type(pte, l)" doesn't use the
> parameter "l" (level). So we'd better to remove it.
> 
> Fixes: e1d3c0fd701df(iommu: add ARM LPAE page table allocator)
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index a7a9bc08dcd1..925ae2b713d6 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -130,7 +130,7 @@
>  /* IOPTE accessors */
>  #define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
>  
> -#define iopte_type(pte,l)					\
> +#define iopte_type(pte)					\
>  	(((pte) >> ARM_LPAE_PTE_TYPE_SHIFT) & ARM_LPAE_PTE_TYPE_MASK)

Shouldn't we update all the users of the macro too?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
