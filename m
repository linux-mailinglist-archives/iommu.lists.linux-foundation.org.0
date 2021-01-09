Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 607452F02CC
	for <lists.iommu@lfdr.de>; Sat,  9 Jan 2021 19:09:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE80887375;
	Sat,  9 Jan 2021 18:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XI-x1jofAwmF; Sat,  9 Jan 2021 18:09:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35F5487369;
	Sat,  9 Jan 2021 18:09:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C7B6C1E6F;
	Sat,  9 Jan 2021 18:09:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E808C013A
 for <iommu@lists.linux-foundation.org>; Sat,  9 Jan 2021 16:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EAEF884789
 for <iommu@lists.linux-foundation.org>; Sat,  9 Jan 2021 16:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8R7rewTKn6aX for <iommu@lists.linux-foundation.org>;
 Sat,  9 Jan 2021 16:39:58 +0000 (UTC)
X-Greylist: delayed 00:07:53 by SQLgrey-1.7.6
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0E62F86108
 for <iommu@lists.linux-foundation.org>; Sat,  9 Jan 2021 16:39:57 +0000 (UTC)
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl
 [83.6.169.53])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id CFC833E7C1;
 Sat,  9 Jan 2021 17:32:00 +0100 (CET)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH] iommu: arm-smmu-qcom: Add sdm630/msm8998 compatibles for qcom
 quirks
Date: Sat,  9 Jan 2021 17:31:53 +0100
Message-Id: <20210109163154.147273-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 18:09:44 +0000
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, iommu@lists.linux-foundation.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Sibi Sankar <sibis@codeaurora.org>
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

SDM630 and MSM8998 are among the SoCs that use Qualcomm's implementation
of SMMUv2 which has already proven to be problematic over the years. Add
their compatibles to the lookup list to prevent the platforms from being
shut down by the hypervisor at MMU probe.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 5dff7ffbef11..383f3671f5e5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -323,6 +323,8 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 }
 
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
+	{ .compatible = "qcom,sdm630-smmu-v2" },
+	{ .compatible = "qcom,msm8998-smmu-v2" },
 	{ .compatible = "qcom,sc7180-smmu-500" },
 	{ .compatible = "qcom,sdm845-smmu-500" },
 	{ .compatible = "qcom,sm8150-smmu-500" },
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
