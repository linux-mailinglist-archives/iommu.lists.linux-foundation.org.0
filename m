Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C22AFB63
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 23:34:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 43155875FA;
	Wed, 11 Nov 2020 22:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYiHh2Ao2DQi; Wed, 11 Nov 2020 22:34:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D0D4875D7;
	Wed, 11 Nov 2020 22:34:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D48DC0889;
	Wed, 11 Nov 2020 22:34:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C424C016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 22:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72C122044E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 22:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jU3Jm45dBUWQ for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 22:34:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id F311320386
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 22:34:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id e7so2604546pfn.12
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 14:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZwD1ohCfAW402dFGnNEhoT+UZSg/Ym6HaUWM7XjPb6E=;
 b=U640QIdoFg2QG3xihbfQE0u71b3stsi/H2Zy2gCGk4cz4t7+j8ElHfQx7ufBQMQdn9
 0PuuYrkCwevEosQBCGQ6vBrtwv4A8QSpgo2cgZH/N9Ro6F/aIlv2jUsFu0oBBpyuDDYV
 Qj7dWArL7VM8nzYPK+kUJ0w+TA5UGBwWYK1unj/wxM4MpVUNdLSH1/xB8pCAVozv95DI
 /h1nnW04mVfKJ9bE291K4/MaWn7n+CgWFDgXj5LiDLBJJZsXLTbXg2R4c8oNJS9su31Z
 5ei6omVBSC0m/ha8GflhXOQ6pSCSvB9KjSAZ2dkGLpoHWOlNkuBd3w0YxCptvObQ9/gv
 Isew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZwD1ohCfAW402dFGnNEhoT+UZSg/Ym6HaUWM7XjPb6E=;
 b=o8/D1lf0rzsSJidm7liCZdh9oxAGybG+Xf6dH3xfQNFYraqeox9pgB9P65Z86qLQl2
 VnIywbcrnGkRpveyzD04lXGhJqRM/tR0yRzhZEaLTsN9fLOjIj4HdgBOMqk72vL32Rk2
 TCfnDpw5dbJXYD6oBCwsRE3LGuxxN7WhyhspwTpKTByWcgaEhV7LR7UhMuHsBYIO0Z6A
 cy0QdXyGpRsHmjwUSFuxJ96RLrVbc0DcXf57/S1Ba/owpuwaQFPpKWQ9CyYILlBJDfwA
 AptSXeJRnAGjTx0KlDIe6F/D03yfOk7Ou3CaenrbjYVSKdd3iXwmgelZoQY9zT/F/8qj
 HAyg==
X-Gm-Message-State: AOAM530KXVd/A4MiapRXV1SV3c4Olh0uNQy0+Wx2TlwIDX3PwGPE0h5c
 8j0YIo/WTsE1QK2SAU7sTxk=
X-Google-Smtp-Source: ABdhPJzU3SRBsWCo/X+VGSnCodJ+e5+64F0QcgDgQaPvykVq0olGHQnqAqWbQj1QKdIFXrf/0xInnw==
X-Received: by 2002:a17:90a:7d06:: with SMTP id
 g6mr5913021pjl.113.1605134083643; 
 Wed, 11 Nov 2020 14:34:43 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a20sm3605096pff.118.2020.11.11.14.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 14:34:43 -0800 (PST)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH RESEND 1/5] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date: Wed, 11 Nov 2020 14:21:25 -0800
Message-Id: <20201111222129.15736-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111222129.15736-1-nicoleotsuka@gmail.com>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
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
