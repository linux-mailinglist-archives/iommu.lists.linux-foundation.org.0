Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B06A5258F8
	for <lists.iommu@lfdr.de>; Fri, 13 May 2022 02:33:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9777960B93;
	Fri, 13 May 2022 00:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B94i1eF4LqCE; Fri, 13 May 2022 00:33:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9A65360BE1;
	Fri, 13 May 2022 00:33:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62248C0081;
	Fri, 13 May 2022 00:33:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEF19C002D
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 00:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95E68404D7
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 00:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQ4yfa0Rim2p for <iommu@lists.linux-foundation.org>;
 Fri, 13 May 2022 00:33:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::614])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DD1F404B3
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 00:33:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVD154dP8Xuc/tis+m/JSuIkQrRXTRs74ksKGQKrWa3rVLOANydV8L/jrQ49RlUwnv4jGZ+PpMKtBSaZVUy2H+esTy4Rq7opEJuOzqiW6E6JFvoxuPpPLioPSewLfRTXOqzGWZl1Z3iWtXhY4CyKoqkNFe27z8q8GWll+AhCvIZx1itAtLxB6/IflpgIsMGHECZQjoYQ5xRzWN5478wqM9xWYcQF5j1ldxLG5wtllxLkoiS+Z+Y4N34MYuHW87ouR3k+Eghhdv+s8VRMwiMEsikrd/DBIc/nitazaxnVAJUC7aCk59r1PRdAPn7I0B2oKz3sxtUzn4DHkWtU24qndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8FfIsi4doYVeNmGUewz4JncLlGe1LY5xPjdXDdBwJY=;
 b=HjUOcZ+yAidaWaeaQQk/TdToFyfBrehdZWNZGXtDcoCHvtO+XRnKMLv7zx6wJFkj9KxtAUIYjbAJH3Ud2H54WSkfMCVgtewWOeWezAvnmAr3qa6YaYaVHBN2QbWsUno4kE+P0q85s7fhZHbqYx0kJ2MzUXF2tXlWHQ2FPYH9BQ5OAB7wZJVwej/NMXDUSfxyanAZHXpArlLyT3A9FjYAEqENy1kNM/Ub9kJ+vYVfVuhKCKeq8VM/KPYkKvEE5cgoPuyAhe+TvhIG//LDeTa2bBCkK00GdSJ5eXjyAdG1uGLMl7mUccqDPZcj5wiWlLe/vUnIZrSNey4ofqfPqUbIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8FfIsi4doYVeNmGUewz4JncLlGe1LY5xPjdXDdBwJY=;
 b=KuYg3p1K0KvFOSeAo7u11TWhkRwVsALTcuJAIB5eXdKb6SoeiIWr+7YRTcUFxSOkJsbYxhvLLAReugWPWgyH2ON8j8k4HbuWAvxvJjMNyf92c7dqKgczr5XW7oZCwSd0RldXLsAqvQIhKFwVkqv1lBl+MDcslclndwRieaWNPDR5qLRyeW30YwZIU2udJCbGnBF94MjVwy8mfgJsZySAG/SLfujrbZwgAfbtT4Zoqgs/HsWk8RFAq9FBqrQgiV/KIjkfkWyokPqlFaXHBNoAx1c0lahl9N892Sb00GXBZ087KxXUTlp49lNu/Q8vqpN64prfkzdWTEL1hknOkZedeA==
Received: from DM6PR02CA0119.namprd02.prod.outlook.com (2603:10b6:5:1b4::21)
 by BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 00:33:20 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::91) by DM6PR02CA0119.outlook.office365.com
 (2603:10b6:5:1b4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Fri, 13 May 2022 00:33:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 00:33:20 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 13 May 2022 00:33:19 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 17:33:18 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 12 May 2022 17:33:18 -0700
To: <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <joro@8bytes.org>,
 <will@kernel.org>
Subject: [PATCH] iommu/vt-d: Try info->iommu in device_to_iommu()
Date: Thu, 12 May 2022 17:32:33 -0700
Message-ID: <20220513003233.4442-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d5b000b-5aa5-4006-5efb-08da34782e3e
X-MS-TrafficTypeDiagnostic: BN9PR12MB5291:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5291464D3D482C125ED44208ABCA9@BN9PR12MB5291.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qy3jf0/+vCn/JFklvTwoZofB97GpgZhdS2BOB8P0VfiDF00kLKLCb7RYyneY0rS7JY1/gXHoASeEQ6osmjrsOajMkjBgD/a3G7aVzkFUL+Z5SQzDTnOUK0uixGUOy/qK6yOhWui5lCR0oJlL1B5GnR9b30MsUoOxKlCyeuw+Y0zPupvjGWy0KcI8TGAs3LI4l+bGRi1ZWF9lLq2zZHXa+4VFEQzR3aqrLY1dRdLm5xKRQorOciWJPfp/F6V/T09N2XaCf+J2FLWpKticydgObkTLkeLNmG0moDdoAOTdAedtP3IK726Tfke9h1s8jRtp3Y5NuqinTzdRqFNoVtVc9vxu9urB+p397cvJwla3OUk21K12NdJlpvboLn6CAK8Cs/82/mlOw1atrCeaKi3hOzf3uhthGt6txn048hqQv5l60oV1DS+ZZ0nd4wWITCZY96CbHqGbJsk72nqT0x9IFjD/zAp/8r0jula4X+IlFNfGvurDdyOfKzb/rlVoP9PT1z34YXpyNCV1T0oRcuZaK0M1/z/MlaCVbFLdHTNXDv2zsBA5WZb+PFQuLkCn6ecYkUjE9JKPa91/xqtaMcAKz/B3cF5XciHy/l5TohW9CDS86/H59nIefG1dLuYMnM86VYYrzDrKveRYUQQIRmb1PtJcnrkVasml7sayM48yfKpr/VeV6ybYZlR3Wylh85WkzIUdXJe4jo+XZzZIisHreA==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(5660300002)(86362001)(426003)(316002)(110136005)(6666004)(40460700003)(186003)(36756003)(47076005)(336012)(70586007)(4326008)(70206006)(8676002)(356005)(1076003)(2616005)(54906003)(81166007)(4744005)(8936002)(36860700001)(26005)(508600001)(7696005)(82310400005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 00:33:20.1655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5b000b-5aa5-4006-5efb-08da34782e3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5291
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 jgg@nvidia.com
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
From: Nicolin Chen via iommu <iommu@lists.linux-foundation.org>
Reply-To: Nicolin Chen <nicolinc@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Local boot test and VFIO sanity test show that info->iommu can be
used in device_to_iommu() as a fast path. So this patch adds it.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/intel/iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 2990f80c5e08..412fca5ab9cd 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -777,6 +777,7 @@ static bool iommu_is_dummy(struct intel_iommu *iommu, struct device *dev)
 struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devfn)
 {
 	struct dmar_drhd_unit *drhd = NULL;
+	struct device_domain_info *info;
 	struct pci_dev *pdev = NULL;
 	struct intel_iommu *iommu;
 	struct device *tmp;
@@ -786,6 +787,10 @@ struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devfn)
 	if (!dev)
 		return NULL;
 
+	info = dev_iommu_priv_get(dev);
+	if (info)
+		return info->iommu;
+
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pf_pdev;
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
