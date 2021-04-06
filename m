Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A1976355381
	for <lists.iommu@lfdr.de>; Tue,  6 Apr 2021 14:20:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7116066F;
	Tue,  6 Apr 2021 12:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQjVpPEo1kin; Tue,  6 Apr 2021 12:20:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4093060634;
	Tue,  6 Apr 2021 12:20:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14E6FC000A;
	Tue,  6 Apr 2021 12:20:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DE8FC000A
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 12:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A3B40503
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 12:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ByEHfZMy_DH for <iommu@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 12:20:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8548F401F7
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 12:20:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 379A4613BD;
 Tue,  6 Apr 2021 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617711600;
 bh=bCiENviP5yLXmsS+jBeN4OdortwS8+IbokWCxySiKp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o8HJ8X3zLjq6lPZI/5QDKETu2XSxajnnOUdmNocHKAPyC29IiMOaeV5EHodyB0Qeu
 iBfIyugoB892HwJvu9MwprrDNIhgzbyrwYO5lP83a3SiHZ2HHQrxTi6ClvksBOjmx6
 S6x1txa7loj4P3v8K5Jwcw13nL4GhKCRzWKw/npwifUlOgMO32caxNPMjYR2MMAn0q
 vQ0fkn1eEgDNxp6+8EndIYQU5NQUjWXlVz2geBHb2CkywIUx4bcu6+jCGSdjnwjgh8
 YBN2GLvBTWTPK8+TvLmHMESpTcTIE38c8A2JcGwJ9xZP23RjtIi5CQ06lLe/a58MAl
 j7q7ArXMtdUGA==
Date: Tue, 6 Apr 2021 13:19:56 +0100
From: Will Deacon <will@kernel.org>
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: Re: [RFC PATCH v3 11/12] iommu/arm-smmu: Implement the unmap_pages()
 IOMMU driver callback
Message-ID: <20210406121955.GG13747@willie-the-truck>
References: <20210405191112.28192-1-isaacm@codeaurora.org>
 <20210405191112.28192-12-isaacm@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210405191112.28192-12-isaacm@codeaurora.org>
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

On Mon, Apr 05, 2021 at 12:11:11PM -0700, Isaac J. Manjarres wrote:
> Implement the unmap_pages() callback for the ARM SMMU driver
> to allow calls from iommu_unmap to unmap multiple pages of
> the same size in one call.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Suggested-by: Will Deacon <will@kernel.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d8c6bfde6a61..f29f1fb109f8 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1225,6 +1225,24 @@ static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
>  	return ret;
>  }
>  
> +static size_t arm_smmu_unmap_pages(struct iommu_domain *domain, unsigned long iova,
> +				   size_t pgsize, size_t pgcount,
> +				   struct iommu_iotlb_gather *iotlb_gather)
> +{
> +	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
> +	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
> +	size_t ret;
> +
> +	if (!ops)
> +		return 0;
> +
> +	arm_smmu_rpm_get(smmu);
> +	ret = ops->unmap_pages(ops, iova, pgsize, pgcount, iotlb_gather);
> +	arm_smmu_rpm_put(smmu);
> +
> +	return ret;
> +}

Doesn't this go wrong if we're using the short-descriptor page-table
format? (same for the next patch)

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
