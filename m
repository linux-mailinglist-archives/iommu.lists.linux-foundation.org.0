Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E348C834
	for <lists.iommu@lfdr.de>; Wed, 12 Jan 2022 17:23:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B41E74294A;
	Wed, 12 Jan 2022 16:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XB9IC90W2-_o; Wed, 12 Jan 2022 16:23:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 352B842949;
	Wed, 12 Jan 2022 16:23:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 044C4C0070;
	Wed, 12 Jan 2022 16:23:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A307C001E
 for <iommu@lists.linux-foundation.org>; Wed, 12 Jan 2022 13:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 4389D40191
 for <iommu@lists.linux-foundation.org>; Wed, 12 Jan 2022 13:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id rrppwczTmIZL for <iommu@lists.linux-foundation.org>;
 Wed, 12 Jan 2022 13:18:27 +0000 (UTC)
X-Greylist: delayed 00:05:02 by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id A1412400DA
 for <iommu@lists.linux-foundation.org>; Wed, 12 Jan 2022 13:18:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1641993507; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=t8UcX5N7QmTU7XeUfa4gdrtpln6WbR8NBAKQ1OyJ86A=;
 b=mfeOxuUPOp6/dVHY4JDD45/sDdyvQFaTJ9MvCTo2R2gxdDlBGEjdWm1U0Ob2wWlw3P+LffTH
 UA2+X3xR7+74s7DB/skLO28gQZibiClhrQzlTeSyDmCB7xLyv1lmj2/9Lw/rTxUuVp6H8tnf
 dL18Uxolx60HWRv7g7rfHzkQd2k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61ded3f3e0071250cf781d8f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Jan 2022 13:13:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C307AC4338F; Wed, 12 Jan 2022 13:13:23 +0000 (UTC)
Received: from vjitta-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: vjitta)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1113DC4338F;
 Wed, 12 Jan 2022 13:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1113DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Vijayanand Jitta <quic_vjitta@quicinc.com>
To: joro@8bytes.org, will@kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] iommu: Fix potential use-after-free during probe
Date: Wed, 12 Jan 2022 18:43:04 +0530
Message-Id: <1641993184-1232-1-git-send-email-quic_vjitta@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 12 Jan 2022 16:23:49 +0000
Cc: vjitta@codeaurora.org, Vijayanand Jitta <quic_vjitta@quicinc.com>,
 kernel-team@android.com
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

Fix this by taking device_lock during probe_iommu_group.

Signed-off-by: Vijayanand Jitta <quic_vjitta@quicinc.com>
---
 drivers/iommu/iommu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index dd7863e..261792d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1617,7 +1617,7 @@ static int probe_iommu_group(struct device *dev, void *data)
 {
 	struct list_head *group_list = data;
 	struct iommu_group *group;
-	int ret;
+	int ret = 0;
 
 	/* Device is probed already if in a group */
 	group = iommu_group_get(dev);
@@ -1626,9 +1626,13 @@ static int probe_iommu_group(struct device *dev, void *data)
 		return 0;
 	}
 
-	ret = __iommu_probe_device(dev, group_list);
-	if (ret == -ENODEV)
-		ret = 0;
+	ret = device_trylock(dev);
+	if (ret) {
+		ret = __iommu_probe_device(dev, group_list);
+		if (ret == -ENODEV)
+			ret = 0;
+		device_unlock(dev);
+	}
 
 	return ret;
 }
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
