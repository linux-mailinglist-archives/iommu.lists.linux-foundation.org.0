Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A00D4AFAB2
	for <lists.iommu@lfdr.de>; Wed,  9 Feb 2022 19:39:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 337D3400C5;
	Wed,  9 Feb 2022 18:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNDWGTJMnq6V; Wed,  9 Feb 2022 18:39:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DC60540475;
	Wed,  9 Feb 2022 18:39:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC2F8C0073;
	Wed,  9 Feb 2022 18:39:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE63EC000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 18:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF769403A7
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 18:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PB5HtVKAxV1a for <iommu@lists.linux-foundation.org>;
 Wed,  9 Feb 2022 18:39:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EAF640239
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 18:39:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A66576006F;
 Wed,  9 Feb 2022 18:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A36C340ED;
 Wed,  9 Feb 2022 18:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644431964;
 bh=13fe4Gu64rL6bhmzbwQ7D7+42vxeVPMAYd9meoU4fuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u6xWgarQVmVNCjnGdwHwUa0cXNH5EIywIS6Sl6GvhWM45pmJmRt31TSlIg1a0WHs2
 i58maxkffbG08e7eUPDaTen3+2b3GXmlEHBWPUOg89RFuJ8WvaPipRZfUr92x5b6XH
 OXVBAQLt9dJej4mLHgpofRbaaFDJ8uzyeWh0RblxC1cbEAehBf1djovWQXHzjQkB+P
 M/+uiO1k5yHsAdlnIutPpFGqALQfZOH8NIVTjTbfbdE24UVCClGO6QEXLgxv6wWbUR
 Tzwi2XJDdLnmnBgXExG6l2uPIaufbnlKKkcDxUWhA2yosG6pUnmLHYLZAj/PD9wfY/
 OceMCeFpRwc6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 19/36] iommu: Fix potential use-after-free during
 probe
Date: Wed,  9 Feb 2022 13:37:42 -0500
Message-Id: <20220209183759.47134-19-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209183759.47134-1-sashal@kernel.org>
References: <20220209183759.47134-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, iommu@lists.linux-foundation.org,
 will@kernel.org
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

From: Vijayanand Jitta <quic_vjitta@quicinc.com>

[ Upstream commit b54240ad494300ff0994c4539a531727874381f4 ]

Kasan has reported the following use after free on dev->iommu.
when a device probe fails and it is in process of freeing dev->iommu
in dev_iommu_free function, a deferred_probe_work_func runs in parallel
and tries to access dev->iommu->fwspec in of_iommu_configure path thus
causing use after free.

BUG: KASAN: use-after-free in of_iommu_configure+0xb4/0x4a4
Read of size 8 at addr ffffff87a2f1acb8 by task kworker/u16:2/153

Workqueue: events_unbound deferred_probe_work_func
Call trace:
 dump_backtrace+0x0/0x33c
 show_stack+0x18/0x24
 dump_stack_lvl+0x16c/0x1e0
 print_address_description+0x84/0x39c
 __kasan_report+0x184/0x308
 kasan_report+0x50/0x78
 __asan_load8+0xc0/0xc4
 of_iommu_configure+0xb4/0x4a4
 of_dma_configure_id+0x2fc/0x4d4
 platform_dma_configure+0x40/0x5c
 really_probe+0x1b4/0xb74
 driver_probe_device+0x11c/0x228
 __device_attach_driver+0x14c/0x304
 bus_for_each_drv+0x124/0x1b0
 __device_attach+0x25c/0x334
 device_initial_probe+0x24/0x34
 bus_probe_device+0x78/0x134
 deferred_probe_work_func+0x130/0x1a8
 process_one_work+0x4c8/0x970
 worker_thread+0x5c8/0xaec
 kthread+0x1f8/0x220
 ret_from_fork+0x10/0x18

