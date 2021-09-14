Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB540A2BD
	for <lists.iommu@lfdr.de>; Tue, 14 Sep 2021 03:47:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F38F76060F;
	Tue, 14 Sep 2021 01:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xB26YJxFoSf3; Tue, 14 Sep 2021 01:47:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 24E8F60625;
	Tue, 14 Sep 2021 01:47:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB35EC000D;
	Tue, 14 Sep 2021 01:47:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BDC4C000D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 01:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B1026060F
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 01:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSb1GmOiXkzI for <iommu@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 01:47:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C92C860625
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 01:47:32 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id e16so10638021pfc.6
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 18:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wQ6Mm6Od3iZGFWm/WLqOg5xt87Kp6fKq243+Rl2T0Ss=;
 b=Y3jNDyP5CI6DWQgOTU0M49Wstb31pavt5tOS+otoHQnjMSFa9KJZV0n3r0URBmy+aj
 dHu2DHI8mrtS9S94f3ihnUIdxz72VE+8O5d/pIpgzMcCENZB4ezUEdzQ8jBzobxT0eLd
 pS07Y8/A7jkA/45l/meCk5dnuYVeIwLfjGBdt07Sv/3VAFXuVpBSFbxOaMyGekI9KwAF
 tAmfPz49A6halWRQM6o/oYTIWrfd5oc2YDyw4vjbLYY5MOcZaotDlmZfzNdV4SpBDo/m
 ad4bP9w6ZW8YnFjB10bLLM02MIQKRgPgIMowhTKWabJAxpaoBQ9upnF3qCI2wtKnqO5a
 Y0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wQ6Mm6Od3iZGFWm/WLqOg5xt87Kp6fKq243+Rl2T0Ss=;
 b=u4zTdY0rw+ZxHbCRnq0ASkgaZVsbZRRXx78o1F7p6hxVu4Ief5j60wMUnBdmHCP0GY
 x+25Sh2iEIQx5FBGzSmcCPG2FnnUyEUXC4bNeI9Lus5r4JBGSBLM1SS/ToetPR/p4mvN
 kG94QPJ8SyK/S7G37RmbKguBp0JOcfR8Why2FiC8emWuZ8zmWTBbCPmQ5P37JTtVqie3
 vjMIzs+8nYxxB9BEufssHDs5gDgm6gGI4TIpcJctGVX7f4i1Yq21/6iOUYDkWnfIBdKW
 zW6BRy9a8mLF9DnRXnHrJFIdTPULFlhnl+6RRRLzgejjR/eopCg9FI8F8gXr8YorcMls
 0WEQ==
X-Gm-Message-State: AOAM531ApLX8gkGS8Td8pilGsMCA0q1VT4FOPhBp4i5MIO6RIWZzom7J
 2ko9EdhCCcHKt41rINKBGgc=
X-Google-Smtp-Source: ABdhPJx9ve/ePQnrtCNYhP2oKHonmJObjkJOsuiwdJNdamk7+cpUBV8DREVgCDqsp2R++Tggh3i5Cg==
X-Received: by 2002:a62:9241:0:b0:438:cdda:1aee with SMTP id
 o62-20020a629241000000b00438cdda1aeemr2368329pfd.36.1631584052234; 
 Mon, 13 Sep 2021 18:47:32 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z11sm8270101pfr.157.2021.09.13.18.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 18:47:31 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v6 1/6] iommu/tegra-smmu: Rename struct iommu_group *group to
 *grp
Date: Mon, 13 Sep 2021 18:38:53 -0700
Message-Id: <20210914013858.31192-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914013858.31192-1-nicoleotsuka@gmail.com>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
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

There are a few structs using "group" for their pointer instances.
This gets confusing sometimes. The instance of struct iommu_group
is used in local function with an alias "grp", which can separate
it from others.

So this patch simply renames "group" to "grp" as a cleanup.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0a281833f611..6ebae635d3aa 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -23,7 +23,7 @@ struct tegra_smmu_group {
 	struct list_head list;
 	struct tegra_smmu *smmu;
 	const struct tegra_smmu_group_soc *soc;
-	struct iommu_group *group;
+	struct iommu_group *grp;
 	unsigned int swgroup;
 };
 
@@ -909,7 +909,7 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	/* Find existing iommu_group associating with swgroup or group_soc */
 	list_for_each_entry(group, &smmu->groups, list)
 		if ((group->swgroup == swgroup) || (soc && group->soc == soc)) {
-			grp = iommu_group_ref_get(group->group);
+			grp = iommu_group_ref_get(group->grp);
 			mutex_unlock(&smmu->lock);
 			return grp;
 		}
@@ -926,23 +926,23 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	group->soc = soc;
 
 	if (dev_is_pci(dev))
-		group->group = pci_device_group(dev);
+		group->grp = pci_device_group(dev);
 	else
-		group->group = generic_device_group(dev);
+		group->grp = generic_device_group(dev);
 
-	if (IS_ERR(group->group)) {
+	if (IS_ERR(group->grp)) {
 		devm_kfree(smmu->dev, group);
 		mutex_unlock(&smmu->lock);
 		return NULL;
 	}
 
-	iommu_group_set_iommudata(group->group, group, tegra_smmu_group_release);
+	iommu_group_set_iommudata(group->grp, group, tegra_smmu_group_release);
 	if (soc)
-		iommu_group_set_name(group->group, soc->name);
+		iommu_group_set_name(group->grp, soc->name);
 	list_add_tail(&group->list, &smmu->groups);
 	mutex_unlock(&smmu->lock);
 
-	return group->group;
+	return group->grp;
 }
 
 static int tegra_smmu_of_xlate(struct device *dev,
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
