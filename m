Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DAF3A239F
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 06:45:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4E7E40430;
	Thu, 10 Jun 2021 04:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuFtxIQ8LTd6; Thu, 10 Jun 2021 04:45:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8CB04402AD;
	Thu, 10 Jun 2021 04:45:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C345EC000B;
	Thu, 10 Jun 2021 04:45:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E70AC000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 04:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F5F7606E5
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 04:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7681_OSaGOzW for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 04:17:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24E29606DA
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 04:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxPGoydV2wO3Fp6pG0JJVxoe7V+uuI73GYPQxMYabbKoCZSSLvT8xYGTbfpaa9iArUgeTmrlRC7w15KhhOrR6RS0PxsFKbmv6z5uhEVXqLwqziuB9iS4ZTlB2jXLNGM3WW57WtIQXoYztX7QuZMq6R+UP/0OghxawAm7D0fpvEymZT6WLJANCOPnvlmR5jwb5t64510nXSitQ3VoUFhidgTKYKJU5wh7cLBpo+L+Nuaku81+INe5ZYwKicUnj8b3w+eW37wrxVuo3AfVnjmti4N6QmwL8p+8fuTYvXd1bB+1wmws8emVTzTgASajWroQ/cOwycdcgdYyn02R37oNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN5UC54JsdjLxvzHndxBqpmY8Hp7cHJ1XGGKBkiJNA8=;
 b=nYkPtUbJ+tUMiswm/UiZ9g8trHthkM0ErWEWRFMAGruJ8C//hw69jOb+sZ7nZceWWAL+OIOf8Yz+dh52AZNDeciIdZIbvMj18K/Nu82QygG3Lujj/N+6KeGD2xODynFOBHjDH0SPG+OFhXz1jjR8ZWhIlqnQA7Ux2z75JmdH1l4grZpVbmTFofdlgyw1RONRmxJp4JZHazfzhI+AiJ0lWf/BmCdPF+mdXPWK30nE0PSXsxbS/CsdC0c6fcD9/6qU+TGDZDIHQf2tOwLOrNC5UW/UWzUK+wDKBvyfDBoVzxFUTPgzVLecjAyFlLZCs6kcttHrf5xjI+reoJfo6P4Yqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN5UC54JsdjLxvzHndxBqpmY8Hp7cHJ1XGGKBkiJNA8=;
 b=HxPz96IEebpMHZew+GU2SWqFbFpaubbmUyShjT5a4cLYfUS+wi9tZ3Y/PxciHGUv+s3P7nntCfMc2gbXzyhIar/6TB9p6NsQqV2lhy3bP2lq9t2N2PlD2e4t2DYQt0odFIT/TsvPYmwyzaJ0C5g7LdQClh1OvMCKXEHu2jxhxxLgI3qDQ3NtHdWh7O2jdXb8QqeSv8cXtioE0w7HbYd9XKodRxg/ia/ekK+KnO+6kdWeyJyBU8c/EgECO92MZcgBRtkY8OXQYXaf4V53Srp01AKou2UhQZ1zzBtBi1b6k/AW2V9gS/ipD8o8PhHCIENRhvFdAdSsCKVKOtaiAgwVaQ==
Received: from CO2PR04CA0006.namprd04.prod.outlook.com (2603:10b6:102:1::16)
 by MWHPR12MB1599.namprd12.prod.outlook.com (2603:10b6:301:10::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 04:17:09 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::f8) by CO2PR04CA0006.outlook.office365.com
 (2603:10b6:102:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Thu, 10 Jun 2021 04:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 04:17:08 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 9 Jun
 2021 21:17:07 -0700
Received: from amhetre.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Jun 2021 21:17:05 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <amhetre@nvidia.com>, <joro@8bytes.org>, <will@kernel.org>,
 <robin.murphy@arm.com>, <vdumpa@nvidia.com>
Subject: [PATCH 0/2] iommu/arm-smmu: Fix races in iommu domain/group creation
Date: Thu, 10 Jun 2021 09:46:52 +0530
Message-ID: <1623298614-31755-1-git-send-email-amhetre@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 590325df-a188-4cc9-e067-08d92bc69cd8
X-MS-TrafficTypeDiagnostic: MWHPR12MB1599:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1599E3043E2D1885EA395C75CA359@MWHPR12MB1599.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GEpngQe68KrYDQmkkRsLoyd1nDJJtEZ5Q9U6nKD+2UkBO7JUWT9Se4SqTP1JeExdOkH2T/xcfXcUVqbcgD8d3PyuIXTWFnFQBRtaUXXug+JRvZLOvxoUKwV5xVyag0a76sgk64tD80aiG1ixeRqHJhDud+H8LatPj6r9SdkQeXlmilQykSj4/ITkIAL40KjQwfdVBZwwHdfm07lVTpjaCjdKspeoboYl1IFv9IkFKTLsrfJpJp0bE6e52k8C37YwwfOhI8zlt4SxBmc7HFvqLqYui3A5l5+RBdvksZD5uRC74mbkFv5X05tRvn3eF0D8V/OsUNIcXIItROEdZ/9vptR6snYzfhpqEr6De1IIzz+CyvSziAFNVmANG6ckWStoZu5C0zPkBc2MSxbA829Aui4QnMon7bnx219N26sNWTkJ2O3q3jYHipLQMR+jVx6wS3ABG90B7B8JLAZHDmz6VLeSo835+vdkZOP3gJAqwBLyvjHp6vxaePT/MFVzcRmKrH9s3NL93chp+wtvTJfqoJA6/LInLuLVMomLVOuZa0bv152TpO8q65PwxpaI4nfqY5pfWFhvNkWACITU9bcLYtPck5Yn/BxL/unBwqRIXsEAVQ1Eo2/YBxzivwShOvRhQOHxQjIoOzu+9nbTdLRnwRFw5gzbrzTnL5AnYorpXjA=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(36840700001)(46966006)(356005)(5660300002)(8676002)(70206006)(6636002)(7636003)(70586007)(82740400003)(316002)(186003)(36756003)(478600001)(8936002)(54906003)(2616005)(26005)(82310400003)(7696005)(86362001)(83380400001)(36860700001)(4744005)(336012)(2906002)(47076005)(426003)(6666004)(4326008)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 04:17:08.2824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 590325df-a188-4cc9-e067-08d92bc69cd8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1599
X-Mailman-Approved-At: Thu, 10 Jun 2021 04:45:06 +0000
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Fix races during iommu group/domain creation for devices sharing same SID.

Ashish Mhetre (1):
  iommu: Fix race condition during default domain allocation

Krishna Reddy (1):
  iommu/arm-smmu: Fix race condition during iommu_group creation

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 6 +++++-
 drivers/iommu/iommu.c                 | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
