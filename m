Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2A22B229
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 17:06:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43AAB88484;
	Thu, 23 Jul 2020 15:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2XPWZugjX8G; Thu, 23 Jul 2020 15:06:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7EC4C88496;
	Thu, 23 Jul 2020 15:06:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AF30C004C;
	Thu, 23 Jul 2020 15:06:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF895C089F
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9F644204F3
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7oJFQvWEZ1or for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 15:05:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F3FC203B8
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:57 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a1so4732020edt.10
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WIf5gPtG6PCGrbyPd+nLy+qiINwOX0mX6fkVLor5Fqc=;
 b=bJhitXqnhrXgo8lLgKS6YdzidPHXQSUYXc+UuTsEgmSEigcxNP3/RNNvuqQuuj33d2
 S3pUDrUh5CZecRG2lsULF68LWslA0MtMLfaQPn/7bwN4Ek/HuYyvSGQ0RSlxAtKQHJON
 HIB2iaVtUfga0QNGVgwq7TnqGZjQiCXGdrSgxb16p/ViDWvLvLosVU3riZkgKI/KZ4k0
 guROlh1kvICUpIAqwIaU+tzCDlSgwZec3/9/CK/abCXsgmjuJA0Aff8pBHcs+TPrFe/F
 1bY63iT/qLGmjWXLuFEwFiCdfnGzKHtxkuAfefWiPAbB4M784v68MX/UryI6YkRRyl7w
 3bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WIf5gPtG6PCGrbyPd+nLy+qiINwOX0mX6fkVLor5Fqc=;
 b=b+CkKiU75G8laTHpGWic3yHGKyKCMoDEGnzjGPjClqA7mHc11ajM4YTDdJrI2l3T5r
 FQ8JFXurfCGJRVibQEKY4YVqek5B62oEpXsu6xhzhw6Zp71oiB/3OgRJBOGmpv8pHjgy
 1Y73W5T6lKZ/nTvFz7l5+IHSWWkq3BANeIRwvrXCJ0J8Acb60Jf79ed8WKNMNmlLIHUt
 v89YT5+SS7pjhjV3OEyg+Uq8c66oJeF1aqPyTAzzF5SBxZSEkvLTXSC0N8zp6dUrxsT2
 B79aXtEZNWvkHzijxBcPlt1R3Yyp/3Ox9Ju8f4egIEcrry9M3p8+VvKoV5mT2Vxy0cWE
 wEEw==
X-Gm-Message-State: AOAM530BewE+McXZfGdCaL7QRyEMTdCtluRu2fNJMzzFawnsuMN0QNgZ
 58luIaKRfGnjH+gnRXwwkH4C7uPooJQ=
X-Google-Smtp-Source: ABdhPJzeBvXvO3zoDWKc6XUZ/psDTOn7xiNZRLaq7BrSX0f7If1Byi4Ur+4K4NMcjc15VFs5NxjBNw==
X-Received: by 2002:a05:6402:16c2:: with SMTP id
 r2mr4512989edx.127.1595516754393; 
 Thu, 23 Jul 2020 08:05:54 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k15sm2145952eji.49.2020.07.23.08.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:05:53 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH v9 07/13] iommu/arm-smmu-v3: Move definitions to a header
Date: Thu, 23 Jul 2020 16:57:19 +0200
Message-Id: <20200723145724.3014766-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723145724.3014766-1-jean-philippe@linaro.org>
References: <20200723145724.3014766-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhengxiang9@huawei.com, zhangfei.gao@linaro.org, will@kernel.org
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

Allow sharing structure definitions with the upcoming SVA support for
Arm SMMUv3, by moving them to a separate header. We could surgically
extract only what is needed but keeping all definitions in one place
looks nicer.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v9: new
---
 drivers/iommu/arm-smmu-v3.h | 675 ++++++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu-v3.c | 660 +----------------------------------
 2 files changed, 676 insertions(+), 659 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-v3.h

