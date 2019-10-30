Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197DE9DEB
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 15:52:33 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DEC17D9F;
	Wed, 30 Oct 2019 14:51:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAD6EC96
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 14:51:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B246163D
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 14:51:27 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3F0F8208E3;
	Wed, 30 Oct 2019 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572447087;
	bh=F9GxmV9JRoWx/7+njViQgD19WYLLBQ0StpL47b4u+Rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACVvc7LJWEa4HLbetuu4zNT2qScjlWX+/gOTfPg/ez2pNJkXXwcpsfO1DWeDggaM4
	ZJF5Egydh7i/VJLGUC8WYT5fJI75n7JeF9sg2mTPzwU9LjoJzNbHi2m1nnwmK4KPk7
	PBLjuxa818PNBErf5IGOdwjnAcekH4CvtODFu6RI=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] iommu/arm-smmu-v3: Allow building as a module
Date: Wed, 30 Oct 2019 14:51:10 +0000
Message-Id: <20191030145112.19738-6-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030145112.19738-1-will@kernel.org>
References: <20191030145112.19738-1-will@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

By removing the redundant call to 'pci_request_acs()' we can allow the
ARM SMMUv3 driver to be built as a module.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/Kconfig       | 2 +-
 drivers/iommu/arm-smmu-v3.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index e3842eabcfdd..7583d47fc4d5 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -388,7 +388,7 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
 	  config.
 
 config ARM_SMMU_V3
-	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
+	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
 	depends on ARM64
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 2ad8e2ca0583..56ce4ba2fcbe 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -3657,7 +3657,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_PCI
 	if (pci_bus_type.iommu_ops != &arm_smmu_ops) {
-		pci_request_acs();
 		ret = bus_set_iommu(&pci_bus_type, &arm_smmu_ops);
 		if (ret)
 			return ret;
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
