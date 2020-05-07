Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A31C8EB1
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 16:29:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9EC986283;
	Thu,  7 May 2020 14:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gb1O0a58jYd2; Thu,  7 May 2020 14:29:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3448C861FE;
	Thu,  7 May 2020 14:29:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2120DC07FF;
	Thu,  7 May 2020 14:29:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9ED8C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C7904885C7
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8eh0Oi5kXX4p for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:29:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 503E4885C6
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:29:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80CC3208D6;
 Thu,  7 May 2020 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588861780;
 bh=fkiihqvs3l6pEIs158rIwq8LwXoqIKl9fUbmIrZefK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ukA1YBjXab11nqDNIfuMw0nGMxbpd0X6oDtsaLPdQ2qDK+IQvHlhNEWmAAXna6cfZ
 cGTSg0v4TXR9ls7m/ctvYmTiCtLdP+qTwlsbYVHXw/3fV8n1NuI/ng2PS+Tc743+Fl
 qalWGFWtj4/aXUqMG6e+rulCYG2tbYbO8hUT1NwQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 19/20] iommu/amd: Fix legacy interrupt remapping
 for x2APIC-enabled system
Date: Thu,  7 May 2020 10:29:15 -0400
Message-Id: <20200507142917.26612-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507142917.26612-1-sashal@kernel.org>
References: <20200507142917.26612-1-sashal@kernel.org>
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

From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

[ Upstream commit b74aa02d7a30ee5e262072a7d6e8deff10b37924 ]

Currently, system fails to boot because the legacy interrupt remapping
mode does not enable 128-bit IRTE (GA), which is required for x2APIC
support.

Fix by using AMD_IOMMU_GUEST_IR_LEGACY_GA mode when booting with
kernel option amd_iommu_intr=legacy instead. The initialization
logic will check GASup and automatically fallback to using
AMD_IOMMU_GUEST_IR_LEGACY if GA mode is not supported.

Fixes: 3928aa3f5775 ("iommu/amd: Detect and enable guest vAPIC support")
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Link: https://lore.kernel.org/r/1587562202-14183-1-git-send-email-suravee.suthikulpanit@amd.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index 465f28a7844c2..2557ed112bc24 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -2836,7 +2836,7 @@ static int __init parse_amd_iommu_intr(char *str)
 {
 	for (; *str; ++str) {
 		if (strncmp(str, "legacy", 6) == 0) {
-			amd_iommu_guest_ir = AMD_IOMMU_GUEST_IR_LEGACY;
+			amd_iommu_guest_ir = AMD_IOMMU_GUEST_IR_LEGACY_GA;
 			break;
 		}
 		if (strncmp(str, "vapic", 5) == 0) {
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