Allocated by task 1:
 ____kasan_kmalloc+0xd4/0x114
 __kasan_kmalloc+0x10/0x1c
 kmem_cache_alloc_trace+0xe4/0x3d4
 __iommu_probe_device+0x90/0x394
 probe_iommu_group+0x70/0x9c
 bus_for_each_dev+0x11c/0x19c
 bus_iommu_probe+0xb8/0x7d4
 bus_set_iommu+0xcc/0x13c
 arm_smmu_bus_init+0x44/0x130 [arm_smmu]
 arm_smmu_device_probe+0xb88/0xc54 [arm_smmu]
 platform_drv_probe+0xe4/0x13c
 really_probe+0x2c8/0xb74
 driver_probe_device+0x11c/0x228
 device_driver_attach+0xf0/0x16c
 __driver_attach+0x80/0x320
 bus_for_each_dev+0x11c/0x19c
 driver_attach+0x38/0x48
 bus_add_driver+0x1dc/0x3a4
 driver_register+0x18c/0x244
 __platform_driver_register+0x88/0x9c
 init_module+0x64/0xff4 [arm_smmu]
 do_one_initcall+0x17c/0x2f0
 do_init_module+0xe8/0x378
 load_module+0x3f80/0x4a40
 __se_sys_finit_module+0x1a0/0x1e4
 __arm64_sys_finit_module+0x44/0x58
 el0_svc_common+0x100/0x264
 do_el0_svc+0x38/0xa4
 el0_svc+0x20/0x30
 el0_sync_handler+0x68/0xac
 el0_sync+0x160/0x180

Freed by task 1:
 kasan_set_track+0x4c/0x84
 kasan_set_free_info+0x28/0x4c
 ____kasan_slab_free+0x120/0x15c
 __kasan_slab_free+0x18/0x28
 slab_free_freelist_hook+0x204/0x2fc
 kfree+0xfc/0x3a4
 __iommu_probe_device+0x284/0x394
 probe_iommu_group+0x70/0x9c
 bus_for_each_dev+0x11c/0x19c
 bus_iommu_probe+0xb8/0x7d4
 bus_set_iommu+0xcc/0x13c
 arm_smmu_bus_init+0x44/0x130 [arm_smmu]
 arm_smmu_device_probe+0xb88/0xc54 [arm_smmu]
 platform_drv_probe+0xe4/0x13c
 really_probe+0x2c8/0xb74
 driver_probe_device+0x11c/0x228
 device_driver_attach+0xf0/0x16c
 __driver_attach+0x80/0x320
 bus_for_each_dev+0x11c/0x19c
 driver_attach+0x38/0x48
 bus_add_driver+0x1dc/0x3a4
 driver_register+0x18c/0x244
 __platform_driver_register+0x88/0x9c
 init_module+0x64/0xff4 [arm_smmu]
 do_one_initcall+0x17c/0x2f0
 do_init_module+0xe8/0x378
 load_module+0x3f80/0x4a40
 __se_sys_finit_module+0x1a0/0x1e4
 __arm64_sys_finit_module+0x44/0x58
 el0_svc_common+0x100/0x264
 do_el0_svc+0x38/0xa4
 el0_svc+0x20/0x30
 el0_sync_handler+0x68/0xac
 el0_sync+0x160/0x180

Fix this by setting dev->iommu to NULL first and
then freeing dev_iommu structure in dev_iommu_free
function.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Vijayanand Jitta <quic_vjitta@quicinc.com>
Link: https://lore.kernel.org/r/1643613155-20215-1-git-send-email-quic_vjitta@quicinc.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/iommu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index f62fb6a58f109..7f409e9eea4b7 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -206,9 +206,14 @@ static struct dev_iommu *dev_iommu_get(struct device *dev)
 
 static void dev_iommu_free(struct device *dev)
 {
-	iommu_fwspec_free(dev);
-	kfree(dev->iommu);
+	struct dev_iommu *param = dev->iommu;
+
 	dev->iommu = NULL;
+	if (param->fwspec) {
+		fwnode_handle_put(param->fwspec->iommu_fwnode);
+		kfree(param->fwspec);
+	}
+	kfree(param);
 }
 
 static int __iommu_probe_device(struct device *dev, struct list_head *group_list)
-- 
2.34.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
