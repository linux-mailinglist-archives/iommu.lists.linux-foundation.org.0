Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 639333A4354
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 15:50:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02CF84062E;
	Fri, 11 Jun 2021 13:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ud4uYPD_AEfc; Fri, 11 Jun 2021 13:50:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EE8DF41575;
	Fri, 11 Jun 2021 13:50:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C426CC0024;
	Fri, 11 Jun 2021 13:50:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74937C000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 13:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55AD060771
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 13:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnFWJisEyWtv for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 13:50:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60FEB60763
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 13:50:31 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lrhYG-00074P-Qe; Fri, 11 Jun 2021 13:50:24 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org
Subject: [PATCH][next] iommu/vt-d: Fix dereference of pointer info before it
 is null checked
Date: Fri, 11 Jun 2021 14:50:24 +0100
Message-Id: <20210611135024.32781-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
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

The assignment of iommu from info->iommu occurs before info is null checked
hence leading to a potential null pointer dereference issue. Fix this by
assigning iommu and checking if iommu is null after null checking info.

Addresses-Coverity: ("Dereference before null check")
Fixes: 4c82b88696ac ("iommu/vt-d: Allocate/register iopf queue for sva devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iommu/intel/iommu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index bd93c7ec879e..76a58b8ad6c3 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5329,10 +5329,14 @@ static int intel_iommu_disable_auxd(struct device *dev)
 static int intel_iommu_enable_sva(struct device *dev)
 {
 	struct device_domain_info *info = get_domain_info(dev);
-	struct intel_iommu *iommu = info->iommu;
+	struct intel_iommu *iommu;
 	int ret;
 
-	if (!info || !iommu || dmar_disabled)
+	if (!info || dmar_disabled)
+		return -EINVAL;
+
+	iommu = info->iommu;
+	if (!iommu)
 		return -EINVAL;
 
 	if (!(iommu->flags & VTD_FLAG_SVM_CAPABLE))
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
