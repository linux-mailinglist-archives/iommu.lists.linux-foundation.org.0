Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D112050DEEC
	for <lists.iommu@lfdr.de>; Mon, 25 Apr 2022 13:37:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6DC60BEB;
	Mon, 25 Apr 2022 11:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2rP8RHK2TQU; Mon, 25 Apr 2022 11:37:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0F71460BEF;
	Mon, 25 Apr 2022 11:37:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E16FBC007C;
	Mon, 25 Apr 2022 11:37:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A32CC002D
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 11:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58DF08198A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 11:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YrlLFi4uh86B for <iommu@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 11:37:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::619])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F4EE81699
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 11:37:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9zwcX8g7sKnWYYi1y16+Zr977F11HmtReBoIvo+7C85s1+6f4Gou/PWfE+GrXZTzxqtOWmqTDLZ0o42zcNAHynfqq31MZgrImetJELCoesCAxjmB0sH0WUcwHTRJ8eqVi3z7m/i/jwbqPuXRVwLeI4F1HidlYBIuimGJ24Oivf/5GKpy3c4EOFHVYzoBOlFLC+C+g88LMypKYUrBuDMd9gbT2kszcE7WiUjI+5VquwO0iRHvy7dxU4A6KXsdm4guyEL2iYH76jdEnCpXk6V2HwQfvUkM6e/GP4iHrETbnZfKdlkWjpaNBjvYEzuN770ztSY++iCMmQueu8AEGHYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmQjFAOHNgZbrfMtfeFj2aCvm8m1INjIqadOiWCqBxQ=;
 b=BEj2qQNLA58KU1e3x6WolEdfO6RBZCKeOszj0Ov2ubmRczqTa1YTmHkXZJzCu/mc68Iu0dUhDFSDl/vzHCWiT2hKXwAdTP+94/psGhJiPQ2sboBcc2/fCvEOfmeIDxXn1r3bf3oI4c0OYObeGKCG5Aml+vyzXGotDY5y4W9ERm9U8NHvVfRJ0IA899mvmxD377O23U0QmRcZU0TKvyBf+7UjDIR4RDIh7WT3lDvQ1niUJIf1VRGZCC+GWaRLI0esc6BkAdBGl9KA5pRzmHlYonYgi3NA7uBQtknuHtKHHwNgJq03b9Fa3YBqpdcKjAiIoyAXWgKYvMryU1UOCoEoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmQjFAOHNgZbrfMtfeFj2aCvm8m1INjIqadOiWCqBxQ=;
 b=jL4oh8eHnBnKr/xsh66Q4v0KPCC1edRC8oR+dYaUQSwIUffZg5CEMgR1mlCukgOOqTf2bmQj6p+Vu39gW06ayQMTL4tQexDmxaFpAfc/LvJOTw/qU2XNK8AO1Kp9fOUwwBPBNxExxACDwO3ngha8+2Ppz45Bj6jUi2cx9zL2y+U=
