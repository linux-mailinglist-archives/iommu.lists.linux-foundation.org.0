Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9246B7DD
	for <lists.iommu@lfdr.de>; Tue,  7 Dec 2021 10:46:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E23360602;
	Tue,  7 Dec 2021 09:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sf5G5hmXOdoA; Tue,  7 Dec 2021 09:46:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2006F605C0;
	Tue,  7 Dec 2021 09:46:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AF57C0012;
	Tue,  7 Dec 2021 09:46:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2B23C0012
 for <iommu@lists.linux-foundation.org>; Tue,  7 Dec 2021 09:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C806605C0
 for <iommu@lists.linux-foundation.org>; Tue,  7 Dec 2021 09:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EGa48XmNWSYI for <iommu@lists.linux-foundation.org>;
 Tue,  7 Dec 2021 09:46:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A230060602
 for <iommu@lists.linux-foundation.org>; Tue,  7 Dec 2021 09:46:28 +0000 (UTC)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4J7b3k4xblzXdQT;
 Tue,  7 Dec 2021 17:44:18 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 17:46:23 +0800
Received: from thunder-town.china.huawei.com (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 17:46:22 +0800
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/1] iommu/arm-smmu-v3: Simplify useless instructions in
 arm_smmu_cmdq_build_cmd()
Date: Tue, 7 Dec 2021 17:41:08 +0800
Message-ID: <20211207094109.1962-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
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
From: Zhen Lei via iommu <iommu@lists.linux-foundation.org>
Reply-To: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

v2 --> v3:
Discard 'register' modifier for local variable 'cmd'.

v1 --> v2:
1. Add patch 1, Properly handle the return value of arm_smmu_cmdq_build_cmd()
2. Remove arm_smmu_cmdq_copy_cmd(). In addition, when build command fails, out_cmd is not filled.

[v2] https://lists.linuxfoundation.org/pipermail/iommu/2021-October/059831.html


Zhen Lei (1):
  iommu/arm-smmu-v3: Simplify useless instructions in
    arm_smmu_cmdq_build_cmd()

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
