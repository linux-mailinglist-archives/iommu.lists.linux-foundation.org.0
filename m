Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74A4F1A39
	for <lists.iommu@lfdr.de>; Mon,  4 Apr 2022 22:47:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C26C440576;
	Mon,  4 Apr 2022 20:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOF1Pke_qT-O; Mon,  4 Apr 2022 20:47:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ABF9C40327;
	Mon,  4 Apr 2022 20:47:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82EFAC0073;
	Mon,  4 Apr 2022 20:47:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5514C0012
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 20:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C358E409A3
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 20:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBTsvb6UJ8Ag for <iommu@lists.linux-foundation.org>;
 Mon,  4 Apr 2022 20:47:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::603])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14CF74090F
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 20:47:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLNkNBj6HBCKhD5HNgnrm4Sm/dI6RijUz/+a5Jimf/a+s41b0V31ubKYv0LElE1lVS6Hmf0bksNjPplNvD+hLlrnfsSY7kDS71CTOtq0zlnySDFNG6hvRPQg0eRG6lmbVubDuNIwDc+7mt4gvbledjx1WdGH39RRctNwXkhLfzq8f2cAZRyW2WtaYOy8q91TMkoXcL54FMPXc5BAj+7TlWfzB/kXN0npbDXQH31Mq+Fi7kV8TySaNuGdxZvD40Al/YSqLUrnZu7H2tT1cuRa2IV0n3Ahu6W1/gGumuNVueVQVR6nMXOhrJKAZcKmABQjXPaZykijbo4V1gyj3VTb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94JCOCW+fPlUnwlKPkgEWPmXrX+ICQvnUxZJn9I/A7g=;
 b=ZT1wJKREbohNq2al8bz9/qs5Q/jJOrltl07E3GZuYmmbtwH59KKODqSlMZ5T79DDqtIN/csqqxEtlRFMUOT0mtPA7gwl2UjsdWAv1+mhtZnM+FUOcY8xF5f0JjeXJu1rEa+3in31m5cnbeu11LVo0cRr9TM+eZYGJmnw6NuRKoP3YO4AWcs9iCkehdW4WMJCpBSr0OKvDTxZhPtjOq6e6ijSXeLPdGEl27j+b73rCe4HFOBvUsR3rZj/KtfVt6bY/YXjCKWwKcO2WXyq9LOHxzaf1MNjjvTz7IaVohkvZNTr/oDdc7PwsNW+1CuLOmYbt3P3j+nBi22g5dCDsEpWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=8bytes.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94JCOCW+fPlUnwlKPkgEWPmXrX+ICQvnUxZJn9I/A7g=;
 b=QPOsZL1uqBYRAiG2Hcdzg6x4YGaIOsWkyC9HkZyxUVAV3bM7xjoPabYsUfuMx8FOBLqplNJkrrVR4BlMEPbn0wgYPpNtPXJabXx3gnZx0lNPHZAjdB5QoAYD8zwhEwLnAM7CPbU0Wts1nHD0uSZwlV2cnYd9wI5iv1UlDNlZ890=
