Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB225FF7D
	for <lists.iommu@lfdr.de>; Mon,  7 Sep 2020 18:33:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 076ED2153D;
	Mon,  7 Sep 2020 16:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeLN4dBshpnH; Mon,  7 Sep 2020 16:33:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2F310203E8;
	Mon,  7 Sep 2020 16:33:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D04D2C0051;
	Mon,  7 Sep 2020 16:33:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A077BC0051
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 16:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 750868709E
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 16:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0yGXRm8bJQ2 for <iommu@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 16:33:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 78A7D86F76
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 16:33:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 443A621941;
 Mon,  7 Sep 2020 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496405;
 bh=cKkhVZVcMcX9KzrcnCMkq38mF8puxm9XVcCbDDzK8Mw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kii9zdSEBVgF/F/Vwt4FEb/8REJzyL5l694rFqOk+jaZJmrKkuk8rl9DrOf/m1gYy
 L75pVoM60W7jYCT89AViNrykzPNROVj6B9HObmzAJ6KQer/BbzPVaWiebLQxcdUGXm
 5CU01kh/Q8/p16/31Kf+bqA9CgHksvHIvBpEL7iE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 51/53] iommu/amd: Do not force direct mapping when
 SME is active
Date: Mon,  7 Sep 2020 12:32:17 -0400
Message-Id: <20200907163220.1280412-51-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163220.1280412-1-sashal@kernel.org>
References: <20200907163220.1280412-1-sashal@kernel.org>
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

From: Joerg Roedel <jroedel@suse.de>

[ Upstream commit 7cad554887f1c5fd77e57e6bf4be38370c2160cb ]

Do not force devices supporting IOMMUv2 to be direct mapped when memory
encryption is active. This might cause them to be unusable because their
DMA mask does not include the encryption bit.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Link: https://lore.kernel.org/r/20200824105415.21000-2-joro@8bytes.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd/iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 2f22326ee4dfe..547b41e376574 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2650,7 +2650,12 @@ static int amd_iommu_def_domain_type(struct device *dev)
 	if (!dev_data)
 		return 0;
 
-	if (dev_data->iommu_v2)
+	/*
+	 * Do not identity map IOMMUv2 capable devices when memory encryption is
+	 * active, because some of those devices (AMD GPUs) don't have the
+	 * encryption bit in their DMA-mask and require remapping.
+	 */
+	if (!mem_encrypt_active() && dev_data->iommu_v2)
 		return IOMMU_DOMAIN_IDENTITY;
 
 	return 0;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
