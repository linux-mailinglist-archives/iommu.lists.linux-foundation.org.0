Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2E5686E9
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 13:43:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB198264A;
	Wed,  6 Jul 2022 11:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB198264A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tYjmHhcm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rj7thCqBwnAE; Wed,  6 Jul 2022 11:43:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E0A081A4E;
	Wed,  6 Jul 2022 11:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0A081A4E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2862CC0077;
	Wed,  6 Jul 2022 11:43:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 455EDC002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F37D240289
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37D240289
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tYjmHhcm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uULhHzv2suE for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 11:43:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A20CB4027E
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A20CB4027E
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIs9WsG5+q6+uztaxe5BFNEvw3LYFixI9KalD97wsWIDla94kmw4Wy5kh9NidUyEtL13JJuEfcICuyrUoeNZEhjRO4bZJ2GkQ3aV2rC9J458QZroneuywutkWMOJGDzvISpRt4etDEDS7deXNz5Xtyy0FFRevLuce4tDKnRRHS3mhbEPsBlYxTsugZInkcuXI45gdrzKJ4/aHRudqlloFv8bevTerAOWE//cI4C/h5rxtCYpsNiklVefo2n6XfjHFQNx/mXOBv8IXSyhs0hK+ckMws+IqD79HiMBAUAQjmZpWoJsI3gOliNFl/JLCJYCDKnG9PrniEX9z+BJIBk2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hARvj8F5gqeCU99F9rORUvmLPyJ/LX00m9f+PTv3pFM=;
 b=nFUarSVZMEL9V6Ihj3XC5bbYAhBVCs7xacHUiIi94QJzzdq3ZNt1+4rjdrRcUjqGe9SUDx+wpZ5rAzspFxQutah5ksr56kemzvD9EUWhU35NWtlg7y/XvWpQrtTPVM5GCvXlrNNgSjc853Tu9th4ehej9XeVCO4Z0O5VTziwbJsoc7HM5waoJc4emG8WfqRkfRmxYRDL0njIddx/vci/ZqSaE+iWBAeVcIqultNNehCYYbyyji6M8nwqBEPn9fK5+jdXhscn8LK8kCyJm721tA/pq+KjqEA8PVaSmP+l14FJ4yZhnfRS+rcmNZDdgpK2gma0MJ91fLG4foc7aHHGiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=8bytes.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hARvj8F5gqeCU99F9rORUvmLPyJ/LX00m9f+PTv3pFM=;
 b=tYjmHhcmIViv+sRfE4KK6glWOBCOEoYanYVnIOg4RhDI1mTS2rcIkbSn/jHMdZ6Y4KjpcP0BfyR5O/zGbwp4COis4+Fei6DUshdFz8fbcgpdSob7BTgaaaGlHNgEaU+yNSGH00Y8C7NDm9jk/kHUQLj2D+4lG5pMIAl7d50XK/w=
