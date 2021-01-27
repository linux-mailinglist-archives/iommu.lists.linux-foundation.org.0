Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 820513064A3
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 21:01:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 404EF86287;
	Wed, 27 Jan 2021 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4LGCPDUy5us; Wed, 27 Jan 2021 20:01:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D797B86277;
	Wed, 27 Jan 2021 20:01:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D23CBC013A;
	Wed, 27 Jan 2021 20:01:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33958C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 21A3122D22
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Tr4nSgQePJH for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 20:01:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A9F23228E7
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAC4D64DA5;
 Wed, 27 Jan 2021 20:01:20 +0000 (UTC)
Subject: [PATCH RFC 9/9] iommu/vt-d: Introduce map_sg() for Intel IOMMUs
From: Chuck Lever <chuck.lever@oracle.com>
To: baolu.lu@linux.intel.com
Date: Wed, 27 Jan 2021 15:01:20 -0500
Message-ID: <161177768006.1311.17544580458956606076.stgit@manet.1015granger.net>
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

Attempt to reduce indirect call overhead when mapping a substantial
scatter-gather list.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 drivers/iommu/intel/iommu.c |   37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 013097b6d55f..deae39f1477a 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4952,6 +4952,42 @@ static int intel_iommu_map(struct iommu_domain *domain,
 				hpa >> VTD_PAGE_SHIFT, size, prot);
 }
 
+static int intel_iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
+			      struct scatterlist *sg, unsigned int nents,
+			      int prot, gfp_t gfp, size_t *mapped)
+{
+	unsigned int i = 0;
+	phys_addr_t start;
+	size_t len = 0;
+	int ret;
+
+	while (i <= nents) {
+		phys_addr_t s_phys = sg_phys(sg);
+
+		if (len && s_phys != start + len) {
+			ret = intel_iommu_map(domain, iova + *mapped, start,
+					      len, prot, gfp);
+			if (ret)
+				return ret;
+
+			*mapped += len;
+			len = 0;
+		}
+
+		if (len) {
+			len += sg->length;
+		} else {
+			len = sg->length;
+			start = s_phys;
+		}
+
+		if (++i < nents)
+			sg = sg_next(sg);
+	}
+
+	return 0;
+}
+
 static size_t intel_iommu_unmap(struct iommu_domain *domain,
 				unsigned long iova, size_t size,
 				struct iommu_iotlb_gather *gather)
@@ -5519,6 +5555,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.aux_detach_dev		= intel_iommu_aux_detach_device,
 	.aux_get_pasid		= intel_iommu_aux_get_pasid,
 	.map			= intel_iommu_map,
+	.map_sg			= intel_iommu_map_sg,
 	.iotlb_sync_map		= intel_iommu_iotlb_sync_map,
 	.unmap			= intel_iommu_unmap,
 	.flush_iotlb_all        = intel_flush_iotlb_all,


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