Received: from BN9PR03CA0101.namprd03.prod.outlook.com (2603:10b6:408:fd::16)
 by MN2PR12MB3744.namprd12.prod.outlook.com (2603:10b6:208:166::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 11:37:02 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::e) by BN9PR03CA0101.outlook.office365.com
 (2603:10b6:408:fd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Mon, 25 Apr 2022 11:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Mon, 25 Apr 2022 11:37:02 +0000
Received: from kali.amdval.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Apr
 2022 06:37:00 -0500
To: <iommu@lists.linux-foundation.org>
Subject: [PATCH v2 08/37] iommu/amd: Introduce per PCI segment alias_table
Date: Mon, 25 Apr 2022 17:03:46 +0530
Message-ID: <20220425113415.24087-9-vasant.hegde@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425113415.24087-1-vasant.hegde@amd.com>
References: <20220425113415.24087-1-vasant.hegde@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a60097-94e9-4d49-9cfc-08da26afea9a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3744:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB374419D25E3BF5EC1B23A97787F89@MN2PR12MB3744.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XkJ6GNz/Yrl+DMapuJJrEztJnPdGsTB81Qw1wESGe8mcJtFOBvEvWQYsYPGP5xqaer3qAFI1+2zox4Rt6qhtJEX0yPN7kTpPd55DGtQqmFyYIUpU90vbY3a0F7iYpXo9MdLvBzA8iB7WSAABsaFJZC9juResTTzdji13wozYygfRYY6IHtqzMgfZJ9A3HaoHXVpVgnsteVj4kBePDoPl2VslHHtawJGjbHLhH6LfbzSEh1SQ79GxGndnA9L86AcH9SMbGVRxBUDB2zIMTu/8YTfC7lhUHch/LCFCmjqA5RFmibyoLPMmvkNc1b12nZL59qYzn1Del8BS7Kf75GgVXRTibekKwr1u+qycOMbIzANqMhH79+/3/WeDSqfm+/S8Iy3bjkp2rvQJbtTjgSdf4JxKK6P8xsHJkiAm6oszxy683gMJLuQ189kANlsScpqmDN/ruyWCPSXuFeiXxm+B5QO9ubK5bcqX4uKztIhL9M8zgYoZS1Lk7H2R+Y1sotctuSUxAS/tfczYr1qVN6XB+II2nsvi0Qxmk1VOOoZ4XoSNR3JHVKwcODI/B17gie3RgBGK4Ekwj0aWWBZ6KZk4MZI12WxEQmiGViVfibfVvxOYEGCQVx3qhu/48WbRZYEFXIxVL18/NyJPLI35IsaaVp72kzwklrvUQdYKBl4SFZul1SRLF+g/amvfpPe4Zzq+YYVShJqJ3zcYSdHjFxhwqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(5660300002)(47076005)(2616005)(16526019)(1076003)(8936002)(36756003)(44832011)(36860700001)(83380400001)(82310400005)(81166007)(356005)(186003)(426003)(336012)(6666004)(86362001)(26005)(8676002)(508600001)(2906002)(70206006)(70586007)(4326008)(6916009)(316002)(54906003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 11:37:02.2698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a60097-94e9-4d49-9cfc-08da26afea9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3744
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

This will replace global alias table (amd_iommu_alias_table).

Co-developed-by: Vasant Hegde <vasant.hegde@amd.com>
Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 drivers/iommu/amd/amd_iommu_types.h |  7 +++++
 drivers/iommu/amd/init.c            | 41 ++++++++++++++++++++++-------
 drivers/iommu/amd/iommu.c           | 41 ++++++++++++++++++-----------
 3 files changed, 64 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 330bb346207a..f9776f188e36 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -572,6 +572,13 @@ struct amd_iommu_pci_seg {
 	 * will be copied to. It's only be used in kdump kernel.
 	 */
 	struct dev_table_entry *old_dev_tbl_cpy;
+
+	/*
+	 * The alias table is a driver specific data structure which contains the
+	 * mappings of the PCI device ids to the actual requestor ids on the IOMMU.
+	 * More than one device can share the same requestor id.
+	 */
+	u16 *alias_table;
 };
 
 /*
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index af413738da01..fe31de6e764c 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -698,6 +698,31 @@ static inline void free_irq_lookup_table(struct amd_iommu_pci_seg *pci_seg)
 	pci_seg->irq_lookup_table = NULL;
 }
 
+static int __init alloc_alias_table(struct amd_iommu_pci_seg *pci_seg)
+{
+	int i;
+
+	pci_seg->alias_table = (void *)__get_free_pages(GFP_KERNEL,
+						    get_order(alias_table_size));
+	if (!pci_seg->alias_table)
+		return -ENOMEM;
+
+	/*
+	 * let all alias entries point to itself
+	 */
+	for (i = 0; i <= amd_iommu_last_bdf; ++i)
+		pci_seg->alias_table[i] = i;
+
+	return 0;
+}
+
+static void __init free_alias_table(struct amd_iommu_pci_seg *pci_seg)
+{
+	free_pages((unsigned long)pci_seg->alias_table,
+		   get_order(alias_table_size));
+	pci_seg->alias_table = NULL;
+}
+
 /*
  * Allocates the command buffer. This buffer is per AMD IOMMU. We can
  * write commands to that buffer later and the IOMMU will execute them
@@ -1266,6 +1291,7 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 	u32 dev_i, ext_flags = 0;
 	bool alias = false;
 	struct ivhd_entry *e;
+	struct amd_iommu_pci_seg *pci_seg = iommu->pci_seg;
 	u32 ivhd_size;
 	int ret;
 
@@ -1347,7 +1373,7 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 			devid_to = e->ext >> 8;
 			set_dev_entry_from_acpi(iommu, devid   , e->flags, 0);
 			set_dev_entry_from_acpi(iommu, devid_to, e->flags, 0);
-			amd_iommu_alias_table[devid] = devid_to;
+			pci_seg->alias_table[devid] = devid_to;
 			break;
 		case IVHD_DEV_ALIAS_RANGE:
 
@@ -1405,7 +1431,7 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 			devid = e->devid;
 			for (dev_i = devid_start; dev_i <= devid; ++dev_i) {
 				if (alias) {
-					amd_iommu_alias_table[dev_i] = devid_to;
+					pci_seg->alias_table[dev_i] = devid_to;
 					set_dev_entry_from_acpi(iommu,
 						devid_to, flags, ext_flags);
 				}
@@ -1540,6 +1566,8 @@ static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id)
 
 	if (alloc_dev_table(pci_seg))
 		return NULL;
+	if (alloc_alias_table(pci_seg))
+		return NULL;
 	if (alloc_rlookup_table(pci_seg))
 		return NULL;
 
@@ -1566,6 +1594,7 @@ static void __init free_pci_segment(void)
 		list_del(&pci_seg->list);
 		free_irq_lookup_table(pci_seg);
 		free_rlookup_table(pci_seg);
+		free_alias_table(pci_seg);
 		free_dev_table(pci_seg);
 		kfree(pci_seg);
 	}
@@ -2838,7 +2867,7 @@ static void __init ivinfo_init(void *ivrs)
 static int __init early_amd_iommu_init(void)
 {
 	struct acpi_table_header *ivrs_base;
-	int i, remap_cache_sz, ret;
+	int remap_cache_sz, ret;
 	acpi_status status;
 
 	if (!amd_iommu_detected)
@@ -2909,12 +2938,6 @@ static int __init early_amd_iommu_init(void)
 	if (amd_iommu_pd_alloc_bitmap == NULL)
 		goto out;
 
-	/*
-	 * let all alias entries point to itself
-	 */
-	for (i = 0; i <= amd_iommu_last_bdf; ++i)
-		amd_iommu_alias_table[i] = i;
-
 	/*
 	 * never allocate domain 0 because its used as the non-allocated and
 	 * error value placeholder
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 63728e34e044..c6058b6f2538 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -243,7 +243,7 @@ static int clone_alias(struct pci_dev *pdev, u16 alias, void *data)
 	return 0;
 }
 
-static void clone_aliases(struct device *dev)
+static void clone_aliases(struct amd_iommu *iommu, struct device *dev)
 {
 	struct pci_dev *pdev;
 
@@ -256,14 +256,15 @@ static void clone_aliases(struct device *dev)
 	 * part of the PCI DMA aliases if it's bus differs
 	 * from the original device.
 	 */
-	clone_alias(pdev, amd_iommu_alias_table[pci_dev_id(pdev)], NULL);
+	clone_alias(pdev, iommu->pci_seg->alias_table[pci_dev_id(pdev)], NULL);
 
 	pci_for_each_dma_alias(pdev, clone_alias, NULL);
 }
 
