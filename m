Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01154D79F
	for <lists.iommu@lfdr.de>; Thu, 16 Jun 2022 03:56:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FC1140C84;
	Thu, 16 Jun 2022 01:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lx90rvloglT2; Thu, 16 Jun 2022 01:56:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6D32F40C86;
	Thu, 16 Jun 2022 01:56:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 550DDC002D;
	Thu, 16 Jun 2022 01:56:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A9A3C002D
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 01:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7624D83F9A
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 01:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HoPKAPZx4xLb for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 01:56:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::616])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9DAB83FA0
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 01:56:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDHXFhvqmj5wEC4pyLpwn7Puz2J68zTjACQHA9mQq30+uQpD2eH2BIbERCRrWZX2XYJYQGuR6caeLq/GSYS3eYxKzNVqVGT4U8RXkCWZXHJODHtotdIma13cdyl4Rvkl44vEroET7kOZBLKEhtZ+FqORxCVAJ89BOkYZx/bjCWRAMVtVlDWFZsOsccVIMTYcHsePxNJd4SPSjumu4Xnc0bA5rHeFSAJfQeo/s4BB+VoLYrlRKStBK6/S1LpbH3dZjr01R0+sb9rbB3K/G+l0CBGgeN+JougSTDi8OAtcfTEUszb+uhgjPQ/EaOtZsXzsPelopIc1fJP2m2LGiJVmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6yVpFxtkPWJlhdwVx2hjM9OeHJHsycJnst8oFkE+OY=;
 b=Qf1voM8oRGd3gc5yGxNW2OmMmMF4bp7J/CuRDDA6p3wC5fGUxB/K4WxhnSqeB1dvd/Y/hoBEzJrOjIcVf9Upe0AER6XJvFFl6+J1+q+OGLanRu2AKEJLQE2sMS8zdf7PfXY3oejKaS4uK4lR+CfwPhODUXd2o6A/SSrGXfHXxW/6egD4vca8SmU1IkORSkIWP/AFqkuZm3NYKL3NbKmxKVSldxbCRRNDvlqnnn2V3cFXJmIIRJFl3stQVzpUi+vuNj7+nUQd6KaWlpV+aMZ5//AhzphImNbdLC1kXq1wNzHC/1NK+bY3tXvuw0n+9XX1SIvZp70Kb0hnxJQ0qZWP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6yVpFxtkPWJlhdwVx2hjM9OeHJHsycJnst8oFkE+OY=;
 b=bbhdGmosYpcij1LnADydC4P5Pu2QTuV2UFMldpEdQpi3Vg7T5wgRA2DVRTYFUCuAtdN9mkW3sPGu76v5P9jYvArrTu4xNho0RfSGwCBAVRMgq3ccJP08oJ491JSDFe/eI5aDNsnkxZfLUDPxXpBgwoT7nPEPFzKcPs0SsorNb9Q=
