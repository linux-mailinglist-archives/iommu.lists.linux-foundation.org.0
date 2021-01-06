Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9782EBD57
	for <lists.iommu@lfdr.de>; Wed,  6 Jan 2021 12:56:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D36A2844E7;
	Wed,  6 Jan 2021 11:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pK4LvzWpsXkE; Wed,  6 Jan 2021 11:56:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5BB38844BD;
	Wed,  6 Jan 2021 11:56:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B7A0C013A;
	Wed,  6 Jan 2021 11:56:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47A05C013A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 11:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3158886A14
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 11:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJ-0IpwxbieI for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jan 2021 11:56:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE7208666D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 11:56:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2EA323110;
 Wed,  6 Jan 2021 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609934184;
 bh=HZYnJAIuD9MMbAMSmu3ejZVLAS6WiLfiiShHiiBv4YU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZRA5wz6FMI5xfUbwYHZUwrrupsOg72i/wc8QiogubLx3JKzJGP+x4AsDTPYMRWZm9
 woKVVXY4n/oWYpj8n7NKPHpTUxnlXvkLQLUuRoRi52QQ1FLkYRj3IoRieZqvEDtAGy
 OPYJeQIPGPrcb4y+QFkbiBkvBPr4xyckxiic5aBMz3Dd3f1Uv6JSRX2iMbVDS9KXS3
 kqoWF/ZGIdVVu1X3nl+gk6qqKYSHvYcOYJixCW1leh3g4Sch3qFhbSuIgcQ7nKjd1r
 m48UxmDVDgIXhwMksWwKlLA+eudExTiJYZs7wTkcBUSfCE09RRZQ2g79ipJ1gGsLWi
 JdBBXRm8J1S4g==
Date: Wed, 6 Jan 2021 11:56:16 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Allow non-coherent masters to use
 system cache
Message-ID: <20210106115615.GA1763@willie-the-truck>
References: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Thu, Dec 24, 2020 at 12:10:07PM +0530, Sai Prakash Ranjan wrote:
> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> the memory type setting required for the non-coherent masters to use
> system cache. Now that system cache support for GPU is added, we will
> need to mark the memory as normal sys-cached for GPU to use system cache.
> Without this, the system cache lines are not allocated for GPU. We use
> the IO_PGTABLE_QUIRK_ARM_OUTER_WBWA quirk instead of a page protection
> flag as the flag cannot be exposed via DMA api because of no in-tree
> users.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7c9ea9d7874a..3fb7de8304a2 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -415,6 +415,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>  		else if (prot & IOMMU_CACHE)
>  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
>  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
> +		else if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
> +			pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
> +				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>  	}

drivers/iommu/io-pgtable.c currently documents this quirk as applying only
to the page-table walker. Given that we only have one user at the moment,
I think it's ok to change that, but please update the comment.

We also need to decide on whether we want to allow the quirk to be passed
if the coherency of the page-table walker differs from the DMA device, since
we have these combinations:

	Coherent walker?	IOMMU_CACHE	IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
0:	N			0		0
1:	N			0		1
2:	N			1		0
3:	N			1		1
4:	Y			0		0
5:	Y			0		1
6:	Y			1		0
7:	Y			1		1

Some of them are obviously bogus, such as (7), but I don't know what to
do about cases such as (3) and (5).

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
