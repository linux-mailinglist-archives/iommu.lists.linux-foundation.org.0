Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B175A5589B9
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 22:01:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A37984808;
	Thu, 23 Jun 2022 20:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A37984808
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o3qYFm4x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuuAfeHzzj6U; Thu, 23 Jun 2022 20:01:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2422684802;
	Thu, 23 Jun 2022 20:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2422684802
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8AB2C002D;
	Thu, 23 Jun 2022 20:01:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E03C1C002D;
 Thu, 23 Jun 2022 20:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABD2640CDE;
 Thu, 23 Jun 2022 20:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABD2640CDE
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=o3qYFm4x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrzEFHiQFioA; Thu, 23 Jun 2022 20:01:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C72A240D75
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C72A240D75;
 Thu, 23 Jun 2022 20:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/9CMReayZBOn1ygd2ecmJGVY7DOuKrYNstgTJpspixhjSxAANL45XZIHR2l80dcr4ELNMW+beEl9hzPvd4csnntZvdaowb57OXnt4hI6Baa7zUPf/HtxLKQyMVhinq3ywdcNVQRdN9j2h1Y0KFkGznrbJaIhIyTGpj1M2giu1w8RoQXg3ZvRqW/sBi4YHVt/QexLyqb5vcUbqW7lEQ8/3lWpw76dUnC+MouOW09VZ/76o4vtbtT4FF/Gz/KwGLxoB/W1wM9QqLRB2WHt1jVXxzeVQ+Q1P3fFbmNmw1tz3qtkyFhtJitguK4xLgPx6iotp3+JO/Tus/18C/80RhdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpJ/cMMHOAAeva/rgHTbXEVWpkRp2h2y74yQttJGbTk=;
 b=FQWAHQZGhsItCcQKja7seG8UpyYPFdzzke4oqz8uMokFGt0YnBYm4nPhi4jeumbDzCWSsWwyMylqsrXZvywjg0pBVGi2ADR/WW1D5JEdAdpHp3WtPp334sMqtXgWMHCThKq6Ct3jOb3blBE242yv2hlkmbQZLT+jyc7EX090eSFx+/xC2I0OZCzzRK4Gt82AWvnek1KG/4f/CKkkLQvSCnhvYQu33kSX46BNfQRPltA3PkcjNg22Z8YvShqdVWQBhunthvEEclWyzJ1LYrnwrji7RTJfNXJ4PlTZiX7pa1ZFbTb3GF1FwGvFAWyac6yPqQlWLs1EvLOR/8KoBOUPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpJ/cMMHOAAeva/rgHTbXEVWpkRp2h2y74yQttJGbTk=;
 b=o3qYFm4x16wY3f/OJcRnIND/ctz0sMPykoUZj3znGdj80GTBQqH9a+n8UuSFOE1Rk4HPVXZ0PBel0c1oT1HgLuK9tGY7psd+0arUr1RRmcVaTZEmYxPlXniv8OKUBsrS84jF9JgU26qkdV6dV9CZSFRNUR63x2+I/mEblAIQ2EqpmSGcuqIebMIlrdcIKrU6Bv2Hx+6XrBZL2hki943AzG+R6PW8SyXvESEmGDWT+RmFD1rrdnJyddrgKW7i04SL5CYpvakYtLgiw9aP/cf6SpIpgiY4Quke6qHEOm5PmxEpH6EknZFcI/lgqb+AKMBaXTyHzSPwKeuiieDlbQRCtQ==
