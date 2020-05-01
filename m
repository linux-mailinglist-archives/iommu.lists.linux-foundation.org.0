Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D381C11EC
	for <lists.iommu@lfdr.de>; Fri,  1 May 2020 14:16:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9417287E25;
	Fri,  1 May 2020 12:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOpkEfy-YvWE; Fri,  1 May 2020 12:16:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 14F1987DE0;
	Fri,  1 May 2020 12:16:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05AE0C016F;
	Fri,  1 May 2020 12:16:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6214BC016F
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 12:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5A02687DE9
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 12:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Gca9_GNWMdV for <iommu@lists.linux-foundation.org>;
 Fri,  1 May 2020 12:15:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1DAEC87DE0
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zSa9108em557MfF5cmmgHqVRvKFdEUJbROm2shmlztY=; b=jOInxxVrnrDiy9mxQpINfGYznI
 oKnrkX0pjC/ar8W6dnfZ2AtZp1BFiHtfRitE8rL3exBB2y1h8KTRLPQ/uANDrAwHgBHA8vqicquEV
 6zVPrRtSFmHRH+SSwCmNKy2wNZ6di27mGN5iKlxCI9s2LGQYJVmAe/9qZyH59xKBOLQMrVeUEuvPT
 2hrIzIuWJHImLQ0MgAXy2JjNZUoJ7H1D/BGg2Bb1eYzGN1h0noSfBxWz217c+O6uM3ykbl9sZerlS
 aQB8pnoPhkrcPfBVhAzrhmobkwqvrkHDU74ar1mGSqtlWYVzy7fKglH3UsAIq7q22z/3fTMFrmIoH
 g9y75kYA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jUUa8-0005TY-RH; Fri, 01 May 2020 12:15:52 +0000
Date: Fri, 1 May 2020 05:15:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v6 17/25] iommu/arm-smmu-v3: Implement
 iommu_sva_bind/unbind()
Message-ID: <20200501121552.GA6012@infradead.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-18-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430143424.2787566-18-jean-philippe@linaro.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, will@kernel.org,
 fenghua.yu@intel.com, jgg@ziepe.ca, linux-pci@vger.kernel.org,
 felix.kuehling@amd.com, hch@infradead.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, catalin.marinas@arm.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, christian.koenig@amd.com,
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

> @@ -432,6 +432,7 @@ config ARM_SMMU_V3
>  	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
>  	depends on ARM64
>  	select IOMMU_API
> +	select IOMMU_SVA
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select GENERIC_MSI_IRQ_DOMAIN

Doesn't this need to select MMU_NOTIFIER now?

> +	struct mmu_notifier_ops		mn_ops;

Note: not a pointer.

> +	/* If bind() was already called for this (dev, mm) pair, reuse it. */
> +	list_for_each_entry(bond, &master->bonds, list) {
> +		if (bond->mm == mm) {
> +			refcount_inc(&bond->refs);
> +			return &bond->sva;
> +		}
> +	}
> +
> +	mn = mmu_notifier_get(&smmu_domain->mn_ops, mm);
> +	if (IS_ERR(mn))
> +		return ERR_CAST(mn);

Which seems to be to avoid mmu_notifier_get reusing notifiers registered
by other arm_smmu_master instance right?

Either you could just use plain old mmu_notifier_register to avoid
the reuse.  Or we could enhance the mmu_notifier_get to pass a private
oaque instance ID pointer, which is checked in addition to the ops,
and you could probably kill off the bonds list and lookup.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
