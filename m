Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A371C283832
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 16:45:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 348F5204C6;
	Mon,  5 Oct 2020 14:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N76GbOR-4jrt; Mon,  5 Oct 2020 14:45:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2A97A2038F;
	Mon,  5 Oct 2020 14:45:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18698C0051;
	Mon,  5 Oct 2020 14:45:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98E48C0051
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 14:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8888B8656A
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 14:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwVaJmkwhJWr for <iommu@lists.linux-foundation.org>;
 Mon,  5 Oct 2020 14:45:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0C5D186569
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 14:45:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10E622100A;
 Mon,  5 Oct 2020 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601909122;
 bh=9jf8/2pMdLGUD/SuF7vDmhqV2XjIPuHv9JsZXVZ+gzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uyNjSHjNJxnl/0RLVq0jbpA0xwDK8OrleTUPValTLDndmB4OABnbw/H6YCyzB0wEg
 bfVFX0okbOwGJzlepmw/+Ka5jGlG6O772uTILww4xiqf5/StTQy4ViNTzVQOdge+z9
 tplzLPmyPsL8dRLUZ2gVt6eP0sTByVC4Lcvrvpgo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 4/4] iommu/vt-d: Fix lockdep splat in
 iommu_flush_dev_iotlb()
Date: Mon,  5 Oct 2020 10:45:17 -0400
Message-Id: <20201005144517.2527627-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201005144517.2527627-1-sashal@kernel.org>
References: <20201005144517.2527627-1-sashal@kernel.org>
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

From: Lu Baolu <baolu.lu@linux.intel.com>

[ Upstream commit 1a3f2fd7fc4e8f24510830e265de2ffb8e3300d2 ]

Lock(&iommu->lock) without disabling irq causes lockdep warnings.

[   12.703950] ========================================================
[   12.703962] WARNING: possible irq lock inversion dependency detected
[   12.703975] 5.9.0-rc6+ #659 Not tainted
[   12.703983] --------------------------------------------------------
[   12.703995] systemd-udevd/284 just changed the state of lock:
[   12.704007] ffffffffbd6ff4d8 (device_domain_lock){..-.}-{2:2}, at:
               iommu_flush_dev_iotlb.part.57+0x2e/0x90
[   12.704031] but this lock took another, SOFTIRQ-unsafe lock in the past:
[   12.704043]  (&iommu->lock){+.+.}-{2:2}
[   12.704045]

               and interrupts could create inverse lock ordering between
               them.

[   12.704073]
               other info that might help us debug this:
[   12.704085]  Possible interrupt unsafe locking scenario:

[   12.704097]        CPU0                    CPU1
[   12.704106]        ----                    ----
[   12.704115]   lock(&iommu->lock);
[   12.704123]                                local_irq_disable();
[   12.704134]                                lock(device_domain_lock);
[   12.704146]                                lock(&iommu->lock);
[   12.704158]   <Interrupt>
[   12.704164]     lock(device_domain_lock);
[   12.704174]
                *** DEADLOCK ***

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20200927062428.13713-1-baolu.lu@linux.intel.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/intel-iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 2ffec65df3889..1147626f0d253 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2560,14 +2560,14 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 		}
 
 		/* Setup the PASID entry for requests without PASID: */
-		spin_lock(&iommu->lock);
+		spin_lock_irqsave(&iommu->lock, flags);
 		if (hw_pass_through && domain_type_is_si(domain))
 			ret = intel_pasid_setup_pass_through(iommu, domain,
 					dev, PASID_RID2PASID);
 		else
 			ret = intel_pasid_setup_second_level(iommu, domain,
 					dev, PASID_RID2PASID);
-		spin_unlock(&iommu->lock);
+		spin_unlock_irqrestore(&iommu->lock, flags);
 		if (ret) {
 			dev_err(dev, "Setup RID2PASID failed\n");
 			dmar_remove_one_dev_info(dev);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
