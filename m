Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE55589BE
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 22:01:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E3941B81;
	Thu, 23 Jun 2022 20:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E3941B81
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JGW4LEKh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogDJXK4C-AFW; Thu, 23 Jun 2022 20:01:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 616C341B79;
	Thu, 23 Jun 2022 20:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 616C341B79
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35EE2C0082;
	Thu, 23 Jun 2022 20:01:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27FB4C002D;
 Thu, 23 Jun 2022 20:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DDC861173;
 Thu, 23 Jun 2022 20:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DDC861173
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=JGW4LEKh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9wmH__IM8Fn; Thu, 23 Jun 2022 20:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F11B60B20
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F11B60B20;
 Thu, 23 Jun 2022 20:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEn3xq36up9V6E08QdW1kFJoHBnAzOm6wJdSUEPaObx3Hdtc3u34kXi+CQ8TWco5GZibzYJ4LzYnST+wZz5eM+t91weB83DV036bpkQNxGEX7YiYWKWYOzDeuGTzuGjZYB48gKUG0X2hDxqubSfR/2usY3dwjALkDF1HpZnIph5ev77kMueUVuLppjx0b3bBnUfvh14UIG+cr2DW/yYGTRMwCkGJFVhzlGYS8UTixGyPRCjMg+NN8fTjM/Osu6sqOwzSmYXEtzRKEzX3CRhgRJKx3I9qeefGNvzs/4ag6aReINUctkhc1hRH/WHX4CLCnZzK3NRghKp+AWmGuoLgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiLl+1qlIiZ2p5XtsJlrm1t+tPCrFaHsdr1121XcM/M=;
 b=cSsFYOQufHDidw4MlQq+Y8ii74VoyK3eE13t1gwOFIhH2oSLiaY/iAOkCmU65RpZjVboajK9Ka9ey41M0CiT8Z8L2TcLKV9ynBKKRcn+cpSQ7RQfxHC53+xXR2ICGYlw/y7zPB80lZyPdSwXIkqQ3PhFibHgiEUuVnIV4wYM1JoeVmiCG4uykquGpmNsn7XlKnhwUx6uMzt1L5uPAKOgL8ZolDDUGi+Ska3TuQWKcdI1vjhxV6Vp/TJ5G2/kzaQEy2fRGHxSG9ZCw1ljyf+308bWTfUQzZF12+Zrpf+x+N4BwESbVRTrlFtZTzLsJYq1BXH8dQAS2d7CZELXxZZS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiLl+1qlIiZ2p5XtsJlrm1t+tPCrFaHsdr1121XcM/M=;
 b=JGW4LEKhNUZbyIo9qiAvbZXZS7j83x/X3izclI6zn572DClh36vUR49ILOeqIhvDNCRTRy2+3kLk1AjZskdSWcra2J4W2vKH/AGUoB9NHcAuCmEX2CzdLWHuOMlfcLRfqgVID5Mb9MbNARRGQBQSX0cAr4RYGv52TKkNvEEhbiIVRnKv+ZmInCwWqRYWpxvMFf4Hfx9dL+abrcwgdlSFzoU0fJjsk8b4GAtQHpShfAvKuClQG4BDRcFPjzP5mpLmockK0IVQXoJb1vH1sNS8aYMI00Snk9kG6/FmYigXL/BrzLuR8GCVpGoGd/9Oc2jL0oCZYOrNTmHWAbPFNF//2Q==
