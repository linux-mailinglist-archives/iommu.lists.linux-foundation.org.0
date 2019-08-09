Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D3387DEA
	for <lists.iommu@lfdr.de>; Fri,  9 Aug 2019 17:22:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 40708DB6;
	Fri,  9 Aug 2019 15:22:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9A9F7D3B
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 15:22:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7E9B6875
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 15:22:38 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 5E8DB45B; Fri,  9 Aug 2019 17:22:36 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 3/3] iommu: Disable passthrough mode when SME is active
Date: Fri,  9 Aug 2019 17:22:33 +0200
Message-Id: <20190809152233.2829-4-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809152233.2829-1-joro@8bytes.org>
References: <20190809152233.2829-1-joro@8bytes.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Thomas.Lendacky@amd.com, Joerg Roedel <jroedel@suse.de>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	bp@alien8.de
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

Using Passthrough mode when SME is active causes certain
devices to use the SWIOTLB bounce buffer. The bounce buffer
code has an upper limit of 256kb for the size of DMA
allocations, which is too small for certain devices and
causes them to fail.

With this patch we enable IOMMU by default when SME is
active in the system, making the default configuration work
for more systems than it does now.

Users that don't want IOMMUs to be enabled still can disable
them with kernel parameters.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 62cae6db0970..fbe1aa51bce9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -104,6 +104,12 @@ static int __init iommu_subsys_init(void)
 	else
 		iommu_def_domain_type = IOMMU_DOMAIN_DMA;
 
+	if ((iommu_def_domain_type == IOMMU_DOMAIN_IDENTITY) &&
+	    sme_active()) {
+		pr_info("SME detected - Disabling default IOMMU passthrough\n");
+		iommu_def_domain_type = IOMMU_DOMAIN_DMA;
+	}
+
 	pr_info("Default domain type: %s\n",
 		iommu_domain_type_str(iommu_def_domain_type));
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
