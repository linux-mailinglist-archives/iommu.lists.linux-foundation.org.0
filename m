Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BF4F1289
	for <lists.iommu@lfdr.de>; Mon,  4 Apr 2022 12:03:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF8B440423;
	Mon,  4 Apr 2022 10:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 375pBnQNihLg; Mon,  4 Apr 2022 10:03:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DA2B340445;
	Mon,  4 Apr 2022 10:03:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBB37C0082;
	Mon,  4 Apr 2022 10:03:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E7EDC0012
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 10:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E6AF40145
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 10:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjYRUr9Ad6t7 for <iommu@lists.linux-foundation.org>;
 Mon,  4 Apr 2022 10:03:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7518B4002B
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 10:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdE3NCQIvO8Wj2xKUZfiHH2tc4b2wrmwNZPIu3G2KExPO09UDbAIW5Dkjb1slKnn1c5UnJyT3zCRgqN5o6h9PXK4l32TKkFj9gtah48WQhE4FhPw3IWkfp/n3uz9hPerSdIyCF7YvxJnIvDijSIJyFss6weyTGjHnKVM39hxoF6X2GIu+GbYCHl6VFPSVKsby/KlxN1YmYcfGFWdkaioNa2ranGQZjixYNzaDRMk52iqYsvlZZx991v0oxOOTYY9vjinKeYUz3VmETVrIjQ5cgbR7cSJ0rrpTBIuNgtkJXYZcsON4lrGYtmo25kwsNvtUjUCiq3/OvdQzrTat5EPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFf65MgM9stWiF/okyQ+w4Orsf2NvI1IhEOt+o5/G78=;
 b=YRQqT18oApcfcYOEHsZeBn3eDIO5TO17nsc4vUw4Y8/y1vFKnwaatJUopwCpZS4gwRkik6xr9NVQwtFLGdF466x5+goVTTfycMh/niQ8NRujXu9D0bbLJj+2xcDlmHV1lb7jLfRAqpvrc88qmXwa9r8MHr5rH5Dr9UEp9L0E4babBqD6u6o2rRp5UkSgABreKmwTVkVyn/jTOByq9ufq4SKPPksJjRDtV1DYRsOTWyQD8MIJ8uep3SN33GtlvWRHtq4rrNtch8rA71KMqpYdnTDVBgMLThhe7awoIe3eMA4j5g0Ggco82ZCeAuTR+u/EQmU89qZQMK2FDgPn5n8etg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFf65MgM9stWiF/okyQ+w4Orsf2NvI1IhEOt+o5/G78=;
 b=zRz9R9uSQ56MzK1tBsi7dTNPg71hcRotRwVGnqI5tzaS+8+EQVUht2IYs1dj1NILvuWdaqFYM2y7gFIeBJ2uEPK/vKsOQiqbci1rBa56WyUjJyEt8kat3YTMaAM0nXtZrb5jhZGQ8ERNBpoLNt5TeLjluTySKRVmM1B7uLGh37Q=