diff --git a/drivers/iommu/arm-smmu-v3.h b/drivers/iommu/arm-smmu-v3.h
new file mode 100644
index 000000000000..51a9ce07b2d6
--- /dev/null
+++ b/drivers/iommu/arm-smmu-v3.h
@@ -0,0 +1,675 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * IOMMU API for ARM architected SMMUv3 implementations.
+ *
+ * Copyright (C) 2015 ARM Limited
+ */
+
+#ifndef _ARM_SMMU_V3_H
+#define _ARM_SMMU_V3_H
+
+#include <linux/bitfield.h>
+#include <linux/iommu.h>
+#include <linux/kernel.h>
+#include <linux/mmzone.h>
+#include <linux/sizes.h>
+
+/* MMIO registers */
+#define ARM_SMMU_IDR0			0x0
+#define IDR0_ST_LVL			GENMASK(28, 27)
+#define IDR0_ST_LVL_2LVL		1
+#define IDR0_STALL_MODEL		GENMASK(25, 24)
+#define IDR0_STALL_MODEL_STALL		0
+#define IDR0_STALL_MODEL_FORCE		2
+#define IDR0_TTENDIAN			GENMASK(22, 21)
+#define IDR0_TTENDIAN_MIXED		0
+#define IDR0_TTENDIAN_LE		2
+#define IDR0_TTENDIAN_BE		3
+#define IDR0_CD2L			(1 << 19)
+#define IDR0_VMID16			(1 << 18)
+#define IDR0_PRI			(1 << 16)
+#define IDR0_SEV			(1 << 14)
+#define IDR0_MSI			(1 << 13)
+#define IDR0_ASID16			(1 << 12)
+#define IDR0_ATS			(1 << 10)
+#define IDR0_HYP			(1 << 9)
+#define IDR0_COHACC			(1 << 4)
+#define IDR0_TTF			GENMASK(3, 2)
+#define IDR0_TTF_AARCH64		2
+#define IDR0_TTF_AARCH32_64		3
+#define IDR0_S1P			(1 << 1)
+#define IDR0_S2P			(1 << 0)
+
+#define ARM_SMMU_IDR1			0x4
+#define IDR1_TABLES_PRESET		(1 << 30)
+#define IDR1_QUEUES_PRESET		(1 << 29)
+#define IDR1_REL			(1 << 28)
+#define IDR1_CMDQS			GENMASK(25, 21)
+#define IDR1_EVTQS			GENMASK(20, 16)
+#define IDR1_PRIQS			GENMASK(15, 11)
+#define IDR1_SSIDSIZE			GENMASK(10, 6)
+#define IDR1_SIDSIZE			GENMASK(5, 0)
+
+#define ARM_SMMU_IDR3			0xc
+#define IDR3_RIL			(1 << 10)
+
+#define ARM_SMMU_IDR5			0x14
+#define IDR5_STALL_MAX			GENMASK(31, 16)
+#define IDR5_GRAN64K			(1 << 6)
+#define IDR5_GRAN16K			(1 << 5)
+#define IDR5_GRAN4K			(1 << 4)
+#define IDR5_OAS			GENMASK(2, 0)
+#define IDR5_OAS_32_BIT			0
+#define IDR5_OAS_36_BIT			1
+#define IDR5_OAS_40_BIT			2
+#define IDR5_OAS_42_BIT			3
+#define IDR5_OAS_44_BIT			4
+#define IDR5_OAS_48_BIT			5
+#define IDR5_OAS_52_BIT			6
+#define IDR5_VAX			GENMASK(11, 10)
+#define IDR5_VAX_52_BIT			1
+
+#define ARM_SMMU_CR0			0x20
+#define CR0_ATSCHK			(1 << 4)
+#define CR0_CMDQEN			(1 << 3)
+#define CR0_EVTQEN			(1 << 2)
+#define CR0_PRIQEN			(1 << 1)
+#define CR0_SMMUEN			(1 << 0)
+
+#define ARM_SMMU_CR0ACK			0x24
+
+#define ARM_SMMU_CR1			0x28
+#define CR1_TABLE_SH			GENMASK(11, 10)
+#define CR1_TABLE_OC			GENMASK(9, 8)
+#define CR1_TABLE_IC			GENMASK(7, 6)
+#define CR1_QUEUE_SH			GENMASK(5, 4)
+#define CR1_QUEUE_OC			GENMASK(3, 2)
+#define CR1_QUEUE_IC			GENMASK(1, 0)
+/* CR1 cacheability fields don't quite follow the usual TCR-style encoding */
+#define CR1_CACHE_NC			0
+#define CR1_CACHE_WB			1
+#define CR1_CACHE_WT			2
+
+#define ARM_SMMU_CR2			0x2c
+#define CR2_PTM				(1 << 2)
+#define CR2_RECINVSID			(1 << 1)
+#define CR2_E2H				(1 << 0)
+
+#define ARM_SMMU_GBPA			0x44
+#define GBPA_UPDATE			(1 << 31)
+#define GBPA_ABORT			(1 << 20)
+
+#define ARM_SMMU_IRQ_CTRL		0x50
+#define IRQ_CTRL_EVTQ_IRQEN		(1 << 2)
+#define IRQ_CTRL_PRIQ_IRQEN		(1 << 1)
+#define IRQ_CTRL_GERROR_IRQEN		(1 << 0)
+
+#define ARM_SMMU_IRQ_CTRLACK		0x54
+
+#define ARM_SMMU_GERROR			0x60
+#define GERROR_SFM_ERR			(1 << 8)
+#define GERROR_MSI_GERROR_ABT_ERR	(1 << 7)
+#define GERROR_MSI_PRIQ_ABT_ERR		(1 << 6)
+#define GERROR_MSI_EVTQ_ABT_ERR		(1 << 5)
+#define GERROR_MSI_CMDQ_ABT_ERR		(1 << 4)
+#define GERROR_PRIQ_ABT_ERR		(1 << 3)
+#define GERROR_EVTQ_ABT_ERR		(1 << 2)
+#define GERROR_CMDQ_ERR			(1 << 0)
+#define GERROR_ERR_MASK			0xfd
+
+#define ARM_SMMU_GERRORN		0x64
+
+#define ARM_SMMU_GERROR_IRQ_CFG0	0x68
+#define ARM_SMMU_GERROR_IRQ_CFG1	0x70
+#define ARM_SMMU_GERROR_IRQ_CFG2	0x74
+
+#define ARM_SMMU_STRTAB_BASE		0x80
+#define STRTAB_BASE_RA			(1UL << 62)
+#define STRTAB_BASE_ADDR_MASK		GENMASK_ULL(51, 6)
+
+#define ARM_SMMU_STRTAB_BASE_CFG	0x88
+#define STRTAB_BASE_CFG_FMT		GENMASK(17, 16)
+#define STRTAB_BASE_CFG_FMT_LINEAR	0
+#define STRTAB_BASE_CFG_FMT_2LVL	1
+#define STRTAB_BASE_CFG_SPLIT		GENMASK(10, 6)
+#define STRTAB_BASE_CFG_LOG2SIZE	GENMASK(5, 0)
+
+#define ARM_SMMU_CMDQ_BASE		0x90
+#define ARM_SMMU_CMDQ_PROD		0x98
+#define ARM_SMMU_CMDQ_CONS		0x9c
+
+#define ARM_SMMU_EVTQ_BASE		0xa0
+#define ARM_SMMU_EVTQ_PROD		0x100a8
+#define ARM_SMMU_EVTQ_CONS		0x100ac
+#define ARM_SMMU_EVTQ_IRQ_CFG0		0xb0
+#define ARM_SMMU_EVTQ_IRQ_CFG1		0xb8
+#define ARM_SMMU_EVTQ_IRQ_CFG2		0xbc
+
+#define ARM_SMMU_PRIQ_BASE		0xc0
+#define ARM_SMMU_PRIQ_PROD		0x100c8
+#define ARM_SMMU_PRIQ_CONS		0x100cc
+#define ARM_SMMU_PRIQ_IRQ_CFG0		0xd0
+#define ARM_SMMU_PRIQ_IRQ_CFG1		0xd8
+#define ARM_SMMU_PRIQ_IRQ_CFG2		0xdc
+
+#define ARM_SMMU_REG_SZ			0xe00
+
+/* Common MSI config fields */
+#define MSI_CFG0_ADDR_MASK		GENMASK_ULL(51, 2)
+#define MSI_CFG2_SH			GENMASK(5, 4)
+#define MSI_CFG2_MEMATTR		GENMASK(3, 0)
+
+/* Common memory attribute values */
+#define ARM_SMMU_SH_NSH			0
+#define ARM_SMMU_SH_OSH			2
+#define ARM_SMMU_SH_ISH			3
+#define ARM_SMMU_MEMATTR_DEVICE_nGnRE	0x1
+#define ARM_SMMU_MEMATTR_OIWB		0xf
+
+#define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
+#define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
+#define Q_OVERFLOW_FLAG			(1U << 31)
+#define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
+#define Q_ENT(q, p)			((q)->base +			\
+					 Q_IDX(&((q)->llq), p) *	\
+					 (q)->ent_dwords)
+
+#define Q_BASE_RWA			(1UL << 62)
+#define Q_BASE_ADDR_MASK		GENMASK_ULL(51, 5)
+#define Q_BASE_LOG2SIZE			GENMASK(4, 0)
+
+/* Ensure DMA allocations are naturally aligned */
+#ifdef CONFIG_CMA_ALIGNMENT
+#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
+#else
+#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + MAX_ORDER - 1)
+#endif
+
+/*
+ * Stream table.
+ *
+ * Linear: Enough to cover 1 << IDR1.SIDSIZE entries
+ * 2lvl: 128k L1 entries,
+ *       256 lazy entries per table (each table covers a PCI bus)
+ */
+#define STRTAB_L1_SZ_SHIFT		20
+#define STRTAB_SPLIT			8
+
+#define STRTAB_L1_DESC_DWORDS		1
+#define STRTAB_L1_DESC_SPAN		GENMASK_ULL(4, 0)
+#define STRTAB_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 6)
+
+#define STRTAB_STE_DWORDS		8
+#define STRTAB_STE_0_V			(1UL << 0)
+#define STRTAB_STE_0_CFG		GENMASK_ULL(3, 1)
+#define STRTAB_STE_0_CFG_ABORT		0
+#define STRTAB_STE_0_CFG_BYPASS		4
+#define STRTAB_STE_0_CFG_S1_TRANS	5
+#define STRTAB_STE_0_CFG_S2_TRANS	6
+
+#define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
+#define STRTAB_STE_0_S1FMT_LINEAR	0
+#define STRTAB_STE_0_S1FMT_64K_L2	2
+#define STRTAB_STE_0_S1CTXPTR_MASK	GENMASK_ULL(51, 6)
+#define STRTAB_STE_0_S1CDMAX		GENMASK_ULL(63, 59)
+
+#define STRTAB_STE_1_S1DSS		GENMASK_ULL(1, 0)
+#define STRTAB_STE_1_S1DSS_TERMINATE	0x0
+#define STRTAB_STE_1_S1DSS_BYPASS	0x1
+#define STRTAB_STE_1_S1DSS_SSID0	0x2
+
+#define STRTAB_STE_1_S1C_CACHE_NC	0UL
+#define STRTAB_STE_1_S1C_CACHE_WBRA	1UL
+#define STRTAB_STE_1_S1C_CACHE_WT	2UL
+#define STRTAB_STE_1_S1C_CACHE_WB	3UL
+#define STRTAB_STE_1_S1CIR		GENMASK_ULL(3, 2)
+#define STRTAB_STE_1_S1COR		GENMASK_ULL(5, 4)
+#define STRTAB_STE_1_S1CSH		GENMASK_ULL(7, 6)
+
+#define STRTAB_STE_1_S1STALLD		(1UL << 27)
+
+#define STRTAB_STE_1_EATS		GENMASK_ULL(29, 28)
+#define STRTAB_STE_1_EATS_ABT		0UL
+#define STRTAB_STE_1_EATS_TRANS		1UL
+#define STRTAB_STE_1_EATS_S1CHK		2UL
+
+#define STRTAB_STE_1_STRW		GENMASK_ULL(31, 30)
+#define STRTAB_STE_1_STRW_NSEL1		0UL
+#define STRTAB_STE_1_STRW_EL2		2UL
+
+#define STRTAB_STE_1_SHCFG		GENMASK_ULL(45, 44)
+#define STRTAB_STE_1_SHCFG_INCOMING	1UL
+
+#define STRTAB_STE_2_S2VMID		GENMASK_ULL(15, 0)
+#define STRTAB_STE_2_VTCR		GENMASK_ULL(50, 32)
+#define STRTAB_STE_2_VTCR_S2T0SZ	GENMASK_ULL(5, 0)
+#define STRTAB_STE_2_VTCR_S2SL0		GENMASK_ULL(7, 6)
+#define STRTAB_STE_2_VTCR_S2IR0		GENMASK_ULL(9, 8)
+#define STRTAB_STE_2_VTCR_S2OR0		GENMASK_ULL(11, 10)
+#define STRTAB_STE_2_VTCR_S2SH0		GENMASK_ULL(13, 12)
+#define STRTAB_STE_2_VTCR_S2TG		GENMASK_ULL(15, 14)
+#define STRTAB_STE_2_VTCR_S2PS		GENMASK_ULL(18, 16)
+#define STRTAB_STE_2_S2AA64		(1UL << 51)
+#define STRTAB_STE_2_S2ENDI		(1UL << 52)
+#define STRTAB_STE_2_S2PTW		(1UL << 54)
+#define STRTAB_STE_2_S2R		(1UL << 58)
+
+#define STRTAB_STE_3_S2TTB_MASK		GENMASK_ULL(51, 4)
+
+/*
+ * Context descriptors.
+ *
+ * Linear: when less than 1024 SSIDs are supported
+ * 2lvl: at most 1024 L1 entries,
+ *       1024 lazy entries per table.
+ */
+#define CTXDESC_SPLIT			10
+#define CTXDESC_L2_ENTRIES		(1 << CTXDESC_SPLIT)
+
+#define CTXDESC_L1_DESC_DWORDS		1
+#define CTXDESC_L1_DESC_V		(1UL << 0)
+#define CTXDESC_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 12)
+
+#define CTXDESC_CD_DWORDS		8
+#define CTXDESC_CD_0_TCR_T0SZ		GENMASK_ULL(5, 0)
+#define CTXDESC_CD_0_TCR_TG0		GENMASK_ULL(7, 6)
+#define CTXDESC_CD_0_TCR_IRGN0		GENMASK_ULL(9, 8)
+#define CTXDESC_CD_0_TCR_ORGN0		GENMASK_ULL(11, 10)
+#define CTXDESC_CD_0_TCR_SH0		GENMASK_ULL(13, 12)
+#define CTXDESC_CD_0_TCR_EPD0		(1ULL << 14)
+#define CTXDESC_CD_0_TCR_EPD1		(1ULL << 30)
+
+#define CTXDESC_CD_0_ENDI		(1UL << 15)
+#define CTXDESC_CD_0_V			(1UL << 31)
+
+#define CTXDESC_CD_0_TCR_IPS		GENMASK_ULL(34, 32)
+#define CTXDESC_CD_0_TCR_TBI0		(1ULL << 38)
+
+#define CTXDESC_CD_0_AA64		(1UL << 41)
+#define CTXDESC_CD_0_S			(1UL << 44)
+#define CTXDESC_CD_0_R			(1UL << 45)
+#define CTXDESC_CD_0_A			(1UL << 46)
+#define CTXDESC_CD_0_ASET		(1UL << 47)
+#define CTXDESC_CD_0_ASID		GENMASK_ULL(63, 48)
+
+#define CTXDESC_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
+
+/*
+ * When the SMMU only supports linear context descriptor tables, pick a
+ * reasonable size limit (64kB).
+ */
+#define CTXDESC_LINEAR_CDMAX		ilog2(SZ_64K / (CTXDESC_CD_DWORDS << 3))
+
+/* Command queue */
+#define CMDQ_ENT_SZ_SHIFT		4
+#define CMDQ_ENT_DWORDS			((1 << CMDQ_ENT_SZ_SHIFT) >> 3)
+#define CMDQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
+
+#define CMDQ_CONS_ERR			GENMASK(30, 24)
+#define CMDQ_ERR_CERROR_NONE_IDX	0
+#define CMDQ_ERR_CERROR_ILL_IDX		1
+#define CMDQ_ERR_CERROR_ABT_IDX		2
+#define CMDQ_ERR_CERROR_ATC_INV_IDX	3
+
+#define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
+
+/*
+ * This is used to size the command queue and therefore must be at least
+ * BITS_PER_LONG so that the valid_map works correctly (it relies on the
+ * total number of queue entries being a multiple of BITS_PER_LONG).
+ */
+#define CMDQ_BATCH_ENTRIES		BITS_PER_LONG
+
+#define CMDQ_0_OP			GENMASK_ULL(7, 0)
+#define CMDQ_0_SSV			(1UL << 11)
+
+#define CMDQ_PREFETCH_0_SID		GENMASK_ULL(63, 32)
+#define CMDQ_PREFETCH_1_SIZE		GENMASK_ULL(4, 0)
+#define CMDQ_PREFETCH_1_ADDR_MASK	GENMASK_ULL(63, 12)
+
+#define CMDQ_CFGI_0_SSID		GENMASK_ULL(31, 12)
+#define CMDQ_CFGI_0_SID			GENMASK_ULL(63, 32)
+#define CMDQ_CFGI_1_LEAF		(1UL << 0)
+#define CMDQ_CFGI_1_RANGE		GENMASK_ULL(4, 0)
+
+#define CMDQ_TLBI_0_NUM			GENMASK_ULL(16, 12)
+#define CMDQ_TLBI_RANGE_NUM_MAX		31
+#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(24, 20)
+#define CMDQ_TLBI_0_VMID		GENMASK_ULL(47, 32)
+#define CMDQ_TLBI_0_ASID		GENMASK_ULL(63, 48)
+#define CMDQ_TLBI_1_LEAF		(1UL << 0)
+#define CMDQ_TLBI_1_TTL			GENMASK_ULL(9, 8)
+#define CMDQ_TLBI_1_TG			GENMASK_ULL(11, 10)
+#define CMDQ_TLBI_1_VA_MASK		GENMASK_ULL(63, 12)
+#define CMDQ_TLBI_1_IPA_MASK		GENMASK_ULL(51, 12)
+
+#define CMDQ_ATC_0_SSID			GENMASK_ULL(31, 12)
+#define CMDQ_ATC_0_SID			GENMASK_ULL(63, 32)
+#define CMDQ_ATC_0_GLOBAL		(1UL << 9)
+#define CMDQ_ATC_1_SIZE			GENMASK_ULL(5, 0)
+#define CMDQ_ATC_1_ADDR_MASK		GENMASK_ULL(63, 12)
+
+#define CMDQ_PRI_0_SSID			GENMASK_ULL(31, 12)
+#define CMDQ_PRI_0_SID			GENMASK_ULL(63, 32)
+#define CMDQ_PRI_1_GRPID		GENMASK_ULL(8, 0)
+#define CMDQ_PRI_1_RESP			GENMASK_ULL(13, 12)
+
+#define CMDQ_SYNC_0_CS			GENMASK_ULL(13, 12)
+#define CMDQ_SYNC_0_CS_NONE		0
+#define CMDQ_SYNC_0_CS_IRQ		1
+#define CMDQ_SYNC_0_CS_SEV		2
+#define CMDQ_SYNC_0_MSH			GENMASK_ULL(23, 22)
+#define CMDQ_SYNC_0_MSIATTR		GENMASK_ULL(27, 24)
+#define CMDQ_SYNC_0_MSIDATA		GENMASK_ULL(63, 32)
+#define CMDQ_SYNC_1_MSIADDR_MASK	GENMASK_ULL(51, 2)
+
+/* Event queue */
+#define EVTQ_ENT_SZ_SHIFT		5
+#define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
+#define EVTQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - EVTQ_ENT_SZ_SHIFT)
+
+#define EVTQ_0_ID			GENMASK_ULL(7, 0)
+
+/* PRI queue */
+#define PRIQ_ENT_SZ_SHIFT		4
+#define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
+#define PRIQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - PRIQ_ENT_SZ_SHIFT)
+
+#define PRIQ_0_SID			GENMASK_ULL(31, 0)
+#define PRIQ_0_SSID			GENMASK_ULL(51, 32)
+#define PRIQ_0_PERM_PRIV		(1UL << 58)
+#define PRIQ_0_PERM_EXEC		(1UL << 59)
+#define PRIQ_0_PERM_READ		(1UL << 60)
+#define PRIQ_0_PERM_WRITE		(1UL << 61)
+#define PRIQ_0_PRG_LAST			(1UL << 62)
+#define PRIQ_0_SSID_V			(1UL << 63)
+
+#define PRIQ_1_PRG_IDX			GENMASK_ULL(8, 0)
+#define PRIQ_1_ADDR_MASK		GENMASK_ULL(63, 12)
+
+/* High-level queue structures */
+#define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
+#define ARM_SMMU_POLL_SPIN_COUNT	10
+
+#define MSI_IOVA_BASE			0x8000000
+#define MSI_IOVA_LENGTH			0x100000
+
+enum pri_resp {
+	PRI_RESP_DENY = 0,
+	PRI_RESP_FAIL = 1,
+	PRI_RESP_SUCC = 2,
+};
+
+struct arm_smmu_cmdq_ent {
+	/* Common fields */
+	u8				opcode;
+	bool				substream_valid;
+
+	/* Command-specific fields */
+	union {
+		#define CMDQ_OP_PREFETCH_CFG	0x1
+		struct {
+			u32			sid;
+			u8			size;
+			u64			addr;
+		} prefetch;
+
+		#define CMDQ_OP_CFGI_STE	0x3
+		#define CMDQ_OP_CFGI_ALL	0x4
+		#define CMDQ_OP_CFGI_CD		0x5
+		#define CMDQ_OP_CFGI_CD_ALL	0x6
+		struct {
+			u32			sid;
+			u32			ssid;
+			union {
+				bool		leaf;
+				u8		span;
+			};
+		} cfgi;
+
+		#define CMDQ_OP_TLBI_NH_ASID	0x11
+		#define CMDQ_OP_TLBI_NH_VA	0x12
+		#define CMDQ_OP_TLBI_EL2_ALL	0x20
+		#define CMDQ_OP_TLBI_S12_VMALL	0x28
+		#define CMDQ_OP_TLBI_S2_IPA	0x2a
+		#define CMDQ_OP_TLBI_NSNH_ALL	0x30
+		struct {
+			u8			num;
+			u8			scale;
+			u16			asid;
+			u16			vmid;
+			bool			leaf;
+			u8			ttl;
+			u8			tg;
+			u64			addr;
+		} tlbi;
+
+		#define CMDQ_OP_ATC_INV		0x40
+		#define ATC_INV_SIZE_ALL	52
+		struct {
+			u32			sid;
+			u32			ssid;
+			u64			addr;
+			u8			size;
+			bool			global;
+		} atc;
+
+		#define CMDQ_OP_PRI_RESP	0x41
+		struct {
+			u32			sid;
+			u32			ssid;
+			u16			grpid;
+			enum pri_resp		resp;
+		} pri;
+
+		#define CMDQ_OP_CMD_SYNC	0x46
+		struct {
+			u64			msiaddr;
+		} sync;
+	};
+};
+
+struct arm_smmu_ll_queue {
+	union {
+		u64			val;
+		struct {
+			u32		prod;
+			u32		cons;
+		};
+		struct {
+			atomic_t	prod;
+			atomic_t	cons;
+		} atomic;
+		u8			__pad[SMP_CACHE_BYTES];
+	} ____cacheline_aligned_in_smp;
+	u32				max_n_shift;
+};
+
+struct arm_smmu_queue {
+	struct arm_smmu_ll_queue	llq;
+	int				irq; /* Wired interrupt */
+
+	__le64				*base;
+	dma_addr_t			base_dma;
+	u64				q_base;
+
+	size_t				ent_dwords;
+
+	u32 __iomem			*prod_reg;
+	u32 __iomem			*cons_reg;
+};
+
+struct arm_smmu_queue_poll {
+	ktime_t				timeout;
+	unsigned int			delay;
+	unsigned int			spin_cnt;
+	bool				wfe;
+};
+
+struct arm_smmu_cmdq {
+	struct arm_smmu_queue		q;
+	atomic_long_t			*valid_map;
+	atomic_t			owner_prod;
+	atomic_t			lock;
+};
+
+struct arm_smmu_cmdq_batch {
+	u64				cmds[CMDQ_BATCH_ENTRIES * CMDQ_ENT_DWORDS];
+	int				num;
+};
+
+struct arm_smmu_evtq {
+	struct arm_smmu_queue		q;
+	u32				max_stalls;
+};
+
+struct arm_smmu_priq {
+	struct arm_smmu_queue		q;
+};
+
+/* High-level stream table and context descriptor structures */
+struct arm_smmu_strtab_l1_desc {
+	u8				span;
+
+	__le64				*l2ptr;
+	dma_addr_t			l2ptr_dma;
+};
+
+struct arm_smmu_ctx_desc {
+	u16				asid;
+	u64				ttbr;
+	u64				tcr;
+	u64				mair;
+};
+
+struct arm_smmu_l1_ctx_desc {
+	__le64				*l2ptr;
+	dma_addr_t			l2ptr_dma;
+};
+
+struct arm_smmu_ctx_desc_cfg {
+	__le64				*cdtab;
+	dma_addr_t			cdtab_dma;
+	struct arm_smmu_l1_ctx_desc	*l1_desc;
+	unsigned int			num_l1_ents;
+};
+
+struct arm_smmu_s1_cfg {
+	struct arm_smmu_ctx_desc_cfg	cdcfg;
+	struct arm_smmu_ctx_desc	cd;
+	u8				s1fmt;
+	u8				s1cdmax;
+};
+
+struct arm_smmu_s2_cfg {
+	u16				vmid;
+	u64				vttbr;
+	u64				vtcr;
+};
+
+struct arm_smmu_strtab_cfg {
+	__le64				*strtab;
+	dma_addr_t			strtab_dma;
+	struct arm_smmu_strtab_l1_desc	*l1_desc;
+	unsigned int			num_l1_ents;
+
+	u64				strtab_base;
+	u32				strtab_base_cfg;
+};
+
+/* An SMMUv3 instance */
+struct arm_smmu_device {
+	struct device			*dev;
+	void __iomem			*base;
+	void __iomem			*page1;
+
+#define ARM_SMMU_FEAT_2_LVL_STRTAB	(1 << 0)
+#define ARM_SMMU_FEAT_2_LVL_CDTAB	(1 << 1)
+#define ARM_SMMU_FEAT_TT_LE		(1 << 2)
+#define ARM_SMMU_FEAT_TT_BE		(1 << 3)
+#define ARM_SMMU_FEAT_PRI		(1 << 4)
+#define ARM_SMMU_FEAT_ATS		(1 << 5)
+#define ARM_SMMU_FEAT_SEV		(1 << 6)
+#define ARM_SMMU_FEAT_MSI		(1 << 7)
+#define ARM_SMMU_FEAT_COHERENCY		(1 << 8)
+#define ARM_SMMU_FEAT_TRANS_S1		(1 << 9)
+#define ARM_SMMU_FEAT_TRANS_S2		(1 << 10)
+#define ARM_SMMU_FEAT_STALLS		(1 << 11)
+#define ARM_SMMU_FEAT_HYP		(1 << 12)
+#define ARM_SMMU_FEAT_STALL_FORCE	(1 << 13)
+#define ARM_SMMU_FEAT_VAX		(1 << 14)
+#define ARM_SMMU_FEAT_RANGE_INV		(1 << 15)
+	u32				features;
+
+#define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
+#define ARM_SMMU_OPT_PAGE0_REGS_ONLY	(1 << 1)
+	u32				options;
+
+	struct arm_smmu_cmdq		cmdq;
+	struct arm_smmu_evtq		evtq;
+	struct arm_smmu_priq		priq;
+
+	int				gerr_irq;
+	int				combined_irq;
+
+	unsigned long			ias; /* IPA */
+	unsigned long			oas; /* PA */
+	unsigned long			pgsize_bitmap;
+
+#define ARM_SMMU_MAX_ASIDS		(1 << 16)
+	unsigned int			asid_bits;
+
+#define ARM_SMMU_MAX_VMIDS		(1 << 16)
+	unsigned int			vmid_bits;
+	DECLARE_BITMAP(vmid_map, ARM_SMMU_MAX_VMIDS);
+
+	unsigned int			ssid_bits;
+	unsigned int			sid_bits;
+
+	struct arm_smmu_strtab_cfg	strtab_cfg;
+
+	/* IOMMU core code handle */
+	struct iommu_device		iommu;
+};
+
+/* SMMU private data for each master */
+struct arm_smmu_master {
+	struct arm_smmu_device		*smmu;
+	struct device			*dev;
+	struct arm_smmu_domain		*domain;
+	struct list_head		domain_head;
+	u32				*sids;
+	unsigned int			num_sids;
+	bool				ats_enabled;
+	unsigned int			ssid_bits;
+};
+
+/* SMMU private data for an IOMMU domain */
+enum arm_smmu_domain_stage {
+	ARM_SMMU_DOMAIN_S1 = 0,
+	ARM_SMMU_DOMAIN_S2,
+	ARM_SMMU_DOMAIN_NESTED,
+	ARM_SMMU_DOMAIN_BYPASS,
+};
+
+struct arm_smmu_domain {
+	struct arm_smmu_device		*smmu;
+	struct mutex			init_mutex; /* Protects smmu pointer */
+
+	struct io_pgtable_ops		*pgtbl_ops;
+	bool				non_strict;
+	atomic_t			nr_ats_masters;
+
+	enum arm_smmu_domain_stage	stage;
+	union {
+		struct arm_smmu_s1_cfg	s1_cfg;
+		struct arm_smmu_s2_cfg	s2_cfg;
+	};
+
+	struct iommu_domain		domain;
+
+	struct list_head		devices;
+	spinlock_t			devices_lock;
+};
+
+#endif /* _ARM_SMMU_V3_H */
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 937aa1af428d..827334ed312b 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -11,7 +11,6 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
-#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
@@ -19,7 +18,6 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
-#include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/msi.h>
@@ -33,397 +31,13 @@
 
 #include <linux/amba/bus.h>
 
