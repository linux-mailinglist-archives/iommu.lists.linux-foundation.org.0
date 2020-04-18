Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AEA1AED04
	for <lists.iommu@lfdr.de>; Sat, 18 Apr 2020 15:49:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 01C4B85F97;
	Sat, 18 Apr 2020 13:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_WANXGNQ_7W; Sat, 18 Apr 2020 13:49:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35B9F85D54;
	Sat, 18 Apr 2020 13:49:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FB0CC089F;
	Sat, 18 Apr 2020 13:49:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBA51C0172
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 13:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C7AD28807B
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 13:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHKkpmyoYG-V for <iommu@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 13:49:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5602F87937
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 13:49:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A98A22250;
 Sat, 18 Apr 2020 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587217758;
 bh=Lh/aVkzRGiJf794rdAEn6bIXmrdHDr/0NaGaE+pi0Js=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rL7+8iA3nH9R0G1SuvMnS01OofFzHYedlg5g5V5FUMz06mjZSyxXTLu8HWgP0uiMC
 VCtFlIc8EU3DTfsKuHQIogGKkd2p3vl3C50oBBGzOFAxJmNaCT5j01mszB2Mvsfjo7
 bv0jsqWT/u/6eZJbv8UEs1yt0jv8T16F6KWkWN+8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 49/73] iommu/vt-d: Add build dependency on IOASID
Date: Sat, 18 Apr 2020 09:47:51 -0400
Message-Id: <20200418134815.6519-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418134815.6519-1-sashal@kernel.org>
References: <20200418134815.6519-1-sashal@kernel.org>
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

From: Jacob Pan <jacob.jun.pan@linux.intel.com>

[ Upstream commit 4a663dae47316ae8b97d5b77025fe7dfd9d3487f ]

IOASID code is needed by VT-d scalable mode for PASID allocation.
Add explicit dependency such that IOASID is built-in whenever Intel
IOMMU is enabled.
Otherwise, aux domain code will fail when IOMMU is built-in and IOASID
is compiled as a module.

Fixes: 59a623374dc38 ("iommu/vt-d: Replace Intel specific PASID allocator with IOASID")
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index d2fade9849997..25149544d57c9 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -188,6 +188,7 @@ config INTEL_IOMMU
 	select NEED_DMA_MAP_STATE
 	select DMAR_TABLE
 	select SWIOTLB
+	select IOASID
 	help
 	  DMA remapping (DMAR) devices support enables independent address
 	  translations for Direct Memory Access (DMA) from devices.
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
