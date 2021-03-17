Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D533EC39
	for <lists.iommu@lfdr.de>; Wed, 17 Mar 2021 10:10:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B41A543039;
	Wed, 17 Mar 2021 09:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXAX7TCjgUvs; Wed, 17 Mar 2021 09:10:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2C7B43203;
	Wed, 17 Mar 2021 09:10:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA3B6C000C;
	Wed, 17 Mar 2021 09:10:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D86A3C000A
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 09:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C71E7605B7
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 09:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhjV9jJVXmet for <iommu@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 09:10:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D1EC6F4E1
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 09:10:47 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 920F03D5;
 Wed, 17 Mar 2021 10:10:42 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 2/3] iommu/amd: Don't call early_amd_iommu_init() when AMD
 IOMMU is disabled
Date: Wed, 17 Mar 2021 10:10:36 +0100
Message-Id: <20210317091037.31374-3-joro@8bytes.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317091037.31374-1-joro@8bytes.org>
References: <20210317091037.31374-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: Joerg Roedel <jroedel@suse.de>, Xiaojian Du <xiaojian.du@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Woodhouse <dwmw2@infradead.org>
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

From: Joerg Roedel <jroedel@suse.de>

Don't even try to initialize the AMD IOMMU hardware when amd_iommu=off has been
passed on the kernel command line.

References: https://bugzilla.kernel.org/show_bug.cgi?id=212133
References: https://bugzilla.suse.com/show_bug.cgi?id=1183132
Cc: stable@vger.kernel.org # v5.11
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd/init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 3280e6f5b720..61dae1800b7f 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -2919,12 +2919,12 @@ static int __init state_next(void)
 		}
 		break;
 	case IOMMU_IVRS_DETECTED:
-		ret = early_amd_iommu_init();
-		init_state = ret ? IOMMU_INIT_ERROR : IOMMU_ACPI_FINISHED;
-		if (init_state == IOMMU_ACPI_FINISHED && amd_iommu_disabled) {
-			pr_info("AMD IOMMU disabled\n");
+		if (amd_iommu_disabled) {
 			init_state = IOMMU_CMDLINE_DISABLED;
 			ret = -EINVAL;
+		} else {
+			ret = early_amd_iommu_init();
+			init_state = ret ? IOMMU_INIT_ERROR : IOMMU_ACPI_FINISHED;
 		}
 		break;
 	case IOMMU_ACPI_FINISHED:
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
