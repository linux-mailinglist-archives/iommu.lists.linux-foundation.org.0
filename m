Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C441E4923
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 18:03:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD8BD86BD0;
	Wed, 27 May 2020 16:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6h9IwsBx90i2; Wed, 27 May 2020 16:03:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3BA2086C2F;
	Wed, 27 May 2020 16:03:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CBAEC0892;
	Wed, 27 May 2020 16:03:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C70FDC0881
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 16:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B2F3888874
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 16:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztLEpOBRS3ST for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 16:03:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9836188644
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 16:03:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j10so8954112wrw.8
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 09:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=KFKU2FIEXjR2LVGipQU8OJxGYrMEcKfupZbFBx9PZZY=;
 b=B2e2R9PE8ZAp1sDLI7S8lrsjRfkvo6x+EJYJrJz0c/qJQagKVvvmzFan3qz6GVfd6w
 ZKbl/Y4xcQche/y9+bbZ5lOKaV7q9ddkacdSC40vxtQbuTw+sN+TPTU7MPDWmrXxy9ax
 3iBMFvXs8pOm6kAt7e6x61xsyeX0RxXmUKZn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KFKU2FIEXjR2LVGipQU8OJxGYrMEcKfupZbFBx9PZZY=;
 b=Aq4SoprxKpTQZfADi39G4VDUYdYRCEBxe6vMwWcfRkvcBIEMFtdhBsnHYHf3bmSSqv
 G6W4uc8DpVJ90HBNCDeTY2NIK+hSOdW3HqWOB5qDMqcTcu2AQtskSgp2uSr2BMnI0KFx
 3t/mLvpUB+1e+6YK/UJqoO5KYQdWIxpb8eR6ssi/9vdAeV5vsZYrqwgsTOhrdT7oukFo
 XXga8LDE43vFi2HLsp+wXcmeDgEx2GGkShtwFu3/OVoorw2qk8d/97+9vliD2RUBIFki
 dQFVdE/iVvfU7ff4uQl56wRJhJ1RIZjtsU0kBUYeUGuMDWVeS0XtfjbMl9ySMfxe8DyR
 mXtQ==
X-Gm-Message-State: AOAM531h4kFmpcgxcGEXORCR9U2MUPAi5rbbTYe/8j5EiRt244qVJEUI
 GnOVgr+e65s6jcRr/IuzQmdAWg==
X-Google-Smtp-Source: ABdhPJy6zYyWagZxKoXwDNe6/zG4VwLJq8RxTRFygqpQIc/E1CTTwd97wcehZx5+4rvjGpKll243Ug==
X-Received: by 2002:adf:ee47:: with SMTP id w7mr19715593wro.171.1590595413899; 
 Wed, 27 May 2020 09:03:33 -0700 (PDT)
Received: from mannams-OptiPlex-7010.dhcp.broadcom.net ([192.19.234.250])
 by smtp.gmail.com with ESMTPSA id t185sm3166536wmt.28.2020.05.27.09.03.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 09:03:33 -0700 (PDT)
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [RFC PATCH] iommu/arm-smmu: Add module parameter to set msi iova
 address
Date: Wed, 27 May 2020 21:33:18 +0530
Message-Id: <1590595398-4217-1-git-send-email-srinath.mannam@broadcom.com>
X-Mailer: git-send-email 2.7.4
Cc: Srinath Mannam <srinath.mannam@broadcom.com>,
 iommu@lists.linux-foundation.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
From: Srinath Mannam via iommu <iommu@lists.linux-foundation.org>
Reply-To: Srinath Mannam <srinath.mannam@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This patch gives the provision to change default value of MSI IOVA base
to platform's suitable IOVA using module parameter. The present
hardcoded MSI IOVA base may not be the accessible IOVA ranges of platform.

Since commit aadad097cd46 ("iommu/dma: Reserve IOVA for PCIe inaccessible
DMA address"), inaccessible IOVA address ranges parsed from dma-ranges
property are reserved.

If any platform has the limitaion to access default MSI IOVA, then it can
be changed using "arm-smmu.msi_iova_base=0xa0000000" command line argument.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 drivers/iommu/arm-smmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 4f1a350..5e59c9d 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -72,6 +72,9 @@ static bool disable_bypass =
 module_param(disable_bypass, bool, S_IRUGO);
 MODULE_PARM_DESC(disable_bypass,
 	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
+static unsigned long msi_iova_base = MSI_IOVA_BASE;
+module_param(msi_iova_base, ulong, S_IRUGO);
+MODULE_PARM_DESC(msi_iova_base, "msi iova base address.");
 
 struct arm_smmu_s2cr {
 	struct iommu_group		*group;
@@ -1566,7 +1569,7 @@ static void arm_smmu_get_resv_regions(struct device *dev,
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
+	region = iommu_alloc_resv_region(msi_iova_base, MSI_IOVA_LENGTH,
 					 prot, IOMMU_RESV_SW_MSI);
 	if (!region)
 		return;
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
