Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C86B33C7D6
	for <lists.iommu@lfdr.de>; Mon, 15 Mar 2021 21:38:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0C066F575;
	Mon, 15 Mar 2021 20:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xq1jU68FE0gR; Mon, 15 Mar 2021 20:38:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E8F86F56B;
	Mon, 15 Mar 2021 20:38:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F08BC0010;
	Mon, 15 Mar 2021 20:38:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F8F4C0001
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 20:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 692F341476
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 20:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qclMDMXYJrFJ for <iommu@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 20:38:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B9E540002
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 20:38:49 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id l2so21175938pgb.1
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 13:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JI5gjZqD2xEbJnqMP+YxSmCk5ElN95HtSiD6k6zxrCs=;
 b=fFTYrpvM5ORm3shjjJorGw/YfeEq+dLrmMr7fCTrbm5TV6KZpL3IxXzb+tzn9zr0FQ
 UhNzWFyQ1NdiseZFF9spqEf8ShasJJgNkYk1urY5W7LhBeEH4yXPsZUkBd4cuwpcQSgG
 NXmAEtBtAFwNfInkQIf4/lQRwjTmaKOu6ggP3AGQqpYiTSYd2tSg6Y6YhY4LXJGrUMCo
 vv+SBUEWLKy68bfI9W6qwY/RtkT22Xt+Q3YXWV9PAfeOy5dLadaD9sJ0/qujwLdrCngW
 ayKwHPvndIR8CCvCaNrGtdS1sUxglxDoNl1Zj8u0wdwidocQxBqaIb5zfNuwKw2Z/PU+
 F2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JI5gjZqD2xEbJnqMP+YxSmCk5ElN95HtSiD6k6zxrCs=;
 b=YLdTRcOZPXZQH4naBhS//B2xqXHQ+Te6EnfSkjja5888vvkmuXdfnoEed9Wd7T1oa9
 ev+G1Uc3BdGQUbsNi4r0S6CgUbsIWO/qbFQIKCZX+1Ja4kc7S/cPRoWK6BDV59WA2hZm
 tUFgwcDZjZFqrrfdJ47pyP8opKlV5X/HeXnnSAr0Sy0PJLSmucR+Dke9Srv/HLqH6Mi+
 d8H9Mks8OuEXz9lQQJHCBNenUUb1rmVW+Q1JzBXfsVQTV05OOEQof7N8DqaPSnMAMs2/
 9RHxy+kvBxUBeJt8SCle4nh2cdaP+So1fb445bicDDkoVICidMpGrF2cPiPQJJkt/OBB
 9taA==
X-Gm-Message-State: AOAM531aAvTWexmQuoIC2qXq3Rtfajf6W0pVwgnjA5h3rOR8M7ny6+IE
 BPogWJBtCaNa0YnBiR+CGcE=
X-Google-Smtp-Source: ABdhPJyH9KRRilmgJCb752bMDst7wp3eGhZJGUFdzlaK6g+zBevlaFvofwnwBDdT2j/AluZPlqyQxQ==
X-Received: by 2002:a63:fc12:: with SMTP id j18mr779988pgi.334.1615840728663; 
 Mon, 15 Mar 2021 13:38:48 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id x19sm14183014pfi.220.2021.03.15.13.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 13:38:48 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
 digetx@gmail.com
Subject: [PATCH v5] iommu/tegra-smmu: Add pagetable mappings to debugfs
Date: Mon, 15 Mar 2021 13:36:31 -0700
Message-Id: <20210315203631.24990-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jonathanh@nvidia.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This patch dumps all active mapping entries from pagetable
to a debugfs directory named "mappings".

Attaching an example:

SWGROUP: hc
ASID: 0
reg: 0x250
PTB_ASID: 0xe0080004
as->pd_dma: 0x80004000
{
        [1023] 0xf008000b (1)
        {
                PTE RANGE      | ATTR | PHYS               | IOVA               | SIZE
                [#1023, #1023] | 0x5  | 0x0000000111a8d000 | 0x00000000fffff000 | 0x1000
        }
}
Total PDE count: 1
Total PTE count: 1

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v5:
 * Fixed a typo in commit message
 * Splitted a long line into two lines
 * Rearranged variable defines by length
 * Added Tested-by and Reviewed-by from Dmitry
v4: https://lkml.org/lkml/2021/3/14/429
 * Changed %d to %u for unsigned variables
 * Fixed print format mismatch warnings on ARM32
v3: https://lkml.org/lkml/2021/3/14/30
 * Fixed PHYS and IOVA print formats
 * Changed variables to unsigned int type
 * Changed the table outputs to be compact
v2: https://lkml.org/lkml/2021/3/9/1382
 * Expanded mutex range to the entire function
 * Added as->lock to protect pagetable walkthrough
 * Replaced devm_kzalloc with devm_kcalloc for group_debug
 * Added "PTE RANGE" and "SIZE" columns to group contiguous mappings
 * Dropped as->count check; added WARN_ON when as->count mismatches pd[pd_index]
v1: https://lkml.org/lkml/2020/9/26/70

 drivers/iommu/tegra-smmu.c | 181 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 176 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 97eb62f667d2..b728cae63314 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -19,6 +19,11 @@
 #include <soc/tegra/ahb.h>
 #include <soc/tegra/mc.h>
 
+struct tegra_smmu_group_debug {
+	const struct tegra_smmu_swgroup *group;
+	void *priv;
+};
+
 struct tegra_smmu_group {
 	struct list_head list;
 	struct tegra_smmu *smmu;
@@ -47,6 +52,8 @@ struct tegra_smmu {
 	struct dentry *debugfs;
 
 	struct iommu_device iommu;	/* IOMMU Core code handle */
+
+	struct tegra_smmu_group_debug *group_debug;
 };
 
 struct tegra_smmu_as {
@@ -152,6 +159,9 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, unsigned long offset)
 
 #define SMMU_PDE_ATTR		(SMMU_PDE_READABLE | SMMU_PDE_WRITABLE | \
 				 SMMU_PDE_NONSECURE)
+#define SMMU_PTE_ATTR		(SMMU_PTE_READABLE | SMMU_PTE_WRITABLE | \
+				 SMMU_PTE_NONSECURE)
+#define SMMU_PTE_ATTR_SHIFT	(29)
 
 static unsigned int iova_pd_index(unsigned long iova)
 {
@@ -163,6 +173,12 @@ static unsigned int iova_pt_index(unsigned long iova)
 	return (iova >> SMMU_PTE_SHIFT) & (SMMU_NUM_PTE - 1);
 }
 
+static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
+{
+	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
+	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
+}
+
 static bool smmu_dma_addr_valid(struct tegra_smmu *smmu, dma_addr_t addr)
 {
 	addr >>= 12;
@@ -334,7 +350,7 @@ static void tegra_smmu_domain_free(struct iommu_domain *domain)
 }
 
 static const struct tegra_smmu_swgroup *
-tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
+tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup, int *index)
 {
 	const struct tegra_smmu_swgroup *group = NULL;
 	unsigned int i;
@@ -342,6 +358,8 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
 	for (i = 0; i < smmu->soc->num_swgroups; i++) {
 		if (smmu->soc->swgroups[i].swgroup == swgroup) {
 			group = &smmu->soc->swgroups[i];
+			if (index)
+				*index = i;
 			break;
 		}
 	}
@@ -350,19 +368,22 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
 }
 
 static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
