Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A096C55520E
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 19:12:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD868143A;
	Wed, 22 Jun 2022 17:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD868143A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nZttiw04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkmeiKV3yJJu; Wed, 22 Jun 2022 17:12:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 05C928142C;
	Wed, 22 Jun 2022 17:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C928142C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9158EC0081;
	Wed, 22 Jun 2022 17:12:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72FA5C0085
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 17:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3157140A01
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 17:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3157140A01
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nZttiw04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSrMZ4fSdWsv for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 17:12:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5321A40012
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5321A40012
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 17:12:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgrtsCw4YTQWUii2Tc+nVO6ggqebO/C2t25eTUSb8WYj/0N+5gz1aoOC4y7oO1lV3nSPP7rAp2IQw/6VcTnsGLoyHyFl3ngFRXyqR27YGPk1NwsWlW/xWKQTzGitPvsSTtdKPa8sGN+E1w5FSwF9Wh0qhqLd8k52fDLrq17BVzlXq7UcmnEk7+F9C4TOCvVcIfEOaR7hgcikRVhkgQoJFI7XmnBXaDxNi8FCwxrfQYh0fdgIoAEq2cXPYdYfAfoG7b004I9MuBeOw1DwrOD6OGr738UkK8wwljQze25qnA48tZBXJX5s2NlMEAXgAj98zUi8JnUMlMYVFBVBhjJI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQKZevV/tsi5ff9hKQfENyQ/xU8fqECb42RcR8Ld8f0=;
 b=RhaY+G9mznCxiG3qu2ZFTKzd59Zd8lsN0ZAYvZm5kAdlBMNcEbqmXvAWU5ocxQbqCYPeqL+OURRl8BOwJPGMQ84fi9hJ0TfC97mB4AXRA5ULfK8foRbCh2khXN5QbvtD/9WcOjEpfHOvUBXmG8oQbQC04LrTFnV4BBLftnuc2pcDhIR8MtG7VmWeSZ2kcvSu/UOgSUOxFHZt1WVm4bxWc/UvMMj5gSgTyn05cqnLRlX+nWASuNyHd4xerCiVAvZp82DBZwReQAcabW7q1wABrlaZIe0nwmYFK1I5mYPUdjb3LWIymUckjwuHdxoLqrJHrLMK9AtmMQgSKIPgJmdYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQKZevV/tsi5ff9hKQfENyQ/xU8fqECb42RcR8Ld8f0=;
 b=nZttiw044LCrtbc5gsppbwtqN17+bJSazMTpNVyU3dFWzh5ZuZQRwFdEMcjotBNZ/Y0I0Z5suBpxJBw19liKevO/lJunNW1prbaNrVLqdLtTx7Ezjatvkmoe4ZHGrVUImyUPmbb7atI/FVVcZ2z2KyDsoz9oWYAFNxwUeBu3S5g=
