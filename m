Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E211282E28
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 00:45:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8C6D853B9;
	Sun,  4 Oct 2020 22:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74ViVaZMGNLd; Sun,  4 Oct 2020 22:45:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39B25853E6;
	Sun,  4 Oct 2020 22:45:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 332E3C0051;
	Sun,  4 Oct 2020 22:45:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9D14C0051
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B902086F9F
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06b+DuJyIcX0 for <iommu@lists.linux-foundation.org>;
 Sun,  4 Oct 2020 22:45:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EF78786F9C
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:45:07 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id o20so5332310pfp.11
 for <iommu@lists.linux-foundation.org>; Sun, 04 Oct 2020 15:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tH7CH0xERnssTzk2TZ8/B+QGzBaLA6HcrfNelQzPQmk=;
 b=PrjEUpaOD8OzReAH0XqyAEAQ1ebhwlj0dgDQiZCRLSwTNqXTtJvGfEexsHfJfm83i8
 YEn4mxf+HoNF8iuy3+dTFX5hF2BFbZ2ogJYcU3yeQeuMnk2j7sWbXzfngFc57fPTYkIw
 Qm8T/+wbrzn990feUc9ZfEGDYmR9+++i2XX2cja9kbrnFcI91dSHY49bzIn9YrjYaXT9
 EDj9ki2iHJwExh2wXtsfsD8PUiEFkds43lNUR/e1Yjjc0VQ5aSHuubHWpvcoQpXPqfR0
 cuh8nb2SM7GBc3D5OdzzBskLUuUgNUFeleSi2lHvTKvuJbl1YViq+tX3zNsQwsJ/nRTt
 4iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tH7CH0xERnssTzk2TZ8/B+QGzBaLA6HcrfNelQzPQmk=;
 b=dE53YvSMDbjCWxUHIhKsarhdgeJwQqSvwQv+A00eEZXNAQx2QWz4Aw9OzZwt4amoUe
 ePWL6TG+g5FgIxH9r0dKAZURNIXGs1VAF6gMOdSmOvhEltJKFjc4ivMssf8wxrC5uVTH
 Nv/Q58H47qJhJLQbNGCkb4QZP4BaQtRzGKVrGLxSygK2Q0XuEiEsR1Ry/9ol+hlOS48V
 NDOB+0Y5RZBwIxhrB1rm/+k9Y64zleykcmbCYHXnEvyUEKessFsBOJc8qpN71P5lUr/g
 FNNOgvKhZsEXIPkmRyCEKfJpAiC5ld0sBESoOH3M8/w6/oJLCEftzvwPV3mEXmXF1Eer
 9nwA==
X-Gm-Message-State: AOAM532ay4mcWCOuexEzweC4ahV4amAEGCcURAQGLZWy//x6KYxPqRtb
 Pfyalxgk1y5c5Yt4I8tXsCM=
X-Google-Smtp-Source: ABdhPJxWbzDo+6M2tYfJrFl/Uh9lGBrRAaf/Gz/fMSH3YjwYmxjtZxgWyObigauM21d4CXUxEseKAA==
X-Received: by 2002:a65:628f:: with SMTP id f15mr7670588pgv.168.1601851507460; 
 Sun, 04 Oct 2020 15:45:07 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d129sm9073236pfc.161.2020.10.04.15.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 15:45:06 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org,
	digetx@gmail.com
Subject: [PATCH v6 3/3] iommu/tegra-smmu: Add PCI support
Date: Sun,  4 Oct 2020 15:38:37 -0700
Message-Id: <20201004223837.15303-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004223837.15303-1-nicoleotsuka@gmail.com>
References: <20201004223837.15303-1-nicoleotsuka@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jonathanh@nvidia.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This patch simply adds support for PCI devices.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v5->v6
 * Added Dmitry's Reviewed-by and Tested-by.
v4->v5
 * Added Dmitry's Reviewed-by
v3->v4
 * Dropped !iommu_present() check
 * Added CONFIG_PCI check in the exit path
v2->v3
 * Replaced ternary conditional operator with if-else in .device_group()
 * Dropped change in tegra_smmu_remove()
v1->v2
 * Added error-out labels in tegra_smmu_probe()
 * Dropped pci_request_acs() since IOMMU core would call it.

 drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index c3a3131543c8..e54c006dedd1 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	group->smmu = smmu;
 	group->soc = soc;
 
-	group->group = iommu_group_alloc();
+	if (dev_is_pci(dev))
+		group->group = pci_device_group(dev);
+	else
+		group->group = generic_device_group(dev);
+
 	if (IS_ERR(group->group)) {
 		devm_kfree(smmu->dev, group);
 		mutex_unlock(&smmu->lock);
@@ -1068,22 +1073,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
 
 	err = iommu_device_register(&smmu->iommu);
-	if (err) {
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return ERR_PTR(err);
-	}
+	if (err)
+		goto err_sysfs;
 
 	err = bus_set_iommu(&platform_bus_type, &tegra_smmu_ops);
-	if (err < 0) {
-		iommu_device_unregister(&smmu->iommu);
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return ERR_PTR(err);
-	}
+	if (err < 0)
+		goto err_unregister;
+
+#ifdef CONFIG_PCI
+	err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
+	if (err < 0)
+		goto err_bus_set;
+#endif
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		tegra_smmu_debugfs_init(smmu);
 
 	return smmu;
+
+err_bus_set: __maybe_unused;
+	bus_set_iommu(&platform_bus_type, NULL);
+err_unregister:
+	iommu_device_unregister(&smmu->iommu);
+err_sysfs:
+	iommu_device_sysfs_remove(&smmu->iommu);
+
+	return ERR_PTR(err);
 }
 
 void tegra_smmu_remove(struct tegra_smmu *smmu)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
