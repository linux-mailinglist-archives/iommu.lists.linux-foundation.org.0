Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F164F12A6
	for <lists.iommu@lfdr.de>; Mon,  4 Apr 2022 12:07:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FE9C410E5;
	Mon,  4 Apr 2022 10:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEafbYr6UBBJ; Mon,  4 Apr 2022 10:07:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 38A57410DE;
	Mon,  4 Apr 2022 10:07:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20576C0012;
	Mon,  4 Apr 2022 10:07:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1272BC0012
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 10:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0003C4093E
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 10:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dh5HFMiHjQ6j for <iommu@lists.linux-foundation.org>;
 Mon,  4 Apr 2022 10:07:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::627])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90F0E4091C
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 10:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2BxABhVN0k9+H7PFq5u03VtS1rJxVPlh/NVhFrn8a7AH3sPLL5IzVnbFOjbNe/RiaLLgz4AWcuCEnhpLjf6t3642Lw/0K8l3fvyNbvcilN4fXSLDbZTV7580fMkvfyWDpNN4PLxVa6UX/r5qggcmfbGioploxGt1Vu8G06E+zuJphPq0qHkkgPQtQQWshl3fhRgidFnVdLujdsY2w3na0rKI+xx+m8wHA+MAN/Ll2XIilEb9t2gS42bRd+0LYFHCIU1d4pTAlQmPKmgSw/1b5wUm8WMyHzVHom/qs+FvO4r7xtfGuCdx0p0ABBdARNGUSn7po9Fm21mkvn1z7pDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8kPqQU9108svMXJCiD1ZpYWqJ7Qllw/XSi8tI+rRZ0=;
 b=Ww90VQQT+a9VVvF7+KkXiacJ21pVbMz785DZyhO0FLi3bwiMlDbTFGDbJijfNuIcGYqm6ld9f2NSenvw5XUCYv4FbD0AtnhaEFriBWTTB8l5dL6n7gk8sIT/oXkXOU+3T12QIrUjHEIUD/e4PoXPfBgZGeFlksbqc78X5dSxcEajhjDa1NZ2akZylI+uwhq7EOk7HdX+/wxwMsW5U2pRCgMuihGD2RpMcDoTAA6SgaK0LMffDKumWj+mGNHNfQQkTti0QR/azLUpOCORzQqsrgYuicZZJewcTEhRLOoDb8TUyrsXLSdFviQxSsu9YcDMZ1IGK/bCMOsg5c2ZR4i6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8kPqQU9108svMXJCiD1ZpYWqJ7Qllw/XSi8tI+rRZ0=;
 b=wMnTn/xO1DK7pNBwIzwOAOLnMekXHpzeXiMrYLJcVvk4LtrJbEiMnZhmleyKMe4GX3uL+RHAoZHwSfkB1ddH/1SQqiT5Q6fSxnxVvVvYR+eA7QXetOlzK3f8xtpaPSPNsnmOUJ6wOqD1zbQ+01V85Ify+7asGzQmsd+cHQ2CrSo=
