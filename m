Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6BFDD577
	for <lists.iommu@lfdr.de>; Sat, 19 Oct 2019 01:32:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8CA4FDD2;
	Fri, 18 Oct 2019 23:31:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 94D70DB2
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 23:31:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9CEF9831
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 23:31:23 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5daa4b4f0001>; Fri, 18 Oct 2019 16:31:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Fri, 18 Oct 2019 16:31:23 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Fri, 18 Oct 2019 16:31:23 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
	(172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 18 Oct 2019 23:31:22 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
	(172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
	Frontend Transport; Fri, 18 Oct 2019 23:31:22 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
	hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
	id <B5daa4b4a0006>; Fri, 18 Oct 2019 16:31:22 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v3 3/7] dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
Date: Fri, 18 Oct 2019 16:31:28 -0700
Message-ID: <1571441492-21919-4-git-send-email-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
References: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1571441488; bh=ByDeYb07Rte9DOsd9vU8TTDm9OtxaU1VF0XSEUNhBRQ=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	Content-Type;
	b=fDk5yVPvNC896WfSUkUvtY9KnU7IKx7vMzOJo3pN7Qbs2T+TJD5Z9FIa92h5+AaPk
	gIm40HqND1YnKNuCi3oA45INUIVF1V1s401BQq3GDmx3MGsgNbBb4H+/T00TOjsmH4
	s1XjtH8YVYnWIVLEid00ROMQQJ1FE1HPTEZ6CCuKsQUSDPYZC26/APVsnIWSwDC242
	GJi0GPxSOk9aHK8tYIKpyAWL4H943kWc3smkMYbnNJ3xs/Y6st6dd6bc+sqSByb68g
	nmmbfX5gYMTSahQDfXspsEBjGS38VWcixL6ovRCqr2j3mDKRhpYqmjPlCpVuQR/T6A
	i5osbrHy6lo0Q==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com,
	mperttunen@nvidia.com, will@kernel.org,
	linux-kernel@vger.kernel.org, praithatha@nvidia.com,
	talho@nvidia.com, iommu@lists.linux-foundation.org,
	nicolinc@nvidia.com, linux-tegra@vger.kernel.org,
	yhsu@nvidia.com, treding@nvidia.com, robin.murphy@arm.com,
	avanbrunt@nvidia.com, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Add binding for NVIDIA's Tegra194 Soc SMMU that is based
on ARM MMU-500.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
index 3133f3b..1d72fac 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
@@ -31,6 +31,10 @@ conditions.
                   as below, SoC-specific compatibles:
                   "qcom,sdm845-smmu-500", "arm,mmu-500"
 
+                  NVIDIA SoCs that use more than one ARM MMU-500 together
+                  needs following SoC-specific compatibles along with "arm,mmu-500":
+                  "nvidia,tegra194-smmu"
+
 - reg           : Base address and size of the SMMU.
 
 - #global-interrupts : The number of global interrupts exposed by the
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
