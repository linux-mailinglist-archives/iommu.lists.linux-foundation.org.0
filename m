Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 66854562437
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 22:37:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1579E416E7;
	Thu, 30 Jun 2022 20:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1579E416E7
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FYQzfn76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X23cO6O0HjcE; Thu, 30 Jun 2022 20:37:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C1B9142425;
	Thu, 30 Jun 2022 20:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B9142425
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C69AC007A;
	Thu, 30 Jun 2022 20:37:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C800C0072;
 Thu, 30 Jun 2022 20:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AD934240D;
 Thu, 30 Jun 2022 20:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD934240D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NcCpnVxWYkml; Thu, 30 Jun 2022 20:37:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C524642420
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C524642420;
 Thu, 30 Jun 2022 20:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=al5yQ5uKrWxWKi2GLB6fekAdy5+IBLcP0GreoJAe9jsd2IiRpZYpgcwPrTC6oAGRK3OpYu8p3M2OzJvGSMhI2OScw/KwNul2syUVNVLnCJ8GAcSgYIKxKTSWCFekEnjvoRStdgd1BrilQXxtKXdgxDBHlQDIXOSBCQo2vIUFXnIywzuXOdz8SgFlhvCX3VIalMoZHmGsaX0bQ3YzVKjw4BuhGi9C8wDp8VkExwW76BaMaq7QlhFlbRD/Bep3eTeiiCAGISisrFCPeLn0LWKwUO1zlq7m9usUTkYieAdYdakdmlfx4hhI75GrG9JBZJC12SeLkWowjDkEBrKNbCNlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpJ/cMMHOAAeva/rgHTbXEVWpkRp2h2y74yQttJGbTk=;
 b=VqUrUTykaLGXu7M+x1n7k3kP6pFAtl/mSXx484TEpba09z9CXfmgcmfjyXYry7xysyNBa/OhMhgXDn+V05EfFnFC9LJAiqCIk8Ng2IwHIiu7RcI6gMKOccHIu47a6fiJBhQObskvVN3IYvGKx8GbYF2EqF4eyVRXsLJfIKMsoU7CV9iLRi77mqiv5mqqfnkKLegeL/PbUfGLysytS7+ZSHO/lm7dmd9vGd+xgUILT+kS2cFo16HYCynB8Y7DBS539zoGBXqidyKoLhbx8Y8fGtbg5XKGJ3Ds1CuF2vVoWL4puRG1Mkg2IaR3GnXuGaSFaH45uL0mrG09W7NhUo/KFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpJ/cMMHOAAeva/rgHTbXEVWpkRp2h2y74yQttJGbTk=;
 b=FYQzfn76syJH+i/D6n1usqQFRuwdw8ZKFhtsrRilKLqUNFLIUGwGzoNQejKP5McqOUI26MLsMpCYvhvpIf8Bi9ynu/TwDjievbU7N2/TLXuDd3pyiuR58iKq1t1hviDfF0REVxD99Hu701Ej4xJ+czjvSbY7dU/dT4Q0RTAiaZiXjyhN3BUOVNG6mzcB7CF8XZEPVVIkJ/I3LKcWTFL1A8cfiy8IrNz4CFvHd3OEBqYeVwpeSqkWd4tfI+hunyUJNATQrtA35Dz8akMbQY9LohaGi2R+yU1MuKw1PzGergWrhY+2D4u6mfUZGxl209AZhHZUwaO7VHlSIlu+PUQdfQ==
Received: from DM6PR11CA0066.namprd11.prod.outlook.com (2603:10b6:5:14c::43)
 by BN6PR1201MB2497.namprd12.prod.outlook.com (2603:10b6:404:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 20:37:10 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::8f) by DM6PR11CA0066.outlook.office365.com
 (2603:10b6:5:14c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Thu, 30 Jun 2022 20:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 20:37:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 30 Jun 2022 20:37:07 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 30 Jun 2022 13:37:06 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Thu, 30 Jun 2022 13:37:05 -0700
To: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
 <sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
 <baolu.lu@linux.intel.com>, <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
 <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>,
 <alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [PATCH v4 4/5] vfio/iommu_type1: Clean up update_dirty_scope in
 detach_group()
Date: Thu, 30 Jun 2022 13:36:34 -0700
Message-ID: <20220630203635.33200-5-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220630203635.33200-1-nicolinc@nvidia.com>
References: <20220630203635.33200-1-nicolinc@nvidia.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a994b858-e972-4205-ce35-08da5ad84e3a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2497:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0qMR9JU5TWfWWCF2gOdI0zoLvGx1n+sLfgI79ffKec/NuT+IRkIF3nNj0Nww5OYIAXWVKW4lcGRgiSwzwZE5JZKOMu6M8IyyJaFW9Tn/siOkTli8dL9j5OJi814zkmgUkZFDVcyS30rUixEysg3yq2KuaqlK2ZeyCyhDuj+E2010eUQ6zB1KNpVsn36TzjREMo1RPnnDIUt2kON+7akekoq9tByBvUjVUEOVH1y8bpyCO3qYpXw8cI7u6QZmU3HXp9nlrz8yMCnK/VxXkY+5uVorM6+NkdkwY0pqT7EVaA8ZbNqtALfDPjF5HwRtWF5HNeEkItRz5Tq+puFUrVe4r9BUI180HmNwc8Z+Fw4DAUGVbtvto7556PwR7dYloQUY4c5XyHkdO404qSJcE2q20i6db+cP6dPKH4fMdb9Av8v9vrQYUg7WwQISNzXyamLnFCf/8sGhLUJDeN3zA7N8D5+QRcKFPnJ7fX60le2aMp383i34TWL+XXLFnqKFXUi8iNvR0kSoMrVIvV7Ej1RaORcdNCAunynouBwRvCK5nvh3FMhUti219eDYOhDZnLmMvtN5AyKzUcO5x1fR8bQshg7d8PR80oMvWWsUritxh2lFcF//DUyNp35X/7uhJZtczjigwhyukvlIs9WOCgMpuh1V0vdlIIDT+Nrgi4M7K/NjUM7aN4g8OVNLY7L6EvugPVbEM3eGDoXm0DXsGqbF26n/xfqHE//FjrzLUP5g6T0DWm5MMcwPwxpn3ZHaYfdCPT2GMLhHADXZTDyLH3Uo/UdsFhNWK5cRaBXP+v9Sg2An9kUcCyPTaZowcY1mH/+640SVSTdvpWaC+Rba6AWSNVSIJGKG4Dnjwjb4hSMwtefCopNgISvasb6gFVV4pOkETUNnnpuGPCyMZvKuv92d0IQErTEpY5lPFNiQe8axdwNrwIB7aIl2U1HBEN8ibRUf
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(46966006)(40470700004)(41300700001)(336012)(47076005)(7696005)(1076003)(426003)(81166007)(186003)(6666004)(40460700003)(26005)(83380400001)(8676002)(2616005)(36860700001)(921005)(356005)(82740400003)(70206006)(7416002)(316002)(8936002)(82310400005)(15650500001)(36756003)(7406005)(40480700001)(5660300002)(2906002)(110136005)(54906003)(86362001)(478600001)(70586007)(4326008)(14143004)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 20:37:09.5446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a994b858-e972-4205-ce35-08da5ad84e3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2497
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
