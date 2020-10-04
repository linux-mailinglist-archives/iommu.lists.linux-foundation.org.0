Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB37282E24
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 00:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A827520367;
	Sun,  4 Oct 2020 22:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2nGo1ZC2vSs; Sun,  4 Oct 2020 22:45:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9B4A020115;
	Sun,  4 Oct 2020 22:45:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AAD0C0051;
	Sun,  4 Oct 2020 22:45:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F02E9C0051
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D70E686F99
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipW9Sv+GdlnH for <iommu@lists.linux-foundation.org>;
 Sun,  4 Oct 2020 22:45:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4F19D86F98
 for <iommu@lists.linux-foundation.org>; Sun,  4 Oct 2020 22:45:05 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gm14so4477168pjb.2
 for <iommu@lists.linux-foundation.org>; Sun, 04 Oct 2020 15:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=h8phoMKaggEIEEEPxyHYutFcrvSMoeO2oUCwixn9XkQ=;
 b=H5qRpChowrqUrPNO9jerKTlh7wLcjgNFxw5NlFbza1sCA8YOkPIj8YTh9ZeEO9qPjJ
 NH4j0QgEZJImfsA+AZWGs0NEK0oOFNYP9BIbGpTjmrvz42fgtD/1mRIzC/AR+4rc5itO
 OI0OPAyLLTX5t+nl8Zj5PU+H6qYLWbSjvv+Hqlvu2NXsujbyLOdntWg0vJYCNH8ppn/S
 sfMoBtH6KNqAB5MHzOJc5O+Md+1JKRRJLF2vkbMIxpBgWuIuh2Baqkyo8C8mMnjGVPp4
 Nagr6URDVOxGNkCXsxZI6MMRnKlTDn7engf+bez3TYUyqmXC+kdVgXlp0hKL0MeqZY5+
 ql5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=h8phoMKaggEIEEEPxyHYutFcrvSMoeO2oUCwixn9XkQ=;
 b=eF9EqPq5TbP7rj+fioS4Oe01UYpYR+qvfD/gA3Mfk76cSwsLQ01koTpkakTQq/3ggf
 GXgu6v30uE9oe3Zyk1kleZxjvMT52EwmCzDfdZw/KFjsBT8EGCvWQgpVyFQGbDmIsK9H
 OBwtb8JccaYcdFYkfH+5YEThwbmnri2fEwd4CykdeHXpWSoorYOmX7yt2unNfh7P1KSY
 RWQhmGsQ8uHp9/+JaB8wgQKl6E1wo980JKMU2yjDY2ZPthwDnveIKgb2MqMe31dNq+un
 Sh8OJ6682EEBcNPwEN+EisykmbdGVbk7vkUulBSUoZYVQsQJ+ZN9QZr965cXogTgJBqP
 4SuQ==
X-Gm-Message-State: AOAM532cKAvPHoH4+eEpChh8qKg08bb2QUcoDXEXw4VYhpkhSPSstE8T
 GshenGV8b5DDdDegDQgiTpI=
X-Google-Smtp-Source: ABdhPJwK2bJj/NFx8BvpkbmtQ4HQox+iyd40MIX6HZNd4DRlHyxZ5vfScAKJiaDThxCgKhL2C6PA7Q==
X-Received: by 2002:a17:90a:1ce:: with SMTP id
 14mr13439887pjd.209.1601851504816; 
 Sun, 04 Oct 2020 15:45:04 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d129sm9073236pfc.161.2020.10.04.15.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 15:45:04 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org,
	digetx@gmail.com
Subject: [PATCH v6 0/3] iommu/tegra-smmu: Add PCI support
Date: Sun,  4 Oct 2020 15:38:34 -0700
Message-Id: <20201004223837.15303-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
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

This series is to add PCI support in tegra-smmu driver.

Changelog (Detail in each patch)
v5->v6
 * Dropped a NULL check, per Dmitry's comments
 * Added Dmitry's Reviewed-by and Tested-by
v4->v5
 * PATCH-1 Cleaned two variables inits
 * PATCH-2 Fixed put() in ->of_xlate() and Updated commit message
 * PATCH-3 Added Dmitry's Reviewed-by
v3->v4
 * Dropped helper function, per Thierry's comments
 * Found another way to get smmu pointer
v2->v3
 * Replaced with devm_tegra_get_memory_controller
 * Updated changes by following Dmitry's comments
v1->v2
 * Added PATCH-1 suggested by Dmitry
 * Reworked PATCH-2 to unify certain code

Nicolin Chen (3):
  iommu/tegra-smmu: Use fwspec in tegra_smmu_(de)attach_dev
  iommu/tegra-smmu: Rework tegra_smmu_probe_device()
  iommu/tegra-smmu: Add PCI support

 drivers/iommu/tegra-smmu.c | 180 ++++++++++++-------------------------
 1 file changed, 56 insertions(+), 124 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
