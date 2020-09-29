Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DC927BC38
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 06:58:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0148B84E97;
	Tue, 29 Sep 2020 04:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1+T4upMNP58; Tue, 29 Sep 2020 04:58:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D16CB85455;
	Tue, 29 Sep 2020 04:58:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC4EBC0051;
	Tue, 29 Sep 2020 04:58:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52D6BC016F
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4F094847AC
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NY_6wm__yhvV for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 04:58:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AD56E85531
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:22 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id md22so3198116pjb.0
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=saP3o3/ZHmG3y2rYGxjiPv6CDY9HgD7NIJX7AD4zLNk=;
 b=ijRT4nTYkzL+krkNzgBJBgV7Gtqxk57xn/BWwJrbRz57EwjDcNUNnTnEPN6MBfLHbM
 cjED5iKz+1W3nOnIYuCSgObHcZJZtrK2gJL9psKylSctrKw+9xLbyxSHLx3/ES77BTet
 beg4WJQYkuGpcj2VkN8/BBZZ6zM0Ri4JF+BbEyoOgFK9kbe5q5dMYmUPyDYlGRfLygjk
 wzmXLKYI8RHT0SbqNxOtdjatrDiEnhZkTNuHbMrrMDwhcnurh7uzA7K4/sn4+xKYVM8L
 BMjUTQI+6g0vB17wEGpjuDrCv88htF+afJCScFFXu4GAher9LnN0swvqxF/EXym+0zek
 68gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=saP3o3/ZHmG3y2rYGxjiPv6CDY9HgD7NIJX7AD4zLNk=;
 b=A9xCU6rFXnAC42bYBIWlF/3lZ0o76hj6eV7PyEyhAYBx52VnSW8QCWxLwjplx/iFet
 1FFX+l2KyYldiGXAKISQu8d5ze9IX98iDUEjZEIqY7aS9aMll3bJHftBm1RIP5wIRDyQ
 8qaMJ4cddHc1Fv5nu0JEF3g68D+GmWgxwn8RXSJVrm8AAkIU9n9t3zibR9jlHZ/lXXo8
 QNnJvGqN+wgyZ+mMWknq6zHIsw1IX9vrk8EglBlvPo3CycnpJofAkKc2ixgFnymc31IH
 R5dg0Bwba7Sr5DZnOouG29OpHyFr/VPL501ObNii5O9490N+qVkcm35DcDWZA8gOkn7K
 YPow==
X-Gm-Message-State: AOAM532U+d3H6b/3JwwJaLC/ewhdPfygWkBgaMD1IZutbVaZBjypAtRm
 S2Twmk0xDnw+annP+Ob8jaY=
X-Google-Smtp-Source: ABdhPJzihHuO7NA53SKJQEP1zPJvMkzlo0VSdnlGlqgUkP7Qocxjntpw+PhEqiDIB0fA0OC7aivJuQ==
X-Received: by 2002:a17:90a:d311:: with SMTP id
 p17mr2264474pju.135.1601355502135; 
 Mon, 28 Sep 2020 21:58:22 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id f207sm3739028pfa.54.2020.09.28.21.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 21:58:21 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH v3 1/2] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
Date: Mon, 28 Sep 2020 21:52:46 -0700
Message-Id: <20200929045247.15596-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929045247.15596-1-nicoleotsuka@gmail.com>
References: <20200929045247.15596-1-nicoleotsuka@gmail.com>
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
v2->v3:
 * N/A
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
