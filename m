Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7314D5F04
	for <lists.iommu@lfdr.de>; Fri, 11 Mar 2022 10:59:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9DF84042B;
	Fri, 11 Mar 2022 09:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlhdsKqvVnlI; Fri, 11 Mar 2022 09:59:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1E8434018A;
	Fri, 11 Mar 2022 09:59:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0653BC000B;
	Fri, 11 Mar 2022 09:59:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C640C000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Mar 2022 09:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BBEA611EA
 for <iommu@lists.linux-foundation.org>; Fri, 11 Mar 2022 09:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obv6TRmt1uYG for <iommu@lists.linux-foundation.org>;
 Fri, 11 Mar 2022 09:59:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14D1060D80
 for <iommu@lists.linux-foundation.org>; Fri, 11 Mar 2022 09:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbG3KpOlk3u9XdBYPjhtLzbx5MDGLF3lToW9OAg8zS8mO3uhkM0fuWj75pBWUExCsLu4Y4PB0J8Et46BmAWSg//CNRa/5eqDdTcseq9kVl/fR7lcjCfQbWj9JS9QGHWw02QeBl1l7ZQLUa3C24oW+Qo4saNAf9fALmxJRQ2Mj4szcDSQA3W0xk5GjmTkrXNyRTSViIinyMIFy/guc+/OA4fyYA28Yv0QxgngyNcYvBGiyiBjDAXyUFVQWASj5XyZ9qO3UXap97axOJXWH2qu6jTCW37AwQjguSgjQooshVOwh4BEyGZ7tWf3yQObjeA7uf0zOL3oTjkWAPz7ecFplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHRSjx7F34tmeBLtxAj+HZOfaIEqkZtSCqk6FydmGwE=;
 b=CyuLlJHafSlvU63LU2RB63iUN6OV9PjEhFq0vFe5EkE1BwEy0eA+u0LWHca7hDzFu/4dPboYY+SS0W71thJFO1ABKwby2lLdHTryloL0m7DOwn8i3GTjbdoT7BMlut5samHyYeLKJKqGsRT0FJGcyOIDUoR9UdTwLU/m81MAKhiOeNuuvZC00I+YA7PmSeO8NobL4DFP++wpIwSqt4JyChaOpkr3smvcUVYGtJaptaH3CFSuFHUthg8lOp3X1GNjR3If9kwXxCZHsicWCt11TkElap9LMl6bqLG6htxcpRNnubHFxmqZBtW1s4wzfyfJPxT6hgmKfMoEwIehDaAapg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHRSjx7F34tmeBLtxAj+HZOfaIEqkZtSCqk6FydmGwE=;
 b=II9D+wHnnrrRzVux62zyWtSyHbj0bM9l/TSyQXIOzebNu5VzN6x/0QdnE+BhVcGOr/j4C6WghZXzNBfZ+cEPrg+Yfn1xJEuA/T2qUSpvb2dA7FVvYWY23NuiflVopGXTDvKk10U10oW54QEUgMBORty4POZJrGs/WUP2lZCj/wA=
Received: from DM6PR07CA0096.namprd07.prod.outlook.com (2603:10b6:5:337::29)
 by CH2PR12MB3669.namprd12.prod.outlook.com (2603:10b6:610:27::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 11 Mar
 2022 09:59:33 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::3f) by DM6PR07CA0096.outlook.office365.com
 (2603:10b6:5:337::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 09:59:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 09:59:33 +0000
Received: from kali.amdval.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 11 Mar
 2022 03:59:30 -0600
To: <iommu@lists.linux-foundation.org>, <joro@8bytes.org>
Subject: [RFC PATCH 28/36] iommu/amd: Remove global amd_iommu_last_bdf
Date: Fri, 11 Mar 2022 15:18:46 +0530
Message-ID: <20220311094854.31595-29-vasant.hegde@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220311094854.31595-1-vasant.hegde@amd.com>
References: <20220311094854.31595-1-vasant.hegde@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0facef7a-8af3-4e32-c702-08da0345d7c2
X-MS-TrafficTypeDiagnostic: CH2PR12MB3669:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB36692FB0C02B423CC2748613870C9@CH2PR12MB3669.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7HrfG/f96G2iRp77V8MrFgvsn2JpN9weVRH3tLsmfPMY3kEov1kEfJh+v3yJEKDcb86HBstxqTYAAnOyDxr5kDEYqjMBYf4CI5ktXY5qjKpXWRCEMSclQnG0OC5vc9bWF8DSe7qXI+89q3ww+U4fPXQ3lpFrNMiq8m8u3dToCFVsENGmi3+N2vJk5o0MKVnqbWu8wLLRNznnS9jsIAW5xxrVi0aWwsMLDduMD2jeTA1v+4k0IWLt6CEvU5MaqjCxXPT9TANqmS1hmezy442yYxojy5tlNsocNyzoY9E2GRTdNcDUGZp0sKwFzFjFyDSst1fHpKdgSJ5+Ovn8m5TXgjW5Ce/YQYVVJCBZx8lO1WiRH2fHkTHuFsOUKdoYrFp9dDd82hw+6WaOtBNPhCGtfcg3tRT8syIpQsYPfI5q3OEM5mHj8i5CAO4ilRHQWjN+yw5ByceLGlYDWT3W2yR4tiQrUNJU6PeBbZuOrzrSvb6fA1dSo6GzYu13ddo2CkhtIDfNfms2fp6AuVRKVpUvAmGwqJgQIipSny8FBLxm4KXHGeGENW8WYJVjGGPviHDLRPMosWBwRVGmdsXkn2FDI7wIgXxoNckjsaUxyd2wj2BwAmaZqo+rz+nLT8jOmLPdqifh4Ob0Te/IY3dcIPx1giCqqpwpR/1bht0LrSRjBT6yQvXxrsICxYDAqfl7n2S6kdxU1UssqKjxUmv87l5TQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70206006)(8676002)(4326008)(2906002)(16526019)(44832011)(86362001)(36756003)(83380400001)(1076003)(26005)(2616005)(426003)(336012)(186003)(316002)(47076005)(36860700001)(508600001)(6666004)(8936002)(82310400004)(110136005)(54906003)(5660300002)(356005)(40460700003)(81166007)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 09:59:33.2745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0facef7a-8af3-4e32-c702-08da0345d7c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3669
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