Received: from MWHPR08CA0056.namprd08.prod.outlook.com (2603:10b6:300:c0::30)
 by CY4PR12MB1734.namprd12.prod.outlook.com (2603:10b6:903:121::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 17:12:39 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::6) by MWHPR08CA0056.outlook.office365.com
 (2603:10b6:300:c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 22 Jun 2022 17:12:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Wed, 22 Jun 2022 17:12:39 +0000
Received: from sp5-759chost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 22 Jun
 2022 12:12:35 -0500
To: <linux-kernel@vger.kernel.org>, <iommu@lists.linux-foundation.org>
Subject: [PATCH v3 5/7] iommu/amd: Set translation valid bit only when IO page
 tables are in use
Date: Wed, 22 Jun 2022 12:11:29 -0500
Message-ID: <20220622171131.11870-6-suravee.suthikulpanit@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622171131.11870-1-suravee.suthikulpanit@amd.com>
References: <20220622171131.11870-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82e9f8b7-ef1a-4ee2-3bd4-08da5472694c
X-MS-TrafficTypeDiagnostic: CY4PR12MB1734:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB173491C6720F46FC43AFAB0FF3B29@CY4PR12MB1734.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bdvM/S5bFLx5JLhyyCf1kh/aycBq62acvicKbXLOmnvX+fd6Htl/qPltFOgNBClrFwrL2Kc4ETpql+itrh1SR5Ckl/c88uURYi1UeCv56YwItzRRzu8Bttb7JJCOPZn1XB5YXh2+PwcsvxJHQErBLA0TqISblXMzjOdE6MikhcYt1VuCSj3GLC8kNgNsi+EYH4YwBH1grdBLZFz4xZRYs9gmdXgPL9q6j3cmFLOhfNIL+Xsjs8Qvub9drylbNsl3pooxO2MdYr2tjfEaeO/wFEIOLoIx14JK1+zYkIp6tdkUiwKfGRtWoyCJcvam6mEfqXFKjxeiosAFKRxeui6gR/tvV3UU5hfegVDn+C48wKzzS0WSVzU2nq6qu5p1t83zWqaoEaMmns4oDEHtSI0/b5zhFNZvXh5bsO+NgXV+tibS+zJ4iuYrgQVbx8aKRexLzAq2y5W7axxWOeE1eqIbEKG3IEs36P0K3gxFKJ/D7wI0coqzqxRW0UDyxU6mN0bVBfmsjSBu9Z64B+cyxHoTkkN90tx7kXdGuISH6jQuNTIf0x6ma2wCwmbA1ezEAtrHQ5OMPzYd13zgvZQlsjaP1014xD+uUFxN3hJWoiNp3rUAeQi/4aNFwzKiu6ReofwQK0RDBQSv4Gg/7VDwDi58rqih9opH6csAtKnUFuItCIhM5fZTRcMlcMG7ZGmjlf+oCKzT+EWCGYeeqpn+pFKKX3YdB44bQQPVLUDEN2W3/5vPEA2tLdZChsJJukywfbJT5uoAHxgUvN7CNFeDR+RhSUTHGNYa77YBNKIV026m8V4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(40470700004)(46966006)(82740400003)(2616005)(41300700001)(1076003)(36860700001)(336012)(4326008)(82310400005)(70586007)(426003)(47076005)(356005)(316002)(40460700003)(44832011)(16526019)(186003)(40480700001)(36756003)(8676002)(83380400001)(110136005)(26005)(70206006)(81166007)(86362001)(8936002)(6666004)(478600001)(54906003)(5660300002)(7696005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 17:12:39.4080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e9f8b7-ef1a-4ee2-3bd4-08da5472694c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1734
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

On AMD system with SNP enabled, IOMMU hardware checks the host translation
valid (TV) and guest translation valid (GV) bits in the device table entry
(DTE) before accessing the corresponded page tables.

However, current IOMMU driver sets the TV bit for all devices regardless
of whether the host page table is in use. This results in
ILLEGAL_DEV_TABLE_ENTRY event for devices, which do not the host page
table root pointer set up.

Thefore, when SNP is enabled, only set TV bit when DMA remapping is not
used, which is when domain ID in the AMD IOMMU device table entry (DTE)
is zero.

Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 drivers/iommu/amd/init.c  |  3 ++-
 drivers/iommu/amd/iommu.c | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index c62fb4470519..f5695ccb7c81 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -2544,7 +2544,8 @@ static void init_device_table_dma(struct amd_iommu_pci_seg *pci_seg)
 
 	for (devid = 0; devid <= pci_seg->last_bdf; ++devid) {
 		__set_dev_entry_bit(dev_table, devid, DEV_ENTRY_VALID);
-		__set_dev_entry_bit(dev_table, devid, DEV_ENTRY_TRANSLATION);
+		if (!amd_iommu_snp_en)
+			__set_dev_entry_bit(dev_table, devid, DEV_ENTRY_TRANSLATION);
 	}
 }
 
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 0792cd618dba..4f4571d3ff61 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1563,7 +1563,14 @@ static void set_dte_entry(struct amd_iommu *iommu, u16 devid,
 	    (domain->flags & PD_GIOV_MASK))
 		pte_root |= DTE_FLAG_GIOV;
 
-	pte_root |= DTE_FLAG_IR | DTE_FLAG_IW | DTE_FLAG_V | DTE_FLAG_TV;
+	pte_root |= DTE_FLAG_IR | DTE_FLAG_IW | DTE_FLAG_V;
+
+	/*
+	 * When SNP is enabled, Only set TV bit when IOMMU
+	 * page translation is in use.
+	 */
+	if (!amd_iommu_snp_en || (domain->id != 0))
+		pte_root |= DTE_FLAG_TV;
 
 	flags = dev_table[devid].data[1];
 
@@ -1625,7 +1632,11 @@ static void clear_dte_entry(struct amd_iommu *iommu, u16 devid)
 	struct dev_table_entry *dev_table = get_dev_table(iommu);
 
 	/* remove entry from the device table seen by the hardware */
-	dev_table[devid].data[0]  = DTE_FLAG_V | DTE_FLAG_TV;
+	dev_table[devid].data[0]  = DTE_FLAG_V;
+
+	if (!amd_iommu_snp_en)
+		dev_table[devid].data[0] |= DTE_FLAG_TV;
+
 	dev_table[devid].data[1] &= DTE_FLAG_MASK;
 
 	amd_iommu_apply_erratum_63(iommu, devid);
-- 
2.32.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