-/* MMIO registers */
-#define ARM_SMMU_IDR0			0x0
-#define IDR0_ST_LVL			GENMASK(28, 27)
-#define IDR0_ST_LVL_2LVL		1
-#define IDR0_STALL_MODEL		GENMASK(25, 24)
-#define IDR0_STALL_MODEL_STALL		0
-#define IDR0_STALL_MODEL_FORCE		2
-#define IDR0_TTENDIAN			GENMASK(22, 21)
-#define IDR0_TTENDIAN_MIXED		0
-#define IDR0_TTENDIAN_LE		2
-#define IDR0_TTENDIAN_BE		3
-#define IDR0_CD2L			(1 << 19)
-#define IDR0_VMID16			(1 << 18)
-#define IDR0_PRI			(1 << 16)
-#define IDR0_SEV			(1 << 14)
-#define IDR0_MSI			(1 << 13)
-#define IDR0_ASID16			(1 << 12)
-#define IDR0_ATS			(1 << 10)
-#define IDR0_HYP			(1 << 9)
-#define IDR0_COHACC			(1 << 4)
-#define IDR0_TTF			GENMASK(3, 2)
-#define IDR0_TTF_AARCH64		2
-#define IDR0_TTF_AARCH32_64		3
-#define IDR0_S1P			(1 << 1)
-#define IDR0_S2P			(1 << 0)
-
-#define ARM_SMMU_IDR1			0x4
-#define IDR1_TABLES_PRESET		(1 << 30)
-#define IDR1_QUEUES_PRESET		(1 << 29)
-#define IDR1_REL			(1 << 28)
-#define IDR1_CMDQS			GENMASK(25, 21)
-#define IDR1_EVTQS			GENMASK(20, 16)
-#define IDR1_PRIQS			GENMASK(15, 11)
-#define IDR1_SSIDSIZE			GENMASK(10, 6)
-#define IDR1_SIDSIZE			GENMASK(5, 0)
-
-#define ARM_SMMU_IDR3			0xc
-#define IDR3_RIL			(1 << 10)
-
-#define ARM_SMMU_IDR5			0x14
-#define IDR5_STALL_MAX			GENMASK(31, 16)
-#define IDR5_GRAN64K			(1 << 6)
-#define IDR5_GRAN16K			(1 << 5)
-#define IDR5_GRAN4K			(1 << 4)
-#define IDR5_OAS			GENMASK(2, 0)
-#define IDR5_OAS_32_BIT			0
-#define IDR5_OAS_36_BIT			1
-#define IDR5_OAS_40_BIT			2
-#define IDR5_OAS_42_BIT			3
-#define IDR5_OAS_44_BIT			4
-#define IDR5_OAS_48_BIT			5
-#define IDR5_OAS_52_BIT			6
-#define IDR5_VAX			GENMASK(11, 10)
-#define IDR5_VAX_52_BIT			1
-
-#define ARM_SMMU_CR0			0x20
-#define CR0_ATSCHK			(1 << 4)
-#define CR0_CMDQEN			(1 << 3)
-#define CR0_EVTQEN			(1 << 2)
-#define CR0_PRIQEN			(1 << 1)
-#define CR0_SMMUEN			(1 << 0)
-
-#define ARM_SMMU_CR0ACK			0x24
-
-#define ARM_SMMU_CR1			0x28
-#define CR1_TABLE_SH			GENMASK(11, 10)
-#define CR1_TABLE_OC			GENMASK(9, 8)
-#define CR1_TABLE_IC			GENMASK(7, 6)
-#define CR1_QUEUE_SH			GENMASK(5, 4)
-#define CR1_QUEUE_OC			GENMASK(3, 2)
-#define CR1_QUEUE_IC			GENMASK(1, 0)
-/* CR1 cacheability fields don't quite follow the usual TCR-style encoding */
-#define CR1_CACHE_NC			0
-#define CR1_CACHE_WB			1
-#define CR1_CACHE_WT			2
-
-#define ARM_SMMU_CR2			0x2c
-#define CR2_PTM				(1 << 2)
-#define CR2_RECINVSID			(1 << 1)
-#define CR2_E2H				(1 << 0)
-
-#define ARM_SMMU_GBPA			0x44
-#define GBPA_UPDATE			(1 << 31)
-#define GBPA_ABORT			(1 << 20)
-
-#define ARM_SMMU_IRQ_CTRL		0x50
-#define IRQ_CTRL_EVTQ_IRQEN		(1 << 2)
-#define IRQ_CTRL_PRIQ_IRQEN		(1 << 1)
-#define IRQ_CTRL_GERROR_IRQEN		(1 << 0)
-
-#define ARM_SMMU_IRQ_CTRLACK		0x54
-
-#define ARM_SMMU_GERROR			0x60
-#define GERROR_SFM_ERR			(1 << 8)
-#define GERROR_MSI_GERROR_ABT_ERR	(1 << 7)
-#define GERROR_MSI_PRIQ_ABT_ERR		(1 << 6)
-#define GERROR_MSI_EVTQ_ABT_ERR		(1 << 5)
-#define GERROR_MSI_CMDQ_ABT_ERR		(1 << 4)
-#define GERROR_PRIQ_ABT_ERR		(1 << 3)
-#define GERROR_EVTQ_ABT_ERR		(1 << 2)
-#define GERROR_CMDQ_ERR			(1 << 0)
-#define GERROR_ERR_MASK			0xfd
-
-#define ARM_SMMU_GERRORN		0x64
-
-#define ARM_SMMU_GERROR_IRQ_CFG0	0x68
-#define ARM_SMMU_GERROR_IRQ_CFG1	0x70
-#define ARM_SMMU_GERROR_IRQ_CFG2	0x74
-
-#define ARM_SMMU_STRTAB_BASE		0x80
-#define STRTAB_BASE_RA			(1UL << 62)
-#define STRTAB_BASE_ADDR_MASK		GENMASK_ULL(51, 6)
-
-#define ARM_SMMU_STRTAB_BASE_CFG	0x88
-#define STRTAB_BASE_CFG_FMT		GENMASK(17, 16)
-#define STRTAB_BASE_CFG_FMT_LINEAR	0
-#define STRTAB_BASE_CFG_FMT_2LVL	1
-#define STRTAB_BASE_CFG_SPLIT		GENMASK(10, 6)
-#define STRTAB_BASE_CFG_LOG2SIZE	GENMASK(5, 0)
-
-#define ARM_SMMU_CMDQ_BASE		0x90
-#define ARM_SMMU_CMDQ_PROD		0x98
-#define ARM_SMMU_CMDQ_CONS		0x9c
-
-#define ARM_SMMU_EVTQ_BASE		0xa0
-#define ARM_SMMU_EVTQ_PROD		0x100a8
-#define ARM_SMMU_EVTQ_CONS		0x100ac
-#define ARM_SMMU_EVTQ_IRQ_CFG0		0xb0
-#define ARM_SMMU_EVTQ_IRQ_CFG1		0xb8
-#define ARM_SMMU_EVTQ_IRQ_CFG2		0xbc
-
-#define ARM_SMMU_PRIQ_BASE		0xc0
-#define ARM_SMMU_PRIQ_PROD		0x100c8
-#define ARM_SMMU_PRIQ_CONS		0x100cc
-#define ARM_SMMU_PRIQ_IRQ_CFG0		0xd0
-#define ARM_SMMU_PRIQ_IRQ_CFG1		0xd8
-#define ARM_SMMU_PRIQ_IRQ_CFG2		0xdc
-
-#define ARM_SMMU_REG_SZ			0xe00
-
-/* Common MSI config fields */
-#define MSI_CFG0_ADDR_MASK		GENMASK_ULL(51, 2)
-#define MSI_CFG2_SH			GENMASK(5, 4)
-#define MSI_CFG2_MEMATTR		GENMASK(3, 0)
-
-/* Common memory attribute values */
-#define ARM_SMMU_SH_NSH			0
-#define ARM_SMMU_SH_OSH			2
-#define ARM_SMMU_SH_ISH			3
-#define ARM_SMMU_MEMATTR_DEVICE_nGnRE	0x1
-#define ARM_SMMU_MEMATTR_OIWB		0xf
-
-#define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
-#define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
-#define Q_OVERFLOW_FLAG			(1U << 31)
-#define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
-#define Q_ENT(q, p)			((q)->base +			\
-					 Q_IDX(&((q)->llq), p) *	\
-					 (q)->ent_dwords)
-
-#define Q_BASE_RWA			(1UL << 62)
-#define Q_BASE_ADDR_MASK		GENMASK_ULL(51, 5)
-#define Q_BASE_LOG2SIZE			GENMASK(4, 0)
-
-/* Ensure DMA allocations are naturally aligned */
-#ifdef CONFIG_CMA_ALIGNMENT
-#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
-#else
-#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + MAX_ORDER - 1)
-#endif
-
-/*
- * Stream table.
- *
- * Linear: Enough to cover 1 << IDR1.SIDSIZE entries
- * 2lvl: 128k L1 entries,
- *       256 lazy entries per table (each table covers a PCI bus)
- */
-#define STRTAB_L1_SZ_SHIFT		20
-#define STRTAB_SPLIT			8
-
-#define STRTAB_L1_DESC_DWORDS		1
-#define STRTAB_L1_DESC_SPAN		GENMASK_ULL(4, 0)
-#define STRTAB_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 6)
-
-#define STRTAB_STE_DWORDS		8
-#define STRTAB_STE_0_V			(1UL << 0)
-#define STRTAB_STE_0_CFG		GENMASK_ULL(3, 1)
-#define STRTAB_STE_0_CFG_ABORT		0
-#define STRTAB_STE_0_CFG_BYPASS		4
-#define STRTAB_STE_0_CFG_S1_TRANS	5
-#define STRTAB_STE_0_CFG_S2_TRANS	6
-
-#define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
-#define STRTAB_STE_0_S1FMT_LINEAR	0
-#define STRTAB_STE_0_S1FMT_64K_L2	2
-#define STRTAB_STE_0_S1CTXPTR_MASK	GENMASK_ULL(51, 6)
-#define STRTAB_STE_0_S1CDMAX		GENMASK_ULL(63, 59)
-
-#define STRTAB_STE_1_S1DSS		GENMASK_ULL(1, 0)
-#define STRTAB_STE_1_S1DSS_TERMINATE	0x0
-#define STRTAB_STE_1_S1DSS_BYPASS	0x1
-#define STRTAB_STE_1_S1DSS_SSID0	0x2
-
-#define STRTAB_STE_1_S1C_CACHE_NC	0UL
-#define STRTAB_STE_1_S1C_CACHE_WBRA	1UL
-#define STRTAB_STE_1_S1C_CACHE_WT	2UL
-#define STRTAB_STE_1_S1C_CACHE_WB	3UL
-#define STRTAB_STE_1_S1CIR		GENMASK_ULL(3, 2)
-#define STRTAB_STE_1_S1COR		GENMASK_ULL(5, 4)
-#define STRTAB_STE_1_S1CSH		GENMASK_ULL(7, 6)
-
-#define STRTAB_STE_1_S1STALLD		(1UL << 27)
-
-#define STRTAB_STE_1_EATS		GENMASK_ULL(29, 28)
-#define STRTAB_STE_1_EATS_ABT		0UL
-#define STRTAB_STE_1_EATS_TRANS		1UL
-#define STRTAB_STE_1_EATS_S1CHK		2UL
-
-#define STRTAB_STE_1_STRW		GENMASK_ULL(31, 30)
-#define STRTAB_STE_1_STRW_NSEL1		0UL
-#define STRTAB_STE_1_STRW_EL2		2UL
-
-#define STRTAB_STE_1_SHCFG		GENMASK_ULL(45, 44)
-#define STRTAB_STE_1_SHCFG_INCOMING	1UL
-
-#define STRTAB_STE_2_S2VMID		GENMASK_ULL(15, 0)
-#define STRTAB_STE_2_VTCR		GENMASK_ULL(50, 32)
-#define STRTAB_STE_2_VTCR_S2T0SZ	GENMASK_ULL(5, 0)
-#define STRTAB_STE_2_VTCR_S2SL0		GENMASK_ULL(7, 6)
-#define STRTAB_STE_2_VTCR_S2IR0		GENMASK_ULL(9, 8)
-#define STRTAB_STE_2_VTCR_S2OR0		GENMASK_ULL(11, 10)
-#define STRTAB_STE_2_VTCR_S2SH0		GENMASK_ULL(13, 12)
-#define STRTAB_STE_2_VTCR_S2TG		GENMASK_ULL(15, 14)
-#define STRTAB_STE_2_VTCR_S2PS		GENMASK_ULL(18, 16)
-#define STRTAB_STE_2_S2AA64		(1UL << 51)
-#define STRTAB_STE_2_S2ENDI		(1UL << 52)
-#define STRTAB_STE_2_S2PTW		(1UL << 54)
-#define STRTAB_STE_2_S2R		(1UL << 58)
-
-#define STRTAB_STE_3_S2TTB_MASK		GENMASK_ULL(51, 4)
-
-/*
- * Context descriptors.
- *
- * Linear: when less than 1024 SSIDs are supported
- * 2lvl: at most 1024 L1 entries,
- *       1024 lazy entries per table.
- */
-#define CTXDESC_SPLIT			10
-#define CTXDESC_L2_ENTRIES		(1 << CTXDESC_SPLIT)
-
-#define CTXDESC_L1_DESC_DWORDS		1
-#define CTXDESC_L1_DESC_V		(1UL << 0)
-#define CTXDESC_L1_DESC_L2PTR_MASK	GENMASK_ULL(51, 12)
-
-#define CTXDESC_CD_DWORDS		8
-#define CTXDESC_CD_0_TCR_T0SZ		GENMASK_ULL(5, 0)
-#define CTXDESC_CD_0_TCR_TG0		GENMASK_ULL(7, 6)
-#define CTXDESC_CD_0_TCR_IRGN0		GENMASK_ULL(9, 8)
-#define CTXDESC_CD_0_TCR_ORGN0		GENMASK_ULL(11, 10)
-#define CTXDESC_CD_0_TCR_SH0		GENMASK_ULL(13, 12)
-#define CTXDESC_CD_0_TCR_EPD0		(1ULL << 14)
-#define CTXDESC_CD_0_TCR_EPD1		(1ULL << 30)
-
-#define CTXDESC_CD_0_ENDI		(1UL << 15)
-#define CTXDESC_CD_0_V			(1UL << 31)
-
-#define CTXDESC_CD_0_TCR_IPS		GENMASK_ULL(34, 32)
-#define CTXDESC_CD_0_TCR_TBI0		(1ULL << 38)
-
-#define CTXDESC_CD_0_AA64		(1UL << 41)
-#define CTXDESC_CD_0_S			(1UL << 44)
-#define CTXDESC_CD_0_R			(1UL << 45)
-#define CTXDESC_CD_0_A			(1UL << 46)
-#define CTXDESC_CD_0_ASET		(1UL << 47)
-#define CTXDESC_CD_0_ASID		GENMASK_ULL(63, 48)
-
-#define CTXDESC_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
-
-/*
- * When the SMMU only supports linear context descriptor tables, pick a
- * reasonable size limit (64kB).
- */
-#define CTXDESC_LINEAR_CDMAX		ilog2(SZ_64K / (CTXDESC_CD_DWORDS << 3))
-
-/* Command queue */
-#define CMDQ_ENT_SZ_SHIFT		4
-#define CMDQ_ENT_DWORDS			((1 << CMDQ_ENT_SZ_SHIFT) >> 3)
-#define CMDQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
-
-#define CMDQ_CONS_ERR			GENMASK(30, 24)
-#define CMDQ_ERR_CERROR_NONE_IDX	0
-#define CMDQ_ERR_CERROR_ILL_IDX		1
-#define CMDQ_ERR_CERROR_ABT_IDX		2
-#define CMDQ_ERR_CERROR_ATC_INV_IDX	3
-
-#define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
-
-/*
- * This is used to size the command queue and therefore must be at least
- * BITS_PER_LONG so that the valid_map works correctly (it relies on the
- * total number of queue entries being a multiple of BITS_PER_LONG).
- */
-#define CMDQ_BATCH_ENTRIES		BITS_PER_LONG
-
-#define CMDQ_0_OP			GENMASK_ULL(7, 0)
-#define CMDQ_0_SSV			(1UL << 11)
-
-#define CMDQ_PREFETCH_0_SID		GENMASK_ULL(63, 32)
-#define CMDQ_PREFETCH_1_SIZE		GENMASK_ULL(4, 0)
-#define CMDQ_PREFETCH_1_ADDR_MASK	GENMASK_ULL(63, 12)
-
-#define CMDQ_CFGI_0_SSID		GENMASK_ULL(31, 12)
-#define CMDQ_CFGI_0_SID			GENMASK_ULL(63, 32)
-#define CMDQ_CFGI_1_LEAF		(1UL << 0)
-#define CMDQ_CFGI_1_RANGE		GENMASK_ULL(4, 0)
-
-#define CMDQ_TLBI_0_NUM			GENMASK_ULL(16, 12)
-#define CMDQ_TLBI_RANGE_NUM_MAX		31
-#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(24, 20)
-#define CMDQ_TLBI_0_VMID		GENMASK_ULL(47, 32)
-#define CMDQ_TLBI_0_ASID		GENMASK_ULL(63, 48)
-#define CMDQ_TLBI_1_LEAF		(1UL << 0)
-#define CMDQ_TLBI_1_TTL			GENMASK_ULL(9, 8)
-#define CMDQ_TLBI_1_TG			GENMASK_ULL(11, 10)
-#define CMDQ_TLBI_1_VA_MASK		GENMASK_ULL(63, 12)
-#define CMDQ_TLBI_1_IPA_MASK		GENMASK_ULL(51, 12)
-
-#define CMDQ_ATC_0_SSID			GENMASK_ULL(31, 12)
-#define CMDQ_ATC_0_SID			GENMASK_ULL(63, 32)
-#define CMDQ_ATC_0_GLOBAL		(1UL << 9)
-#define CMDQ_ATC_1_SIZE			GENMASK_ULL(5, 0)
-#define CMDQ_ATC_1_ADDR_MASK		GENMASK_ULL(63, 12)
-
-#define CMDQ_PRI_0_SSID			GENMASK_ULL(31, 12)
-#define CMDQ_PRI_0_SID			GENMASK_ULL(63, 32)
-#define CMDQ_PRI_1_GRPID		GENMASK_ULL(8, 0)
-#define CMDQ_PRI_1_RESP			GENMASK_ULL(13, 12)
-
-#define CMDQ_SYNC_0_CS			GENMASK_ULL(13, 12)
-#define CMDQ_SYNC_0_CS_NONE		0
-#define CMDQ_SYNC_0_CS_IRQ		1
-#define CMDQ_SYNC_0_CS_SEV		2
-#define CMDQ_SYNC_0_MSH			GENMASK_ULL(23, 22)
-#define CMDQ_SYNC_0_MSIATTR		GENMASK_ULL(27, 24)
-#define CMDQ_SYNC_0_MSIDATA		GENMASK_ULL(63, 32)
-#define CMDQ_SYNC_1_MSIADDR_MASK	GENMASK_ULL(51, 2)
-
-/* Event queue */
-#define EVTQ_ENT_SZ_SHIFT		5
-#define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
-#define EVTQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - EVTQ_ENT_SZ_SHIFT)
-
-#define EVTQ_0_ID			GENMASK_ULL(7, 0)
-
-/* PRI queue */
-#define PRIQ_ENT_SZ_SHIFT		4
-#define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
-#define PRIQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - PRIQ_ENT_SZ_SHIFT)
-
-#define PRIQ_0_SID			GENMASK_ULL(31, 0)
-#define PRIQ_0_SSID			GENMASK_ULL(51, 32)
-#define PRIQ_0_PERM_PRIV		(1UL << 58)
-#define PRIQ_0_PERM_EXEC		(1UL << 59)
-#define PRIQ_0_PERM_READ		(1UL << 60)
-#define PRIQ_0_PERM_WRITE		(1UL << 61)
-#define PRIQ_0_PRG_LAST			(1UL << 62)
-#define PRIQ_0_SSID_V			(1UL << 63)
-
-#define PRIQ_1_PRG_IDX			GENMASK_ULL(8, 0)
-#define PRIQ_1_ADDR_MASK		GENMASK_ULL(63, 12)
-
-/* High-level queue structures */
-#define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
-#define ARM_SMMU_POLL_SPIN_COUNT	10
-
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
+#include "arm-smmu-v3.h"
 
 static bool disable_bypass = 1;
 module_param_named(disable_bypass, disable_bypass, bool, S_IRUGO);
 MODULE_PARM_DESC(disable_bypass,
 	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
 
-enum pri_resp {
-	PRI_RESP_DENY = 0,
-	PRI_RESP_FAIL = 1,
-	PRI_RESP_SUCC = 2,
-};
-
 enum arm_smmu_msi_index {
 	EVTQ_MSI_INDEX,
 	GERROR_MSI_INDEX,
@@ -449,278 +63,6 @@ static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
 	},
 };
 
