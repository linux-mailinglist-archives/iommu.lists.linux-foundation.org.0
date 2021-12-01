Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2046F464903
	for <lists.iommu@lfdr.de>; Wed,  1 Dec 2021 08:40:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAADD8175E;
	Wed,  1 Dec 2021 07:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czLZ9WmB48PY; Wed,  1 Dec 2021 07:40:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EA95B814B7;
	Wed,  1 Dec 2021 07:40:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C04DEC000A;
	Wed,  1 Dec 2021 07:40:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07373C000A
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 07:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E82A0607E4
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 07:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThGpTOzHV0q1 for <iommu@lists.linux-foundation.org>;
 Wed,  1 Dec 2021 07:40:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3F176071F
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 07:40:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4B212CE1D68;
 Wed,  1 Dec 2021 07:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF780C53FD0;
 Wed,  1 Dec 2021 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638344402;
 bh=rd1g/Mg+d9q8eRsVNqe7GRL0cp3tKq24b0vxwmqSUco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F6oBf04UDEjljSy3K4IoRij8DRgqgaPN7pu8QAHzXBy9o2Jz805NI7NBGItU3Y8bs
 C7oIKxidj3F0X/dVGCcdcLA5ukRAs+r1qiANANpgBHurSzX40X9DS0bpT+AvVPt4OH
 RwjLZGYVFV9WEMcRxSh2JZ+I2rdHzVV5kMqJgMEpOxwIPwqxWZFwJbIbdfV3d7Kufb
 aCi+WbisGz5ZX+8YogLI5xx3OsECBcH4gTB8QTxoNjmmMSTm6yqCVnViKopFSO/5eg
 5iTGy6nuFBRK99d7hMcmq0tUP+1r4JLc2y1CblLNNUWsPUYOKKpAOZdNPrMo5V3XmG
 j9Rp6ZKDKiUVg==
From: Vinod Koul <vkoul@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 2/2] iommu: arm-smmu-impl: Add SM8450 qcom iommu implementation
Date: Wed,  1 Dec 2021 13:09:43 +0530
Message-Id: <20211201073943.3969549-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201073943.3969549-1-vkoul@kernel.org>
References: <20211201073943.3969549-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

Add SM8450 qcom iommu implementation to the table of
qcom_smmu_impl_of_match table which brings in iommu support for
SM8450 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ca736b065dd0..4aee83330629 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -415,6 +415,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm8150-smmu-500" },
 	{ .compatible = "qcom,sm8250-smmu-500" },
 	{ .compatible = "qcom,sm8350-smmu-500" },
+	{ .compatible = "qcom,sm8450-smmu-500" },
 	{ }
 };
 
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
