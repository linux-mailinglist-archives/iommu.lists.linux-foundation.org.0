Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC04F3C8A
	for <lists.iommu@lfdr.de>; Tue,  5 Apr 2022 18:16:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31AA941605;
	Tue,  5 Apr 2022 16:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAVulYTs5AXO; Tue,  5 Apr 2022 16:16:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DD50C415F1;
	Tue,  5 Apr 2022 16:16:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72B3CC0012;
	Tue,  5 Apr 2022 16:16:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EFDEC0012;
 Tue,  5 Apr 2022 16:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE2A240ABF;
 Tue,  5 Apr 2022 16:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgtoPpspPYJH; Tue,  5 Apr 2022 16:16:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::602])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5EAD400E5;
 Tue,  5 Apr 2022 16:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlznvIoPpsBceogC2J1a/886h2l4nluzDEbt9aTGv0GEc3tnDmjneudkJB+m5DwQFAJEwZ0GszMBG0EKmCxWM+j3Zq/hjQ8qM/WZ8EwTOwq+xQ4IdyP/wGvY0lmuRO6Y0ldC511dSBfx8WIC8uUZ+d0utlx7wIc1XCoLwpRmXEt9YZo/07GMBLXCf/lVeFlV6PfWWnbAUpYhjjTvYu0gh8+vkE8n1Fn/t2KHU6QRE5dK6s8imn4ooueDssx8SI8T5A8Ca/AMygQ282v1S72zeMDdmdRj8e2aY1RO4ytCpHiPC7qyM7bNA/qI/Rrk48SWT1yQxnb9yNoUg3xNsc5gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrbA4VAIicUckPy/EYaYXdM1hvuSyWyOMmfOfHNRYjI=;
 b=krYDiJwv+Ty3i1cLjSlLBL2P4L7KDktKFTCtdd9JuybLXxJ3HQBfh9p26Mk+AwmKxUPGNZVZ/vFY3xecdaPV8N+zCeCXiYXLTrZ8UsvRqCbdB5lIRFdDs1J4L2oZD/OnKORR/F6yPqVkbuZZolrZKnQeCApEKSi3XlqFHhxqBBZTdkYf4iaUZFijcnVSqdwG9Z9rtHZXDWqusyU5H+iwGgyDhFeD/rmhg/AmrvtZ0x1zcdBd5cUkiYLvpOEL+dOl67ZF7StQ8Cw0r7E/fSTvxSLMg0sN2EDhRqWbTqP6LNgYk1ZOJZSc2R6U/+ziG95mVx/tIUDk8sxZ3haU5OVHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrbA4VAIicUckPy/EYaYXdM1hvuSyWyOMmfOfHNRYjI=;
 b=AEDCNcB46EBnLcxCHrpxMykKLmnyrDFZFfGhZ175ildDcV/77ySXnS6e6MrcvavNMxqGa2K9xe4yDsn0cIzwpny03KyLGmRl5mNxVabhXMQRqtvhoiEUsm4YUxSAw1WhWNSB4RzMh8+KgkxYIUaAL6xbWaKHq9060OKYNlkDSZs1NDnqheVni4ErKkBI/sEe8GTe1ru1G1dZE6D6JsFOiudIxE7hCdfsM+75QW2Fg8jQC+a1fm838CphpkR2SE+vQnxMZDm4kGkpB5A2ntYksjAjAyfZS+81Z0B8lICH08zYQnZOT898cMx6Y8FrERLDVXqHGpkWWWmjv31taICtCA==
Received: from BN6PR12MB1153.namprd12.prod.outlook.com (2603:10b6:404:19::17)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 16:16:07 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR12MB1153.namprd12.prod.outlook.com (2603:10b6:404:19::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 16:16:06 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%5]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 16:16:06 +0000
To: Alex Williamson <alex.williamson@redhat.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Christian Benvenuti <benve@cisco.com>,
 Cornelia Huck <cohuck@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Nelson Escobar <neescoba@cisco.com>,
 netdev@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 virtualization@lists.linux-foundation.org, Will Deacon <will@kernel.org>
Subject: [PATCH 1/5] iommu: Replace uses of IOMMU_CAP_CACHE_COHERENCY with
 dev_is_dma_coherent()
