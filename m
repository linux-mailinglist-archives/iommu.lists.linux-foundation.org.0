Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DF049563BE7
	for <lists.iommu@lfdr.de>; Fri,  1 Jul 2022 23:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66EB74185B;
	Fri,  1 Jul 2022 21:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66EB74185B
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k8pG/fJC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zrNAC-lqYqB; Fri,  1 Jul 2022 21:45:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C8FBF41BDE;
	Fri,  1 Jul 2022 21:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8FBF41BDE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71352C0039;
	Fri,  1 Jul 2022 21:45:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3E25C002D;
 Fri,  1 Jul 2022 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99DFF60ACE;
 Fri,  1 Jul 2022 21:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99DFF60ACE
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=k8pG/fJC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Le059jLJ1bN6; Fri,  1 Jul 2022 21:45:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 146B760B6B
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2076.outbound.protection.outlook.com [40.107.95.76])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 146B760B6B;
 Fri,  1 Jul 2022 21:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI9pn2CQa9tVt/zSVo7mys2gbuXO+DSJzWOl6PXjlIN0yJH2vR5Y1P6+lTVm4oC349Q66VXWoSvXsImmOaIJ/Qx24RzUopFkL6YNcR8y1uLH2A5MPgLrHxf3mDf69wutcIMjFJSxKFNXrQfHf7K2+ESau4dWORBB0Qw0Jst9VlqUUmUKLMXA+2ozllPuo7F+FqJ6sZBIolryhSQXlGqmDXfA4sYcmKak1y7cZODSySxB2dVIjT3+RoL7Pnju/Sra/KRxHQPFpf3iFlFGvJ+FclbjdDt6xWAoIWcu3KtR3WQ9MvsmmUDPvjOr7zCu9EGl5z97X09SiBY5796mnGnBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBSZ/8mCoG3UGXcMOCHLX5phuetsyzqVOcV/4EW2NGc=;
 b=occ9A/aqGOLEniGSs5RVfKDEYNIigY2cdSuXIsi4qNPbiGX4NbwL2jUNuXbZ6aF7xBgJ9qKpMfrqbsZR6nEzE2oE7RcBrQoVuWoykAdESfkiGeQPYKP6EANb5xqgoqiCgPSDB+zIWg+grBe4yfSRJT+t3QKYoFxz0ePRkkkF7HQQan0MVtripoE0cYT6PWThpC1240GVhReuV28Rh/KGOKeivP9jfOCgGNkBr0IiS7pSheZSiO+yrkii3FStoSDeLQu3PDGNJHqHAjLgQOQVfsLSZghFGMYgL8owqCTpKIuVJIXELW3K2k526LiciFif7Z+acNSIxKgLQTqXyJCMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBSZ/8mCoG3UGXcMOCHLX5phuetsyzqVOcV/4EW2NGc=;
 b=k8pG/fJCFUOLx+I8ynI7pEC7H/lQbxgIAh8DR5xVTImRjjzI/+rLzZmRct2GzDh1baxvIsi5P5OSmjJozRsPQhwRDWHIaPszh5pkZu14uOsiaff2kQRBC03ZzWYAMv3shrXNg/l05mj060+UXVVUGosZ18Lhdnxb5HpiGlaMliPUaX2pDCdkN5MP3LNaxNaheRdx52KGHlE9NU2HfTBBx29sH4XOI4BUWavkbJ2bGxddojzEWo0i+qgaMyoxK5zTAFj8Atsq9OvIVPbsHP0E7avmpYt7ChWV7WRH2QltbbJioSqbVOk+YG+f53wZltG8HvC/pGR9/GsuH6j1rxydBg==
