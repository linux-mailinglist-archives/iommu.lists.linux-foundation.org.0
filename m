Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334B563BEA
	for <lists.iommu@lfdr.de>; Fri,  1 Jul 2022 23:45:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1AC1423C3;
	Fri,  1 Jul 2022 21:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1AC1423C3
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lYeXHVlB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGk89F-yWsjr; Fri,  1 Jul 2022 21:45:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7227241B40;
	Fri,  1 Jul 2022 21:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7227241B40
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48EBCC0039;
	Fri,  1 Jul 2022 21:45:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6568EC0035;
 Fri,  1 Jul 2022 21:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ED9E60AFC;
 Fri,  1 Jul 2022 21:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED9E60AFC
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=lYeXHVlB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDwfb4qlTIyf; Fri,  1 Jul 2022 21:45:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FEAD60ACE
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FEAD60ACE;
 Fri,  1 Jul 2022 21:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdZPlIPf5uc7hbEKNE1o7UwgP/yWwIBY3YDAXmsUM/QXGU/CanHQyevK4gDrF2XtcacEOdndCU6nCw6+3da9ruxAncfaQrVyb8gQNuIPFJhDc1j5jaRBm4z/2N/ZmAxWbhuB5pKn4rNB0+IFyfkuwq5/GbqreTPs1y3/hyd55WHgY2hxqopkGrJrWzq86XQP9HqMv/aYaKZlNo5UkzZ7oBElnNbVM3z9kG4lD4WEitbgJarjAgDLZmziodXVY73KlttI1m4bNsHGqg5jMrtD5CZo4z74dNhKdatSdTFkUaic+4HkRNFYkl/u5BXeiUk6+UBqSebPkgan5KKAtdvAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8c0HJirraBV0iUyoB0bUoXWVwy2+oMhqJqz0e4/bLU=;
 b=nUYB8WrBaXZmAKPJBjHYuV9NqeFr9fLJO6W/617deaErfhDcB4foH7CClVVNLgwT2tlcLJtOfq/rRJgVNp16ye9JiphcDg/BEwqOO9s+/9Bjyejarmsm/JJStWJSjSd56Dczb6sQCF/8qJgqJtwtEH3Gp8C76kl8bDuLGWgcTHpl1hoYOA6EOdwIxeEUrRhXGys5WHdELQDrq7wJfKv57Z9C+5Qx6FlC8PJYJEOiFIG45B0v0cbQS3+w7rtrdRSSJloNyY/I1mucUFs/m6RODQhzPThEa7pnNeZc+Dd189dBjlBkkAhFX59dLYwxlOfgjIWjrqLQ817bcBnxtrwpgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8c0HJirraBV0iUyoB0bUoXWVwy2+oMhqJqz0e4/bLU=;
 b=lYeXHVlB9hUo3gS9L+JZ7cukYO8ZQLkY6gnbbpnnoqpkuwgInm0qysDQ9oLYWd9HlXk0zhvvBrgpqeJsKHbuoTPF6xG8/UwsjznPmp2h/MUcXrP5uxk6XfpwKy0p4ucBimIjXmS9NveySpNCeKdXIq/TvlCUQOVMu5eoeTRWLakipJm0Huojot6klB/xUyxgZB/dhDwIbCSt4vttYvsI0Qj6GzM/nvU6iSp+y3wuBVucC1xZq4gqPWfnUgsI53AzxY/Vq/ZvsCwlovzjJOG8kLKnQ6+eKqvgNtkHesoVuffx0jfQigOCw1Q1TbAyw3LPMm1KXmm59heBvYM6CnJ6DQ==