Received: from BN9PR03CA0482.namprd03.prod.outlook.com (2603:10b6:408:130::7)
 by MW2PR12MB2379.namprd12.prod.outlook.com (2603:10b6:907:9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Mon, 4 Apr
 2022 20:47:36 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::7f) by BN9PR03CA0482.outlook.office365.com
 (2603:10b6:408:130::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Mon, 4 Apr 2022 20:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Mon, 4 Apr 2022 20:47:35 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 15:47:33 -0500
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v2 1/2] iommu/amd: Enable swiotlb in all cases
Date: Mon, 4 Apr 2022 15:47:22 -0500
Message-ID: <20220404204723.9767-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404204723.9767-1-mario.limonciello@amd.com>
References: <20220404204723.9767-1-mario.limonciello@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3dc8a52-0453-4fd9-fdd4-08da167c5941
X-MS-TrafficTypeDiagnostic: MW2PR12MB2379:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB237903CAEA08DC5F8345666AE2E59@MW2PR12MB2379.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cpp2Jf31DLwsNwb3AywUGP3b7es8cHmdHzWytPgyqgm+f715CuUrO8A1LftsYs3lBOIkFZbiVbCkgpiUxdHJxadRWnJIIZGr2d9VuZUZAyDZrmJrLrws1W9G8twLh5yxFZLsgnBPy8LUkvUR4vrq+4aw5N9LJWzJ5ZI/jHhHRpvxI6Z8Ak+JCRBxAVPrKkDHBukHInPH9ixTH8DTVJDaGEjt77/EeYWnYRFecfdERPzWjbs5nf8xRAwUHeUafZAUQWJZ320KdmEHC205GdSvEuqr8j/L6Ze0u1e3IztAykjXo1h+k8gtfg+/GTAlVzB68f0g+c5H/dKQyxmhG7Gfp8nz5rGZw/mqyCEzcHrq6yR3XwSOuvgYIXgH+yoLeXYzBmmBrV7GyXzVbNTbpRFvRdS/64VeibSXPJ/9ccC+F0HPdd7Ma7B9T7HBZ00df6vJu618N1NL8yrJ1nAVl4CFblRnvvC4NbkpG1bXKaooycwoGeQmJmbQquDpJX5mWGnh5obTqeQPrPcUQ+w9PGH6Cy52Zt3fQzGsc02tvYL1uIPXoeMdwCzfRNS9HCUDpYQvQkM3CsNiy3fOfdIU8urfpvt85tqGKtDjQlHJpf6ee9qWRxM9fqqzhWps+Fz+faprzkmYFCMfC5L/Mxz2Ls3uwRE+GHHwbwTL4so5760ItcJru+n+7ZN7esJq12cOiaCCD/1I5gfnaYLl2P9rtVIPpw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(82310400004)(70206006)(70586007)(36860700001)(47076005)(110136005)(8936002)(86362001)(316002)(81166007)(54906003)(44832011)(356005)(26005)(5660300002)(1076003)(83380400001)(40460700003)(2616005)(36756003)(426003)(336012)(16526019)(186003)(7696005)(6666004)(8676002)(2906002)(508600001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 20:47:35.4818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3dc8a52-0453-4fd9-fdd4-08da167c5941
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2379
Cc: Hegde Vasant <Vasant.Hegde@amd.com>, open
 list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Robin Murphy <robin.murphy@arm.com>
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
From: Mario Limonciello via iommu <iommu@lists.linux-foundation.org>
Reply-To: Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Previously the AMD IOMMU would only enable SWIOTLB in certain
circumstances:
 * IOMMU in passthrough mode
 * SME enabled

This logic however doesn't work when an untrusted device is plugged in
that doesn't do page aligned DMA transactions.  The expectation is
that a bounce buffer is used for those transactions.

This fails like this:

swiotlb buffer is full (sz: 4096 bytes), total 0 (slots), used 0 (slots)

That happens because the bounce buffers have been allocated, followed by
freed during startup but the bounce buffering code expects that all IOMMUs
have left it enabled.

Remove the criteria to set up bounce buffers on AMD systems to ensure
they're always available for supporting untrusted devices.

Fixes: 82612d66d51d ("iommu: Allow the dma-iommu api to use bounce buffers")
Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Enable swiotlb for AMD instead of ignoring it for inactive

 drivers/iommu/amd/iommu.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index a1ada7bff44e..079694f894b8 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1838,17 +1838,10 @@ void amd_iommu_domain_update(struct protection_domain *domain)
 	amd_iommu_domain_flush_complete(domain);
 }
 
-static void __init amd_iommu_init_dma_ops(void)
-{
-	swiotlb = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
-}
-
 int __init amd_iommu_init_api(void)
 {
 	int err;
 
-	amd_iommu_init_dma_ops();
-
 	err = bus_set_iommu(&pci_bus_type, &amd_iommu_ops);
 	if (err)
 		return err;
-- 
2.34.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
