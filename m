Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCB53064A2
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 21:01:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 252EE86C6A;
	Wed, 27 Jan 2021 20:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7WD9GYWquos; Wed, 27 Jan 2021 20:01:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA56386C1A;
	Wed, 27 Jan 2021 20:01:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7D6BC013A;
	Wed, 27 Jan 2021 20:01:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C66BC013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8911586C1A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxUGrC16dWfZ for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 20:01:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 13DD886C0E
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D43364DA4;
 Wed, 27 Jan 2021 20:01:14 +0000 (UTC)
Subject: [PATCH RFC 8/9] iommu/arm-smmu: Hook up map_sg()
From: Chuck Lever <chuck.lever@oracle.com>
To: baolu.lu@linux.intel.com
Date: Wed, 27 Jan 2021 15:01:13 -0500
Message-ID: <161177767345.1311.5047482538156874597.stgit@manet.1015granger.net>
In-Reply-To: <161177711359.1311.417185373365934204.stgit@manet.1015granger.net>
References: <161177711359.1311.417185373365934204.stgit@manet.1015granger.net>
User-Agent: StGit/0.23-29-ga622f1
MIME-Version: 1.0
Cc: isaacm@codeaurora.org, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, will@kernel.org
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

From: Isaac J. Manjarres <isaacm@codeaurora.org>

Now that everything is in place for iommu_map_sg() to defer
mapping a scatter-gather list to the io-pgtable layer, implement
the map_sg() callback in the SMMU driver, so that iommu_map_sg()
can invoke it with the entire scatter-gather list that will be
mapped.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index d8c6bfde6a61..52acc6858512 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1208,6 +1208,24 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
 	return ret;
 }
 
+static int arm_smmu_map_sg(struct iommu_domain *domain, unsigned long iova,
+			   struct scatterlist *sg, unsigned int nents, int prot,
+			   gfp_t gfp, size_t *mapped)
+{
+	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
+	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
+	int ret;
+
+	if (!ops)
+		return -ENODEV;
+
+	arm_smmu_rpm_get(smmu);
+	ret = ops->map_sg(ops, iova, sg, nents, prot, gfp, mapped);
+	arm_smmu_rpm_put(smmu);
+
+	return ret;
+}
+
 static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 			     size_t size, struct iommu_iotlb_gather *gather)
 {
@@ -1624,6 +1642,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.domain_free		= arm_smmu_domain_free,
 	.attach_dev		= arm_smmu_attach_dev,
 	.map			= arm_smmu_map,
+	.map_sg			= arm_smmu_map_sg,
 	.unmap			= arm_smmu_unmap,
 	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 	.iotlb_sync		= arm_smmu_iotlb_sync,


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