Received: from MW4PR03CA0259.namprd03.prod.outlook.com (2603:10b6:303:b4::24)
 by PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 21:45:07 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::5) by MW4PR03CA0259.outlook.office365.com
 (2603:10b6:303:b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Fri, 1 Jul 2022 21:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 21:45:07 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 1 Jul 2022 21:45:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 1 Jul 2022
 14:45:05 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Fri, 1 Jul 2022 14:45:03 -0700
To: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
 <sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
 <baolu.lu@linux.intel.com>, <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
 <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>,
 <alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [PATCH v5 2/5] vfio/iommu_type1: Prefer to reuse domains vs match
 enforced cache coherency
Date: Fri, 1 Jul 2022 14:44:52 -0700
Message-ID: <20220701214455.14992-3-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701214455.14992-1-nicolinc@nvidia.com>
References: <20220701214455.14992-1-nicolinc@nvidia.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daa3572e-c837-4fed-2d9e-08da5baaf73d
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvIsLnjwuKNCAJ95WimQvww3KF/Tvd3cqLfe1JGdIgnsE8npu5nSAW63GRtAxXswz5nUOy9DgSVMwm5mFv04SAUTxaObv+wlsXBLJNno5qvmEnLhd1MNCHWwIzMBlFNuxkWoAXgTZO055Hq6XvXpM48hoi8ikOZnxjcy/qX58KuT/Id45aoDFXNk+rWdIWJh7Uf3rOnCNHqo/TqmvyIgN55Ke1MQWw6bNmiP6/JdpJ3PJClrdfQ5KeQiMVjWcFi6QMZg+ZAlCobV0neF0g61TR+rmlbiTcjcHI/NvUSm3930JToPhzX4tuw5hk3DRxIXdYKCM7Gdpfj29QLkOdJCadD8VCg/J4QrryhCk5T5EVPk94SNcRAMRVmVUzCzbA/sB65tflhOVOHVZA8Tgns3A4duFOREbjEaxf8wpphRpWt2wgJXTbwb3NY62D40+KX6ShjskCDHi+vb7gX+Y4xIz9OHVPONWdLQNl0sCV8bEZXgtRXY31LnwO0eVP7BgYWGmSOWP9CMWXhfcgpXdqptBv5WVh3Mk1fdyyM5Jze0AaDKEMaephNDL6u33Ox0K4a8rpTDVuiPwcwbR33oyXupguhNt0vRx/as+JFaPoPn0hNc2V02QMj/ePmO/v9oBsxvmagEE12SsmFw7gJe+/3V504QYhhqtMA2nw8J8N6dpqCaVOQ4D0SRLo6y6pkXeF1dvin6vU6jFd8ZHgTCnWDJESAl3eNMCQ34cGoQS9LaZBoO5+m/ABMKIWVod9VZU4t3Ko/1cpXzGy3U+2OXK+YPxBjNbXy17WfTS2Nt+SWAl+raObtbdpMYH5n7q4y1jDBFqn33IvEC24PfsG9yGW+rTKogEwNs5YC2kURPHt4o4PsFHjFKlfSvEHSTjH/nOf9PvyMo/flOYHzWdIEs8tS3mIKML2M/PXCJ3sEDj34iiAw=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(426003)(1076003)(186003)(336012)(47076005)(36756003)(82310400005)(2616005)(26005)(83380400001)(7696005)(36860700001)(6666004)(40480700001)(40460700003)(4326008)(54906003)(110136005)(7406005)(7416002)(8936002)(70206006)(5660300002)(2906002)(478600001)(82740400003)(81166007)(356005)(70586007)(316002)(8676002)(41300700001)(86362001)(921005)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 21:45:07.5802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa3572e-c837-4fed-2d9e-08da5baaf73d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6000
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

From: Jason Gunthorpe <jgg@nvidia.com>

The KVM mechanism for controlling wbinvd is based on OR of the coherency
property of all devices attached to a guest, no matter whether those
devices are attached to a single domain or multiple domains.

On the other hand, the benefit to using separate domains was that those
devices attached to domains supporting enforced cache coherency always
mapped with the attributes necessary to provide that feature, therefore
if a non-enforced domain was dropped, the associated group removal would
re-trigger an evaluation by KVM.

In practice however, the only known cases of such mixed domains included
an Intel IGD device behind an IOMMU lacking snoop control, where such
devices do not support hotplug, therefore this scenario lacks testing and
is not considered sufficiently relevant to support.

After all, KVM won't take advantage of trying to push a device that could
do enforced cache coherency to a dedicated domain vs re-using an existing
domain, which is non-coherent.

Simplify this code and eliminate the test. This removes the only logic
that needed to have a dummy domain attached prior to searching for a
matching domain and simplifies the next patches.

It's unclear whether we want to further optimize the Intel driver to
update the domain coherency after a device is detached from it, at
least not before KVM can be verified to handle such dynamics in related
emulation paths (wbinvd, vcpu load, write_cr0, ept, etc.). In reality
we don't see an usage requiring such optimization as the only device
which imposes such non-coherency is Intel GPU which even doesn't
support hotplug/hot remove.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index c496b7d0b96f..7530f0d727e5 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2288,9 +2288,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 	 * testing if they're on the same bus_type.
 	 */
 	list_for_each_entry(d, &iommu->domain_list, next) {
-		if (d->domain->ops == domain->domain->ops &&
-		    d->enforce_cache_coherency ==
-			    domain->enforce_cache_coherency) {
+		if (d->domain->ops == domain->domain->ops) {
 			iommu_detach_group(domain->domain, group->iommu_group);
 			if (!iommu_attach_group(d->domain,
 						group->iommu_group)) {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
