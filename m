Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C538DD6F
	for <lists.iommu@lfdr.de>; Mon, 24 May 2021 00:26:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7672F60677;
	Sun, 23 May 2021 22:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KiC04BRxKWVW; Sun, 23 May 2021 22:26:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B94A6086B;
	Sun, 23 May 2021 22:26:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3416FC0027;
	Sun, 23 May 2021 22:26:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECF67C0001
 for <iommu@lists.linux-foundation.org>; Sun, 23 May 2021 21:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3FA5606E4
 for <iommu@lists.linux-foundation.org>; Sun, 23 May 2021 21:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o72wpV0JFUQ0 for <iommu@lists.linux-foundation.org>;
 Sun, 23 May 2021 21:44:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8AF8600C6
 for <iommu@lists.linux-foundation.org>; Sun, 23 May 2021 21:44:54 +0000 (UTC)
Received: from TimeMachine.localdomain (bband-dyn255.178-41-232.t-com.sk
 [178.41.232.255])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id 50B0F3E8D8;
 Sun, 23 May 2021 23:25:58 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
To: 
Subject: [PATCH V2] iommu: arm-smmu-qcom: Add sm6125 compatible
Date: Sun, 23 May 2021 23:25:33 +0200
Message-Id: <20210523212535.740979-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 23 May 2021 22:26:52 +0000
Cc: Rob Clark <robdclark@chromium.org>, John Stultz <john.stultz@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Add compatible for SM6125 SoC

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Changes in V2:
Add commit description
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 98b3a1c2a181..7455bcc92f43 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -333,6 +333,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500" },
 	{ .compatible = "qcom,sdm630-smmu-v2" },
 	{ .compatible = "qcom,sdm845-smmu-500" },
+	{ .compatible = "qcom,sm6125-smmu-500" },
 	{ .compatible = "qcom,sm8150-smmu-500" },
 	{ .compatible = "qcom,sm8250-smmu-500" },
 	{ .compatible = "qcom,sm8350-smmu-500" },
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
