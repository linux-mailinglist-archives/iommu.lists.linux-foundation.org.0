Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37D5686F0
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 13:44:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 542F740B16;
	Wed,  6 Jul 2022 11:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 542F740B16
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=m32h35C+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLqDbExU2QpM; Wed,  6 Jul 2022 11:44:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3C92C404F6;
	Wed,  6 Jul 2022 11:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C92C404F6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12D0BC0077;
	Wed,  6 Jul 2022 11:44:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A33DC002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13853404F6
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13853404F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Wmf7BoKSEAC for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 11:44:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D43B0404B7
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2058.outbound.protection.outlook.com [40.107.212.58])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D43B0404B7
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:44:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZSHUeamAYwo+FToudY20LvFzZ9gOSrtvRgmGaHRV4wqVVa0o50Vu9V+2g2tNFSBZ80KRRf+Xkb7ohmxRV498qZMLPHmbwy+lKMziDxlWe5vYnlA/NmNX0TelQVtcOLkLhbmMUUipWj03VZtPuIHZCN8Fs8VAUNbEt8kmMjDrjf00J9BP4DtXXHfW5OZcs0hGMh2L7vgG2E+qeIAzBFMCXpJdnaAQTf3qIGC0vI5YU3wpSxT1t+yV7pquC0N0dhu24DGzle5f4e5f6UFwFRumsbn6yWxNjfW7PIK2zkVDAHyOZhTE5R75DhxTfqSmYXTBFhrpsnsYGDPID6zynXEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nwgbVyElAiiiocLVaXk5WteoOj3jpvx1jZMUaHFamM=;
 b=VkDqGm2yWGwt1UAvUuIOT/KNnJ95Q6HLQplSnI0dFM3oM5kMbjcG3vmHWMBvzZcKW8HX1Y+3g/Jf1F8AudtkFxoTxhb8VwMeVOirK9VMwlYM2P9X+3vGGsDl8bt8MGyR93otUSi6iA2swdZeUBOAPLHr6lnM3ose336HHaNw2b80FzwmZt6YDycZaP0ElP+EedHakgxR2VZhwxFyvGva1R1D/Lmdl3P9MJig+dcMUgaH3j4EKsRKNwIJN0MvIknVfwW1+19EtfjZ2u6Ll3Xx8j7lAFZL6AJkSCdwVS8E+C4iKd39SkcSHV0N2/YvZE89+83hOe+q/oAYdHeykdZk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=8bytes.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nwgbVyElAiiiocLVaXk5WteoOj3jpvx1jZMUaHFamM=;
 b=m32h35C+fDBo4PJMD7C4SHw/KJJ97DI6gjM5tcuRtY8ar1CQmgrqpErQrQidI7YK+Iri1NOymPqfi5ZqQ10wyR71zxG7SNWOl+sG1nGzjcLqvXDmRisAA75HM/8zMk1JIErcSKNXQTbz0xV4t7E+fmOV8I2VZ+aYPI9wBfxvkJA=