Received: from MW4PR03CA0034.namprd03.prod.outlook.com (2603:10b6:303:8e::9)
 by MN2PR12MB4504.namprd12.prod.outlook.com (2603:10b6:208:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Thu, 16 Jun
 2022 01:56:25 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::3) by MW4PR03CA0034.outlook.office365.com
 (2603:10b6:303:8e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14 via Frontend
 Transport; Thu, 16 Jun 2022 01:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Thu, 16 Jun 2022 01:56:24 +0000
Received: from sp5-759chost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 15 Jun
 2022 20:55:55 -0500
To: <iommu@lists.linux-foundation.org>
Subject: [PATCH v2 2/7] iommu/amd: Process all IVHDs before enabling IOMMU
 features
Date: Wed, 15 Jun 2022 20:55:36 -0500
Message-ID: <20220616015541.11207-3-suravee.suthikulpanit@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616015541.11207-1-suravee.suthikulpanit@amd.com>
References: <20220616015541.11207-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a091a841-3ca8-476b-3d27-08da4f3b6b68
X-MS-TrafficTypeDiagnostic: MN2PR12MB4504:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB450496675091B362E8276263F3AC9@MN2PR12MB4504.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UayTc8ciVZay1ajbulaI4uh5EEkMoAQprtBSbUVzdjVA/nQIQitiYErTHZVrZbnnPpKtj82XGXkWl/zyb28u1T1HBE2KWF2UvhifHZ5UC3JzKGNBNPJGwgiy0k6vfrd5yKFHhqA5igC17V4R3qeNH4jiY7RG2FsHPj820FjSlP2yhkvwnXesQl5saVKJvzzG4YRdhrVwJa29OlkKg5uf17CwgAdqTnCx38RkbZcsnCD4x0ZJQ5XHROhAqpfMl3D40E/pwpMhxtMjrb+6C+PlCqCbpd0Lo51iHfNiizAMLX471SLMHSydZaQaVIMfuoCT3d8OTp9m2Pvwb7cIJi0c/0UmJ6sVF7w4YLW8yummyYMd9VhDyWoWWPtoEpA+LVxoJajXLHXh/6DZM6xIf3rWqHglfXK69WG+heINATDfTxyM+3q4/D1ycM+vPFW8KibyH6lpKwBpuf5U14xZ33c42CuhPvSiG7kjJInNgg8gZCMZ7ox70jSxklozuxa02RRhwHcHvgqWYpaz+E1Yw6CP9MYqkDZz7mpNVRa6bJqUObI6/nLLsK5lw8v2NRkc+An9tk6dWPo7xx/raczUxz2e8ZXh0ZHIG8Jolzvbvh2B/we5HiCKOkdEtMZQNWgI5r44GpgaMoNnb1NlKe56wQQ1vPEfyJZZvldkRxqsjI21LQ2hj2RM8aOs57OTmiTS6c3KiItd3Kxp1F4XERxcCrN48g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(316002)(83380400001)(44832011)(36756003)(36860700001)(70586007)(6916009)(4326008)(2906002)(70206006)(8676002)(54906003)(8936002)(16526019)(6666004)(82310400005)(26005)(47076005)(186003)(508600001)(336012)(426003)(86362001)(2616005)(1076003)(81166007)(356005)(40460700003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 01:56:24.8129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a091a841-3ca8-476b-3d27-08da4f3b6b68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4504
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, vasant.hegde@amd.com,
 robin.murphy@arm.com
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
From: Suravee Suthikulpanit via iommu <iommu@lists.linux-foundation.org>
Reply-To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The ACPI IVRS table can contain multiple IVHD blocks. Each block contains
information used to initialize each IOMMU instance.

Currently, init_iommu_all sequentially process IVHD block and initialize
IOMMU instance one-by-one. However, certain features require all IOMMUs
to be configured in the same way system-wide. In case certain IVHD blocks
contain inconsistent information (most likely FW bugs), the driver needs
to go through and try to revert settings on IOMMUs that have already been
configured.

A solution is to split IOMMU initialization into 3 phases:

Phase1 : Processes information of the IVRS table for all IOMMU instances.
This allow all IVHDs to be processed prior to enabling features.

Phase2 : Early feature support check on all IOMMUs (using information in
IVHD blocks.

Phase3 : Iterates through all IOMMU instances and enabling features.

Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 drivers/iommu/amd/init.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index b3e4551ce9dd..5f86e357dbaa 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -1692,7 +1692,6 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h,
 				 struct acpi_table_header *ivrs_base)
 {
 	struct amd_iommu_pci_seg *pci_seg;
-	int ret;
 
 	pci_seg = get_pci_segment(h->pci_seg, ivrs_base);
 	if (pci_seg == NULL)
@@ -1773,6 +1772,13 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h,
 	if (!iommu->mmio_base)
 		return -ENOMEM;
 
+	return init_iommu_from_acpi(iommu, h);
+}
+
+static int __init init_iommu_one_late(struct amd_iommu *iommu)
+{
+	int ret;
+
 	if (alloc_cwwb_sem(iommu))
 		return -ENOMEM;
 
@@ -1794,10 +1800,6 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h,
 	if (amd_iommu_pre_enabled)
 		amd_iommu_pre_enabled = translation_pre_enabled(iommu);
 
-	ret = init_iommu_from_acpi(iommu, h);
-	if (ret)
-		return ret;
-
 	if (amd_iommu_irq_remap) {
 		ret = amd_iommu_create_irq_domain(iommu);
 		if (ret)
@@ -1808,7 +1810,7 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h,
 	 * Make sure IOMMU is not considered to translate itself. The IVRS
 	 * table tells us so, but this is a lie!
 	 */
-	pci_seg->rlookup_table[iommu->devid] = NULL;
+	iommu->pci_seg->rlookup_table[iommu->devid] = NULL;
 
 	return 0;
 }
@@ -1853,6 +1855,7 @@ static int __init init_iommu_all(struct acpi_table_header *table)
 	end += table->length;
 	p += IVRS_HEADER_LENGTH;
 
+	/* Phase 1: Process all IVHD blocks */
 	while (p < end) {
 		h = (struct ivhd_header *)p;
 		if (*p == amd_iommu_target_ivhd_type) {
@@ -1878,6 +1881,15 @@ static int __init init_iommu_all(struct acpi_table_header *table)
 	}
 	WARN_ON(p != end);
 
+	/* Phase 2 : Early feature support check */
+
+	/* Phase 3 : Enabling IOMMU features */
+	for_each_iommu(iommu) {
+		ret = init_iommu_one_late(iommu);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.32.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