Received: from DM6PR06CA0060.namprd06.prod.outlook.com (2603:10b6:5:54::37) by
 CH2PR12MB3765.namprd12.prod.outlook.com (2603:10b6:610:25::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Thu, 23 Jun 2022 20:01:42 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::8b) by DM6PR06CA0060.outlook.office365.com
 (2603:10b6:5:54::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19 via Frontend
 Transport; Thu, 23 Jun 2022 20:01:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 20:01:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 23 Jun 2022 20:01:42 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 23 Jun
 2022 13:01:41 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Thu, 23 Jun 2022 13:01:38 -0700
To: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
 <sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
 <baolu.lu@linux.intel.com>, <matthias.bgg@gmail.com>, <orsonzhai@gmail.com>,
 <baolin.wang7@gmail.com>, <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>, 
 <alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [PATCH v3 4/5] vfio/iommu_type1: Clean up update_dirty_scope in
 detach_group()
Date: Thu, 23 Jun 2022 13:00:28 -0700
Message-ID: <20220623200029.26007-5-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220623200029.26007-1-nicolinc@nvidia.com>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a549c545-b365-4285-a2bf-08da55533174
X-MS-TrafficTypeDiagnostic: CH2PR12MB3765:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXI9S+yoP+6Yq+ctwi/ubAqakKZup4PFl18u8YOw7ArHXSAtBim758E8OAw4lPss/MHBNB+2BNNHNucspUqnggiMpvdvuYVyL2xaCZNa2Kp8Ck0o3GLwFOoQV2pLMi4mG/rLYmv9NMT9VB95UizIG3Yi+owoOWBWQyChAa07jJB4L6ND99CV4E44M4IhERCs3b1h3XII/ZVr9Rxn+HBTNTBjcHHDxs1Zc3pHljodX0F4PRq512X1Acxp9a25kS8xLJWT4lxhQFIl1Yp/LlU9V3Ti+VhvQFfJLD8OGxQ+bda9J3ARZwP6tCthyMlG8Co9GSWV9MGbll7xObpj/LQZhdEek29m90s20zGsUyvBIt8iDY5xnEQuvD2V5TdWk6NIINRI/d817lM35zPw+7uQNMSb4CsFo5G3KJrmUW/vXnDBL3ssUnBiFMht9H0JqjmUu+tmmn1SO5ioKFUfzPsOuBkNq42dua/aPNs5Te6auUGHC5VPgYu79JuHTN63fjYQz2A2pD5KRO4XF0mWKS9+bqZdmvGOQAoHq55mz5vlNkGyWA7c5Uurp7vS+Cr7ggnj+0D3mlXWVdp7l5ZbzO6vWi1L8aKuq5hHSTnE+RkPr4AJ/SaNWRNl7kUxXR4iC3Fwt2zUM3dhizKInnXcFcoaZx5jpjnn0jBqyUiE3XmFgdsn4QTmCVTpp2dHKqXXV3kFcskr1PLZY3mnN83BEpzaTlK5THkp/YI94rRhphFlQo/uTIN23KQYCvjIzbWN2no8tnDuTL6V4KLM0FehZWg2/0PQUqUlOqkiGhGOkJdsrphXLvXTanLefUkUVCvoOJjSK4jAcCcq5ZXZbW7He9rhQHqoOn+FB5Vh4or3JhATyqwiEysdKqxWip5hTJX+DlpsufTq5/y+FOg41TdDutMnLp64Vpd3lydDf36QAIn7v80=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(186003)(1076003)(40460700003)(83380400001)(336012)(47076005)(426003)(6666004)(82310400005)(4326008)(36756003)(82740400003)(81166007)(7416002)(70206006)(356005)(2616005)(921005)(7696005)(40480700001)(36860700001)(41300700001)(110136005)(86362001)(478600001)(316002)(2906002)(54906003)(70586007)(15650500001)(8676002)(7406005)(5660300002)(26005)(8936002)(14143004)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 20:01:42.5470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a549c545-b365-4285-a2bf-08da55533174
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3765
Cc: jordan@cosmicpenguin.net, thierry.reding@gmail.com, alyssa@rosenzweig.io,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, jonathanh@nvidia.com,
 yangyingliang@huawei.com, gerald.schaefer@linux.ibm.com,
 linux-arm-msm@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, dwmw2@infradead.org
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
index 11be5f95580b..b9ccb3cfac5d 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2453,14 +2453,12 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
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
 
@@ -2469,7 +2467,8 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 			WARN_ON(iommu->notifier.head);
 			vfio_iommu_unmap_unpin_all(iommu);
 		}
-		goto detach_group_done;
+		mutex_unlock(&iommu->lock);
+		return;
 	}
 
 	/*
@@ -2485,9 +2484,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 			continue;
 
 		iommu_detach_group(domain->domain, group->iommu_group);
-		update_dirty_scope = !group->pinned_page_dirty_scope;
 		list_del(&group->next);
-		kfree(group);
 		/*
 		 * Group ownership provides privilege, if the group list is
 		 * empty, the domain goes away. If it's the last domain with
@@ -2510,6 +2507,16 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
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
 
@@ -2518,16 +2525,6 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
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
