Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3E64060DF
	for <lists.iommu@lfdr.de>; Fri, 10 Sep 2021 02:21:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 440CD40198;
	Fri, 10 Sep 2021 00:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZYdgaF_O3I2; Fri, 10 Sep 2021 00:20:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 50C9F40217;
	Fri, 10 Sep 2021 00:20:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C97CC0022;
	Fri, 10 Sep 2021 00:20:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 789BFC000D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 684EE605FE
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1hzZnCA83lj for <iommu@lists.linux-foundation.org>;
 Fri, 10 Sep 2021 00:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA66D605F7
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:20:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1C3F611AF;
 Fri, 10 Sep 2021 00:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233256;
 bh=O/gg5zFLjVoQtTTZxlWgpQw4T0yXAHEHAMRe3ZrnNIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JmNeB98HNqtiLQ6m+dQsge5k5a2a9mFuecEVvHGz3KIQVkHUHs0qIhz5Z1XWuYKgH
 cRIBZ7JF2BfLW8MM4Twqi1UiNrdUrqziLfQCIJvY4A7XTD6/13YoCR26xEelmlbPYh
 qNz8lx1gXkE3Q/w5Gbp9HhYtaDalIJmh4myeyDAfePKR1yBBIyPCIwqvfDGlgnbTHa
 7KzBLS4xzDDynR/WSDKoGmioqJAEfahBTdv/TstK56J0lr8Uxd+x5O/0epfcPXVI6Q
 UObqkcuYn7vv7Gzh3OvAtKzpgMlYxKhsPjY2Z1xVUbualXE4xHtMvqNAJcJ2M5vO0E
 hkxLgIe4RXtkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 20/53] iommu: Fix race condition during default
 domain allocation
Date: Thu,  9 Sep 2021 20:19:55 -0400
Message-Id: <20210910002028.175174-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002028.175174-1-sashal@kernel.org>
References: <20210910002028.175174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, Ashish Mhetre <amhetre@nvidia.com>
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

From: Ashish Mhetre <amhetre@nvidia.com>

[ Upstream commit 211ff31b3d33b56aa12937e898c9280d07daf0d9 ]

When two devices with same SID are getting probed concurrently through
iommu_probe_device(), the iommu_domain sometimes is getting allocated more
than once as call to iommu_alloc_default_domain() is not protected for
concurrency. Furthermore, it leads to each device holding a different
iommu_domain pointer, separate IOVA space and only one of the devices'
domain is used for translations from IOMMU. This causes accesses from other
device to fault or see incorrect translations.
Fix this by protecting iommu_alloc_default_domain() call with group->mutex
and let all devices with same SID share same iommu_domain.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
Link: https://lore.kernel.org/r/1628570641-9127-2-git-send-email-amhetre@nvidia.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index bcf060b5cf85..a103a503a4db 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -262,7 +262,9 @@ int iommu_probe_device(struct device *dev)
 	 * support default domains, so the return value is not yet
 	 * checked.
 	 */
+	mutex_lock(&group->mutex);
 	iommu_alloc_default_domain(group, dev);
+	mutex_unlock(&group->mutex);
 
 	if (group->default_domain) {
 		ret = __iommu_attach_device(group->default_domain, dev);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
