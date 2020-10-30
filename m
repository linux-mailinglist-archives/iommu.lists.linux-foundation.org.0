Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1012A0D55
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 19:26:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EAA4E20457;
	Fri, 30 Oct 2020 18:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eCZmoNGqJiM; Fri, 30 Oct 2020 18:26:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 96E7A20418;
	Fri, 30 Oct 2020 18:26:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83048C0051;
	Fri, 30 Oct 2020 18:26:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37CCCC0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 18:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1C61587048
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 18:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkR53ucQSz3f for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 18:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7266A87037
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 18:26:39 +0000 (UTC)
Received: from localhost.localdomain ([81.185.160.173]) by mwinf5d86 with ME
 id mJSW2300E3km4KV03JSWA8; Fri, 30 Oct 2020 19:26:37 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Oct 2020 19:26:37 +0100
X-ME-IP: 81.185.160.173
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dwmw2@infradead.org,
	baolu.lu@linux.intel.com,
	joro@8bytes.org
Subject: [PATCH] iommu/vt-d: Avoid GFP_ATOMIC where it is not needed
Date: Fri, 30 Oct 2020 19:26:30 +0100
Message-Id: <20201030182630.5154-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

There is no reason to use GFP_ATOMIC in a 'suspend' function.
Use GFP_KERNEL instead to give more opportunities to allocate the
requested memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Should GFP_ATOMIC be mandatory here, a comment explaining why would be great
---
 drivers/iommu/intel/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index f8177c59d229..cd2a82ed78b5 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4114,7 +4114,7 @@ static int iommu_suspend(void)
 
 	for_each_active_iommu(iommu, drhd) {
 		iommu->iommu_state = kcalloc(MAX_SR_DMAR_REGS, sizeof(u32),
-						 GFP_ATOMIC);
+					     GFP_KERNEL);
 		if (!iommu->iommu_state)
 			goto nomem;
 	}
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