-static void setup_aliases(struct device *dev)
+static void setup_aliases(struct amd_iommu *iommu, struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
+	struct amd_iommu_pci_seg *pci_seg = iommu->pci_seg;
 	u16 ivrs_alias;
 
 	/* For ACPI HID devices, there are no aliases */
@@ -274,12 +275,12 @@ static void setup_aliases(struct device *dev)
 	 * Add the IVRS alias to the pci aliases if it is on the same
 	 * bus. The IVRS table may know about a quirk that we don't.
 	 */
-	ivrs_alias = amd_iommu_alias_table[pci_dev_id(pdev)];
+	ivrs_alias = pci_seg->alias_table[pci_dev_id(pdev)];
 	if (ivrs_alias != pci_dev_id(pdev) &&
 	    PCI_BUS_NUM(ivrs_alias) == pdev->bus->number)
 		pci_add_dma_alias(pdev, ivrs_alias & 0xff, 1);
 
-	clone_aliases(dev);
+	clone_aliases(iommu, dev);
 }
 
 static struct iommu_dev_data *find_dev_data(u16 devid)
@@ -371,7 +372,7 @@ static bool check_device(struct device *dev)
 	return true;
 }
 
-static int iommu_init_device(struct device *dev)
+static int iommu_init_device(struct amd_iommu *iommu, struct device *dev)
 {
 	struct iommu_dev_data *dev_data;
 	int devid;
@@ -388,7 +389,7 @@ static int iommu_init_device(struct device *dev)
 		return -ENOMEM;
 
 	dev_data->dev = dev;
-	setup_aliases(dev);
+	setup_aliases(iommu, dev);
 
 	/*
 	 * By default we use passthrough mode for IOMMUv2 capable device.
@@ -409,7 +410,7 @@ static int iommu_init_device(struct device *dev)
 	return 0;
 }
 
-static void iommu_ignore_device(struct device *dev)
+static void iommu_ignore_device(struct amd_iommu *iommu, struct device *dev)
 {
 	int devid;
 
@@ -420,7 +421,7 @@ static void iommu_ignore_device(struct device *dev)
 	amd_iommu_rlookup_table[devid] = NULL;
 	memset(&amd_iommu_dev_table[devid], 0, sizeof(struct dev_table_entry));
 
-	setup_aliases(dev);
+	setup_aliases(iommu, dev);
 }
 
 static void amd_iommu_uninit_device(struct device *dev)
@@ -1290,6 +1291,7 @@ static int device_flush_dte(struct iommu_dev_data *dev_data)
 {
 	struct amd_iommu *iommu;
 	struct pci_dev *pdev = NULL;
+	struct amd_iommu_pci_seg *pci_seg;
 	u16 alias;
 	int ret;
 
@@ -1306,7 +1308,8 @@ static int device_flush_dte(struct iommu_dev_data *dev_data)
 	if (ret)
 		return ret;
 
-	alias = amd_iommu_alias_table[dev_data->devid];
+	pci_seg = iommu->pci_seg;
+	alias = pci_seg->alias_table[dev_data->devid];
 	if (alias != dev_data->devid) {
 		ret = iommu_flush_dte(iommu, alias);
 		if (ret)
@@ -1622,7 +1625,7 @@ static void do_attach(struct iommu_dev_data *dev_data,
 	/* Update device table */
 	set_dte_entry(dev_data->devid, domain,
 		      ats, dev_data->iommu_v2);
-	clone_aliases(dev_data->dev);
+	clone_aliases(iommu, dev_data->dev);
 
 	device_flush_dte(dev_data);
 }
