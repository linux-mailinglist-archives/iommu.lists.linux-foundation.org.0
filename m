Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id C858D446F21
	for <lists.iommu@lfdr.de>; Sat,  6 Nov 2021 17:53:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42FDE4027F;
	Sat,  6 Nov 2021 16:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWrTyzjrjQLj; Sat,  6 Nov 2021 16:53:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A8BA840278;
	Sat,  6 Nov 2021 16:53:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79FB7C0036;
	Sat,  6 Nov 2021 16:53:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D6F6C000E
 for <iommu@lists.linux-foundation.org>; Sat,  6 Nov 2021 16:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FCFE40267
 for <iommu@lists.linux-foundation.org>; Sat,  6 Nov 2021 16:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mDO-v_IQf_fY for <iommu@lists.linux-foundation.org>;
 Sat,  6 Nov 2021 16:53:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46E9840203
 for <iommu@lists.linux-foundation.org>; Sat,  6 Nov 2021 16:53:24 +0000 (UTC)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id jOwRmPLTp2lVYjOwSmW8kS; Sat, 06 Nov 2021 17:53:22 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 06 Nov 2021 17:53:22 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org,
 will@kernel.org, kevin.tian@intel.com
Subject: [PATCH] iommu/vt-d: Fix an unbalanced rcu_read_lock/rcu_read_unlock()
Date: Sat,  6 Nov 2021 17:53:18 +0100
Message-Id: <40cc077ca5f543614eab2a10e84d29dd190273f6.1636217517.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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

If we return -EOPNOTSUPP, the rcu lock remains lock. This is spurious.
Go through the end of the function instead. This way, the missing
'rcu_read_unlock()' is called.

Fixes: 7afd7f6aa21a ("iommu/vt-d: Check FL and SL capability sanity in scalable mode")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative, review with care.
---
 drivers/iommu/intel/cap_audit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/cap_audit.c b/drivers/iommu/intel/cap_audit.c
index b39d223926a4..71596fc62822 100644
--- a/drivers/iommu/intel/cap_audit.c
+++ b/drivers/iommu/intel/cap_audit.c
@@ -144,6 +144,7 @@ static int cap_audit_static(struct intel_iommu *iommu, enum cap_audit_type type)
 {
 	struct dmar_drhd_unit *d;
 	struct intel_iommu *i;
+	int rc = 0;
 
 	rcu_read_lock();
 	if (list_empty(&dmar_drhd_units))
@@ -169,11 +170,11 @@ static int cap_audit_static(struct intel_iommu *iommu, enum cap_audit_type type)
 	 */
 	if (intel_cap_smts_sanity() &&
 	    !intel_cap_flts_sanity() && !intel_cap_slts_sanity())
-		return -EOPNOTSUPP;
+		rc = -EOPNOTSUPP;
 
 out:
 	rcu_read_unlock();
-	return 0;
+	return rc;
 }
 
 int intel_cap_audit(enum cap_audit_type type, struct intel_iommu *iommu)
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
