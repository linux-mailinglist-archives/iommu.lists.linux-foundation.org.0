Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D774C1EEE68
	for <lists.iommu@lfdr.de>; Fri,  5 Jun 2020 01:44:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 87E6F8738D;
	Thu,  4 Jun 2020 23:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZc4-5dioi9C; Thu,  4 Jun 2020 23:44:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FA5D8738F;
	Thu,  4 Jun 2020 23:44:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AF78C016E;
	Thu,  4 Jun 2020 23:44:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0653C016E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 23:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 98D0825343
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 23:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id apQLBm11R9y0 for <iommu@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 23:44:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by silver.osuosl.org (Postfix) with ESMTPS id 8CCF3251C1
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 23:44:22 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ed986fd0000>; Thu, 04 Jun 2020 16:42:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 04 Jun 2020 16:44:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 04 Jun 2020 16:44:22 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jun
 2020 23:44:13 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Thu, 4 Jun 2020 23:44:13 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ed9874c0001>; Thu, 04 Jun 2020 16:44:13 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v6 4/4] iommu/arm-smmu-nvidia: fix the warning reported by
 kbuild test robot
Date: Thu, 4 Jun 2020 16:44:14 -0700
Message-ID: <20200604234414.21912-5-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604234414.21912-1-vdumpa@nvidia.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591314174; bh=2ofUV6N4w8MVqMXhL27SWFuQR3WHDuZrVd5MUpa+Yso=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=I8hehESMwvZR2f+fZE445YwxDRNXgLctdd8NHKLZ2A7c3EDVSuTTi0FTk/Z5qdyHU
 CG1nkGlM4Yacr5TIDNltsyxdaPp0IrJRSa+FN/AUX9ksGCDnIlFQ9+tro99Dwmk+ZI
 5IdPA6SDWXL4cAuDDLvfs7HfmDmiPlNAUextWo0FDNUW5VdI/YPj2TQeSqWM3oLwVn
 aoWOupD2+Yn/nLhUYCoOQcvXqJ47LWYSM+Ht8N6CLn/ebhiF+sFGhZgo7XRAhJ18cf
 IbJuH/61fiMVLueQm1hJxiuvdAmeIjTbIvtM9+M4RnGPR0SMbVr34ce8Flq+9sC76P
 TRcVafU8b7/HA==
Cc: snikam@nvidia.com, mperttunen@nvidia.com, kbuild test robot <lkp@intel.com>,
 bhuntsman@nvidia.com, will@kernel.org, linux-kernel@vger.kernel.org,
 praithatha@nvidia.com, talho@nvidia.com, iommu@lists.linux-foundation.org,
 nicolinc@nvidia.com, linux-tegra@vger.kernel.org, yhsu@nvidia.com,
 treding@nvidia.com, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 bbiswas@nvidia.com
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

>> drivers/iommu/arm-smmu-nvidia.c:151:33: sparse: sparse: cast removes
>> address space '<asn:2>' of expression

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu-nvidia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidia.c
index 5999b6a770992..6348d8dc17fc2 100644
--- a/drivers/iommu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm-smmu-nvidia.c
@@ -248,7 +248,7 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 			break;
 		nsmmu->bases[i] = devm_ioremap_resource(dev, res);
 		if (IS_ERR(nsmmu->bases[i]))
-			return (struct arm_smmu_device *)nsmmu->bases[i];
+			return ERR_CAST(nsmmu->bases[i]);
 		nsmmu->num_inst++;
 	}
 
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
