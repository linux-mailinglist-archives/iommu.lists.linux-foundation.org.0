Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6153C3FC146
	for <lists.iommu@lfdr.de>; Tue, 31 Aug 2021 05:08:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C9060BA4;
	Tue, 31 Aug 2021 03:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1f51ZpOOJMuM; Tue, 31 Aug 2021 03:07:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D482660BAD;
	Tue, 31 Aug 2021 03:07:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED8A9C0027;
	Tue, 31 Aug 2021 03:07:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDE9C000E
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 03:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3FEC4044C
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 03:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lC8cWdyeGi72 for <iommu@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 03:07:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89AFB4043C
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 03:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLmNvnYGR52qTm85T3EzwlmeRoVi0gNLoEDeMHTfOTTqQV19JNg4Db6TGmq+iTRg0J4pWoHLjVCnIfA8o/8PxR2OtbBJkVvtpCzYwCaMjz6Dszc050DDIeeaTyq6qyufpmBZBkHK4VppGGD2UoHjAAJ1iuxbldk/28RUxS9xfkAgWzOoEXtL2f2GnAlnV7kEmchjYxAv3xRJ+VyirvticPI1WajY1+V5h4XU9Tc5rJJ1ObRq4NZQAXXTafab73PSMAma/y7Bhczz4jaAy0nJUci3nq05Vg5DmDBUQRLPdyUrDavCkKrTRUtA+eg2Iih9E6KYZgGwmam+mrQvwQsgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y1sZnggWLQTQCHMetWfg3D7bWv+PfU9Es3PjDXX9B4=;
 b=HDrGXsiwxEktcvBonjR/4jUPZaBHL9moHYxa22NxseTRzDtIl1Pf6Yv0OFtHu9/XlO33HKNghB5AqHJzbivywNeT6aV8nR+6nVstQEAGfAbDOJX0uplU3wjljCBvGbA0lbhQ7KZj5hy8G3i/plYs3a0WkvDYZS1JuGsBIOo+8jLeXzaNg/aEPiQIhnZfuqrXo7mZiZSIlm50NaTRCpBb3UbhOLJ/p0StckqApQnpQT1/rB2JvRXbVcF9XF9pWFPSBitfSgiZCZMlVtJG5EnL5Zj4MMYHAFCz4Qf96SAS7vadItRig/DTgTCNzlkDkDU51ZYrz/uIKmsGDRRk6wlvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y1sZnggWLQTQCHMetWfg3D7bWv+PfU9Es3PjDXX9B4=;
 b=ZRsc1tBCDAriHjHpRP6IVeui44Vt1ckReEfi2MBqmGIgtFNyU8oT7Da+xbkuiLaQ9S5v8bYvjk0/f/RJQdPL4KVewh90JyYkk2LSGhYZsxySeQyL5noBbrw0q5td7ce9MUcNryFolZWM5FQ8ZDoVutxR3NuKwGo6VZs1ieS9cbeFxyQnPdmnkrwqDAt1mu4afuQTHfotgqd3Bhz8a6/HQCNnGD3sM1aDiVwti1BsTCLJ3JfWeXMKD9DxfogBEA2utfFlbU6FlJtkDPGrKKewBTO0UyfqN2D+HrfwO0v0IYwDaP10XnTmfqbDn0QT+4y8NBBTOYj6Kp1YTHDla/27cQ==
