Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 980531FC156
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 00:04:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DC3E87E1F;
	Tue, 16 Jun 2020 22:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1m6rl3uSmmMm; Tue, 16 Jun 2020 22:04:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BE2087E38;
	Tue, 16 Jun 2020 22:04:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B712C016E;
	Tue, 16 Jun 2020 22:04:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6D29C016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 22:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8F49C85E14
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 22:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoV00j59X+pB for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 22:04:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 102B987E1F
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 22:04:26 +0000 (UTC)
Received: from hopp.molgen.mpg.de (hopp.molgen.mpg.de [141.14.25.186])
 by mx.molgen.mpg.de (Postfix) with ESMTP id E56812002EE15;
 Wed, 17 Jun 2020 00:04:23 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Subject: [PATCH] iommu/amd: Print extended features in one line to fix
 divergent log levels
Date: Wed, 17 Jun 2020 00:04:20 +0200
Message-Id: <20200616220420.19466-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, iommu@lists.linux-foundation.org
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

Currently, Linux logs the two messages below.

    [    0.979142] pci 0000:00:00.2: AMD-Vi: Extended features (0xf77ef22294ada):
    [    0.979546]  PPR NX GT IA GA PC GA_vAPIC

The log level of these lines differs though. The first one has level
*info*, while the second has level *warn*, which is confusing.

    $ dmesg -T --level=info | grep "Extended features"
    [Tue Jun 16 21:46:58 2020] pci 0000:00:00.2: AMD-Vi: Extended features (0xf77ef22294ada):
    $ dmesg -T --level=warn | grep "PPR"
    [Tue Jun 16 21:46:58 2020]  PPR NX GT IA GA PC GA_vAPIC

The problem is, that commit 3928aa3f57 ("iommu/amd: Detect and enable
guest vAPIC support") introduced a newline, causing `pr_cont()`, used to
print the features, to default back to the default log level.

    /**
     * pr_cont - Continues a previous log message in the same line.
     * @fmt: format string
     * @...: arguments for the format string
     *
     * This macro expands to a printk with KERN_CONT loglevel. It should only be
     * used when continuing a log message with no newline ('\n') enclosed. Otherwise
     * it defaults back to KERN_DEFAULT loglevel.
     */
    #define pr_cont(fmt, ...) \
            printk(KERN_CONT fmt, ##__VA_ARGS__)

So, remove the line break, so only one line is logged.

Fixes: 3928aa3f57 ("iommu/amd: Detect and enable guest vAPIC support")
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/iommu/amd_iommu_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index 5b81fd16f5faf8..8d9b2c94178c43 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -1844,7 +1844,7 @@ static void print_iommu_info(void)
 		pci_info(pdev, "Found IOMMU cap 0x%hx\n", iommu->cap_ptr);
 
 		if (iommu->cap & (1 << IOMMU_CAP_EFR)) {
-			pci_info(pdev, "Extended features (%#llx):\n",
+			pci_info(pdev, "Extended features (%#llx):",
 				 iommu->features);
 			for (i = 0; i < ARRAY_SIZE(feat_str); ++i) {
 				if (iommu_feature(iommu, (1ULL << i)))
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
