Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A02797CB
	for <lists.iommu@lfdr.de>; Sat, 26 Sep 2020 10:12:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EFA92874BA;
	Sat, 26 Sep 2020 08:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7-dBbXDpQ9p; Sat, 26 Sep 2020 08:12:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 81FC6874B2;
	Sat, 26 Sep 2020 08:12:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78FB2C0051;
	Sat, 26 Sep 2020 08:12:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DB89C0051
 for <iommu@lists.linux-foundation.org>; Sat, 26 Sep 2020 08:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 29537874B2
 for <iommu@lists.linux-foundation.org>; Sat, 26 Sep 2020 08:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6YReZmBTvHQ for <iommu@lists.linux-foundation.org>;
 Sat, 26 Sep 2020 08:12:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 62F82874A7
 for <iommu@lists.linux-foundation.org>; Sat, 26 Sep 2020 08:12:30 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id q4so671534pjh.5
 for <iommu@lists.linux-foundation.org>; Sat, 26 Sep 2020 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VVVAr+184BtvhzMD2Murp/xUE/D9g6IJfB0eGMqFFJo=;
 b=MNClZS+5VS7Fi2JhH3w96/QGLwQcMIqywqi1LZAlT7HAi2Ju30laqpwGxe+F7gf6yO
 KouvmZ12cKgduFowL2xaO6G61KDcj88T8oXykfBXIDrPkmhSfAroXYZUzTh/dQP1R8VQ
 c+92n7rD6XgF1rP6g+oSg+IS68DIF+2hg0CYO/rZdnoX8bknL/B5uIyU0C3YhrEhjyae
 1urWNWsLcwBp1Xii9L7mTsjabjAYD/hGTPdTkdRsV/EQPwdAHoW290yIU9FYqRsykgoB
 LUt00uDR2vknXuRVarJEY4AfsgNMDG+ogE2pTqSya20ftzfQiRiOzVunh595DzBzSDLo
 J2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VVVAr+184BtvhzMD2Murp/xUE/D9g6IJfB0eGMqFFJo=;
 b=cjB6GVc1TIq51bJ/tLfjg0l3B+N4LKapdWtYIlE02V3+So59EqVHzEiPmlBONqX66s
 QS0KWGIhwFiXRdi5m3uOjvGFCfPFrLlqVdrOPJ7bx7kKBrWD+4r9fyA3hGRVN53JOb5r
 KXoUxIYUb7QDXfrFZq4HAsR4EH8e+nYIU2X8VZx9wX8PWGGAwvWnrxQHKbk2SFNGE3BF
 l6TYQs5LeqtKor8dW5UlZKzviq0OPHFLp040HcH3kAhmxA+A2cb3ws86aWBbvlrJxXoY
 z2d5uZL6BDTpN38UObsI4LMKwZ5ozGJuMBTtUVgoTmVfD49In1pxzmHRCOeVcClrvOZr
 05Kg==
X-Gm-Message-State: AOAM532AC2MwoFH1WeloDwDJ/bcaW2aYk81wAC2J1yERZh71tfyYKR7X
 KG8nDFUiOJIN7W+KnJ9Oa4k=
X-Google-Smtp-Source: ABdhPJzFEpRxK4TIMy7eeSxXQ5/Eg30XdZ30+RRKKAZ5PSoWLT+DA9tbqMm51WQggzz5mT65ofrDsQ==
X-Received: by 2002:a17:902:7b93:b029:d2:172:7d9e with SMTP id
 w19-20020a1709027b93b02900d201727d9emr3074529pll.83.1601107949943; 
 Sat, 26 Sep 2020 01:12:29 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i1sm4833497pfk.21.2020.09.26.01.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 01:12:29 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org,
	krzk@kernel.org
Subject: [PATCH 1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date: Sat, 26 Sep 2020 01:07:15 -0700
Message-Id: <20200926080719.6822-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926080719.6822-1-nicoleotsuka@gmail.com>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
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
 drivers/iommu/tegra-smmu.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0becdbfea306..6335285dc373 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -903,11 +903,13 @@ static void tegra_smmu_group_release(void *iommu_data)
 	mutex_unlock(&smmu->lock);
 }
 
-static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
-						unsigned int swgroup)
+static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	const struct tegra_smmu_group_soc *soc;
 	struct tegra_smmu_group *group;
+	int swgroup = fwspec->ids[0];
 	struct iommu_group *grp;
 
 	/* Find group_soc associating with swgroup */
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
