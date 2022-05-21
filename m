Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61D52F6B9
	for <lists.iommu@lfdr.de>; Sat, 21 May 2022 02:21:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 373CF60797;
	Sat, 21 May 2022 00:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lq9NF4I_ESV2; Sat, 21 May 2022 00:21:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3BAF060ADD;
	Sat, 21 May 2022 00:21:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 042A2C007E;
	Sat, 21 May 2022 00:21:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC203C002D
 for <iommu@lists.linux-foundation.org>; Sat, 21 May 2022 00:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E813960A9B
 for <iommu@lists.linux-foundation.org>; Sat, 21 May 2022 00:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mtVowb9kr8T for <iommu@lists.linux-foundation.org>;
 Sat, 21 May 2022 00:21:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C73B60797
 for <iommu@lists.linux-foundation.org>; Sat, 21 May 2022 00:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653092508; x=1684628508;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cPfLoZtca+b22hQ2Mb+X+UQqtW+Opc4ACZBXmZVYf0Y=;
 b=isgFfGzONW7GQbIv0VMn1BOT6fROqoPN3hiqecDn+R/dZrXbu1DrNr/7
 YvouXXsqWuLb7UQjAeJS6KnIJcuh1kHRlEcFix2Dzs7vira/uGVOmSZan
 v4lMeWY+pfMUZw9k8VImUfFhCLCbeQR0JoR9bVGHq/aEAXV80viJghMxx
 vaPSaNmuPUbE34Hl/gtork2FvBDww9IkCyM+qcGm+PUiPbFULSfbXnvAZ
 RDh3Tp0/8nOEuq96GCYEcfg0OJmOp1lAxeoeUZT+New9cwIpfomIxHx63
 O1GViauDY1D6agFysVh2VgD2LUvkw1iHUBx+LyhA8YvsKv+ddbXeusczc A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="298091946"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="298091946"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 17:21:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="571089465"
Received: from oux.sc.intel.com ([10.3.52.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 17:21:47 -0700
From: Yian Chen <yian.chen@intel.com>
To: iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Ravi Shankar <ravi.v.shankar@intel.com>, Yian Chen <yian.chen@intel.com>
Subject: [PATCH] iommu/vt-d: Fix PCI bus rescan device hot add
Date: Fri, 20 May 2022 17:21:15 -0700
Message-Id: <20220521002115.1624069-1-yian.chen@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Notifier calling chain uses priority to determine the execution
order of the notifiers or listeners registered to the chain.
PCI bus device hot add utilizes the notification mechanism.

The current code sets low priority (INT_MIN) to Intel
dmar_pci_bus_notifier and postpones DMAR decoding after adding
new device into IOMMU. The result is that struct device pointer
cannot be found in DRHD search for the new device's DMAR/IOMMU.
Subsequently, the device is put under the "catch-all" IOMMU
instead of the correct one. This could cause system hang when
device TLB invalidation is sent to the wrong IOMMU. Invalidation
timeout error and hard lockup have been observed and data
inconsistency/crush may occur as well.

This patch fixes the issue by setting a positive priority(1) for
dmar_pci_bus_notifier while the priority of IOMMU bus notifier
uses the default value(0), therefore DMAR decoding will be in
advance of DRHD search for a new device to find the correct IOMMU.

Following is a 2-step example that triggers the bug by simulating
PCI device hot add behavior in Intel Sapphire Rapids server.

echo 1 > /sys/bus/pci/devices/0000:6a:01.0/remove
echo 1 > /sys/bus/pci/rescan

Fixes: 59ce0515cdaf ("iommu/vt-d: Update DRHD/RMRR/ATSR device scope")
Cc: stable@vger.kernel.org # v3.15+
Reported-by: Zhang, Bernice <bernice.zhang@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Yian Chen <yian.chen@intel.com>
---
This is a quick fix for the bug reported. Intel internally evaluated
another redesigned solution that eliminates dmar pci bus notifier to
simplify the workflow of pci hotplug and improve its runtime efficiency.

While considering the fix could apply to downstream and the complexity
of pci hotplug workflow change may significantly increase the
engineering effort to downstream the patch, the choice is to submit this
simple patch to help the deployment of this bug fix.
---

 drivers/iommu/intel/dmar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 4de960834a1b..497c5bd95caf 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -383,7 +383,7 @@ static int dmar_pci_bus_notifier(struct notifier_block *nb,
 
 static struct notifier_block dmar_pci_bus_nb = {
 	.notifier_call = dmar_pci_bus_notifier,
-	.priority = INT_MIN,
+	.priority = 1,
 };
 
 static struct dmar_drhd_unit *
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