Received: from BN0PR04CA0175.namprd04.prod.outlook.com (2603:10b6:408:eb::30)
 by MN2PR12MB3615.namprd12.prod.outlook.com (2603:10b6:208:c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 11:43:12 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::8f) by BN0PR04CA0175.outlook.office365.com
 (2603:10b6:408:eb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 11:43:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 11:43:12 +0000
Received: from kali.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 06:43:09 -0500
To: <joro@8bytes.org>, <iommu@lists.linux.dev>
Subject: [PATCH v3 RESEND 03/35] iommu/amd: Introduce per PCI segment device
 table
Date: Wed, 6 Jul 2022 17:07:53 +0530
Message-ID: <20220706113825.25582-4-vasant.hegde@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706113825.25582-1-vasant.hegde@amd.com>
References: <20220706113825.25582-1-vasant.hegde@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b78e2508-5a03-49c3-388d-08da5f44b4c8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3615:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mq2H+005TxV5ccDoVAbRQTvI9oVZhL3RRwyH1Pkzc2Ldhel6k5m8VixzASAKfMuylPj6gK4MKXHVvS/uz5cMZG4RlrQjlUXS4GDYPJRh/xrzaaRWA86NH/FRTb6nI5skQN6Mmul0Rkiv/LtQHRoPQYGFdVJ0KZdF13CwnT1uzT0w8AoFRyuCrajvfDzLFgJyiYCCTv5GKPmoftacoIPOPfXl3g1d9/cWvSotriI03f8JBA++ffFpxs45FsR72OFEWEN29QYMn4omDFUuWOcnRbHFokVeB2Uh+ss89DoFzLQEu4Rx6Zdqtt7NtON5GCBLMaXXw168ouUFMBnHtrQHGJpt5XAFZIkc2hENIZt+ri53aHwgUxKC8gkq4dpvvIXJRZ7JLh2t7QR0n5Vlu27rG+KieEN4mfe7Qvfk84uKs3tnJaHy3S1WC8Vge3rb84kkAIc3sufNZDsqt76WjpW9r+yoDeF93ICF4RMREy2eCaDdLjTScMb0czVPIMPNN9H+x33kvDBZ+Jkby/JhKfanqzNh5Gg9NLkhJZLk2ubi+vmENQhULCPeqOEXTBkw9xAR36pE/bnk5onifpPdO3SmfS7sGhi+wGUpVk/Wr+lyISoPfhmj9OXB2pLJ2pHkOGuSu4fdr8RBmdi43mDGhbfsKGyz1rCZAWZ+yJqE/FBy2wWOl6b8uQDkVCm6XtXoayN8l+sn2crOg7MAxGPzzkaqRcVDnVDF8bWYYjEEpKpJ+EdxVpJICo37cuL6cXNATfIBWsuKZ9fprrNIka9J1PzYm4NPUAsRafVgGVZqTmjNfs5ryzYhtYz8Nmr2GyCTbk5dn08FQq+aENrZKrTU8CbiNVF/F19J/BodDfBZMs9EecSykhe7gD0MelaXQhoQ6Sey
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(54906003)(8676002)(4326008)(83380400001)(110136005)(70586007)(70206006)(2906002)(81166007)(82740400003)(356005)(8936002)(478600001)(36756003)(5660300002)(1076003)(26005)(186003)(16526019)(86362001)(82310400005)(44832011)(2616005)(34020700004)(36860700001)(6666004)(41300700001)(316002)(7696005)(47076005)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 11:43:12.1156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b78e2508-5a03-49c3-388d-08da5f44b4c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3615
Cc: iommu@lists.linux-foundation.org, Vasant Hegde <vasant.hegde@amd.com>
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

Introduce per PCI segment device table. All IOMMUs within the segment
will share this device table. This will replace global device
table i.e. amd_iommu_dev_table.

Also introduce helper function to get the device table for the given IOMMU.

Co-developed-by: Vasant Hegde <vasant.hegde@amd.com>
Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 drivers/iommu/amd/amd_iommu.h       |  1 +
 drivers/iommu/amd/amd_iommu_types.h | 10 ++++++++++
 drivers/iommu/amd/init.c            | 26 ++++++++++++++++++++++++--
 drivers/iommu/amd/iommu.c           | 12 ++++++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index 1ab31074f5b3..885570cd0d77 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -128,4 +128,5 @@ static inline void amd_iommu_apply_ivrs_quirks(void) { }
 
 extern void amd_iommu_domain_set_pgtable(struct protection_domain *domain,
 					 u64 *root, int mode);
+extern struct dev_table_entry *get_dev_table(struct amd_iommu *iommu);
 #endif
diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 2243b1a22d78..422ea87ae4c7 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -544,6 +544,16 @@ struct amd_iommu_pci_seg {
 
 	/* PCI segment number */
 	u16 id;
+
+	/*
+	 * device table virtual address
+	 *
+	 * Pointer to the per PCI segment device table.
+	 * It is indexed by the PCI device id or the HT unit id and contains
+	 * information about the domain the device belongs to as well as the
+	 * page table root pointer.
+	 */
+	struct dev_table_entry *dev_table;
 };
 
 /*
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index c1b5d530dbf3..5152243593bf 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -642,11 +642,29 @@ static int __init find_last_devid_acpi(struct acpi_table_header *table)
  *
  * The following functions belong to the code path which parses the ACPI table
  * the second time. In this ACPI parsing iteration we allocate IOMMU specific
- * data structures, initialize the device/alias/rlookup table and also
- * basically initialize the hardware.
+ * data structures, initialize the per PCI segment device/alias/rlookup table
+ * and also basically initialize the hardware.
  *
  ****************************************************************************/
 
+/* Allocate per PCI segment device table */
+static inline int __init alloc_dev_table(struct amd_iommu_pci_seg *pci_seg)
+{
+	pci_seg->dev_table = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO | GFP_DMA32,
+						      get_order(dev_table_size));
+	if (!pci_seg->dev_table)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static inline void free_dev_table(struct amd_iommu_pci_seg *pci_seg)
+{
+	free_pages((unsigned long)pci_seg->dev_table,
+		    get_order(dev_table_size));
+	pci_seg->dev_table = NULL;
+}
+
 /*
  * Allocates the command buffer. This buffer is per AMD IOMMU. We can
  * write commands to that buffer later and the IOMMU will execute them
@@ -1471,6 +1489,9 @@ static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id)
 	pci_seg->id = id;
 	list_add_tail(&pci_seg->list, &amd_iommu_pci_seg_list);
 
+	if (alloc_dev_table(pci_seg))
+		return NULL;
+
 	return pci_seg;
 }
 
@@ -1492,6 +1513,7 @@ static void __init free_pci_segments(void)
 
 	for_each_pci_segment_safe(pci_seg, next) {
 		list_del(&pci_seg->list);
+		free_dev_table(pci_seg);
 		kfree(pci_seg);
 	}
 }
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index efa8af5a9419..ac8f81f527b4 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -134,6 +134,18 @@ static inline int get_device_id(struct device *dev)
 	return devid;
 }
 
+struct dev_table_entry *get_dev_table(struct amd_iommu *iommu)
+{
+	struct dev_table_entry *dev_table;
+	struct amd_iommu_pci_seg *pci_seg = iommu->pci_seg;
+
+	BUG_ON(pci_seg == NULL);
+	dev_table = pci_seg->dev_table;
+	BUG_ON(dev_table == NULL);
+
+	return dev_table;
+}
+
 static struct protection_domain *to_pdomain(struct iommu_domain *dom)
 {
 	return container_of(dom, struct protection_domain, domain);
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