Date: Tue,  5 Apr 2022 13:16:00 -0300
Message-Id: <1-v1-ef02c60ddb76+12ca2-intel_no_snoop_jgg@nvidia.com>
In-Reply-To: <0-v1-ef02c60ddb76+12ca2-intel_no_snoop_jgg@nvidia.com>
References: 
X-ClientProxiedBy: BL1PR13CA0326.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::31) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a76cff61-cc69-446f-32e5-08da171f95d8
X-MS-TrafficTypeDiagnostic: BN6PR12MB1153:EE_|DM4PR12MB5818:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1153CD045BAAB062DA245934C2E49@BN6PR12MB1153.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzQC0aqYOeg8VnV919OqNJq1tIvQ8GQ58gW1ZNUauthYOGTmNulwg+1kTqf/2A+eeTeKeRMfmzPVSFGS8GZK6cal95/0s5EbffNBz4EXbUnV5f0v1KgT6QOmQ6zc4U1XcQbXVF9zwzpTL48OreKLpwY39obvcLukD/ZhW4UfZqi4Q+5vDLgTsEgWbshjlAON8esbprWwZOA343LT+x0H7uSnEeuJTdv8g0Ar99SzntMgq0cvyq+IGqQrjSuACTSxVIYzDL9ndIjGjywbB7hzw4kJgovOVaL4YKsqnypk+2rHAslaAbEVwz6DUnAgsKop5Sxe6s/vAqlToOULdvtuDPiylOLF+LoL6o0VPEJAHTsLMJaXESiTF1TD3ws9jafBnrj3JIvFWDYee/mApsLXFk5N2/mOv+XcuA2vKHLUJSa6iLCowHjGMj4xcAV7DsazJ0HXv6o3wlpkapzdjdynSHN5a4GW0CzjZ/q9WjEXT5KoNu4Ln+ShmY1V/WBDMLRxSVWCiGhDIfEts7eKBp4AUepbbOlb0Thmwb4cVISTKKwrUiijAZjQlOyt4PPFqRGP6Pqa+M2A8+rv8SZXsbMNaGZqDcZPpJ+syPxHC/eQ24CeQvlFPmkJqc1ZPBahiUSpsr0NPr0FHYCSWKVX3ytYgH0U3PP3tGKBHjMIUqS7MlOqie770Au9Z5aMXtSh5Y/T86wXddyzsVjnQOH3OvQRkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR12MB1153.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(508600001)(7416002)(8936002)(6512007)(5660300002)(2906002)(83380400001)(36756003)(316002)(110136005)(66946007)(38100700002)(186003)(6666004)(54906003)(6506007)(921005)(26005)(86362001)(66476007)(66556008)(4326008)(2616005)(8676002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Xjb03ZbzKPf+LebL/vGg+6WgyoskAcG5ujOhTS72JpFDTuVXqu/e4kQnbr/?=
 =?us-ascii?Q?iEWobnEZB09bdLJwFCISwfji0CQqP8XYU1p2ZplalNJVZl1DmW5zNZeuJ1We?=
 =?us-ascii?Q?ZYDgTby4nNngxbnsQfy1zTPSR74FXwQPS0pBI+31aV11CZ0eVE9+nVZ9iFXO?=
 =?us-ascii?Q?J2YPGoIjGY8kOA4K91SXjVlh38AqNzeKL/9hX3W+aORmKPNhREXz1BsIRDLv?=
 =?us-ascii?Q?m0ng9uW3W15TlgnkL208TIyiCmwbZtQcURPbh6pH24msIhnk1zN+kvRLvwc8?=
 =?us-ascii?Q?h/4koa2yNHdQNB2DLm5zrHwJVtfu0n6qwYMmjrdkHxbUB6yI2XWOCyAy77kR?=
 =?us-ascii?Q?1U34B29NPCTysDpyY9E5w/8zIe7QImG8RCnnx8SpyNNYKE3AsMlkoLcsIMsu?=
 =?us-ascii?Q?FyiCYQifvKpOa4qDv6cRZgbHWfAl81BFOdjM+k5kS4yBUIUypQ0+eJqkY+9S?=
 =?us-ascii?Q?FS7ldwUQ7LjexAGG0hc0RBLuISxtXCFRBSJxi/DIwyc92RjTE3EurBAOirh+?=
 =?us-ascii?Q?S43jR02QUaknjvS6ugyulv/8EOGFLODy04gcLr7BU71J6CHrTDtFv/VHQDJ5?=
 =?us-ascii?Q?U4Pj4EEYqb4ZrccQrye5D1XYPGE7Mq7y42F5vX40uLAzyri1me/Xr3c6zP8d?=
 =?us-ascii?Q?K8t6MyZ02oacFKyn4EOdpziGVTNJqS8blFPyCGhkjD/lf+AJPhgvPPRhZ0zs?=
 =?us-ascii?Q?5I3fdPjSoO0wG98lCa54ohT9yAYnAX3YaRnCEYpz1FgYRRhoRq3t5zVRL/DJ?=
 =?us-ascii?Q?W7i4OiBsmXF7l4gg1/0gvH4KL68wCv4BpUZu2MZ+ks6KzgOptry4XCWGqwRp?=
 =?us-ascii?Q?ntr7peHFmTSbvATlpvAPa6eRk4+GYsK+2ItgzzGNyJAeMj2YCSC3YUlrYsGM?=
 =?us-ascii?Q?r0oX/FVp9tzO7QNDpqSZQ6W7zaFYCzmWC/UmYThojdz4sfhz153poO1vPZ4r?=
 =?us-ascii?Q?KTTqz3IprIe+q8cJ6rob8QHhALE9NE5QvX/58bT94rmgPfDEuv91iH61k8z4?=
 =?us-ascii?Q?GBjjDBiGxaE1gO+ktaFdeWwzZTnNP90QsoxTE5aeRHz4q97xeQN6tUqdXKOX?=
 =?us-ascii?Q?B4Wwg/qTxB0j0JfGYviFZEuvQ2wHP7AQv17cEk3dHQY9KLj6k9VPwn4tiHyb?=
 =?us-ascii?Q?PJotLWhw78D4UbpkDv7VxyOatPmEXrORT/li2wzhe00mgdGv7nC3wFVZtsIi?=
 =?us-ascii?Q?j1tM8rapIy7BKFeunnPl34Ke5vioK5A8KaRraDos5lCT/yTRZCx4giVvMR6H?=
 =?us-ascii?Q?lcMISNdUD525AJdmUfOxL/iG7mM+Fd6LBzPwnYloIku4HluSF3T362grTg6a?=
 =?us-ascii?Q?mYKq/+6I1ywuh5XFALC8oS1VGoihaLYCVEH2m0JUTkepa8U4oTn8yihVcBul?=
 =?us-ascii?Q?15dPJiBOfzs7uaPR+OYePbMW56rPIe2IPDq1Yf5ofqrw6/rNZDaFRbjbSirw?=
 =?us-ascii?Q?8S6d7TkHmA11o581ifW4vDFGpncg8GFZWZaju5FGzglDgFHzEbeOrwundOH5?=
 =?us-ascii?Q?vXgILfr1cs6QgEsqXIjDWBq+t7kWPNexTqBp4zhvURX4FfbYzaL9HeVzwRG/?=
 =?us-ascii?Q?c8UIuR444PCuqVIkgUMRWzlrao5mDJW3piP+4MRPGMWPQB8I4uomI4HxxbyX?=
 =?us-ascii?Q?nA0XuzExRLtHD65gTGjsJLjHXXnIfErCieZGZki0PiBuP5nCg7arbLLZgh4Y?=
 =?us-ascii?Q?kfKjBIPcpYFiuiadE6UcaYLaTnFRVnxlU9TdOar0nZPknrc43pjiVbHEev5I?=
 =?us-ascii?Q?7Trb6nh22A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76cff61-cc69-446f-32e5-08da171f95d8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 16:16:05.8319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOC6IVCw74JlEEA2Z6+d15Crt/32cBJBG7ZeFvifzh4UHBHoOJ4nStlzM0FxuSYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Christoph Hellwig <hch@lst.de>
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
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

vdpa and usnic are trying to test if IOMMU_CACHE is supported. The correct
way to do this is via dev_is_dma_coherent() like the DMA API does. If
IOMMU_CACHE is not supported then these drivers won't work as they don't
call any coherency-restoring routines around their DMAs.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/infiniband/hw/usnic/usnic_uiom.c | 16 +++++++---------
 drivers/vhost/vdpa.c                     |  3 ++-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index 760b254ba42d6b..24d118198ac756 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -42,6 +42,7 @@
 #include <linux/list.h>
 #include <linux/pci.h>
 #include <rdma/ib_verbs.h>
+#include <linux/dma-map-ops.h>
 
 #include "usnic_log.h"
 #include "usnic_uiom.h"
@@ -474,6 +475,12 @@ int usnic_uiom_attach_dev_to_pd(struct usnic_uiom_pd *pd, struct device *dev)
 	struct usnic_uiom_dev *uiom_dev;
 	int err;
 
+	if (!dev_is_dma_coherent(dev)) {
+		usnic_err("IOMMU of %s does not support cache coherency\n",
+				dev_name(dev));
+		return -EINVAL;
+	}
+
 	uiom_dev = kzalloc(sizeof(*uiom_dev), GFP_ATOMIC);
 	if (!uiom_dev)
 		return -ENOMEM;
@@ -483,13 +490,6 @@ int usnic_uiom_attach_dev_to_pd(struct usnic_uiom_pd *pd, struct device *dev)
 	if (err)
 		goto out_free_dev;
 
-	if (!iommu_capable(dev->bus, IOMMU_CAP_CACHE_COHERENCY)) {
-		usnic_err("IOMMU of %s does not support cache coherency\n",
-				dev_name(dev));
-		err = -EINVAL;
-		goto out_detach_device;
-	}
-
 	spin_lock(&pd->lock);
 	list_add_tail(&uiom_dev->link, &pd->devs);
 	pd->dev_cnt++;
@@ -497,8 +497,6 @@ int usnic_uiom_attach_dev_to_pd(struct usnic_uiom_pd *pd, struct device *dev)
 
 	return 0;
 
-out_detach_device:
-	iommu_detach_device(pd->domain, dev);
 out_free_dev:
 	kfree(uiom_dev);
 	return err;
diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 4c2f0bd062856a..05ea5800febc37 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -22,6 +22,7 @@
 #include <linux/vdpa.h>
 #include <linux/nospec.h>
 #include <linux/vhost.h>
+#include <linux/dma-map-ops.h>
 
 #include "vhost.h"
 
@@ -929,7 +930,7 @@ static int vhost_vdpa_alloc_domain(struct vhost_vdpa *v)
 	if (!bus)
 		return -EFAULT;
 
-	if (!iommu_capable(bus, IOMMU_CAP_CACHE_COHERENCY))
+	if (!dev_is_dma_coherent(dma_dev))
 		return -ENOTSUPP;
 
 	v->domain = iommu_domain_alloc(bus);
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
