Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF6F4F124C
	for <lists.iommu@lfdr.de>; Mon,  4 Apr 2022 11:45:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A99B60D88;
	Mon,  4 Apr 2022 09:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wi_EU6Pr3Lkt; Mon,  4 Apr 2022 09:45:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0AF1460A80;
	Mon,  4 Apr 2022 09:45:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA3FCC0012;
	Mon,  4 Apr 2022 09:45:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E05FC0012
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 09:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D90F60C34
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 09:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMR8gSNIS1Jc for <iommu@lists.linux-foundation.org>;
 Mon,  4 Apr 2022 09:45:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30A1B60A80
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 09:45:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxkvqzsxbLOgZaE9243lQlBnAiMHGr8Mdhl/FrNRDX1MAU3nk0/RqCgfuyGTdovE7frGwxzIMaMzBZyv794Ng74rpYm2HWmPC+y9kGGrsvWJBR4SWAvNKz6a4w5UMHhOv40jb2gXEiBlDQ2lAungzykxpDIUweV2zatf4Gx0LDyfXIzN6nDytVelVZianJIJF6XYeCvjN48BHCka/3/ofbEEMGeK9QEPkEl4yiQNfIdC73lMm1N78J7uTc1i/j4lqp9AMUcizfl8YwIYSDGNVP3ctNiaOquCCQ+2ar3LhZT6TPQHguSH8WCVr18OvSPf79FOFWYUiR7gOOfKokMQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IajpVcjO8h8eoS6fd4d11l9UxZbjyeClUWmfJVOXPI=;
 b=WHJp47U3bguI17k4VIZ3Oqtj6lKaugdFpUCM14tJrp/tKqxqRygq/rUIL5zU9AikG0YaOzIWvb0iVYf6ir/v9xNW1btgkasnSy6exqedAK3XLsddQWCOtqMCN4NoXkAvhddtss97kgLW6cC8AqguKZGnp/dgzWOEUJd40n7a6mA+nnyJyF+VmPZSf/W3YLXHe1x6J20ssuAJw77n4ha3m9u9LyuCjUgGolu9LchguJom3NNWIJ2bPbbCfd6+cKFDhxxIM2nPjyl1Ej9afTSHu82ISL+HiqU96ylCRF6PALoWZbdLaNXelXXZ5O8XDYF7J3M/vcxtzqL6RV5Nffafrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IajpVcjO8h8eoS6fd4d11l9UxZbjyeClUWmfJVOXPI=;
 b=qpWIgVjtIgzy8hJmAZ22N6+ADHQGSb+6HzUWEXx6cOfxYZEC9RdQOlS/FNIajJw/RGGNHKeCYKAZSY8GGTDS0yNf8WsIv8DipQacozxHjIv+sRUg8nsIiw0gslyxV6uCVEIIcV1BsCVOKzSXd8pxduC/CfiZdavlgVxnuqKsZSs=
