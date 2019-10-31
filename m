Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D1EA806
	for <lists.iommu@lfdr.de>; Thu, 31 Oct 2019 01:07:53 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E1A6DE61;
	Thu, 31 Oct 2019 00:07:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 78D11E53
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 00:07:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B8C9187B
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 00:07:30 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5dba25c90000>; Wed, 30 Oct 2019 17:07:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Wed, 30 Oct 2019 17:07:30 -0700
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Wed, 30 Oct 2019 17:07:30 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
	(172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 31 Oct 2019 00:07:29 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL111.nvidia.com
	(172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
	Frontend Transport; Thu, 31 Oct 2019 00:07:30 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
	hqnvemgw02.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
	id <B5dba25c10003>; Wed, 30 Oct 2019 17:07:29 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v4 2/6] dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
Date: Wed, 30 Oct 2019 17:07:13 -0700
Message-ID: <1572480437-28449-3-git-send-email-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572480437-28449-1-git-send-email-vdumpa@nvidia.com>
References: <1572480437-28449-1-git-send-email-vdumpa@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1572480457; bh=ByDeYb07Rte9DOsd9vU8TTDm9OtxaU1VF0XSEUNhBRQ=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	Content-Type;
	b=Ab6FjmnAu/ey/xbDiaeeUmobNdpKbr+oIPdhf9eZ0LUMowGy1rXKNG8ic9tkTxm0C
	9mQKhKGqbDfbGc19AuKiFaYaQLBLmU6mYH3i4sJzeJoPuBGvQrUSl+0xOA994KPYn3
	7eqlXcGRAjK3ktPZX+6U/nMsHT7zUwpLAHl+vnVXZ5eV3Rl0jqoFgMxo3nAt3XJoI+
	ayl6cEKLyqNUbi+qvYm0/RVhZe2jFx+/U0TZhZ6HmaeHutUhV5Q0BQKPayztWrUFbu
	c9KkmBrFZRLo8QB/pY6uqM19ixT30aDl25ODVqGfrb1mjugqUQIhBDjhKdTSomPt1H
	52e80uaPUN64g==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: snikam@nvidia.com, jtukkinen@nvidia.com, mperttunen@nvidia.com,
	will@kernel.org, linux-kernel@vger.kernel.org,
	praithatha@nvidia.com, talho@nvidia.com,
	iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
	linux-tegra@vger.kernel.org, yhsu@nvidia.com, treding@nvidia.com,
	robin.murphy@arm.com, avanbrunt@nvidia.com,
	linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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
