Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CCE8D50F
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 15:39:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AEB621077;
	Wed, 14 Aug 2019 13:38:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CA6041032
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 13:38:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB2018A6
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 13:38:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id E92C34FE; Wed, 14 Aug 2019 15:38:43 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 08/10] iommu: Set default domain type at runtime
Date: Wed, 14 Aug 2019 15:38:39 +0200
Message-Id: <20190814133841.7095-9-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814133841.7095-1-joro@8bytes.org>
References: <20190814133841.7095-1-joro@8bytes.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: fenghua.yu@intel.com, tony.luck@intel.com, linux-ia64@vger.kernel.org,
	corbet@lwn.net, Joerg Roedel <jroedel@suse.de>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
	Thomas.Lendacky@amd.com, hpa@zytor.com, tglx@linutronix.de
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Joerg Roedel <jroedel@suse.de>

Set the default domain-type at runtime, not at compile-time.
This keeps default domain type setting in one place when we
have to change it at runtime.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 233bc22b487e..96cc7cc8ab21 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -26,11 +26,8 @@
 
 static struct kset *iommu_group_kset;
 static DEFINE_IDA(iommu_group_ida);
-#ifdef CONFIG_IOMMU_DEFAULT_PASSTHROUGH
-static unsigned int iommu_def_domain_type = IOMMU_DOMAIN_IDENTITY;
-#else
-static unsigned int iommu_def_domain_type = IOMMU_DOMAIN_DMA;
-#endif
+
+static unsigned int iommu_def_domain_type __read_mostly;
 static bool iommu_dma_strict __read_mostly = true;
 static u32 iommu_cmd_line __read_mostly;
 
@@ -76,7 +73,7 @@ static void iommu_set_cmd_line_dma_api(void)
 	iommu_cmd_line |= IOMMU_CMD_LINE_DMA_API;
 }
 
-static bool __maybe_unused iommu_cmd_line_dma_api(void)
+static bool iommu_cmd_line_dma_api(void)
 {
 	return !!(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API);
 }
@@ -115,8 +112,18 @@ static const char *iommu_domain_type_str(unsigned int t)
 
 static int __init iommu_subsys_init(void)
 {
-	pr_info("Default domain type: %s\n",
-		iommu_domain_type_str(iommu_def_domain_type));
+	bool cmd_line = iommu_cmd_line_dma_api();
+
+	if (!cmd_line) {
+		if (IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH))
+			iommu_set_default_passthrough();
+		else
+			iommu_set_default_translated();
+	}
+
+	pr_info("Default domain type: %s %s\n",
+		iommu_domain_type_str(iommu_def_domain_type),
+		cmd_line ? "(set via kernel command line)" : "");
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
