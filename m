Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DD54D5A3
	for <lists.iommu@lfdr.de>; Thu, 16 Jun 2022 02:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2294140253;
	Thu, 16 Jun 2022 00:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUy1tK0OQ4ft; Thu, 16 Jun 2022 00:03:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3BA5840186;
	Thu, 16 Jun 2022 00:03:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0591BC002D;
	Thu, 16 Jun 2022 00:03:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D935C002D;
 Thu, 16 Jun 2022 00:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE16610A2;
 Thu, 16 Jun 2022 00:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGa8Wy183DaJ; Thu, 16 Jun 2022 00:03:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::603])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8176A610A5;
 Thu, 16 Jun 2022 00:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nw5PyHSyCB2Sxt4jKDfqj7u1zLYEG2Xcj1fFolsScreoDFQ8mbRNU5wfbHlLemd9YDXx6J491AecpfI7PmlJN74jVhY630fppegsnyReH/JuyirXJWzLE9Tz7N7cZQoFViXwViL4R9DDCoJd0K8Mv64fLlET3EqPaShHHTIEwotgYMS6ZYRnNglRPBz10CHoTOxcd+vjaXMUfDFswRFR9okYo7Vb4/68TCyKUJ7ttx3AKVBG0zyrLue1SE/RGbowiiuJvVxlLeLIOMYhhXNzwE38HiqWaTrOlDS1UInKqoq3D8+HBQSjuVr8yk4+4ZuUozxYSkg886Hy9/pV5RyACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jauZu1JZ0EjRRsLjq+9fYvdku8WhvGC8mvSh+MRyeuU=;
 b=h1w6OST3OSxJU8HzevC7/YJ18RZuXM2RiPtcdyjGR0Ls8N40HXlrpmSWcAAjdRFmDxtVz8y+y2oeFDBFVgAqymmJAM62843LRUVFE48Tv0BMRbCYN8BfnVLu3pJ0HUr6tpxcW4mdKc29VI9Fj3mC/G8UfHqz9jYhpS4zvnkNU5nEODp5f8B9XVKEUcQhNgpnVSnMQi2I2XDHuQhq1fEJxcIfDgr7Z7OwEXfkrId4vqGJSL8j0ktP+L4vVsCt+NUHDBaP1AiqP6SEr4+j7f5VDFQAweajfLtzXLQAXcQKjS26mkWIi1Oy9pPRIe0H+cJO6jgWjlalpAyuDooFTrgXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jauZu1JZ0EjRRsLjq+9fYvdku8WhvGC8mvSh+MRyeuU=;
 b=PhUhT8Emb7MoJssbsQkG/CXJ0SKGpJ4xnF/up4eexCpXyo5P1Ve0kACyZmKtxwIhf9s+DFZEKObLH6FkK+9G3qa1ewsbW+zA3NSxThb4eJhaqlEEgoyy//deOfp4WUSiFQD9wa5RDns0jLKoy/r11bUwAHc19Lm73xGTdRpCqY0y98d+1ultXMJM6upIRJWIblTXxPP9951ByByQ8vNH4EXaHqO6iF1y2UJXa6weL2wBc7Tb3ng5Yca7M9Jzh0Z3Uik0O3uaUjHgGHvFNHz1SKL2aOsOvJtwiZciER8LtvelBIiPUVBTiH30WXUhZ2837GpW9yH7quo8YQgZv35r0A==