Received: from DM6PR05CA0041.namprd05.prod.outlook.com (2603:10b6:5:335::10)
 by DM6PR12MB3721.namprd12.prod.outlook.com (2603:10b6:5:1c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 09:45:49 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::21) by DM6PR05CA0041.outlook.office365.com
 (2603:10b6:5:335::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.14 via Frontend
 Transport; Mon, 4 Apr 2022 09:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Mon, 4 Apr 2022 09:45:48 +0000
Received: from kali.amdval.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 04:45:46 -0500
To: <iommu@lists.linux-foundation.org>, <joro@8bytes.org>
Subject: [PATCH v1 10/37] iommu/amd: Introduce per PCI segment last_bdf
Date: Mon, 4 Apr 2022 15:11:02 +0530
Message-ID: <20220404094129.323642-11-vasant.hegde@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404094129.323642-1-vasant.hegde@amd.com>
References: <20220404094129.323642-1-vasant.hegde@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8aee54d-ddf4-4ab3-72db-08da161fe63a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3721:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3721B78ECD099A95946C177487E59@DM6PR12MB3721.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBprYi3npVVqYrjDtNZM8gtXFP/YYSxE71mG6UDHiYpQqg9drFifLGzNfRYGnmLHR1NbWAPovPSwVAUtYi+mjf6K6wvF+++xZZlqKoMaUAy80+GVRBWCMo9panV2BlMjkZ11+1LEsGTxhliYFcvkxPjv+4q1TQRh8cAJfAP3uVSuZu29u9PWfFz9bEc/v1jTbgtzTgTCy4gpZE4Aa9CfFhq5rmSYxybef3EZ3kS+jr3lFblL3rXvSxet2lUzam+9K38EdG7hd8xp0O0DP479cZVWMvzj/z5JBxU/FAsKb5D89KOmm1qsvfV3AkT90K2PPjA9W02c/0VhNvTlyi2PuLfFP0dnctVDL4Db/fw+nyoDf5OsPAi7nW+K6ow+XBnt7hR+9oWqItqC4bf5COS27D+8IX5YFKnyKOeq+dEZ0xM4BzBSDMARkd6VwJ3jFJ3NgI5RBcg0HC7v6aa2fJVuV3k46QvVKe67wbIxoASfYmxAKBSnxm0Qx1rzQ9W5B+m3QaVeBOS5F+kKQQjhT/PcSuu6H4K6r+32/my2sbcaMdr+lOJ6ULfdUeOKS7Fp7honStUmGxJJ7gvrF8mhoRbuIKdo9t4No55qnRWX1jnH6o63YT3LfjFwWNTgMSRkohKnrj2CtijU1nPDMKDJAK1s45lJUpFC7sws8GVzrn6dVHcudQsZEp5jf5RZe1Wm/jNzcDFHcKKMN1bW+uM1b3+w8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(316002)(110136005)(54906003)(36860700001)(83380400001)(36756003)(5660300002)(40460700003)(356005)(70206006)(81166007)(86362001)(2906002)(70586007)(8936002)(426003)(44832011)(16526019)(336012)(1076003)(26005)(186003)(82310400004)(6666004)(2616005)(508600001)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 09:45:48.7640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8aee54d-ddf4-4ab3-72db-08da161fe63a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3721
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

Current code uses global "amd_iommu_last_bdf" to track the last bdf
supported by the system. This value is used for various memory
allocation, device data flushing, etc.

Introduce per PCI segment last_bdf which will be used to track last bdf
supported by the given PCI segment and use this value for all per
segment memory allocations. Eventually it will replace global
"amd_iommu_last_bdf".

Co-developed-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
---
 drivers/iommu/amd/amd_iommu_types.h |  3 ++
 drivers/iommu/amd/init.c            | 68 ++++++++++++++++++-----------
 2 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index c4c9c35e2bf7..e39e7db54e69 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -544,6 +544,9 @@ struct amd_iommu_pci_seg {
 	/* PCI segment number */
 	u16 id;
 
+	/* Largest PCI device id we expect translation requests for */
+	u16 last_bdf;
+
 	/*
 	 * device table virtual address
 	 *
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index d613e20ea013..71f39551a83a 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -550,6 +550,7 @@ static int __init find_last_devid_from_ivhd(struct ivhd_header *h)
 {
 	u8 *p = (void *)h, *end = (void *)h;
 	struct ivhd_entry *dev;
+	int last_devid = -EINVAL;
 
 	u32 ivhd_size = get_ivhd_header_size(h);
 
@@ -567,6 +568,7 @@ static int __init find_last_devid_from_ivhd(struct ivhd_header *h)
 		case IVHD_DEV_ALL:
 			/* Use maximum BDF value for DEV_ALL */
 			update_last_devid(0xffff);
+			return 0xffff;
 			break;
 		case IVHD_DEV_SELECT:
 		case IVHD_DEV_RANGE_END:
@@ -574,6 +576,8 @@ static int __init find_last_devid_from_ivhd(struct ivhd_header *h)
 		case IVHD_DEV_EXT_SELECT:
 			/* all the above subfield types refer to device ids */
 			update_last_devid(dev->devid);
+			if (dev->devid > last_devid)
+				last_devid = dev->devid;
 			break;
 		default:
 			break;
@@ -583,7 +587,7 @@ static int __init find_last_devid_from_ivhd(struct ivhd_header *h)
 
 	WARN_ON(p != end);
 
-	return 0;
+	return last_devid;
 }
 
 static int __init check_ivrs_checksum(struct acpi_table_header *table)
@@ -607,27 +611,31 @@ static int __init check_ivrs_checksum(struct acpi_table_header *table)
  * id which we need to handle. This is the first of three functions which parse
  * the ACPI table. So we check the checksum here.
  */
-static int __init find_last_devid_acpi(struct acpi_table_header *table)
+static int __init find_last_devid_acpi(struct acpi_table_header *table, u16 pci_seg)
 {
 	u8 *p = (u8 *)table, *end = (u8 *)table;
 	struct ivhd_header *h;
+	int last_devid, last_bdf = 0;
 
 	p += IVRS_HEADER_LENGTH;
 
 	end += table->length;
 	while (p < end) {
 		h = (struct ivhd_header *)p;
-		if (h->type == amd_iommu_target_ivhd_type) {
-			int ret = find_last_devid_from_ivhd(h);
-
-			if (ret)
-				return ret;
+		if (h->pci_seg == pci_seg &&
+		    h->type == amd_iommu_target_ivhd_type) {
+			last_devid = find_last_devid_from_ivhd(h);
+
+			if (last_devid < 0)
+				return -EINVAL;
+			if (last_devid > last_bdf)
+				last_bdf = last_devid;
 		}
 		p += h->length;
 	}
 	WARN_ON(p != end);
 
-	return 0;
+	return last_bdf;
 }
 
 /****************************************************************************
@@ -1551,14 +1559,28 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 }
 
 /* Allocate PCI segment data structure */
-static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id)
+static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id,
+					  struct acpi_table_header *ivrs_base)
 {
 	struct amd_iommu_pci_seg *pci_seg;
+	int last_bdf;
+
+	/*
+	 * First parse ACPI tables to find the largest Bus/Dev/Func we need to
+	 * handle in this PCI segment. Upon this information the shared data
+	 * structures for the PCI segments in the system will be allocated.
+	 */
+	last_bdf = find_last_devid_acpi(ivrs_base, id);
+	if (last_bdf < 0)
+		return NULL;
 
 	pci_seg = kzalloc(sizeof(struct amd_iommu_pci_seg), GFP_KERNEL);
 	if (pci_seg == NULL)
 		return NULL;
 
+	pci_seg->last_bdf = last_bdf;
+	DUMP_printk("PCI segment : 0x%0x, last bdf : 0x%04x\n", id, last_bdf);
+
 	pci_seg->id = id;
 	init_llist_head(&pci_seg->dev_data_list);
 	INIT_LIST_HEAD(&pci_seg->unity_map);
@@ -1574,7 +1596,8 @@ static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id)
 	return pci_seg;
 }
 