Received: from BN9PR03CA0783.namprd03.prod.outlook.com (2603:10b6:408:13f::8)
 by SN6PR12MB2751.namprd12.prod.outlook.com (2603:10b6:805:6c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 20:01:40 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::eb) by BN9PR03CA0783.outlook.office365.com
 (2603:10b6:408:13f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Thu, 23 Jun 2022 20:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 20:01:39 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 23 Jun 2022 20:01:39 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 23 Jun
 2022 13:01:38 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Thu, 23 Jun 2022 13:01:36 -0700
To: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
 <sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
 <baolu.lu@linux.intel.com>, <matthias.bgg@gmail.com>, <orsonzhai@gmail.com>,
 <baolin.wang7@gmail.com>, <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>, 
 <alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>
Subject: [PATCH v3 3/5] vfio/iommu_type1: Remove the domain->ops comparison
Date: Thu, 23 Jun 2022 13:00:27 -0700
Message-ID: <20220623200029.26007-4-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220623200029.26007-1-nicolinc@nvidia.com>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be33d66a-062a-445e-9b6a-08da55532fe8
X-MS-TrafficTypeDiagnostic: SN6PR12MB2751:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cowBanVnRs74asRIkEry4va1+JrzBKVdez/9Msww3cMrrv4yrQEY50xIGLlh?=
 =?us-ascii?Q?vMk0CpVor5zl3+aRZKKTyZv0dy7BlE/KNXar+T5Sike4FS8mD1pk/gwis8Yf?=
 =?us-ascii?Q?7SUJwKSeUzSoRcvg4KDz4NPHZ03/7aorBvmNRWL7PB/EhwDKUHU3NlwrnNNj?=
 =?us-ascii?Q?D5FTe0gHtU8kAiVBzOKigzQSHLowZWLQ1xxFfcWCm6MZtHKQUjzF7mKY9kOS?=
 =?us-ascii?Q?N8nTAbU+Uyj0xmwRhzoib+VJb6IWwF4/dKsm4i8nYnjnFtTKN+b7xdw0oai8?=
 =?us-ascii?Q?2ZxjT3ifvCbq+hnwGwzSN+pkcUH/jorv51dBVGNDPt3xlMu126MT1tC3ij2v?=
 =?us-ascii?Q?FUEr5CaAyyD6MFpDK+GRRk+U8c4s5EuvTlN/GwgMiwZBHktnpewvwiJOWDmQ?=
 =?us-ascii?Q?PrqBo/vnhgz5IcjduDrW/Y/Kmev/UBI+KcTR9Tv64bRDtC5//zfUT0+t7hAi?=
 =?us-ascii?Q?2J3IWQ78fEwofgB+YqEMjyBVu/QH8HcL6LhRHtM6vdFNB07cJPaCT/9f1Dfv?=
 =?us-ascii?Q?TdfGdMNUOTBn+yLPmta9/cKQi8eqK132k5iwi6qzYRnrkb/ja5u/TUe6zkxg?=
 =?us-ascii?Q?hqANeJkprZoNrSe+XgmFRVSMa5/v5G/IiyS+z1pT8ZW69G0KrD8eeAdISMwy?=
 =?us-ascii?Q?ntOfrbuKM2BTRLIjF4gSwOirah9B/7neysp+drV8ldW2LsTcRmaqwPKKfwa0?=
 =?us-ascii?Q?a2/0bVvf5NQyZYS8Nd5qjOZ84zHcbddq6nB0dswMC1h781bzSbO2nbci3+Ca?=
 =?us-ascii?Q?l3M8psnch5jhqyNv0btXgfRlLsApZLZbQYSQ2OCzxlplcqwvDaEQo5aesjNx?=
 =?us-ascii?Q?bR4dIlgfs6yqhqPW1HkeWE3Am3MuZtt97iOyqP+miqwfn+ZWTofqegyBsEnf?=
 =?us-ascii?Q?pYp3vqogl+RlrUYZw7T0DNfNmuwApokdQL+yTpgCk06oWO418Ib1ib5ty6CP?=
 =?us-ascii?Q?OrJOP0x+kwEMM3txjgIcJLCpiVbWR92d6KyjYCNVg/G0giAVcrGp3r8mBi2t?=
 =?us-ascii?Q?s4sMv/5nixIfz9KR/PYCUgt+KA=3D=3D?=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(40470700004)(36840700001)(46966006)(40480700001)(7406005)(83380400001)(426003)(336012)(86362001)(2616005)(70206006)(6666004)(70586007)(4326008)(8676002)(186003)(8936002)(7416002)(5660300002)(36860700001)(47076005)(1076003)(81166007)(82740400003)(316002)(40460700003)(41300700001)(921005)(356005)(26005)(478600001)(7696005)(36756003)(2906002)(82310400005)(110136005)(54906003)(966005)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 20:01:39.9047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be33d66a-062a-445e-9b6a-08da55532fe8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2751
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

The domain->ops validation was added, as a precaution, for mixed-driver
systems.

Per Robin's remarks,
* While bus_set_iommu() still exists, the core code prevents multiple
  drivers from registering, so we can't really run into a situation of
  having a mixed-driver system:
  https://lore.kernel.org/kvm/6e1280c5-4b22-ebb3-3912-6c72bc169982@arm.com/

* And there's plenty more significant problems than this to fix; in future
  when many can be permitted, we will rely on the IOMMU core code to check
  the domain->ops:
  https://lore.kernel.org/kvm/6575de6d-94ba-c427-5b1e-967750ddff23@arm.com/

So remove the check in VFIO for simplicity.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index f4e3b423a453..11be5f95580b 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2277,29 +2277,19 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 			domain->domain->ops->enforce_cache_coherency(
 				domain->domain);
 
-	/*
-	 * Try to match an existing compatible domain.  We don't want to
-	 * preclude an IOMMU driver supporting multiple bus_types and being
-	 * able to include different bus_types in the same IOMMU domain, so
-	 * we test whether the domains use the same iommu_ops rather than
-	 * testing if they're on the same bus_type.
-	 */
+	/* Try to match an existing compatible domain */
 	list_for_each_entry(d, &iommu->domain_list, next) {
-		if (d->domain->ops == domain->domain->ops) {
-			iommu_detach_group(domain->domain, group->iommu_group);
-			if (!iommu_attach_group(d->domain,
-						group->iommu_group)) {
-				list_add(&group->next, &d->group_list);
-				iommu_domain_free(domain->domain);
-				kfree(domain);
-				goto done;
-			}
-
-			ret = iommu_attach_group(domain->domain,
-						 group->iommu_group);
-			if (ret)
-				goto out_domain;
+		iommu_detach_group(domain->domain, group->iommu_group);
+		if (!iommu_attach_group(d->domain, group->iommu_group)) {
+			list_add(&group->next, &d->group_list);
+			iommu_domain_free(domain->domain);
+			kfree(domain);
+			goto done;
 		}
+
+		ret = iommu_attach_group(domain->domain,  group->iommu_group);
+		if (ret)
+			goto out_domain;
 	}
 
 	vfio_test_domain_fgsp(domain);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