Received: from BN6PR20CA0051.namprd20.prod.outlook.com (2603:10b6:404:151::13)
 by BN9PR12MB5116.namprd12.prod.outlook.com (2603:10b6:408:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 10:03:34 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:151:cafe::d4) by BN6PR20CA0051.outlook.office365.com
 (2603:10b6:404:151::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Mon, 4 Apr 2022 10:03:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Mon, 4 Apr 2022 10:03:34 +0000
Received: from kali.amdval.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 05:03:32 -0500
To: <iommu@lists.linux-foundation.org>, <joro@8bytes.org>
Subject: [RESEND PATCH v1 11/37] iommu/amd: Introduce per PCI segment device
 table size
Date: Mon, 4 Apr 2022 15:29:57 +0530
Message-ID: <20220404100023.324645-12-vasant.hegde@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404100023.324645-1-vasant.hegde@amd.com>
References: <20220404100023.324645-1-vasant.hegde@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e162715-6d34-4089-6028-08da16226193
X-MS-TrafficTypeDiagnostic: BN9PR12MB5116:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB51166CB10DAF14BADD7DE2BF87E59@BN9PR12MB5116.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YHBHK3b+OwSl0Qm6EOwl5z8kuOgGzXrhu1eXgqp1jXC284q1UuBn6kbqFE60XR5rX3tV5d5qJinUTg30VyzKh9L+amMqYb+sp5dZ4jvkOlvOLxi1LTnf8bxVpVr5Ez00Nr4qmWsatzNCr76UK1jyynWx5Wxi5TRz3zkWuUSGIdbgHmrX4Cf0saxNlLwzsFqZfFXSVOs+rl6YZFrz48/wxze0Tuk+0drWsZPjfCl9l3qCMgXACgpwuCvLdfROCaeXeNn/w4988HiqFVfPME+CgIFKWvxRTRTzDlxOMHKaPcnTx2nlf62r1dUykHBFbWlQjUWYPp/DgdDU/WP5TSLYzkg4vkMaLZpitDkwWjvKGZpzxAhYy+Bmi30tclrHkHeyXlHWG+vpQrTxyEH+5y3+V7443bwxAs95pxBal9kItBJPIFUDOk81nxHC8U0AD6FbbMjV7EX8K94GgDruczOHUhHjblPcgSx/QYdXeAZ9dtioM8D9f7EMYQ58RDL5IzWSxA6G4yqgliPCkHE2L9siWhd/ntyi+HpckvF5D4rAlKhlEG+b5dSFw++t1+VUwC73+dtZLMqGI+02VlZ3esHynOzBk9L6HCV6HRhPwVpANr6cOxI9GJLsREONy3hvNGvBnguOEAlWWcXRvDSeQCTPE4tmJNiXlz/tOCdvr+f2z0V0lf4JHktVt/hr/rknbOUgXbfugcC67Fs+7H4LbsAjgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(47076005)(356005)(81166007)(36860700001)(82310400004)(8936002)(40460700003)(508600001)(5660300002)(110136005)(44832011)(70206006)(70586007)(54906003)(316002)(336012)(426003)(1076003)(16526019)(26005)(186003)(2906002)(83380400001)(4326008)(6666004)(8676002)(2616005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 10:03:34.7312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e162715-6d34-4089-6028-08da16226193
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5116
Cc: Vasant Hegde <vasant.hegde@amd.com>
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
From: Vasant Hegde via iommu <iommu@lists.linux-foundation.org>
Reply-To: Vasant Hegde <vasant.hegde@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

With multiple pci segment support, number of BDF supported by each
segment may differ. Hence introduce per segment device table size
which depends on last_bdf. This will replace global
"device_table_size" variable.

Co-developed-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
---
 drivers/iommu/amd/amd_iommu_types.h |  3 +++
 drivers/iommu/amd/init.c            | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index e39e7db54e69..aa666d0723ba 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -547,6 +547,9 @@ struct amd_iommu_pci_seg {
 	/* Largest PCI device id we expect translation requests for */
 	u16 last_bdf;
 
+	/* Size of the device table */
+	u32 dev_table_size;
+
 	/*
 	 * device table virtual address
 	 *
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 71f39551a83a..f8da686182b5 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -414,6 +414,7 @@ static void iommu_set_cwwb_range(struct amd_iommu *iommu)
 static void iommu_set_device_table(struct amd_iommu *iommu)
 {
 	u64 entry;
+	u32 dev_table_size = iommu->pci_seg->dev_table_size;
 
 	BUG_ON(iommu->mmio_base == NULL);
 
@@ -651,7 +652,7 @@ static int __init find_last_devid_acpi(struct acpi_table_header *table, u16 pci_
 static inline int __init alloc_dev_table(struct amd_iommu_pci_seg *pci_seg)
 {
 	pci_seg->dev_table = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO | GFP_DMA32,
-						      get_order(dev_table_size));
+						      get_order(pci_seg->dev_table_size));
 	if (!pci_seg->dev_table)
 		return -ENOMEM;
 
@@ -661,7 +662,7 @@ static inline int __init alloc_dev_table(struct amd_iommu_pci_seg *pci_seg)
 static inline void free_dev_table(struct amd_iommu_pci_seg *pci_seg)
 {
 	free_pages((unsigned long)pci_seg->dev_table,
-		    get_order(dev_table_size));
+		    get_order(pci_seg->dev_table_size));
 	pci_seg->dev_table = NULL;
 }
 
@@ -1034,7 +1035,7 @@ static bool __copy_device_table(struct amd_iommu *iommu)
 	entry = (((u64) hi) << 32) + lo;
 
 	old_devtb_size = ((entry & ~PAGE_MASK) + 1) << 12;
-	if (old_devtb_size != dev_table_size) {
+	if (old_devtb_size != pci_seg->dev_table_size) {
 		pr_err("The device table size of IOMMU:%d is not expected!\n",
 			iommu->index);
 		return false;
@@ -1053,15 +1054,15 @@ static bool __copy_device_table(struct amd_iommu *iommu)
 	}
 	old_devtb = (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) && is_kdump_kernel())
 		    ? (__force void *)ioremap_encrypted(old_devtb_phys,
-							dev_table_size)
-		    : memremap(old_devtb_phys, dev_table_size, MEMREMAP_WB);
+							pci_seg->dev_table_size)
+		    : memremap(old_devtb_phys, pci_seg->dev_table_size, MEMREMAP_WB);
 
 	if (!old_devtb)
 		return false;
 
 	gfp_flag = GFP_KERNEL | __GFP_ZERO | GFP_DMA32;
 	pci_seg->old_dev_tbl_cpy = (void *)__get_free_pages(gfp_flag,
-						    get_order(dev_table_size));
+						    get_order(pci_seg->dev_table_size));
 	if (pci_seg->old_dev_tbl_cpy == NULL) {
 		pr_err("Failed to allocate memory for copying old device table!\n");
 		memunmap(old_devtb);
@@ -1580,6 +1581,7 @@ static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id,
 
 	pci_seg->last_bdf = last_bdf;
 	DUMP_printk("PCI segment : 0x%0x, last bdf : 0x%04x\n", id, last_bdf);
+	pci_seg->dev_table_size     = tbl_size(DEV_TABLE_ENTRY_SIZE);
 
 	pci_seg->id = id;
 	init_llist_head(&pci_seg->dev_data_list);
@@ -2675,7 +2677,7 @@ static void early_enable_iommus(void)
 		for_each_pci_segment(pci_seg) {
 			if (pci_seg->old_dev_tbl_cpy != NULL) {
 				free_pages((unsigned long)pci_seg->old_dev_tbl_cpy,
-						get_order(dev_table_size));
+						get_order(pci_seg->dev_table_size));
 				pci_seg->old_dev_tbl_cpy = NULL;
 			}
 		}
@@ -2689,7 +2691,7 @@ static void early_enable_iommus(void)
 
 		for_each_pci_segment(pci_seg) {
 			free_pages((unsigned long)pci_seg->dev_table,
-				   get_order(dev_table_size));
+				   get_order(pci_seg->dev_table_size));
 			pci_seg->dev_table = pci_seg->old_dev_tbl_cpy;
 		}
 
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
