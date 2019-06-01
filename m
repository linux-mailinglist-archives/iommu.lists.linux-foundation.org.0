Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D838731D56
	for <lists.iommu@lfdr.de>; Sat,  1 Jun 2019 15:28:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C64F93998;
	Sat,  1 Jun 2019 13:28:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 392582839
	for <iommu@lists.linux-foundation.org>;
	Sat,  1 Jun 2019 13:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E30678A2
	for <iommu@lists.linux-foundation.org>;
	Sat,  1 Jun 2019 13:26:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A49A3273C3;
	Sat,  1 Jun 2019 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559395598;
	bh=Ty1n3O1+kcrqM6zde0cyWrmCFeIf8+B9A/Bi/spdayo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LNcNuDrw8mkPkg1vtBYrrX6vgjyMfvmRTcGbba0ufPMRJeWNK1d9Cms/QwuXXPHe5
	4GYWotD9xVw67ScDi+8+pWi/l0ZSeHF0rs1bIOpR9z9XdndevIY3Uq0at7waUfCltp
	6k7gbOBZ15PQfCXX0d56Q6WYz+Q4GGqCK8xbSxvE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 19/56] iommu/vt-d: Set intel_iommu_gfx_mapped
	correctly
Date: Sat,  1 Jun 2019 09:25:23 -0400
Message-Id: <20190601132600.27427-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <jroedel@suse.de>, Ashok Raj <ashok.raj@intel.com>,
	Zhenyu Wang <zhenyuw@linux.intel.com>, iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Lu Baolu <baolu.lu@linux.intel.com>

[ Upstream commit cf1ec4539a50bdfe688caad4615ca47646884316 ]

The intel_iommu_gfx_mapped flag is exported by the Intel
IOMMU driver to indicate whether an IOMMU is used for the
graphic device. In a virtualized IOMMU environment (e.g.
QEMU), an include-all IOMMU is used for graphic device.
This flag is found to be clear even the IOMMU is used.

Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Reported-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Fixes: c0771df8d5297 ("intel-iommu: Export a flag indicating that the IOMMU is used for iGFX.")
Suggested-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/intel-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 3e97c4b2ebed2..b965561a41627 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3983,9 +3983,7 @@ static void __init init_no_remapping_devices(void)
 
 		/* This IOMMU has *only* gfx devices. Either bypass it or
 		   set the gfx_mapped flag, as appropriate */
-		if (dmar_map_gfx) {
-			intel_iommu_gfx_mapped = 1;
-		} else {
+		if (!dmar_map_gfx) {
 			drhd->ignored = 1;
 			for_each_active_dev_scope(drhd->devices,
 						  drhd->devices_cnt, i, dev)
@@ -4694,6 +4692,9 @@ int __init intel_iommu_init(void)
 		goto out_free_reserved_range;
 	}
 
+	if (dmar_map_gfx)
+		intel_iommu_gfx_mapped = 1;
+
 	init_no_remapping_devices();
 
 	ret = init_dmars();
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
