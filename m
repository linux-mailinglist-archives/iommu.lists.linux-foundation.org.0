Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C845E4060BC
	for <lists.iommu@lfdr.de>; Fri, 10 Sep 2021 02:18:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FC3F40260;
	Fri, 10 Sep 2021 00:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pv96kHlehxNW; Fri, 10 Sep 2021 00:18:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0F92B4011B;
	Fri, 10 Sep 2021 00:18:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBDCAC000D;
	Fri, 10 Sep 2021 00:18:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E6A8C000D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8015160778
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kgVN7x3VrGSw for <iommu@lists.linux-foundation.org>;
 Fri, 10 Sep 2021 00:18:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7CFE605DE
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:18:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEAF261101;
 Fri, 10 Sep 2021 00:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233123;
 bh=jAQoBe4VI8WbxoL6SHPTRwai47qCqtUJMMAaZNMIVtk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R5FhD0SdWU1YyuC1nMOy80dUxYk9Wi6zmbytejGMbjc+j9onPqrIh62ZX3SvX/m/0
 lJi57V2eXngEhtUxK4OPxIQ3zdMdpH2fogdz8tFDxzDHaW7z8b8yofzZV+mdjknwDt
 AsuMeDEKD04W93V1Wp/nD9DgfiOnxEYOY0Q7bQQ0/UjlKIUrSew8tvNyy3IHikJ8Og
 8OPBIYdbcZ0zT1qLoIeJjA7kBfI1Uqm/7M+wLENmXOSnHNDx69EqfHHOpTeF7HF+Uz
 3FZ7o3q3r3JPSlrNY3dX8g0O/hq5ZCOGD5w0SzznBfhA3cE+Z4sETyX7OhqM15xn6k
 RVS3tY/xV5xKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 16/88] iommu/amd: Fix printing of IOMMU events
 when rate limiting kicks in
Date: Thu,  9 Sep 2021 20:17:08 -0400
Message-Id: <20210910001820.174272-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001820.174272-1-sashal@kernel.org>
References: <20210910001820.174272-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>
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

From: Lennert Buytenhek <buytenh@wantstofly.org>

[ Upstream commit ee974d9625c405977ef5d9aedc476be1d0362ebf ]

For the printing of RMP_HW_ERROR / RMP_PAGE_FAULT / IO_PAGE_FAULT
events, the AMD IOMMU code uses such logic:

	if (pdev)
		dev_data = dev_iommu_priv_get(&pdev->dev);

	if (dev_data && __ratelimit(&dev_data->rs)) {
		pci_err(pdev, ...
	} else {
		printk_ratelimit() / pr_err{,_ratelimited}(...
	}

This means that if we receive an event for a PCI devid which actually
does have a struct pci_dev and an attached struct iommu_dev_data, but
rate limiting kicks in, we'll fall back to the non-PCI branch of the
test, and print the event in a different format.

Fix this by changing the logic to:

	if (dev_data) {
		if (__ratelimit(&dev_data->rs)) {
			pci_err(pdev, ...
		}
	} else {
		pr_err_ratelimited(...
	}

Suggested-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
Reviewed-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Link: https://lore.kernel.org/r/YPgk1dD1gPMhJXgY@wantstofly.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd/iommu.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index c46dde88a132..69d441fc1e32 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -425,9 +425,11 @@ static void amd_iommu_report_rmp_hw_error(volatile u32 *event)
 	if (pdev)
 		dev_data = dev_iommu_priv_get(&pdev->dev);
 
-	if (dev_data && __ratelimit(&dev_data->rs)) {
-		pci_err(pdev, "Event logged [RMP_HW_ERROR vmg_tag=0x%04x, spa=0x%llx, flags=0x%04x]\n",
-			vmg_tag, spa, flags);
+	if (dev_data) {
+		if (__ratelimit(&dev_data->rs)) {
+			pci_err(pdev, "Event logged [RMP_HW_ERROR vmg_tag=0x%04x, spa=0x%llx, flags=0x%04x]\n",
+				vmg_tag, spa, flags);
+		}
 	} else {
 		pr_err_ratelimited("Event logged [RMP_HW_ERROR device=%02x:%02x.%x, vmg_tag=0x%04x, spa=0x%llx, flags=0x%04x]\n",
 			PCI_BUS_NUM(devid), PCI_SLOT(devid), PCI_FUNC(devid),
@@ -456,9 +458,11 @@ static void amd_iommu_report_rmp_fault(volatile u32 *event)
 	if (pdev)
 		dev_data = dev_iommu_priv_get(&pdev->dev);
 
-	if (dev_data && __ratelimit(&dev_data->rs)) {
-		pci_err(pdev, "Event logged [RMP_PAGE_FAULT vmg_tag=0x%04x, gpa=0x%llx, flags_rmp=0x%04x, flags=0x%04x]\n",
-			vmg_tag, gpa, flags_rmp, flags);
+	if (dev_data) {
+		if (__ratelimit(&dev_data->rs)) {
+			pci_err(pdev, "Event logged [RMP_PAGE_FAULT vmg_tag=0x%04x, gpa=0x%llx, flags_rmp=0x%04x, flags=0x%04x]\n",
+				vmg_tag, gpa, flags_rmp, flags);
+		}
 	} else {
 		pr_err_ratelimited("Event logged [RMP_PAGE_FAULT device=%02x:%02x.%x, vmg_tag=0x%04x, gpa=0x%llx, flags_rmp=0x%04x, flags=0x%04x]\n",
 			PCI_BUS_NUM(devid), PCI_SLOT(devid), PCI_FUNC(devid),
@@ -480,11 +484,13 @@ static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
 	if (pdev)
 		dev_data = dev_iommu_priv_get(&pdev->dev);
 
-	if (dev_data && __ratelimit(&dev_data->rs)) {
-		pci_err(pdev, "Event logged [IO_PAGE_FAULT domain=0x%04x address=0x%llx flags=0x%04x]\n",
-			domain_id, address, flags);
-	} else if (printk_ratelimit()) {
-		pr_err("Event logged [IO_PAGE_FAULT device=%02x:%02x.%x domain=0x%04x address=0x%llx flags=0x%04x]\n",
+	if (dev_data) {
+		if (__ratelimit(&dev_data->rs)) {
+			pci_err(pdev, "Event logged [IO_PAGE_FAULT domain=0x%04x address=0x%llx flags=0x%04x]\n",
+				domain_id, address, flags);
+		}
+	} else {
+		pr_err_ratelimited("Event logged [IO_PAGE_FAULT device=%02x:%02x.%x domain=0x%04x address=0x%llx flags=0x%04x]\n",
 			PCI_BUS_NUM(devid), PCI_SLOT(devid), PCI_FUNC(devid),
 			domain_id, address, flags);
 	}
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