Received: from BN6PR13CA0063.namprd13.prod.outlook.com (2603:10b6:404:11::25)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 21:45:02 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::6f) by BN6PR13CA0063.outlook.office365.com
 (2603:10b6:404:11::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.11 via Frontend
 Transport; Fri, 1 Jul 2022 21:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 21:45:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 1 Jul 2022 21:45:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 1 Jul 2022
 14:45:00 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 1 Jul 2022 14:44:58 -0700
To: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
 <sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
 <baolu.lu@linux.intel.com>, <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
 <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>,
 <alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [PATCH v5 0/5] cover-letter: Simplify vfio_iommu_type1 attach/detach
 routine
Date: Fri, 1 Jul 2022 14:44:50 -0700
Message-ID: <20220701214455.14992-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f14d8d5c-a732-4c23-06cf-08da5baaf447
X-MS-TrafficTypeDiagnostic: BL3PR12MB6547:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7zO5x+QGb3Zd5ZjZKBQKOhFjKUIYy5TCTTzdgh+ejGhsQUx6bBsj/LM6OUG7?=
 =?us-ascii?Q?n+Hhs2AuSCSyQnVu5q6UHAa5bS5D5pbi+P4etUGyypBJvbPCZEDs2bS3zdpV?=
 =?us-ascii?Q?Oanv+vjZrGmOFOCvfsbr96fZGC+pYjFwl/Y6jXVXxZomZaqhf+whpPAbw1R4?=
 =?us-ascii?Q?CYRv8jYJJqMHoklq7+zOwxIfeQgj7a0JaDfYiiWqwTc62nXiYTifIVx8Amtz?=
 =?us-ascii?Q?AEpUWgrCoCOvPIgfv7h2MwxxHoiyfZQo8Ou2QV5NkrF/0jfG1uBOgXB1Cx5j?=
 =?us-ascii?Q?WDL6ag9lBplllEzEHv65FiEui3RSdLU5FMV81w5IaM7jDu3ek+xhUxDFUnFM?=
 =?us-ascii?Q?zYRRrSwHU7MzFPj/eshZ9BM0jm5mhksn5AsNrSDcnjBi+jlQ5ctI4kPqp32I?=
 =?us-ascii?Q?TBdyTgNlJ26cFV1SgFVG9PIykmrgzGjfoHY3gGtSlDowHAP71XCc+jW3vGzr?=
 =?us-ascii?Q?hNJUtK9pmiOZ3/z31BWqvpy1jhzDsY0biIrKet4menfTrscKTKIXmYKws9NZ?=
 =?us-ascii?Q?wIFEU3rwBPNll+3M4uZQ7QRiJWL03AoE3g3JdOHARDV0qQNkC4sCuFgoj+dn?=
 =?us-ascii?Q?yzRaSoPrFioKNrbXzq1Pw1mE9U5uxMhKIQhoHodLyY2qdXodyyM/iA2OGluu?=
 =?us-ascii?Q?3hxg9nSt0uEFXnsHP8RdNWLCaHwEmADHrbpW8iBnDzbXl968TzT4TJwQomCw?=
 =?us-ascii?Q?9Pb99Lx6mJKiLKlVU0uhLwZTxnxF1ycztruf8dSMbSrRX2cNWOIGP0qVJKYD?=
 =?us-ascii?Q?VsMUzKKttjv2lv+TcQdYG/7rQryAivdApfIArgJmAO1+E42WU3WiyZSPh0x3?=
 =?us-ascii?Q?PWi/EKiRTIz40LaDtbQaPPD3G9BIq2ZiRjiahDPdWURmgY+03MqZYSWNBQMu?=
 =?us-ascii?Q?hrYyP3yHEdaXpU0cF0WJFPZbwiPraAdfd9zufM1aDeWDlyadY5jvyCql+2EU?=
 =?us-ascii?Q?h58tSJdsADRSAgxD2Z6cPMHlnsTJc8piRfQsLnZbMLVxgwRVuawbuOsYhsdF?=
 =?us-ascii?Q?pMpXISYb4aaZZJalVIX301iqhXefaNwWC/9NOPY+HD1PQyk=3D?=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(40470700004)(316002)(7696005)(7416002)(7406005)(26005)(86362001)(5660300002)(8936002)(478600001)(110136005)(70206006)(4326008)(70586007)(8676002)(82740400003)(356005)(6666004)(966005)(81166007)(54906003)(47076005)(336012)(426003)(83380400001)(40480700001)(40460700003)(36756003)(1076003)(186003)(921005)(82310400005)(41300700001)(2906002)(2616005)(36860700001)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 21:45:02.5335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f14d8d5c-a732-4c23-06cf-08da5baaf447
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
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

This is a preparatory series for IOMMUFD v2 patches. It enforces error
code -EMEDIUMTYPE in iommu_attach_device() and iommu_attach_group() when
an IOMMU domain and a device/group are incompatible. It also drops the
useless domain->ops check since it won't fail in current environment.

These allow VFIO iommu code to simplify its group attachment routine, by
avoiding the extra IOMMU domain allocations and attach/detach sequences
of the old code.

Worths mentioning the exact match for enforce_cache_coherency is removed
with this series, since there's very less value in doing that as KVM will
not be able to take advantage of it -- this just wastes domain memory.
Instead, we rely on Intel IOMMU driver taking care of that internally.

This is on github:
https://github.com/nicolinc/iommufd/commits/vfio_iommu_attach

Changelog
v5:
 * Rebased on top of Robin's "Simplify bus_type determination".
 * Fixed a wrong change returning -EMEDIUMTYPE in arm-smmu driver.
 * Added Baolu's "Reviewed-by".
v4:
 * Dropped -EMEDIUMTYPE change in mtk_v1 driver per Robin's input
 * Added Baolu's and Kevin's Reviewed-by lines
v3: https://lore.kernel.org/kvm/20220623200029.26007-1-nicolinc@nvidia.com/
 * Dropped all dev_err since -EMEDIUMTYPE clearly indicates what error.
 * Updated commit message of enforce_cache_coherency removing patch.
 * Updated commit message of domain->ops removing patch.
 * Replaced "goto out_unlock" with simply mutex_unlock() and return.
 * Added a line of comments for -EMEDIUMTYPE return check.
 * Moved iommu_get_msi_cookie() into alloc_attach_domain() as a cookie
   should be logically tied to the lifetime of a domain itself.
 * Added Kevin's "Reviewed-by".
v2: https://lore.kernel.org/kvm/20220616000304.23890-1-nicolinc@nvidia.com/
 * Added -EMEDIUMTYPE to more IOMMU drivers that fit the category.
 * Changed dev_err to dev_dbg for -EMEDIUMTYPE to avoid kernel log spam.
 * Dropped iommu_ops patch, and removed domain->ops in VFIO directly,
   since there's no mixed-driver use case that would fail the sanity.
 * Updated commit log of the patch removing enforce_cache_coherency.
 * Fixed a misplace of "num_non_pinned_groups--" in detach_group patch.
 * Moved "num_non_pinned_groups++" in PATCH-5 to the common path between
   domain-reusing and new-domain pathways, like the code previously did.
 * Fixed a typo in EMEDIUMTYPE patch.
v1: https://lore.kernel.org/kvm/20220606061927.26049-1-nicolinc@nvidia.com/

Jason Gunthorpe (1):
  vfio/iommu_type1: Prefer to reuse domains vs match enforced cache
    coherency

Nicolin Chen (4):
  iommu: Return -EMEDIUMTYPE for incompatible domain and device/group
  vfio/iommu_type1: Remove the domain->ops comparison
  vfio/iommu_type1: Clean up update_dirty_scope in detach_group()
  vfio/iommu_type1: Simplify group attachment

 drivers/iommu/amd/iommu.c                   |   2 +-
 drivers/iommu/apple-dart.c                  |   4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  15 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |   5 +-
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     |   9 +-
 drivers/iommu/intel/iommu.c                 |  10 +-
 drivers/iommu/iommu.c                       |  28 ++
 drivers/iommu/ipmmu-vmsa.c                  |   4 +-
 drivers/iommu/omap-iommu.c                  |   3 +-
 drivers/iommu/s390-iommu.c                  |   2 +-
 drivers/iommu/sprd-iommu.c                  |   6 +-
 drivers/iommu/tegra-gart.c                  |   2 +-
 drivers/iommu/virtio-iommu.c                |   3 +-
 drivers/vfio/vfio_iommu_type1.c             | 352 ++++++++++----------
 14 files changed, 229 insertions(+), 216 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