Received: from BN9PR03CA0921.namprd03.prod.outlook.com (2603:10b6:408:107::26)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 00:03:16 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::f7) by BN9PR03CA0921.outlook.office365.com
 (2603:10b6:408:107::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16 via Frontend
 Transport; Thu, 16 Jun 2022 00:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 16 Jun 2022 00:03:15 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 16 Jun 2022 00:03:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 17:03:14 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Wed, 15 Jun 2022 17:03:12 -0700
To: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
 <sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
 <baolu.lu@linux.intel.com>, <matthias.bgg@gmail.com>, <orsonzhai@gmail.com>,
 <baolin.wang7@gmail.com>, <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>, 
 <alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [PATCH v2 2/5] vfio/iommu_type1: Prefer to reuse domains vs match
 enforced cache coherency
Date: Wed, 15 Jun 2022 17:03:01 -0700
Message-ID: <20220616000304.23890-3-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616000304.23890-1-nicolinc@nvidia.com>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 983d751c-36ee-48ce-88a5-08da4f2b9ccf
X-MS-TrafficTypeDiagnostic: IA1PR12MB6331:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB63317969D69B60CF58AFEBE9ABAC9@IA1PR12MB6331.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yboDXVffL3w6sJqprITRC10rb+BkzMV16RO60Re1vfT83wNw7AH0QcBytge7dwckbSLcaBs3qasCflzCpY1zWaXJd8BVZS9LiCv3tQRDbrfaA/Ib9sjs/Wk+Vo7qQNAkuCA1M2wOTAicHGdxRi5B9FCX8+fwYBnRjQunJyagKO27KilxN4HmZVpivwaFgB/2eQ2Nq/fMP/1PKPNvR3wHLvYI5AvMnVq0FSYR+cDFjNVYRJNfxPn85EK+NBSAzzOsUdd8zj1xuObjjcGrhDiJtMCfwcj0fwvpcK9XcWiLG4JVMzCRiNjtpcSv70cXLl4m8rt+UZwmhmWvIEaAesbpM8jGw2vm5cnX2n3FbIavpYwAUqHcWKfaYDSnAomgFp1469gSgR90iYiqhfa1UNamBaNK1c2vM9jjn5cPc/LF12waMEBNCQr/hEpzBycOvGN7mvR/611PxVjGMTmPbYpIJVGBuTVvspDTL/9hZGPjp8mnwYwdSh+tE9DOIVy0Bz6jNCqc90B49odKa+VegIW8ziS9ZjtWO2PkpBBOk161N+j+FBPWbQceZq6DwzHk6VVU8pq4RQs0kUlXTDjkRh7oTEEw2NDbCnrcLDMsF+vOR8S+4ZN45s6rXKZ36TG0TvZ84njOcTcpgh/4rXyhEz1hap1BpHro9DHdDDq8Mn2nvAgh1bhnFKyPAgn1ehHo27x8H1JnJD1uofYLu7/cuaaZY8DBgJkGOLBHfAsReqwL7oeRAlW8Rh8Z2WtLjzsF3twK2Bm0v3Air6njBNWtV76DyA==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(54906003)(110136005)(316002)(40460700003)(86362001)(82310400005)(7696005)(26005)(356005)(921005)(81166007)(4326008)(508600001)(8936002)(5660300002)(8676002)(70586007)(70206006)(7406005)(186003)(7416002)(1076003)(83380400001)(47076005)(426003)(336012)(6666004)(36860700001)(2616005)(36756003)(2906002)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 00:03:15.7818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 983d751c-36ee-48ce-88a5-08da4f2b9ccf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331
Cc: jordan@cosmicpenguin.net, thierry.reding@gmail.com, alyssa@rosenzweig.io,
 linux-s390@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
 kvm@vger.kernel.org, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, yangyingliang@huawei.com,
 gerald.schaefer@linux.ibm.com, linux-arm-msm@vger.kernel.org,
 christophe.jaillet@wanadoo.fr, linux-tegra@vger.kernel.org, tglx@linutronix.de,
 virtualization@lists.linux-foundation.org, isaacm@codeaurora.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
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
property of all devices attached to a guest, no matter those devices are
attached to a single domain or multiple domains.

So, there is no value in trying to push a device that could do enforced
cache coherency to a dedicated domain vs re-using an existing domain
which is non-coherent since KVM won't be able to take advantage of it.
This just wastes domain memory.

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
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index c13b9290e357..f4e3b423a453 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2285,9 +2285,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
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
