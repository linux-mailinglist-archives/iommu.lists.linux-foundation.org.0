Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC218C9C2
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 10:14:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8EA2427409;
	Fri, 20 Mar 2020 09:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wfw1bcHtEJIq; Fri, 20 Mar 2020 09:14:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DD1A2273ED;
	Fri, 20 Mar 2020 09:14:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5332C07FF;
	Fri, 20 Mar 2020 09:14:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47E75C089E
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3215427431
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tm39BHsUmnNh for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 09:14:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 876B020440
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:14:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 89CDA49B; Fri, 20 Mar 2020 10:14:22 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v3 15/15] iommu: Move fwspec->iommu_priv to struct dev_iommu
Date: Fri, 20 Mar 2020 10:14:14 +0100
Message-Id: <20200320091414.3941-16-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320091414.3941-1-joro@8bytes.org>
References: <20200320091414.3941-1-joro@8bytes.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, guohanjun@huawei.com,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

Move the pointer for iommu private data from struct iommu_fwspec to
struct dev_iommu.

Tested-by: Will Deacon <will@kernel.org> # arm-smmu
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 include/linux/iommu.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 056900e75758..8c4d45fce042 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -369,6 +369,7 @@ struct iommu_fault_param {
  *
  * @fault_param: IOMMU detected device fault reporting data
  * @fwspec:	 IOMMU fwspec data
+ * @priv:	 IOMMU Driver private data
  *
  * TODO: migrate other per device data pointers under iommu_dev_data, e.g.
  *	struct iommu_group	*iommu_group;
@@ -377,6 +378,7 @@ struct dev_iommu {
 	struct mutex lock;
 	struct iommu_fault_param	*fault_param;
 	struct iommu_fwspec		*fwspec;
+	void				*priv;
 };
 
 int  iommu_device_register(struct iommu_device *iommu);
@@ -589,7 +591,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev);
 struct iommu_fwspec {
 	const struct iommu_ops	*ops;
 	struct fwnode_handle	*iommu_fwnode;
-	void			*iommu_priv;
 	u32			flags;
 	u32			num_pasid_bits;
 	unsigned int		num_ids;
@@ -629,12 +630,12 @@ static inline void dev_iommu_fwspec_set(struct device *dev,
 
 static inline void *dev_iommu_priv_get(struct device *dev)
 {
-	return dev->iommu->fwspec->iommu_priv;
+	return dev->iommu->priv;
 }
 
 static inline void dev_iommu_priv_set(struct device *dev, void *priv)
 {
-	dev->iommu->fwspec->iommu_priv = priv;
+	dev->iommu->priv = priv;
 }
 
 int iommu_probe_device(struct device *dev);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