-struct arm_smmu_cmdq_ent {
-	/* Common fields */
-	u8				opcode;
-	bool				substream_valid;
-
-	/* Command-specific fields */
-	union {
-		#define CMDQ_OP_PREFETCH_CFG	0x1
-		struct {
-			u32			sid;
-			u8			size;
-			u64			addr;
-		} prefetch;
-
-		#define CMDQ_OP_CFGI_STE	0x3
-		#define CMDQ_OP_CFGI_ALL	0x4
-		#define CMDQ_OP_CFGI_CD		0x5
-		#define CMDQ_OP_CFGI_CD_ALL	0x6
-		struct {
-			u32			sid;
-			u32			ssid;
-			union {
-				bool		leaf;
-				u8		span;
-			};
-		} cfgi;
-
-		#define CMDQ_OP_TLBI_NH_ASID	0x11
-		#define CMDQ_OP_TLBI_NH_VA	0x12
-		#define CMDQ_OP_TLBI_EL2_ALL	0x20
-		#define CMDQ_OP_TLBI_S12_VMALL	0x28
-		#define CMDQ_OP_TLBI_S2_IPA	0x2a
-		#define CMDQ_OP_TLBI_NSNH_ALL	0x30
-		struct {
-			u8			num;
-			u8			scale;
-			u16			asid;
-			u16			vmid;
-			bool			leaf;
-			u8			ttl;
-			u8			tg;
-			u64			addr;
-		} tlbi;
-
-		#define CMDQ_OP_ATC_INV		0x40
-		#define ATC_INV_SIZE_ALL	52
-		struct {
-			u32			sid;
-			u32			ssid;
-			u64			addr;
-			u8			size;
-			bool			global;
-		} atc;
-
-		#define CMDQ_OP_PRI_RESP	0x41
-		struct {
-			u32			sid;
-			u32			ssid;
-			u16			grpid;
-			enum pri_resp		resp;
-		} pri;
-
-		#define CMDQ_OP_CMD_SYNC	0x46
-		struct {
-			u64			msiaddr;
-		} sync;
-	};
-};
-
-struct arm_smmu_ll_queue {
-	union {
-		u64			val;
-		struct {
-			u32		prod;
-			u32		cons;
-		};
-		struct {
-			atomic_t	prod;
-			atomic_t	cons;
-		} atomic;
-		u8			__pad[SMP_CACHE_BYTES];
-	} ____cacheline_aligned_in_smp;
-	u32				max_n_shift;
-};
-
-struct arm_smmu_queue {
-	struct arm_smmu_ll_queue	llq;
-	int				irq; /* Wired interrupt */
-
-	__le64				*base;
-	dma_addr_t			base_dma;
-	u64				q_base;
-
-	size_t				ent_dwords;
-
-	u32 __iomem			*prod_reg;
-	u32 __iomem			*cons_reg;
-};
-
-struct arm_smmu_queue_poll {
-	ktime_t				timeout;
-	unsigned int			delay;
-	unsigned int			spin_cnt;
-	bool				wfe;
-};
-
-struct arm_smmu_cmdq {
-	struct arm_smmu_queue		q;
-	atomic_long_t			*valid_map;
-	atomic_t			owner_prod;
-	atomic_t			lock;
-};
-
-struct arm_smmu_cmdq_batch {
-	u64				cmds[CMDQ_BATCH_ENTRIES * CMDQ_ENT_DWORDS];
-	int				num;
-};
-
-struct arm_smmu_evtq {
-	struct arm_smmu_queue		q;
-	u32				max_stalls;
-};
-
-struct arm_smmu_priq {
-	struct arm_smmu_queue		q;
-};
-
-/* High-level stream table and context descriptor structures */
-struct arm_smmu_strtab_l1_desc {
-	u8				span;
-
-	__le64				*l2ptr;
-	dma_addr_t			l2ptr_dma;
-};
-
-struct arm_smmu_ctx_desc {
-	u16				asid;
-	u64				ttbr;
-	u64				tcr;
-	u64				mair;
-};
-
-struct arm_smmu_l1_ctx_desc {
-	__le64				*l2ptr;
-	dma_addr_t			l2ptr_dma;
-};
-
-struct arm_smmu_ctx_desc_cfg {
-	__le64				*cdtab;
-	dma_addr_t			cdtab_dma;
-	struct arm_smmu_l1_ctx_desc	*l1_desc;
-	unsigned int			num_l1_ents;
-};
-
-struct arm_smmu_s1_cfg {
-	struct arm_smmu_ctx_desc_cfg	cdcfg;
-	struct arm_smmu_ctx_desc	cd;
-	u8				s1fmt;
-	u8				s1cdmax;
-};
-
-struct arm_smmu_s2_cfg {
-	u16				vmid;
-	u64				vttbr;
-	u64				vtcr;
-};
-
-struct arm_smmu_strtab_cfg {
-	__le64				*strtab;
-	dma_addr_t			strtab_dma;
-	struct arm_smmu_strtab_l1_desc	*l1_desc;
-	unsigned int			num_l1_ents;
-
-	u64				strtab_base;
-	u32				strtab_base_cfg;
-};
-
-/* An SMMUv3 instance */
-struct arm_smmu_device {
-	struct device			*dev;
-	void __iomem			*base;
-	void __iomem			*page1;
-
-#define ARM_SMMU_FEAT_2_LVL_STRTAB	(1 << 0)
-#define ARM_SMMU_FEAT_2_LVL_CDTAB	(1 << 1)
-#define ARM_SMMU_FEAT_TT_LE		(1 << 2)
-#define ARM_SMMU_FEAT_TT_BE		(1 << 3)
-#define ARM_SMMU_FEAT_PRI		(1 << 4)
-#define ARM_SMMU_FEAT_ATS		(1 << 5)
-#define ARM_SMMU_FEAT_SEV		(1 << 6)
-#define ARM_SMMU_FEAT_MSI		(1 << 7)
-#define ARM_SMMU_FEAT_COHERENCY		(1 << 8)
-#define ARM_SMMU_FEAT_TRANS_S1		(1 << 9)
-#define ARM_SMMU_FEAT_TRANS_S2		(1 << 10)
-#define ARM_SMMU_FEAT_STALLS		(1 << 11)
-#define ARM_SMMU_FEAT_HYP		(1 << 12)
-#define ARM_SMMU_FEAT_STALL_FORCE	(1 << 13)
-#define ARM_SMMU_FEAT_VAX		(1 << 14)
-#define ARM_SMMU_FEAT_RANGE_INV		(1 << 15)
-	u32				features;
-
-#define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
-#define ARM_SMMU_OPT_PAGE0_REGS_ONLY	(1 << 1)
-	u32				options;
-
-	struct arm_smmu_cmdq		cmdq;
-	struct arm_smmu_evtq		evtq;
-	struct arm_smmu_priq		priq;
-
-	int				gerr_irq;
-	int				combined_irq;
-
-	unsigned long			ias; /* IPA */
-	unsigned long			oas; /* PA */
-	unsigned long			pgsize_bitmap;
-
-#define ARM_SMMU_MAX_ASIDS		(1 << 16)
-	unsigned int			asid_bits;
-
-#define ARM_SMMU_MAX_VMIDS		(1 << 16)
-	unsigned int			vmid_bits;
-	DECLARE_BITMAP(vmid_map, ARM_SMMU_MAX_VMIDS);
-
-	unsigned int			ssid_bits;
-	unsigned int			sid_bits;
-
-	struct arm_smmu_strtab_cfg	strtab_cfg;
-
-	/* IOMMU core code handle */
-	struct iommu_device		iommu;
-};
-
-/* SMMU private data for each master */
-struct arm_smmu_master {
-	struct arm_smmu_device		*smmu;
-	struct device			*dev;
-	struct arm_smmu_domain		*domain;
-	struct list_head		domain_head;
-	u32				*sids;
-	unsigned int			num_sids;
-	bool				ats_enabled;
-	unsigned int			ssid_bits;
-};
-
-/* SMMU private data for an IOMMU domain */
-enum arm_smmu_domain_stage {
-	ARM_SMMU_DOMAIN_S1 = 0,
-	ARM_SMMU_DOMAIN_S2,
-	ARM_SMMU_DOMAIN_NESTED,
-	ARM_SMMU_DOMAIN_BYPASS,
-};
-
-struct arm_smmu_domain {
-	struct arm_smmu_device		*smmu;
-	struct mutex			init_mutex; /* Protects smmu pointer */
-
-	struct io_pgtable_ops		*pgtbl_ops;
-	bool				non_strict;
-	atomic_t			nr_ats_masters;
-
-	enum arm_smmu_domain_stage	stage;
-	union {
-		struct arm_smmu_s1_cfg	s1_cfg;
-		struct arm_smmu_s2_cfg	s2_cfg;
-	};
-
-	struct iommu_domain		domain;
-
-	struct list_head		devices;
-	spinlock_t			devices_lock;
-};
-
 struct arm_smmu_option_prop {
 	u32 opt;
 	const char *prop;
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
