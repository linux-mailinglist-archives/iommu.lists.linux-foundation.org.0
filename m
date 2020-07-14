Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF3B21FD3A
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 21:22:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5B5EC860EF;
	Tue, 14 Jul 2020 19:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPfhkB8IZrbw; Tue, 14 Jul 2020 19:22:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF823860C1;
	Tue, 14 Jul 2020 19:22:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C27E3C0733;
	Tue, 14 Jul 2020 19:22:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0F1DC0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 19:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B89A68904D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 19:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leLdHANQFCTW for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 19:22:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ACA3088124
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 19:22:14 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jvQVH-00030h-Nb; Tue, 14 Jul 2020 19:22:11 +0000
From: Colin King <colin.king@canonical.com>
To: Joerg Roedel <joro@8bytes.org>, Tony Lindgren <tony@atomide.com>,
 Hiroshi DOYU <Hiroshi.DOYU@nokia.com>, iommu@lists.linux-foundation.org
Subject: [PATCH] OMAP: iommu: check for failure of a call to
 omap_iommu_dump_ctx
Date: Tue, 14 Jul 2020 20:22:11 +0100
Message-Id: <20200714192211.744776-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

It is possible for the call to omap_iommu_dump_ctx to return
a negative error number, so check for the failure and return
the error number rather than pass the negative value to
simple_read_from_buffer.

Addresses-Coverity: ("Improper use of negative value")
Fixes: 14e0e6796a0d ("OMAP: iommu: add initial debugfs support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iommu/omap-iommu-debug.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/omap-iommu-debug.c b/drivers/iommu/omap-iommu-debug.c
index 8e19bfa94121..a99afb5d9011 100644
--- a/drivers/iommu/omap-iommu-debug.c
+++ b/drivers/iommu/omap-iommu-debug.c
@@ -98,8 +98,11 @@ static ssize_t debug_read_regs(struct file *file, char __user *userbuf,
 	mutex_lock(&iommu_debug_lock);
 
 	bytes = omap_iommu_dump_ctx(obj, p, count);
+	if (bytes < 0)
+		goto err;
 	bytes = simple_read_from_buffer(userbuf, count, ppos, buf, bytes);
 
+err:
 	mutex_unlock(&iommu_debug_lock);
 	kfree(buf);
 
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
