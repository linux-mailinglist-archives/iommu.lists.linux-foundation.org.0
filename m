Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADD563BF3
	for <lists.iommu@lfdr.de>; Fri,  1 Jul 2022 23:45:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A6E4161A;
	Fri,  1 Jul 2022 21:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A6E4161A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eLS6CMt+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TDwQjj-LJ0F; Fri,  1 Jul 2022 21:45:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E4D85418B1;
	Fri,  1 Jul 2022 21:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4D85418B1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8A9DC0039;
	Fri,  1 Jul 2022 21:45:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FC95C002D;
 Fri,  1 Jul 2022 21:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CC1F60E28;
 Fri,  1 Jul 2022 21:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC1F60E28
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=eLS6CMt+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFCYs9NI2pdw; Fri,  1 Jul 2022 21:45:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 486FD60B8B
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 486FD60B8B;
 Fri,  1 Jul 2022 21:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyyQHVqeuvwGmTS9N3ut1d64rf5YSi2JnM8gQcRgMaQQP5wDfS27FxciCptX7Ci8neOn5KgL8swiHo/pdNWbhd7c2O9Wjto1ZO2t/goUEzFfmYjyqRslTV7iRSWyijhyfNPOGx6axKfN3zcXFynLS2ub4qAqQkc66JvDdD77U7frIvp8FOd3HorWINIOaK3SPsFRIrELhhUP+wIbCTvuTwVCrUHsRdZCH9IGupm1NnUJe4ZtwWCE5fuNDmNqjGa78l6DmGo5O5ovW8W28B5fU6v8g1bXC3hL3jHLzm1bFwFcm4MiWczxfWxKdZSezNZ7aWjAr7mg12Z0vK5PEJNJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRNov0IlTB5uPZuj+7TWOzHm5AivjpTU5veR0T+7cO4=;
 b=ijr6AmhobixWOrfGpGPtRJXP3aTTrvbyLpy2Hd2+aGjo09vt6hi5JLdnabRiVT1tKx2SmKAI9E2TXG6arQl3GC8hv2yvBtzQvSzM/IY6YJaruvWiZTDM6rGGV33hKdXKDlTCB4sZi26zJ/LX1J4odRvnEI1Iykj1hhckhiT+AtdRK7iElpkz0wVhzaKixURVSVjeBiYq13bcm1bCGETPoKit31O8jVL5BKnJOdCbFZYoGHOWipWyx7cvPDs8yShTU5jNDaBAwj/okd3BpznWw3ubPR1j6ztH2RglgmN8RdX2mC2W2fZEv+OM2jGUTqSpaOW4Kgy2g3nu4Uhgk8zKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRNov0IlTB5uPZuj+7TWOzHm5AivjpTU5veR0T+7cO4=;
 b=eLS6CMt+z7Ay8AQj8YCn/2rAuie9oXtzDR6DjPYjLnX3N1HGP4W/6/SlctGaEFjA21GsYlrklpdePrHSuUXVyROwuI89n7i6iSeFD+AEoEjL+i2bdgEiG4FfBacEYyJ4ad4wi3VqW6L9g4LE6o5Fz3U3A0yAt5dCAJlvHJ8e8vj25KkoU2CEU3Qf7LVqgBB8amUNc5LRtYXdUsJae+OWO5l6JIH1hqZy+XI3E++CMKunfrnC5xPMQUYIuwugNag0QSmDyGACE1Jmz1t78qnCpTVGHvEsnNZfof8tW//O+uTSmkHpXZCKCmRwHgwp9kxhkFOkDotRBz09TL7aZG0xsg==