Replace it with per PCI segment last_bdf variable.

Co-developed-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
---
 drivers/iommu/amd/amd_iommu_types.h |  3 ---
 drivers/iommu/amd/init.c            | 35 ++++++++++-------------------
 drivers/iommu/amd/iommu.c           | 10 ++++++---
 3 files changed, 19 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 7d719461db27..a57676b5ec27 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -829,9 +829,6 @@ struct unity_map_entry {
 /* size of the dma_ops aperture as power of 2 */
 extern unsigned amd_iommu_aperture_order;
 
-/* largest PCI device id we expect translation requests for */
-extern u16 amd_iommu_last_bdf;
-
 /* allocation bitmap for domain ids */
 extern unsigned long *amd_iommu_pd_alloc_bitmap;
 
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index b3905b1c4bc9..093304d16c85 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -161,9 +161,6 @@ static bool amd_iommu_disabled __initdata;
 static bool amd_iommu_force_enable __initdata;
 static int amd_iommu_target_ivhd_type;
 
-u16 amd_iommu_last_bdf;			/* largest PCI device id we have
-					   to handle */
-
 LIST_HEAD(amd_iommu_pci_seg_list);	/* list of all PCI segments */
 LIST_HEAD(amd_iommu_list);		/* list of all AMD IOMMUs in the
 					   system */
@@ -245,16 +242,10 @@ static void init_translation_status(struct amd_iommu *iommu)
 		iommu->flags |= AMD_IOMMU_FLAG_TRANS_PRE_ENABLED;
 }
 
-static inline void update_last_devid(u16 devid)
-{
-	if (devid > amd_iommu_last_bdf)
-		amd_iommu_last_bdf = devid;
-}
-
-static inline unsigned long tbl_size(int entry_size)
+static inline unsigned long tbl_size(int entry_size, int last_bdf)
 {
 	unsigned shift = PAGE_SHIFT +
-			 get_order(((int)amd_iommu_last_bdf + 1) * entry_size);
+			 get_order((last_bdf + 1) * entry_size);
 
 	return 1UL << shift;
 }
@@ -538,7 +529,6 @@ static int __init find_last_devid_from_ivhd(struct ivhd_header *h)
 		switch (dev->type) {
 		case IVHD_DEV_ALL:
 			/* Use maximum BDF value for DEV_ALL */
-			update_last_devid(0xffff);
 			return 0xffff;
 			break;
 		case IVHD_DEV_SELECT:
@@ -546,7 +536,6 @@ static int __init find_last_devid_from_ivhd(struct ivhd_header *h)
 		case IVHD_DEV_ALIAS:
 		case IVHD_DEV_EXT_SELECT:
 			/* all the above subfield types refer to device ids */
-			update_last_devid(dev->devid);
 			if (dev->devid > last_devid)
 				last_devid = dev->devid;
 			break;
@@ -688,7 +677,7 @@ static int __init alloc_alias_table(struct amd_iommu_pci_seg *pci_seg)
 	/*
 	 * let all alias entries point to itself
 	 */
-	for (i = 0; i <= amd_iommu_last_bdf; ++i)
+	for (i = 0; i <= pci_seg->last_bdf; ++i)
 		pci_seg->alias_table[i] = i;
 
 	return 0;
@@ -1054,7 +1043,7 @@ static bool __copy_device_table(struct amd_iommu *iommu)
 		return false;
 	}
 
