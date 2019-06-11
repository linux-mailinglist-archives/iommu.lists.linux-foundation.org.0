Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A63C8D2
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 12:25:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2015DE4D;
	Tue, 11 Jun 2019 10:25:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 60F3EE44
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 10:25:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6201D76D
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 10:25:02 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 9F707D3A5FA93713C97B;
	Tue, 11 Jun 2019 18:24:59 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Tue, 11 Jun 2019
	18:24:55 +0800
Date: Tue, 11 Jun 2019 11:24:44 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 5/8] iommu/arm-smmu-v3: Add second level of context
	descriptor table
Message-ID: <20190611112444.00002f4a@huawei.com>
In-Reply-To: <20190610184714.6786-6-jean-philippe.brucker@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-6-jean-philippe.brucker@arm.com>
Organization: Huawei
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, will.deacon@arm.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, 10 Jun 2019 19:47:11 +0100
Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:

> The SMMU can support up to 20 bits of SSID. Add a second level of page
> tables to accommodate this. Devices that support more than 1024 SSIDs now
> have a table of 1024 L1 entries (8kB), pointing to tables of 1024 context
> descriptors (64kB), allocated on demand.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
One trivial typo.

Thanks,

Jonathan
> ---
>  drivers/iommu/arm-smmu-v3.c | 136 +++++++++++++++++++++++++++++++++---
>  1 file changed, 128 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index d90eb604b65d..326b71793336 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -216,6 +216,8 @@
>  
>  #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
>  #define STRTAB_STE_0_S1FMT_LINEAR	0
> +#define STRTAB_STE_0_S1FMT_4K_L2	1
> +#define STRTAB_STE_0_S1FMT_64K_L2	2
>  #define STRTAB_STE_0_S1CTXPTR_MASK	GENMASK_ULL(51, 6)
>  #define STRTAB_STE_0_S1CDMAX		GENMASK_ULL(63, 59)
>  
> @@ -255,6 +257,18 @@
>  
>  #define STRTAB_STE_3_S2TTB_MASK		GENMASK_ULL(51, 4)
>  
> +/*
> + * Linear: when less than 1024 SSIDs are supported
> + * 2lvl: at most 1024 L1 entrie,

entries?

> + *      1024 lazy entries per table.
> + */
> +#define CTXDESC_SPLIT			10
> +#define CTXDESC_NUM_L2_ENTRIES		(1 << CTXDESC_SPLIT)
> +
> +#define CTXDESC_L1_DESC_DWORD		1
> +#define CTXDESC_L1_DESC_VALID		1
> +#define CTXDESC_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 12)
> +
>  /* Context descriptor (stage-1 only) */
>  #define CTXDESC_CD_DWORDS		8
>  #define CTXDESC_CD_0_TCR_T0SZ		GENMASK_ULL(5, 0)
> @@ -530,7 +544,10 @@ struct arm_smmu_ctx_desc {
>  struct arm_smmu_s1_cfg {
>  	u8				s1fmt;
>  	u8				s1cdmax;
> -	struct arm_smmu_cd_table	table;
> +	struct arm_smmu_cd_table	*tables;
> +	size_t				num_tables;
> +	__le64				*l1ptr;
> +	dma_addr_t			l1ptr_dma;
>  
>  	/* Context descriptor 0, when substreams are disabled or s1dss = 0b10 */
>  	struct arm_smmu_ctx_desc	cd;
> @@ -1118,12 +1135,51 @@ static void arm_smmu_free_cd_leaf_table(struct arm_smmu_device *smmu,
>  {
>  	size_t size = num_entries * (CTXDESC_CD_DWORDS << 3);
>  
> +	if (!table->ptr)
> +		return;
>  	dmam_free_coherent(smmu->dev, size, table->ptr, table->ptr_dma);
>  }
>  
> -static __le64 *arm_smmu_get_cd_ptr(struct arm_smmu_s1_cfg *cfg, u32 ssid)
> +static void arm_smmu_write_cd_l1_desc(__le64 *dst,
> +				      struct arm_smmu_cd_table *table)
>  {
> -	return cfg->table.ptr + ssid * CTXDESC_CD_DWORDS;
> +	u64 val = (table->ptr_dma & CTXDESC_L1_DESC_L2PTR_MASK) |
> +		  CTXDESC_L1_DESC_VALID;
> +
> +	*dst = cpu_to_le64(val);
> +}
> +
> +static __le64 *arm_smmu_get_cd_ptr(struct arm_smmu_domain *smmu_domain,
> +				   u32 ssid)
> +{
> +	unsigned int idx;
> +	struct arm_smmu_cd_table *table;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
> +
> +	if (cfg->s1fmt == STRTAB_STE_0_S1FMT_LINEAR) {
> +		table = &cfg->tables[0];
> +		idx = ssid;
> +	} else {
> +		idx = ssid >> CTXDESC_SPLIT;
> +		if (idx >= cfg->num_tables)
> +			return NULL;
> +
> +		table = &cfg->tables[idx];
> +		if (!table->ptr) {
> +			__le64 *l1ptr = cfg->l1ptr + idx * CTXDESC_L1_DESC_DWORD;
> +
> +			if (arm_smmu_alloc_cd_leaf_table(smmu, table,
> +							 CTXDESC_NUM_L2_ENTRIES))
> +				return NULL;
> +
> +			arm_smmu_write_cd_l1_desc(l1ptr, table);
> +			/* An invalid L1 entry is allowed to be cached */
> +			arm_smmu_sync_cd(smmu_domain, ssid, false);
> +		}
> +		idx = ssid & (CTXDESC_NUM_L2_ENTRIES - 1);
> +	}
> +	return table->ptr + idx * CTXDESC_CD_DWORDS;
>  }
>  
>  static u64 arm_smmu_cpu_tcr_to_cd(u64 tcr)
> @@ -1149,7 +1205,7 @@ static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
>  	u64 val;
>  	bool cd_live;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	__le64 *cdptr = arm_smmu_get_cd_ptr(&smmu_domain->s1_cfg, ssid);
> +	__le64 *cdptr = arm_smmu_get_cd_ptr(smmu_domain, ssid);
>  
>  	/*
>  	 * This function handles the following cases:
> @@ -1213,20 +1269,81 @@ static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
>  static int arm_smmu_alloc_cd_tables(struct arm_smmu_domain *smmu_domain,
>  				    struct arm_smmu_master *master)
>  {
> +	int ret;
> +	size_t size = 0;
> +	size_t max_contexts, num_leaf_entries;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
>  
>  	cfg->s1fmt = STRTAB_STE_0_S1FMT_LINEAR;
>  	cfg->s1cdmax = master->ssid_bits;
> -	return arm_smmu_alloc_cd_leaf_table(smmu, &cfg->table, 1 << cfg->s1cdmax);
> +
> +	max_contexts = 1 << cfg->s1cdmax;
> +	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB) ||
> +	    max_contexts <= CTXDESC_NUM_L2_ENTRIES) {
> +		cfg->s1fmt = STRTAB_STE_0_S1FMT_LINEAR;
> +		cfg->num_tables = 1;
> +		num_leaf_entries = max_contexts;
> +	} else {
> +		cfg->s1fmt = STRTAB_STE_0_S1FMT_64K_L2;
> +		/*
> +		 * SSID[S1CDmax-1:10] indexes 1st-level table, SSID[9:0] indexes
> +		 * 2nd-level
> +		 */
> +		cfg->num_tables = max_contexts / CTXDESC_NUM_L2_ENTRIES;
> +
> +		size = cfg->num_tables * (CTXDESC_L1_DESC_DWORD << 3);
> +		cfg->l1ptr = dmam_alloc_coherent(smmu->dev, size,
> +						 &cfg->l1ptr_dma,
> +						 GFP_KERNEL | __GFP_ZERO);
> +		if (!cfg->l1ptr) {
> +			dev_warn(smmu->dev, "failed to allocate L1 context table\n");
> +			return -ENOMEM;
> +		}
> +
> +		num_leaf_entries = CTXDESC_NUM_L2_ENTRIES;
> +	}
> +
> +	cfg->tables = devm_kzalloc(smmu->dev, sizeof(struct arm_smmu_cd_table) *
> +				   cfg->num_tables, GFP_KERNEL);
> +	if (!cfg->tables)
> +		return -ENOMEM;
> +
> +	ret = arm_smmu_alloc_cd_leaf_table(smmu, &cfg->tables[0], num_leaf_entries);
> +	if (ret)
> +		goto err_free_l1;
> +
> +	if (cfg->l1ptr)
> +		arm_smmu_write_cd_l1_desc(cfg->l1ptr, &cfg->tables[0]);
> +
> +	return 0;
> +
> +err_free_l1:
> +	if (cfg->l1ptr)
> +		dmam_free_coherent(smmu->dev, size, cfg->l1ptr, cfg->l1ptr_dma);
> +	devm_kfree(smmu->dev, cfg->tables);
> +	return ret;
>  }
>  
>  static void arm_smmu_free_cd_tables(struct arm_smmu_domain *smmu_domain)
>  {
> +	int i;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
> +	size_t num_leaf_entries = 1 << cfg->s1cdmax;
> +	struct arm_smmu_cd_table *table = cfg->tables;
> +
> +	if (cfg->l1ptr) {
> +		size_t size = cfg->num_tables * (CTXDESC_L1_DESC_DWORD << 3);
>  
> -	arm_smmu_free_cd_leaf_table(smmu, &cfg->table, 1 << cfg->s1cdmax);
> +		dmam_free_coherent(smmu->dev, size, cfg->l1ptr,
> +				   cfg->l1ptr_dma);
> +		num_leaf_entries = CTXDESC_NUM_L2_ENTRIES;
> +	}
> +
> +	for (i = 0; i < cfg->num_tables; i++, table++)
> +		arm_smmu_free_cd_leaf_table(smmu, table, num_leaf_entries);
> +	devm_kfree(smmu->dev, cfg->tables);
>  }
>  
>  /* Stream table manipulation functions */
> @@ -1346,6 +1463,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  	}
>  
>  	if (s1_cfg) {
> +		dma_addr_t ptr_dma = s1_cfg->l1ptr ? s1_cfg->l1ptr_dma :
> +			             s1_cfg->tables[0].ptr_dma;
> +
>  		BUG_ON(ste_live);
>  		dst[1] = cpu_to_le64(
>  			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
> @@ -1358,7 +1478,7 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
>  			dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
>  
> -		val |= (s1_cfg->table.ptr_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
> +		val |= (ptr_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
>  			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
>  			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
>  			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
> @@ -1815,7 +1935,7 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
>  	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
>  		struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
>  
> -		if (cfg->table.ptr) {
> +		if (cfg->tables) {
>  			arm_smmu_free_cd_tables(smmu_domain);
>  			arm_smmu_bitmap_free(smmu->asid_map, cfg->cd.asid);
>  		}


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