Received: from BN9PR03CA0954.namprd03.prod.outlook.com (2603:10b6:408:108::29)
 by BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 21:45:13 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::8f) by BN9PR03CA0954.outlook.office365.com
 (2603:10b6:408:108::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Fri, 1 Jul 2022 21:45:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 21:45:12 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 1 Jul 2022 21:45:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 1 Jul 2022
 14:45:11 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 1 Jul 2022 14:45:08 -0700
To: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
 <sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
 <baolu.lu@linux.intel.com>, <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
 <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>,
 <alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [PATCH v5 4/5] vfio/iommu_type1: Clean up update_dirty_scope in
 detach_group()
Date: Fri, 1 Jul 2022 14:44:54 -0700
Message-ID: <20220701214455.14992-5-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701214455.14992-1-nicolinc@nvidia.com>
References: <20220701214455.14992-1-nicolinc@nvidia.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfb1d1df-fa9a-4f6a-dc9a-08da5baafa39
X-MS-TrafficTypeDiagnostic: BYAPR12MB3048:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZk8p+X/kzc9EseWs780VkXxf7c/OkQ8T8gYzb+IbxZqVJdfHDZ5accyM9CYeNmvZ7ksUWyeO3bURx25b7tgZMprJpMGVdmqJ+LgY75TdpItu6UYwpwrDSTcjqSrVAgVTI9ayCgU+G/d11hX9wVh7CUHl3A2zCNp1uEtfYkFoj4vJh/rHtLMnlykQ0DKuKYBqfLx6l3bnOIZSQiP89jhQ36K7kTF33igyWFTVT3VGvE4cnzyVrz2JqELNYJBa6cuFKnQl3Amce5NRzI3MwGorJ+sVaOhnvxao1hlJYJsMjIopY6dcCC5HOHlD9aJjZuX1sGPToMOM9JrkZsRXINSy8Ea+wE9L/TGlaJcSJ2O0+lADTb5BlpJbduc4m0QBtbVgoTh5MZxZ2uR5f4ADU2HUDFyS9zFjfBoG+VdelzmoVVU0eubC59VcrdMP6/ZbGzedKwwxT6WepvUr1j4EvlL+xznPUVY3j6EcEwV5L+TtPy/rfsxPAiSzIP87wt1YZ1tG/q/U/95Y0Wv5WwIMN/fTCUMX+jDJjV9izcMO4YuVqUoYBI6dmsCHJgWMX18820a9owEz767+Nj3ljYUQvfM6vGLunpQ4WyqPk9+gk2vGNnE6Wk8G78TaAGQA2YFYOZqL7prDZKDg4rR8J3RQunJDlMGPS4rJ8MaQoejjznhgoxDJNQk+VhBJO3cGKZDv6H6kOr1DEocRs14w/JPoK+gS7zKNrlinouLv18r+LddAeMy4RaAm+gZM17+Nhtx6Jc6BGbUWatyRCb114iHhI7GWHvu3n4SyF+3rl9P6hzsq3CCRPCXmyuJXbBr4BqtLZQ/B0hgWL8/lcIHgE3nBQXQE+BGZxZI3IHMei/CSZmMEfhOfIc1bODRGLyKHDhPGl3oHSUejGueq6o0/nJa9/s7tea3a/pHNHHYi+i+TRq7C539gs3j9vyuP6+J16g6ee0b
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(36840700001)(46966006)(40470700004)(336012)(426003)(47076005)(110136005)(81166007)(316002)(2616005)(41300700001)(82310400005)(1076003)(82740400003)(36860700001)(921005)(54906003)(6666004)(186003)(7696005)(356005)(15650500001)(8676002)(4326008)(478600001)(26005)(2906002)(83380400001)(40480700001)(36756003)(40460700003)(7406005)(70586007)(7416002)(8936002)(70206006)(86362001)(5660300002)(14143004)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 21:45:12.5291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb1d1df-fa9a-4f6a-dc9a-08da5baafa39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3048
Cc: virtualization@lists.linux-foundation.org, thierry.reding@gmail.com,
 alyssa@rosenzweig.io, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 jonathanh@nvidia.com, iommu@lists.linux.dev, yangyingliang@huawei.com,
 gerald.schaefer@linux.ibm.com, linux-arm-msm@vger.kernel.org,
 christophe.jaillet@wanadoo.fr, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 dwmw2@infradead.org
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

All devices in emulated_iommu_groups have pinned_page_dirty_scope
set, so the update_dirty_scope in the first list_for_each_entry
is always false. Clean it up, and move the "if update_dirty_scope"
part from the detach_group_done routine to the domain_list part.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 5992ee2345a0..5624bbf02ab7 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2456,14 +2456,12 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 	struct vfio_iommu *iommu = iommu_data;
 	struct vfio_domain *domain;
 	struct vfio_iommu_group *group;
-	bool update_dirty_scope = false;
 	LIST_HEAD(iova_copy);
 
 	mutex_lock(&iommu->lock);
 	list_for_each_entry(group, &iommu->emulated_iommu_groups, next) {
 		if (group->iommu_group != iommu_group)
 			continue;
-		update_dirty_scope = !group->pinned_page_dirty_scope;
 		list_del(&group->next);
 		kfree(group);
 
@@ -2472,7 +2470,8 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 			WARN_ON(iommu->notifier.head);
 			vfio_iommu_unmap_unpin_all(iommu);
 		}
-		goto detach_group_done;
+		mutex_unlock(&iommu->lock);
+		return;
 	}
 
 	/*
@@ -2488,9 +2487,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 			continue;
 
 		iommu_detach_group(domain->domain, group->iommu_group);
-		update_dirty_scope = !group->pinned_page_dirty_scope;
 		list_del(&group->next);
-		kfree(group);
 		/*
 		 * Group ownership provides privilege, if the group list is
 		 * empty, the domain goes away. If it's the last domain with
@@ -2513,6 +2510,16 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 			vfio_iommu_aper_expand(iommu, &iova_copy);
 			vfio_update_pgsize_bitmap(iommu);
 		}
+		/*
+		 * Removal of a group without dirty tracking may allow
+		 * the iommu scope to be promoted.
+		 */
+		if (!group->pinned_page_dirty_scope) {
+			iommu->num_non_pinned_groups--;
+			if (iommu->dirty_page_tracking)
+				vfio_iommu_populate_bitmap_full(iommu);
+		}
+		kfree(group);
 		break;
 	}
 
@@ -2521,16 +2528,6 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 	else
 		vfio_iommu_iova_free(&iova_copy);
 
-detach_group_done:
-	/*
-	 * Removal of a group without dirty tracking may allow the iommu scope
-	 * to be promoted.
-	 */
-	if (update_dirty_scope) {
-		iommu->num_non_pinned_groups--;
-		if (iommu->dirty_page_tracking)
-			vfio_iommu_populate_bitmap_full(iommu);
-	}
 	mutex_unlock(&iommu->lock);
 }
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