Received: from BN9PR03CA0249.namprd03.prod.outlook.com (2603:10b6:408:ff::14)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 11:43:58 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::40) by BN9PR03CA0249.outlook.office365.com
 (2603:10b6:408:ff::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Wed, 6 Jul 2022 11:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 11:43:57 +0000
Received: from kali.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 06:43:54 -0500
To: <joro@8bytes.org>, <iommu@lists.linux.dev>
Subject: [PATCH v3 RESEND 06/35] iommu/amd: Introduce per PCI segment
 dev_data_list
Date: Wed, 6 Jul 2022 17:07:56 +0530
Message-ID: <20220706113825.25582-7-vasant.hegde@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706113825.25582-1-vasant.hegde@amd.com>
References: <20220706113825.25582-1-vasant.hegde@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e22dd034-6e5c-4cce-477e-08da5f44cfc7
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5611:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HYBoZG09aL+P4Kqed2k3egz09L/2bgf/8+vPPnXKWvN/PB6d/zPOtS0Lqgyaqzyy1hyAya1EUHnQEL0FAJ/pZyKWCBfg/Oe0NEcBVJIoViV+TtW/Mjl/gGQ0fpkOZVFaADvpnh8jsn91ldMKCjEbwDLM7NNvAxSOB1d3eELvMRquzPcBIBAkDN7xT0pj5k+NCMYRDDBoNfsAdratIdXlwKsz0fk8URIxbyQNYvnFC8xuGb5Fd4mzt/KLkDgVe0hAIALe+QBDJUdK0KAyqliFwc5GpYZDHCxej9sk/UL3IdrnXIhcV+J9g2pigbwEpMKp3s3tyi6hzzX44V/pHIjpBAZyYb8tWXUhZM/FxKg6/Z6V7JCYekQsERh4sxe1ijJ0YE+xFvpBYi7B4WEufrABTgjiaWAmPOukoclZwV+WgPlekT2VvoTnwOauFFJSifVg3vwY30I/40DU3kbiXpSQn35m6tJFfX/STVfIRjbZIwmVfBqCCO1HSFb5vsP486gIH/COCksSxxTCSvRa96qRdk/R1b643vSJslTx8SWrkt6qmDCEqaGljO7iSzf3AW9L7zpzuzQI+86kXF7y1l+uz7zRx6cpuv9qw9rn6NGwA8fEH596YZsTPEGoKyNQqnEaN3Zy1d3Pg8nHmTffnFGVgJ3qluJzi/otA1jdkI1pNO+dOb10PvY1X+AWS2KIZOYBmIlxltS6+IoW9340T5iq3ETXiIhszrmC5E/yFMvCsRKvJZ2f5g1c6/0I4Bz+LaCiBOUPptDGz1q1GDxwtfJ0Ps4mkeGjqIeBI4sIqbYahCNlgP6vSTqs0BFJCqjK4O+4Sq580E5bJzAnIiX4qJn47NI9rWsb9G5ImgYqs3nVpYfbifIflQXgld4Dv25+gQS3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(40470700004)(36840700001)(34020700004)(40480700001)(40460700003)(186003)(36860700001)(47076005)(16526019)(1076003)(83380400001)(36756003)(336012)(82310400005)(2616005)(2906002)(356005)(426003)(110136005)(70586007)(8676002)(70206006)(4326008)(44832011)(8936002)(7696005)(26005)(5660300002)(316002)(82740400003)(478600001)(86362001)(54906003)(41300700001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 11:43:57.4080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e22dd034-6e5c-4cce-477e-08da5f44cfc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611
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

This will replace global dev_data_list.

Co-developed-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Vasant Hegde <vasant.hegde@amd.com>
---
 drivers/iommu/amd/amd_iommu_types.h |  3 +++
 drivers/iommu/amd/init.c            |  1 +
 drivers/iommu/amd/iommu.c           | 21 ++++++++++-----------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index cfb5f0e44186..5f3cc704f131 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -546,6 +546,9 @@ struct amd_iommu_pci_seg {
 	/* List with all PCI segments in the system */
 	struct list_head list;
 
+	/* List of all available dev_data structures */
+	struct llist_head dev_data_list;
+
 	/* PCI segment number */
 	u16 id;
 
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index f6678dd56e28..509655f86851 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -1527,6 +1527,7 @@ static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id)
 		return NULL;
 
 	pci_seg->id = id;
+	init_llist_head(&pci_seg->dev_data_list);
 	list_add_tail(&pci_seg->list, &amd_iommu_pci_seg_list);
 
 	if (alloc_dev_table(pci_seg))
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index b0262b2e749d..48275da7fcb0 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -62,9 +62,6 @@
 
 static DEFINE_SPINLOCK(pd_bitmap_lock);
 
-/* List of all available dev_data structures */
-static LLIST_HEAD(dev_data_list);
-
 LIST_HEAD(ioapic_map);
 LIST_HEAD(hpet_map);
 LIST_HEAD(acpihid_map);
@@ -195,9 +192,10 @@ static struct protection_domain *to_pdomain(struct iommu_domain *dom)
 	return container_of(dom, struct protection_domain, domain);
 }
 
-static struct iommu_dev_data *alloc_dev_data(u16 devid)
+static struct iommu_dev_data *alloc_dev_data(struct amd_iommu *iommu, u16 devid)
 {
 	struct iommu_dev_data *dev_data;
+	struct amd_iommu_pci_seg *pci_seg = iommu->pci_seg;
 
 	dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
 	if (!dev_data)
@@ -207,19 +205,20 @@ static struct iommu_dev_data *alloc_dev_data(u16 devid)
 	dev_data->devid = devid;
 	ratelimit_default_init(&dev_data->rs);
 
-	llist_add(&dev_data->dev_data_list, &dev_data_list);
+	llist_add(&dev_data->dev_data_list, &pci_seg->dev_data_list);
 	return dev_data;
 }
 
-static struct iommu_dev_data *search_dev_data(u16 devid)
+static struct iommu_dev_data *search_dev_data(struct amd_iommu *iommu, u16 devid)
 {
 	struct iommu_dev_data *dev_data;
 	struct llist_node *node;
+	struct amd_iommu_pci_seg *pci_seg = iommu->pci_seg;
 
-	if (llist_empty(&dev_data_list))
+	if (llist_empty(&pci_seg->dev_data_list))
 		return NULL;
 
-	node = dev_data_list.first;
+	node = pci_seg->dev_data_list.first;
 	llist_for_each_entry(dev_data, node, dev_data_list) {
 		if (dev_data->devid == devid)
 			return dev_data;
@@ -288,10 +287,10 @@ static struct iommu_dev_data *find_dev_data(u16 devid)
 	struct iommu_dev_data *dev_data;
 	struct amd_iommu *iommu = amd_iommu_rlookup_table[devid];
 
-	dev_data = search_dev_data(devid);
+	dev_data = search_dev_data(iommu, devid);
 
 	if (dev_data == NULL) {
-		dev_data = alloc_dev_data(devid);
+		dev_data = alloc_dev_data(iommu, devid);
 		if (!dev_data)
 			return NULL;
 
@@ -3466,7 +3465,7 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 	struct vcpu_data *vcpu_pi_info = pi_data->vcpu_data;
 	struct amd_ir_data *ir_data = data->chip_data;
 	struct irq_2_irte *irte_info = &ir_data->irq_2_irte;
-	struct iommu_dev_data *dev_data = search_dev_data(irte_info->devid);
+	struct iommu_dev_data *dev_data = search_dev_data(NULL, irte_info->devid);
 
 	/* Note:
 	 * This device has never been set up for guest mode.
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