-static struct amd_iommu_pci_seg *__init get_pci_segment(u16 id)
+static struct amd_iommu_pci_seg *__init get_pci_segment(u16 id,
+					struct acpi_table_header *ivrs_base)
 {
 	struct amd_iommu_pci_seg *pci_seg;
 
@@ -1583,7 +1606,7 @@ static struct amd_iommu_pci_seg *__init get_pci_segment(u16 id)
 			return pci_seg;
 	}
 
-	return alloc_pci_segment(id);
+	return alloc_pci_segment(id, ivrs_base);
 }
 
 static void __init free_pci_segment(void)
@@ -1684,12 +1707,13 @@ static void amd_iommu_ats_write_check_workaround(struct amd_iommu *iommu)
  * together and also allocates the command buffer and programs the
  * hardware. It does NOT enable the IOMMU. This is done afterwards.
  */
-static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h)
+static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h,
+				 struct acpi_table_header *ivrs_base)
 {
 	struct amd_iommu_pci_seg *pci_seg;
 	int ret;
 
-	pci_seg = get_pci_segment(h->pci_seg);
+	pci_seg = get_pci_segment(h->pci_seg, ivrs_base);
 	if (pci_seg == NULL)
 		return -ENOMEM;
 	iommu->pci_seg = pci_seg;
@@ -1864,7 +1888,7 @@ static int __init init_iommu_all(struct acpi_table_header *table)
 			if (iommu == NULL)
 				return -ENOMEM;
 
-			ret = init_iommu_one(iommu, h);
+			ret = init_iommu_one(iommu, h, table);
 			if (ret)
 				return ret;
 		}
@@ -2408,13 +2432,14 @@ static void __init free_unity_maps(void)
 }
 
 /* called for unity map ACPI definition */
-static int __init init_unity_map_range(struct ivmd_header *m)
+static int __init init_unity_map_range(struct ivmd_header *m,
+				       struct acpi_table_header *ivrs_base)
 {
 	struct unity_map_entry *e = NULL;
 	struct amd_iommu_pci_seg *pci_seg;
 	char *s;
 
-	pci_seg = get_pci_segment(m->pci_seg);
+	pci_seg = get_pci_segment(m->pci_seg, ivrs_base);
 	if (pci_seg == NULL)
 		return -ENOMEM;
 
@@ -2481,7 +2506,7 @@ static int __init init_memory_definitions(struct acpi_table_header *table)
 	while (p < end) {
 		m = (struct ivmd_header *)p;
 		if (m->flags & (IVMD_FLAG_UNITY_MAP | IVMD_FLAG_EXCL_RANGE))
-			init_unity_map_range(m);
+			init_unity_map_range(m, table);
 
 		p += m->length;
 	}
@@ -2905,15 +2930,6 @@ static int __init early_amd_iommu_init(void)
 	amd_iommu_target_ivhd_type = get_highest_supported_ivhd_type(ivrs_base);
 	DUMP_printk("Using IVHD type %#x\n", amd_iommu_target_ivhd_type);
 
-	/*
-	 * First parse ACPI tables to find the largest Bus/Dev/Func
-	 * we need to handle. Upon this information the shared data
-	 * structures for the IOMMUs in the system will be allocated
-	 */
-	ret = find_last_devid_acpi(ivrs_base);
-	if (ret)
-		goto out;
-
 	dev_table_size     = tbl_size(DEV_TABLE_ENTRY_SIZE);
 	alias_table_size   = tbl_size(ALIAS_TABLE_ENTRY_SIZE);
 	rlookup_table_size = tbl_size(RLOOKUP_TABLE_ENTRY_SIZE);
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
