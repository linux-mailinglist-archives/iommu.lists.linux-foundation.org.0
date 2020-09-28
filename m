Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860C27B89C
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 02:04:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3785985C4F;
	Tue, 29 Sep 2020 00:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-_49oDBOOml; Tue, 29 Sep 2020 00:04:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 682B885C54;
	Tue, 29 Sep 2020 00:04:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 382D1C016F;
	Tue, 29 Sep 2020 00:04:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 168E6C016F
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 00:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 04C9A866BA
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 00:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rf1hq6-PzkwD for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 00:04:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 56269866B9
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 00:04:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id bb1so3113plb.2
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 17:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C/2uCZ+b3JDX5POeuiJcjwGtwJq2owg7pPnLmk6OF2c=;
 b=FgGdK8Ox4KmfRnLlsUDtVNk39OBCNrwR2zslti3e2U+iK2s0i0CWt/nvnfujSfyjD4
 mRxIDzd59HOdREeeNFR1+8rTnTkqX3HRQopS2MXO9dnYnfpTDnoch209ZQyC4TeEqtBG
 CQYGEpQOvAX8NPUyaP5SfLMPc+OdOzAqVtOSgpTVeWUIcugKK6Hkblr0bYn5JxcaKdEl
 7D37Ku+SfdA+yGhjcwJbnP9TSremXnFip3ITB0D2C+KhF+yYRkGWJnl5oIMGKL5fElet
 V0IpUaFyX1gQy1fbyHbpKjngjE1I2MbqVb08W7+Fp/FsIcmEjJ4rH7iJWFJNwB0pqA2J
 RuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C/2uCZ+b3JDX5POeuiJcjwGtwJq2owg7pPnLmk6OF2c=;
 b=ikf+UdWae4h0QcrBhLWoLrd76GeKFH6/WHGZ+3jtnZpcXgJnxyV7CxiY1MJcJ3r5Xz
 ao+zydT+dnmGPek7gHjEVLulHYpKvDyPYx7a9W9v2bXai06gk7tp8q/bycR/xrhGhTr2
 0Na0fQiXfvJ3P3bNCu5315nuhcvUXtDohEhg0v9+QHD5gymm/j7Wr8IZXH5W4FOpr+IF
 Ffc68TTblrSl+U4T0gb6wy2suKA8N5pxwm1Yzj3CHvGsVAnXhKOM7fThbSJvjLg7enTb
 fS/l9gNz0/nLFlvq11tHvCZEtQut6bLIDpzU/s1McSI++LesgG+ZLRmsrM4NrTjQBjQA
 jAjQ==
X-Gm-Message-State: AOAM53208jQrHnF0XUetVm+ib972Q4HZixOdEHf4DBHjSDyzC1vUzeLx
 g/6OYWPR94muZ3Cp58HeFFA=
X-Google-Smtp-Source: ABdhPJw1JD+0yORoCok+gamYtL0khtKydIQiDxk27/3l2F5HWucqnW4RdjfC+RJ9HrQewH+66pZsCw==
X-Received: by 2002:a17:902:7c0e:b029:d0:89f3:28d4 with SMTP id
 x14-20020a1709027c0eb02900d089f328d4mr1837914pll.16.1601337886912; 
 Mon, 28 Sep 2020 17:04:46 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id fz23sm2392814pjb.36.2020.09.28.17.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 17:04:46 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH v2 1/2] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date: Mon, 28 Sep 2020 16:59:00 -0700
Message-Id: <20200928235901.28337-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928235901.28337-1-nicoleotsuka@gmail.com>
References: <20200928235901.28337-1-nicoleotsuka@gmail.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com
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

The tegra_smmu_group_get was added to group devices in different
SWGROUPs and it'd return a NULL group pointer upon a mismatch at
tegra_smmu_find_group(), so for most of clients/devices, it very
likely would mismatch and need a fallback generic_device_group().

But now tegra_smmu_group_get handles devices in same SWGROUP too,
which means that it would allocate a group for every new SWGROUP
or would directly return an existing one upon matching a SWGROUP,
i.e. any device will go through this function.

So possibility of having a NULL group pointer in device_group()
is upon failure of either devm_kzalloc() or iommu_group_alloc().
In either case, calling generic_device_group() no longer makes a
sense. Especially for devm_kzalloc() failing case, it'd cause a
problem if it fails at devm_kzalloc() yet succeeds at a fallback
generic_device_group(), because it does not create a group->list
for other devices to match.

This patch simply unwraps the function to clean it up.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v1->v2:
 * Changed type of swgroup to "unsigned int", following Thierry's
   commnets.

 drivers/iommu/tegra-smmu.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0becdbfea306..ec4c9dafff95 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -903,10 +903,12 @@ static void tegra_smmu_group_release(void *iommu_data)
 	mutex_unlock(&smmu->lock);
 }
 
-static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
-						unsigned int swgroup)
+static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	const struct tegra_smmu_group_soc *soc;
+	unsigned int swgroup = fwspec->ids[0];
 	struct tegra_smmu_group *group;
 	struct iommu_group *grp;
 
@@ -950,19 +952,6 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 	return group->group;
 }
 
-static struct iommu_group *tegra_smmu_device_group(struct device *dev)
-{
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
-	struct iommu_group *group;
-
-	group = tegra_smmu_group_get(smmu, fwspec->ids[0]);
-	if (!group)
-		group = generic_device_group(dev);
-
-	return group;
-}
-
 static int tegra_smmu_of_xlate(struct device *dev,
 			       struct of_phandle_args *args)
 {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