Received: from MW4PR03CA0027.namprd03.prod.outlook.com (2603:10b6:303:8f::32)
 by DM8PR12MB5416.namprd12.prod.outlook.com (2603:10b6:8:28::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 10:07:35 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::60) by MW4PR03CA0027.outlook.office365.com
 (2603:10b6:303:8f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Mon, 4 Apr 2022 10:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Mon, 4 Apr 2022 10:07:34 +0000
Received: from kali.amdval.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 05:07:32 -0500
To: <iommu@lists.linux-foundation.org>, <joro@8bytes.org>
Subject: [RESEND PATCH v1 27/37] iommu/amd: Remove global amd_iommu_dev_table
Date: Mon, 4 Apr 2022 15:30:13 +0530
Message-ID: <20220404100023.324645-28-vasant.hegde@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404100023.324645-1-vasant.hegde@amd.com>
References: <20220404100023.324645-1-vasant.hegde@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b965673-0e09-4325-3dcb-08da1622f07b
X-MS-TrafficTypeDiagnostic: DM8PR12MB5416:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB5416B610068F7413BC640F4387E59@DM8PR12MB5416.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MAthKLvPDhX1BrNTVPN9UQ1wtRvjPC5IalLg6DjeWqR1h6dYsjK/CbE1dIaroPXdAdinUVbwM7NloMeGCx1x27KDo4TnhVc2ZiLSdiFKa6BSSDXEWHH7lzIZ+f2zs86CEL18vDF5Ck7rIckqxXGM2j77KiSs8VYLy+IAkgOvPqrSGDOON+aDyxBmYjRWDzHGaYzbWdSTQyZ9N51E5jpC5owhvWaevt1E0eeh89bDzAqFJQXB4S/dDc5BFriViZzmnYwYh9TDbMo321Hcvuob0iR99qtNs243zlpDKgpu32O63zxVzuOuMPo+/65zOGNuPYo50kd+S61DYhcrR4OXzHhS6uCRsK3NodZNvj8JpMqw1xPmYiizVJntxMSadMN9GdTn7jCYUioVzpd9vKgfOlSyhhv8ERD/Qpz6HfpgHWznCJ4ji1a70DYHjjTUzYQiCG4qFi5BvmvN4Ky8yWqoTYyN1XQ7r27hUFSzRbTTckuQbnWwFcvfT5f6OfPaouB/y0mjxTOy3J8WhhORgrSJQOrbvSIESlVuRS1bu/+LH1TvDEenh79R4nDzobbG6/Gdq/ygZTTAplRQ8/VNEqxbOdUC5yA9//7/AsrRcIOSC9Y1VxH5YCiBeKowrfUL1/9rCCMq/2mp3NQVyFah2TJ44Yp5dr2kNIoILjvsBXee6zslQCWYNeR4kxO6U/tIQ27DDO12utuE5N73JSkNThPN8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(16526019)(54906003)(40460700003)(336012)(186003)(26005)(5660300002)(426003)(2616005)(1076003)(110136005)(356005)(316002)(81166007)(36860700001)(82310400004)(47076005)(2906002)(36756003)(70206006)(70586007)(508600001)(8676002)(6666004)(8936002)(83380400001)(44832011)(4326008)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 10:07:34.3779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b965673-0e09-4325-3dcb-08da1622f07b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5416
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

From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

Replace global amd_iommu_dev_table with per PCI segment device table.
Also remove "dev_table_size".

Co-developed-by: Vasant Hegde <vasant.hegde@amd.com>
Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 drivers/iommu/amd/amd_iommu_types.h |  6 ------
 drivers/iommu/amd/init.c            | 30 +++--------------------------
 drivers/iommu/amd/iommu.c           |  8 +++++---
 3 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 334206381f84..dc76ee2c3ea5 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -826,12 +826,6 @@ struct unity_map_entry {
  * Data structures for device handling
  */
 
-/*
- * Device table used by hardware. Read and write accesses by software are
- * locked with the amd_iommu_pd_table lock.
- */
-extern struct dev_table_entry *amd_iommu_dev_table;
-
 /*
  * Alias table to find requestor ids to device ids. Not locked because only
  * read on runtime.
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index b2ddf407e967..dd667dfb4355 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -185,14 +185,6 @@ static bool amd_iommu_pc_present __read_mostly;
 
 bool amd_iommu_force_isolation __read_mostly;
 
-/*
- * Pointer to the device table which is shared by all AMD IOMMUs
- * it is indexed by the PCI device id or the HT unit id and contains
- * information about the domain the device belongs to as well as the
- * page table root pointer.
- */
-struct dev_table_entry *amd_iommu_dev_table;
-
 /*
  * The alias table is a driver specific data structure which contains the
  * mappings of the PCI device ids to the actual requestor ids on the IOMMU.
@@ -206,7 +198,6 @@ u16 *amd_iommu_alias_table;
  */
 unsigned long *amd_iommu_pd_alloc_bitmap;
 
-static u32 dev_table_size;	/* size of the device table */
 static u32 alias_table_size;	/* size of the alias table */
 
 enum iommu_init_state {
@@ -402,10 +393,11 @@ static void iommu_set_device_table(struct amd_iommu *iommu)
 {
 	u64 entry;
 	u32 dev_table_size = iommu->pci_seg->dev_table_size;
+	void *dev_table = (void *)get_dev_table(iommu);
 
 	BUG_ON(iommu->mmio_base == NULL);
 
-	entry = iommu_virt_to_phys(amd_iommu_dev_table);
+	entry = iommu_virt_to_phys(dev_table);
 	entry |= (dev_table_size >> 12) - 1;
 	memcpy_toio(iommu->mmio_base + MMIO_DEV_TABLE_OFFSET,
 			&entry, sizeof(entry));
@@ -1148,12 +1140,6 @@ void amd_iommu_apply_erratum_63(struct amd_iommu *iommu, u16 devid)
 		set_dev_entry_bit(iommu, devid, DEV_ENTRY_IW);
 }
 
-/* Writes the specific IOMMU for a device into the rlookup table */
-static void __init set_iommu_for_device(struct amd_iommu *iommu, u16 devid)
-{
-	iommu->pci_seg->rlookup_table[devid] = iommu;
-}
-
 /*
  * This function takes the device specific flags read from the ACPI
  * table and sets up the device table entry with that information
@@ -1178,7 +1164,7 @@ static void __init set_dev_entry_from_acpi(struct amd_iommu *iommu,
 
 	amd_iommu_apply_erratum_63(iommu, devid);
 
-	set_iommu_for_device(iommu, devid);
+	amd_iommu_set_rlookup_table(iommu, devid);
 }
 
 int __init add_special_device(u8 type, u8 id, u16 *devid, bool cmd_line)
@@ -2809,10 +2795,6 @@ static void __init free_iommu_resources(void)
 		   get_order(alias_table_size));
 	amd_iommu_alias_table = NULL;
 
-	free_pages((unsigned long)amd_iommu_dev_table,
-		   get_order(dev_table_size));
-	amd_iommu_dev_table = NULL;
-
 	free_iommu_all();
 	free_pci_segment();
 }
@@ -2941,16 +2923,10 @@ static int __init early_amd_iommu_init(void)
 	amd_iommu_target_ivhd_type = get_highest_supported_ivhd_type(ivrs_base);
 	DUMP_printk("Using IVHD type %#x\n", amd_iommu_target_ivhd_type);
 
-	dev_table_size     = tbl_size(DEV_TABLE_ENTRY_SIZE);
 	alias_table_size   = tbl_size(ALIAS_TABLE_ENTRY_SIZE);
 
 	/* Device table - directly used by all IOMMUs */
 	ret = -ENOMEM;
-	amd_iommu_dev_table = (void *)__get_free_pages(
-				      GFP_KERNEL | __GFP_ZERO | GFP_DMA32,
-				      get_order(dev_table_size));
-	if (amd_iommu_dev_table == NULL)
-		goto out;
 
 	/*
 	 * Alias table - map PCI Bus/Dev/Func to Bus/Dev/Func the
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 7fb9e9a3291b..13731fa241f2 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -230,6 +230,7 @@ static struct iommu_dev_data *search_dev_data(struct amd_iommu *iommu, u16 devid
 static int clone_alias(struct pci_dev *pdev, u16 alias, void *data)
 {
 	struct amd_iommu *iommu;
+	struct dev_table_entry *dev_table;
 	u16 devid = pci_dev_id(pdev);
 
 	if (devid == alias)
@@ -240,9 +241,10 @@ static int clone_alias(struct pci_dev *pdev, u16 alias, void *data)
 		return 0;
 
 	amd_iommu_set_rlookup_table(iommu, alias);
-	memcpy(amd_iommu_dev_table[alias].data,
-	       amd_iommu_dev_table[devid].data,
-	       sizeof(amd_iommu_dev_table[alias].data));
+	dev_table = get_dev_table(iommu);
+	memcpy(dev_table[alias].data,
+	       dev_table[devid].data,
+	       sizeof(dev_table[alias].data));
 
 	return 0;
 }
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