-			      unsigned int asid)
+			      struct tegra_smmu_as *as)
 {
 	const struct tegra_smmu_swgroup *group;
+	unsigned int asid = as->id;
 	unsigned int i;
 	u32 value;
 
-	group = tegra_smmu_find_swgroup(smmu, swgroup);
+	group = tegra_smmu_find_swgroup(smmu, swgroup, &i);
 	if (group) {
 		value = smmu_readl(smmu, group->reg);
 		value &= ~SMMU_ASID_MASK;
 		value |= SMMU_ASID_VALUE(asid);
 		value |= SMMU_ASID_ENABLE;
 		smmu_writel(smmu, value, group->reg);
+		if (smmu->group_debug)
+			smmu->group_debug[i].priv = as;
 	} else {
 		pr_warn("%s group from swgroup %u not found\n", __func__,
 				swgroup);
@@ -389,13 +410,15 @@ static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
 	unsigned int i;
 	u32 value;
 
-	group = tegra_smmu_find_swgroup(smmu, swgroup);
+	group = tegra_smmu_find_swgroup(smmu, swgroup, &i);
 	if (group) {
 		value = smmu_readl(smmu, group->reg);
 		value &= ~SMMU_ASID_MASK;
 		value |= SMMU_ASID_VALUE(asid);
 		value &= ~SMMU_ASID_ENABLE;
 		smmu_writel(smmu, value, group->reg);
+		if (smmu->group_debug)
+			smmu->group_debug[i].priv = NULL;
 	}
 
 	for (i = 0; i < smmu->soc->num_clients; i++) {
@@ -499,7 +522,7 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 		if (err)
 			goto disable;
 
-		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
+		tegra_smmu_enable(smmu, fwspec->ids[index], as);
 	}
 
 	if (index == 0)
@@ -1058,8 +1081,141 @@ static int tegra_smmu_clients_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
 
+static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
+{
+	struct tegra_smmu_group_debug *group_debug = s->private;
+	const struct tegra_smmu_swgroup *group;
+	struct tegra_smmu_as *as;
+	struct tegra_smmu *smmu;
+	unsigned int pd_index;
+	unsigned int pt_index;
+	unsigned long flags;
+	u64 pte_count = 0;
+	u32 pde_count = 0;
+	u32 val, ptb_reg;
+	u32 *pd;
+
+	if (!group_debug || !group_debug->priv || !group_debug->group)
+		return 0;
+
+	group = group_debug->group;
+	as = group_debug->priv;
+	smmu = as->smmu;
+
+	mutex_lock(&smmu->lock);
+
+	val = smmu_readl(smmu, group->reg) & SMMU_ASID_ENABLE;
+	if (!val)
+		goto unlock;
+
+	pd = page_address(as->pd);
+	if (!pd)
+		goto unlock;
+
+	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n",
+		   group->name, as->id, group->reg);
+
+	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
+	ptb_reg = smmu_readl(smmu, SMMU_PTB_DATA);
+
+	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: %pad\n",
+		   ptb_reg, &as->pd_dma);
+	seq_puts(s, "{\n");
+
+	spin_lock_irqsave(&as->lock, flags);
+
+	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
+		struct page *pt_page;
+		unsigned int i;
+		u32 *addr;
+
+		/* An empty PDE should not have a pte use count */
+		WARN_ON_ONCE(!pd[pd_index] ^ !as->count[pd_index]);
+
+		/* Skip this empty PDE */
+		if (!pd[pd_index])
+			continue;
+
+		pde_count++;
+		pte_count += as->count[pd_index];
+		seq_printf(s, "\t[%u] 0x%x (%d)\n",
+			   pd_index, pd[pd_index], as->count[pd_index]);
+		pt_page = as->pts[pd_index];
+		addr = page_address(pt_page);
+
+		seq_puts(s, "\t{\n");
+		seq_printf(s, "\t\t%-14s | %-4s | %-10s%s | %-10s%s | %-11s\n",
+			   "PTE RANGE", "ATTR",
+			   "PHYS", sizeof(phys_addr_t) > 4 ? "        " : "",
+			   "IOVA", sizeof(dma_addr_t)  > 4 ? "        " : "",
+			   "SIZE");
+		for (pt_index = 0; pt_index < SMMU_NUM_PTE; pt_index += i) {
+			size_t size = SMMU_SIZE_PT;
+			dma_addr_t iova;
+			phys_addr_t pa;
+
+			i = 1;
+
+			if (!addr[pt_index])
+				continue;
+
+			iova = pd_pt_index_iova(pd_index, pt_index);
+			pa = SMMU_PFN_PHYS(addr[pt_index] & ~SMMU_PTE_ATTR);
+
+			/* Check contiguous mappings and increase size */
+			while (pt_index + i < SMMU_NUM_PTE) {
+				dma_addr_t next_iova;
+				phys_addr_t next_pa;
+
+				if (!addr[pt_index + i])
+					break;
+
+				next_iova = pd_pt_index_iova(pd_index, pt_index + i);
+				next_pa = SMMU_PFN_PHYS(addr[pt_index + i] & ~SMMU_PTE_ATTR);
+
+				/* Break at the end of a linear mapping */
+				if ((next_iova - iova != SMMU_SIZE_PT * i) ||
+				    (next_pa - pa != SMMU_SIZE_PT * i))
+					break;
+
+				i++;
+			}
+
+			seq_printf(s, "\t\t[#%-4u, #%-4u] | 0x%-2x | %pa | %pad | 0x%-9zx\n",
+				   pt_index, pt_index + i - 1,
+				   addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
+				   &pa, &iova, size * i);
+		}
+		seq_puts(s, "\t}\n");
+	}
+
+	spin_unlock_irqrestore(&as->lock, flags);
+
+	seq_puts(s, "}\n");
+	seq_printf(s, "Total PDE count: %u\n", pde_count);
+	seq_printf(s, "Total PTE count: %llu\n", pte_count);
+
+unlock:
+	mutex_unlock(&smmu->lock);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(tegra_smmu_mappings);
+
 static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
 {
+	const struct tegra_smmu_soc *soc = smmu->soc;
+	struct tegra_smmu_group_debug *group_debug;
+	struct device *dev = smmu->dev;
+	struct dentry *d;
+	unsigned int i;
+
+	group_debug = devm_kcalloc(dev, soc->num_swgroups,
+				   sizeof(*group_debug), GFP_KERNEL);
+	if (!group_debug)
+		return;
+
 	smmu->debugfs = debugfs_create_dir("smmu", NULL);
 	if (!smmu->debugfs)
 		return;
@@ -1068,6 +1224,21 @@ static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
 			    &tegra_smmu_swgroups_fops);
 	debugfs_create_file("clients", S_IRUGO, smmu->debugfs, smmu,
 			    &tegra_smmu_clients_fops);
+	d = debugfs_create_dir("mappings", smmu->debugfs);
+
+	for (i = 0; i < soc->num_swgroups; i++) {
+		const struct tegra_smmu_swgroup *group = &soc->swgroups[i];
+
+		if (!group->name)
+			continue;
+
+		group_debug[i].group = group;
+
+		debugfs_create_file(group->name, 0444, d, &group_debug[i],
+				    &tegra_smmu_mappings_fops);
+	}
+
+	smmu->group_debug = group_debug;
 }
 
 static void tegra_smmu_debugfs_exit(struct tegra_smmu *smmu)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