Received: from MWHPR07CA0003.namprd07.prod.outlook.com (2603:10b6:300:116::13)
 by DM6PR12MB3515.namprd12.prod.outlook.com (2603:10b6:5:15f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 03:07:31 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:116:cafe::8c) by MWHPR07CA0003.outlook.office365.com
 (2603:10b6:300:116::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Tue, 31 Aug 2021 03:07:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 03:07:31 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 03:07:30 +0000
Received: from Asurada-Nvidia.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 03:07:30 +0000
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <alex.williamson@redhat.com>, <cohuck@redhat.com>, <corbet@lwn.net>
Subject: [RFC][PATCH v2 03/13] vfio: Document VMID control for IOMMU
 Virtualization
Date: Mon, 30 Aug 2021 19:59:13 -0700
Message-ID: <20210831025923.15812-4-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210831025923.15812-1-nicolinc@nvidia.com>
References: <20210831025923.15812-1-nicolinc@nvidia.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb41c4bf-b513-40e3-3292-08d96c2c78d9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3515:
X-Microsoft-Antispam-PRVS: <DM6PR12MB351536D56E8F12F64612F46FABCC9@DM6PR12MB3515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0SYAXcY+augGzMSqzNi6zVq5a9AW5XTjp6afjcWXlPvp08zwhuJwN/vRO99S3qKKMeXpULY5YS4VQ44bGtMaWffZ0GkmjpCpUNGISVQ725tEf17/brOq5dp4QzjrjGqoThzPJEohy3178lmKJUh9N6jo0G65RwNqlyDppcP1SDT7Sz+oPKtw1+AfEqznRgPdReTh3aL05QLdBxk+jad0Tnx80DrPnhuDS6V+aGmZla34KtXY7eBquJhnZAekfPBZxKlnwiBvyjtGP8Y0NaYg4/zJJclgzDoQr1eYoWNhndOJYxdTpEMXWdxsjUhkUAvpH7r5UIUIyZPnrM0FH0XTI/OvYBszSADW980elogKkMIzHehEZ19ozBFFeFqdlBnKn2T9hFTb6FbedpKQpp3q/5lLLeDnmSGSOCkIHuT3QRnbovF2PLSh5saqS7AeM6NjfpGOxSUyHd3MHvKNEO1AD28wPrak5Ue3VwAZ0RSEomu1DSxk0FQ0qxIpOXicNYTgosx63qelh/wsE0RFPAPM1L5Wf42dDtNEePFMOMAT2ufZAlW3ZfrUX8kt0wcdSbgTuj1Vzv2Jv9OQhma1xoZlAS2mmD+URT0RzxbnergfoceYTsYTdsbGiYr/r67UF1CjrA5tyWMgnmh90HiFKiDvm2pTXlh/IezfUzkIDx3EM6Vs5regcEUvEEeqqKsK16q85ZkgbSlRCnPAhRLvtbca4oQuo6MJ3e74r3zJgw78c8g=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(8936002)(26005)(4326008)(36756003)(36860700001)(186003)(7416002)(336012)(47076005)(426003)(1076003)(2616005)(2906002)(83380400001)(6666004)(5660300002)(7696005)(54906003)(7636003)(8676002)(110136005)(82740400003)(70206006)(356005)(36906005)(70586007)(316002)(478600001)(82310400003)(86362001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:07:31.0347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb41c4bf-b513-40e3-3292-08d96c2c78d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3515
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
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
From: Nicolin Chen via iommu <iommu@lists.linux-foundation.org>
Reply-To: Nicolin Chen <nicolinc@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The VFIO API was enhanced to support VMID control with two
new iotcls to set and get VMID between the kernel and the
virtual machine hypervisor. So updating the document.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 Documentation/driver-api/vfio.rst | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
index c663b6f97825..a76a17065cdd 100644
--- a/Documentation/driver-api/vfio.rst
+++ b/Documentation/driver-api/vfio.rst
@@ -239,6 +239,40 @@ group and can access them as follows::
 	/* Gratuitous device reset and go... */
 	ioctl(device, VFIO_DEVICE_RESET);
 
+IOMMU Virtual Machine Identifier (VMID)
+------------------------
+In case of virtualization, each VM is assigned a Virtual Machine Identifier
+(VMID). This VMID is used to tag translation lookaside buffer (TLB) entries,
+to identify which VM each entry belongs to. This tagging allows translations
+for multiple different VMs to be present in the TLBs at the same time.
+
+The IOMMU Kernel driver is responsible for allocating a VMID. However, only
+a hypervisor knows what physical devices get assigned to the same VM. Thus,
+when the first physical device gets assigned to the VM, once the hypervisor
+finishes its IOCTL call of VFIO_SET_IOMMU, it should call the following:
+
+struct vm {
+	int iommu_type;
+	uint32_t vmid;	/* initial value is VFIO_IOMMU_VMID_INVALID */
+} vm0;
+
+	/* ... */
+	ioctl(container->fd, VFIO_SET_IOMMU, vm0->iommu_type);
+	/* ... */
+	if (vm0->vmid == VFIO_IOMMU_VMID_INVALID)
+		ioctl(container->fd, VFIO_IOMMU_GET_VMID, &vm0->vmid);
+
+This VMID would be the shared value, across the entire VM, between all the
+physical devices that are assigned to it. So, when other physical devices
+get assigned to the VM, before the hypervisor runs into the IOCTL call of
+VFIO_IOMMU_SET_VMID, it should call the following:
+
+	/* ... */
+	ioctl(container->fd, VFIO_SET_IOMMU, vm0->iommu_type);
+	/* ... */
+	if (vm0->vmid != VFIO_IOMMU_VMID_INVALID)
+		ioctl(container->fd, VFIO_IOMMU_SET_VMID, vmid);
+
 VFIO User API
 -------------------------------------------------------------------------------
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