-	for (devid = 0; devid <= amd_iommu_last_bdf; ++devid) {
+	for (devid = 0; devid <= pci_seg->last_bdf; ++devid) {
 		pci_seg->old_dev_tbl_cpy[devid] = old_devtb[devid];
 		dom_id = old_devtb[devid].data[1] & DEV_DOMID_MASK;
 		dte_v = old_devtb[devid].data[0] & DTE_FLAG_V;
@@ -1315,7 +1304,7 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 
 			DUMP_printk("  DEV_ALL\t\t\tflags: %02x\n", e->flags);
 
-			for (dev_i = 0; dev_i <= amd_iommu_last_bdf; ++dev_i)
+			for (dev_i = 0; dev_i <= pci_seg->last_bdf; ++dev_i)
 				set_dev_entry_from_acpi(iommu, dev_i, e->flags, 0);
 			break;
 		case IVHD_DEV_SELECT:
@@ -1560,9 +1549,9 @@ static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id,
 
 	pci_seg->last_bdf = last_bdf;
 	DUMP_printk("PCI segment : 0x%0x, last bdf : 0x%04x\n", id, last_bdf);
-	pci_seg->dev_table_size     = tbl_size(DEV_TABLE_ENTRY_SIZE);
-	pci_seg->alias_table_size   = tbl_size(ALIAS_TABLE_ENTRY_SIZE);
-	pci_seg->rlookup_table_size = tbl_size(RLOOKUP_TABLE_ENTRY_SIZE);
+	pci_seg->dev_table_size     = tbl_size(DEV_TABLE_ENTRY_SIZE, last_bdf);
+	pci_seg->alias_table_size   = tbl_size(ALIAS_TABLE_ENTRY_SIZE, last_bdf);
+	pci_seg->rlookup_table_size = tbl_size(RLOOKUP_TABLE_ENTRY_SIZE, last_bdf);
 
 	pci_seg->id = id;
 	init_llist_head(&pci_seg->dev_data_list);
@@ -2443,7 +2432,7 @@ static int __init init_unity_map_range(struct ivmd_header *m,
 	case ACPI_IVMD_TYPE_ALL:
 		s = "IVMD_TYPE_ALL\t\t";
 		e->devid_start = 0;
-		e->devid_end = amd_iommu_last_bdf;
+		e->devid_end = pci_seg->last_bdf;
 		break;
 	case ACPI_IVMD_TYPE_RANGE:
 		s = "IVMD_TYPE_RANGE\t\t";
@@ -2510,7 +2499,7 @@ static void init_device_table_dma(struct amd_iommu_pci_seg *pci_seg)
 	if (dev_table == NULL)
 		return;
 
-	for (devid = 0; devid <= amd_iommu_last_bdf; ++devid) {
+	for (devid = 0; devid <= pci_seg->last_bdf; ++devid) {
 		__set_dev_entry_bit(dev_table, devid, DEV_ENTRY_VALID);
 		__set_dev_entry_bit(dev_table, devid, DEV_ENTRY_TRANSLATION);
 	}
@@ -2524,7 +2513,7 @@ static void __init uninit_device_table_dma(struct amd_iommu_pci_seg *pci_seg)
 	if (dev_table == NULL)
 		return;
 
-	for (devid = 0; devid <= amd_iommu_last_bdf; ++devid) {
+	for (devid = 0; devid <= pci_seg->last_bdf; ++devid) {
 		dev_table[devid].data[0] = 0ULL;
 		dev_table[devid].data[1] = 0ULL;
 	}
@@ -2539,7 +2528,7 @@ static void init_device_table(void)
 		return;
 
 	for_each_pci_segment(pci_seg) {
-		for (devid = 0; devid <= amd_iommu_last_bdf; ++devid)
+		for (devid = 0; devid <= pci_seg->last_bdf; ++devid)
 			__set_dev_entry_bit(pci_seg->dev_table,
 					    devid, DEV_ENTRY_IRQ_TBL_EN);
 	}
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 9ffe27f04776..c4e17f11fcf8 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -357,6 +357,8 @@ static bool pci_iommuv2_capable(struct pci_dev *pdev)
  */
 static bool check_device(struct device *dev)
 {
+	struct amd_iommu_pci_seg *pci_seg;
+	struct amd_iommu *iommu;
 	int devid;
 
 	if (!dev)
@@ -366,11 +368,13 @@ static bool check_device(struct device *dev)
 	if (devid < 0)
 		return false;
 
-	/* Out of our scope? */
-	if (devid > amd_iommu_last_bdf)
+	iommu = rlookup_amd_iommu(dev);
+	if (!iommu)
 		return false;
 
-	if (rlookup_amd_iommu(dev) == NULL)
+	/* Out of our scope? */
+	pci_seg = iommu->pci_seg;
+	if ((devid & 0xffff) > pci_seg->last_bdf)
 		return false;
 
 	return true;
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