@@ -1638,7 +1641,7 @@ static void do_detach(struct iommu_dev_data *dev_data)
 	dev_data->domain = NULL;
 	list_del(&dev_data->list);
 	clear_dte_entry(dev_data->devid);
-	clone_aliases(dev_data->dev);
+	clone_aliases(iommu, dev_data->dev);
 
 	/* Flush the DTE entry */
 	device_flush_dte(dev_data);
@@ -1821,12 +1824,12 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 	if (dev_iommu_priv_get(dev))
 		return &iommu->iommu;
 
-	ret = iommu_init_device(dev);
+	ret = iommu_init_device(iommu, dev);
 	if (ret) {
 		if (ret != -ENOTSUPP)
 			dev_err(dev, "Failed to initialize - trying to proceed anyway\n");
 		iommu_dev = ERR_PTR(ret);
-		iommu_ignore_device(dev);
+		iommu_ignore_device(iommu, dev);
 	} else {
 		amd_iommu_set_pci_msi_domain(dev, iommu);
 		iommu_dev = &iommu->iommu;
@@ -1877,9 +1880,13 @@ static void update_device_table(struct protection_domain *domain)
 	struct iommu_dev_data *dev_data;
 
 	list_for_each_entry(dev_data, &domain->dev_list, list) {
+		struct amd_iommu *iommu = rlookup_amd_iommu(dev_data->dev);
+
+		if (!iommu)
+			continue;
 		set_dte_entry(dev_data->devid, domain,
 			      dev_data->ats.enabled, dev_data->iommu_v2);
-		clone_aliases(dev_data->dev);
+		clone_aliases(iommu, dev_data->dev);
 	}
 }
 
@@ -2781,6 +2788,7 @@ static struct irq_remap_table *alloc_irq_table(u16 devid, struct pci_dev *pdev)
 {
 	struct irq_remap_table *table = NULL;
 	struct irq_remap_table *new_table = NULL;
+	struct amd_iommu_pci_seg *pci_seg;
 	struct amd_iommu *iommu;
 	unsigned long flags;
 	u16 alias;
@@ -2791,11 +2799,12 @@ static struct irq_remap_table *alloc_irq_table(u16 devid, struct pci_dev *pdev)
 	if (!iommu)
 		goto out_unlock;
 
+	pci_seg = iommu->pci_seg;
 	table = irq_lookup_table[devid];
 	if (table)
 		goto out_unlock;
 
-	alias = amd_iommu_alias_table[devid];
+	alias = pci_seg->alias_table[devid];
 	table = irq_lookup_table[alias];
 	if (table) {
 		set_remap_table_entry(iommu, devid, table);
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
