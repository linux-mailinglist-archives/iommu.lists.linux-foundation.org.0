Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F78518AE9
	for <lists.iommu@lfdr.de>; Tue,  3 May 2022 19:19:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C00A417A4;
	Tue,  3 May 2022 17:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vpt0ECbyIjQf; Tue,  3 May 2022 17:19:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D0DD7417A5;
	Tue,  3 May 2022 17:19:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C1D2C007E;
	Tue,  3 May 2022 17:19:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7027C002D
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 17:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B752B832E6
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 17:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XuU4TFlLQkK for <iommu@lists.linux-foundation.org>;
 Tue,  3 May 2022 17:18:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A03B4832D1
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 17:18:57 +0000 (UTC)
X-UUID: ce9a7978bb5e4c5490f9d6ec351fac8e-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:6ad70994-0b93-4c29-b97c-0c2157893154, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:ff1c912f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ce9a7978bb5e4c5490f9d6ec351fac8e-20220504
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 16904984; Wed, 04 May 2022 01:18:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 01:18:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 01:18:48 +0800
To: <yf.wang@mediatek.com>
Subject: Re: [PATCH 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to support TTBR
 up to 35bit for MediaTek
Date: Wed, 4 May 2022 01:18:48 +0800
Message-ID: <20220503171848.24992-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220429143411.7640-2-yf.wang@mediatek.com>
References: <20220429143411.7640-2-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: isaacm@codeaurora.org, wsd_upstream@mediatek.com, will@kernel.org,
 linux-kernel@vger.kernel.org, Libo.Kang@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 ning.li@mediatek.com, matthias.bgg@gmail.com, stable@vger.kernel.org,
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
From: Miles Chen via iommu <iommu@lists.linux-foundation.org>
Reply-To: Miles Chen <miles.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi YF,

> The calling to kmem_cache_alloc for level 2 page table allocation may
> run in atomic context, and it fails sometimes when DMA32 zone runs out
> of memory.
> 
> Since Mediatek IOMMU hardware support at most 35bit PA in page table,

s/Mediatek/MediaTek/
s/support/supports/

> so add a quirk to allow the PA of level 2 pgtable support bit35.

35bits PA, right?

>
> 

...snip...

>  
>  	phys = virt_to_phys(table);
> -	if (phys != (arm_v7s_iopte)phys) {
> +	if (phys != (arm_v7s_iopte)phys &&
> +	    !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)) {

I have one question while reading this.

If IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT is set, it means that the phys can be up to 35 bits.
In aarch64, kmalloc() could return up to 52 bits PA (e.g., ARM64_PA_BITS_52=y)

How do we guarantee that phys is safe (<= 35 bits) in this case?
For example:
When IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT is set, the platform guarantees its PAs are at most
35 bits?


Thanks,
Miles
>  		/* Doesn't fit in PTE */
>  		dev_err(dev, "Page table does not fit in PTE: %pa", &phys);
>  		goto out_free;
> @@ -457,9 +464,14 @@ static arm_v7s_iopte arm_v7s_install_table(arm_v7s_iopte *table,
>  					   arm_v7s_iopte curr,
>  					   struct io_pgtable_cfg *cfg)
>  {
> +	phys_addr_t phys = virt_to_phys(table);
>  	arm_v7s_iopte old, new;
>  
> -	new = virt_to_phys(table) | ARM_V7S_PTE_TYPE_TABLE;
> +	new = phys | ARM_V7S_PTE_TYPE_TABLE;
> +
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
> +		new = to_iopte_mtk(phys, new, cfg);
> +
>  	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
>  		new |= ARM_V7S_ATTR_NS_TABLE;
>  
> @@ -778,6 +790,7 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
>  static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>  						void *cookie)
>  {
> +	slab_flags_t slab_flag = ARM_V7S_TABLE_SLAB_FLAGS;
>  	struct arm_v7s_io_pgtable *data;
>  
>  	if (cfg->ias > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
> @@ -788,7 +801,8 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>  
>  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>  			    IO_PGTABLE_QUIRK_NO_PERMS |
> -			    IO_PGTABLE_QUIRK_ARM_MTK_EXT))
> +			    IO_PGTABLE_QUIRK_ARM_MTK_EXT |
> +			    IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT))
>  		return NULL;
>  
>  	/* If ARM_MTK_4GB is enabled, the NO_PERMS is also expected. */
> @@ -801,10 +815,12 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>  		return NULL;
>  
>  	spin_lock_init(&data->split_lock);
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
> +		slab_flag = 0;
>  	data->l2_tables = kmem_cache_create("io-pgtable_armv7s_l2",
>  					    ARM_V7S_TABLE_SIZE(2, cfg),
>  					    ARM_V7S_TABLE_SIZE(2, cfg),
> -					    ARM_V7S_TABLE_SLAB_FLAGS, NULL);
> +					    slab_flag, NULL);
>  	if (!data->l2_tables)
>  		goto out_free_data;
>  
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 86af6f0a00a2..7ed15ad4710c 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -74,17 +74,22 @@ struct io_pgtable_cfg {
>  	 *	to support up to 35 bits PA where the bit32, bit33 and bit34 are
>  	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
>  	 *
> +	 * IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT: (ARM v7s format) MediaTek IOMMUs
> +	 *	extend the translation table support up to 35 bits PA, the
> +	 *	encoding format is same with IO_PGTABLE_QUIRK_ARM_MTK_EXT.
> +	 *
>  	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
>  	 *	for use in the upper half of a split address space.
>  	 *
>  	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the outer-cacheability
>  	 *	attributes set in the TCR for a non-coherent page-table walker.
>  	 */
> -	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
> -	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
> -	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
> -	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
> -	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA	BIT(6)
> +	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
> +	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
> +	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT		BIT(3)
> +	#define IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT	BIT(4)
> +	#define IO_PGTABLE_QUIRK_ARM_TTBR1		BIT(5)
> +	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
>  	unsigned long			quirks;
>  	unsigned long			pgsize_bitmap;
>  	unsigned int			ias;
> -- 
> 2.18.0
> 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
