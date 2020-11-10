Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7D2ACCB2
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 04:56:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B34F886566;
	Tue, 10 Nov 2020 03:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NW7ayo7XcyQu; Tue, 10 Nov 2020 03:56:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3BA0D85A46;
	Tue, 10 Nov 2020 03:56:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36BA1C016F;
	Tue, 10 Nov 2020 03:56:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91BD4C016F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 03:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B1F386BE2
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 03:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yv-DfP19alcV for <iommu@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 03:56:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1497186A2E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 03:56:48 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC54F20665;
 Tue, 10 Nov 2020 03:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980607;
 bh=3uCbvFkz7ftTmGmmmbXlOs5RjKWiK5OgCyKJxqptNqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dcEXpLGYUThxYClEHFW68v80+M8UbJLQ5qySYRvH5RyWqSZKsi8AkJkqLYxAk4Yiq
 TMYVQvXMQqF4NALPs0UWxKF9GtBEtut+NYJSLe/pSM/2gc5e/ZBbzUa70iBgVo9xlY
 78FkH+NbmIx9yDQE2zBWjNFn3EyUCpt1O4SamHIA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 10/12] iommu/amd: Increase interrupt remapping
 table limit to 512 entries
Date: Mon,  9 Nov 2020 22:56:31 -0500
Message-Id: <20201110035633.425030-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110035633.425030-1-sashal@kernel.org>
References: <20201110035633.425030-1-sashal@kernel.org>
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

[ Upstream commit 73db2fc595f358460ce32bcaa3be1f0cce4a2db1 ]

Certain device drivers allocate IO queues on a per-cpu basis.
On AMD EPYC platform, which can support up-to 256 cpu threads,
this can exceed the current MAX_IRQ_PER_TABLE limit of 256,
and result in the error message:

    AMD-Vi: Failed to allocate IRTE

This has been observed with certain NVME devices.

AMD IOMMU hardware can actually support upto 512 interrupt
remapping table entries. Therefore, update the driver to
match the hardware limit.

Please note that this also increases the size of interrupt remapping
table to 8KB per device when using the 128-bit IRTE format.

Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Link: https://lore.kernel.org/r/20201015025002.87997-1-suravee.suthikulpanit@amd.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu_types.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
index da3fbf82d1cf4..e19c05d9e84ba 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -383,7 +383,11 @@ extern bool amd_iommu_np_cache;
 /* Only true if all IOMMUs support device IOTLBs */
 extern bool amd_iommu_iotlb_sup;
 
-#define MAX_IRQS_PER_TABLE	256
+/*
+ * AMD IOMMU hardware only support 512 IRTEs despite
+ * the architectural limitation of 2048 entries.
+ */
+#define MAX_IRQS_PER_TABLE	512
 #define IRQ_TABLE_ALIGNMENT	128
 
 struct irq_remap_table {
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
