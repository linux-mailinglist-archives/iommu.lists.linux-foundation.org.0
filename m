Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FC3550A
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 03:43:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C59A292F;
	Wed,  5 Jun 2019 01:43:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 882872F
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 00:52:54 +0000 (UTC)
X-Greylist: delayed 00:05:24 by SQLgrey-1.7.6
Received: from mail7-211.sinamail.sina.com.cn (mail7-211.sinamail.sina.com.cn
	[202.108.7.211])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 2595619B
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 00:52:52 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([123.112.52.63])
	by sina.com with ESMTP
	id 5CF7111B00004B92; Wed, 5 Jun 2019 08:47:25 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 970774395166
From: Hillf Danton <hdanton@sina.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/26] iommu/dma: move the arm64 wrappers to common code
Date: Wed,  5 Jun 2019 08:47:17 +0800
Message-Id: <20190422175942.18788-8-hch@lst.de>
In-Reply-To: <20190422175942.18788-1-hch@lst.de>
References: <20190422175942.18788-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Archived-At: <https://lore.kernel.org/lkml/20190422175942.18788-8-hch@lst.de/>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 05 Jun 2019 01:43:27 +0000
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


Hi Christoph

On Mon, 22 Apr 2019 19:59:23 +0200 Christoph Hellwig wrote:
> @@ -744,18 +816,22 @@ static void __invalidate_sg(struct scatterlist *sg, int nents)
>   * impedance-matching, to be able to hand off a suitably-aligned list,
>   * but still preserve the original offsets and sizes for the caller.
>   */
> -int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
> -		int nents, int prot)
> +static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
> +		int nents, enum dma_data_direction dir, unsigned long attrs)
>  {
>  	struct iommu_domain *domain = iommu_get_dma_domain(dev);
>  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
>  	struct iova_domain *iovad = &cookie->iovad;
>  	struct scatterlist *s, *prev = NULL;
> +	int prot = dma_info_to_prot(dir, dev_is_dma_coherent(dev), attrs);
>  	dma_addr_t iova;
>  	size_t iova_len = 0;
>  	unsigned long mask = dma_get_seg_boundary(dev);
>  	int i;
>  
> +	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> +		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
> +
>  	/*
>  	 * Work out how much IOVA space we need, and align the segments to
>  	 * IOVA granules for the IOMMU driver to handle. With some clever
> @@ -815,12 +891,16 @@ int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  	return 0;
>  }
>  
> -void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
> -		enum dma_data_direction dir, unsigned long attrs)
> +static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> +		int nents, enum dma_data_direction dir, unsigned long attrs)
>  {
>  	dma_addr_t start, end;
>  	struct scatterlist *tmp;
>  	int i;
> +
> +	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
> +		iommu_dma_sync_sg_for_cpu(dev, sg, nents, dir);
> +
Is it a typo?

>  	/*
>  	 * The scatterlist segments are mapped into a single
>  	 * contiguous IOVA allocation, so this is incredibly easy.
[...]
> +
> +/*
> + * The IOMMU core code allocates the default DMA domain, which the underlying
> + * IOMMU driver needs to support via the dma-iommu layer.
> + */
Over comment.

> +void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 size)
> +{
> +	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> +
> +	if (!domain)
> +		goto out_err;
> +
> +	/*
> +	 * The IOMMU core code allocates the default DMA domain, which the
> +	 * underlying IOMMU driver needs to support via the dma-iommu layer.
> +	 */
> +	if (domain->type == IOMMU_DOMAIN_DMA) {
> +		if (iommu_dma_init_domain(domain, dma_base, size, dev))
> +			goto out_err;
> +		dev->dma_ops = &iommu_dma_ops;
> +	}
> +
> +	return;
> +out_err:
> +	 pr_warn("Failed to set up IOMMU for device %s; retaining platform DMA ops\n",
> +		 dev_name(dev));
> +}
> +

BR
Hillf

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
