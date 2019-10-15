Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D072FD745D
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 13:12:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EDF4FCAD;
	Tue, 15 Oct 2019 11:12:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9C05AC6F
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:12:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
	[210.160.252.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 26D8C821
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:12:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; d="scan'208";a="28928934"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2019 20:12:00 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A84A74207866;
	Tue, 15 Oct 2019 20:12:00 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Subject: [PATCH v2 6/6] iommu/ipmmu-vmsa: Add utlb_offset_base
Date: Tue, 15 Oct 2019 20:12:00 +0900
Message-Id: <1571137920-15314-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org
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

Since we will have changed memory mapping of the IPMMU in the future,
this patch adds a utlb_offset_base into struct ipmmu_features
for IMUCTR and IMUASID registers. No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index d8385ef..1225f12 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -52,6 +52,7 @@ struct ipmmu_features {
 	bool cache_snoop;
 	unsigned int ctx_offset_base;
 	unsigned int ctx_offset_stride;
+	unsigned int utlb_offset_base;
 };
 
 struct ipmmu_vmsa_device {
@@ -232,7 +233,7 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 
 static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
 {
-	return reg;
+	return mmu->features->utlb_offset_base + reg;
 }
 
 static void ipmmu_imuasid_write(struct ipmmu_vmsa_device *mmu,
@@ -956,6 +957,7 @@ static const struct ipmmu_features ipmmu_features_default = {
 	.cache_snoop = true,
 	.ctx_offset_base = 0,
 	.ctx_offset_stride = 0x40,
+	.utlb_offset_base = 0,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -969,6 +971,7 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.cache_snoop = false,
 	.ctx_offset_base = 0,
 	.ctx_offset_stride = 0x40,
+	.utlb_offset_base = 0,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
