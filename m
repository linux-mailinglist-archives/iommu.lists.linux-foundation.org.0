Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3F742A818
	for <lists.iommu@lfdr.de>; Tue, 12 Oct 2021 17:18:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 972A4605B0;
	Tue, 12 Oct 2021 15:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1bHRTeIBG3y; Tue, 12 Oct 2021 15:18:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B15F8600C6;
	Tue, 12 Oct 2021 15:18:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90878C001E;
	Tue, 12 Oct 2021 15:18:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC11EC000D
 for <iommu@lists.linux-foundation.org>; Tue, 12 Oct 2021 15:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81D4A605A7
 for <iommu@lists.linux-foundation.org>; Tue, 12 Oct 2021 15:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-bPwxhIQFYP for <iommu@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 15:18:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6937E600C6
 for <iommu@lists.linux-foundation.org>; Tue, 12 Oct 2021 15:18:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A63B60E0B;
 Tue, 12 Oct 2021 15:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634051929;
 bh=JiebhzwuHVXY80Oic6utfrmJONJx8VfAP7QNQDVcqMs=;
 h=From:To:Cc:Subject:Date:From;
 b=uR/kT2xSoizS9rasOuK34HL8QIyL1MeUKiN6cCH7xbeVXoqQdGga8pdfpOgEEWcKm
 K60YyUfG/XcGQWkQw57Yz7uLcF+5aLJ50tqKanW87C69WAMmp/MwV6/MK9q6bLvlph
 +cU+OmijhxAN+h3oV/4/rOVfq4Tf8iwIdOYjqIhXhHaPVYn0r33J605soOFJHSjhMa
 exXEIB11fwoCOuoYxCWuqbEggd6k8oUzjCnGkGtEWA1RXodyXvVQiaWvaCLN0Y4RBZ
 Hh4V81oUQX0ISzfYmfrzhv5/mELKa+USfhAzPFWHVv4kSVh8s7Nd52y2SgmF/VSESs
 e8u0cLRb13ZAA==
From: Arnd Bergmann <arnd@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] iommu/arm: fix ARM_SMMU_QCOM compilation
Date: Tue, 12 Oct 2021 17:18:00 +0200
Message-Id: <20211012151841.2639732-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Alex Elder <elder@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, John Stultz <john.stultz@linaro.org>,
 Kalle Valo <kvalo@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Arnd Bergmann <arnd@arndb.de>

My previous bugfix ended up making things worse for the QCOM IOMMU
driver when it forgot to add the Kconfig symbol that is getting used to
control the compilation of the SMMU implementation specific code
for Qualcomm.

Fixes: 424953cf3c66 ("qcom_scm: hide Kconfig symbol")
Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reported-by: John Stultz <john.stultz@linaro.org>
Link: https://lore.kernel.org/lkml/20211010023350.978638-1-dmitry.baryshkov@linaro.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
In case we want fix it this way after all, here is the patch
I made. Either this one or Dmitry patch from the link above
is required for v5.15
---
 drivers/iommu/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c5c71b7ab7e8..3eb68fa1b8cc 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -355,6 +355,14 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
 	  'arm-smmu.disable_bypass' will continue to override this
 	  config.
 
+config ARM_SMMU_QCOM
+	def_tristate y
+	depends on ARM_SMMU && ARCH_QCOM
+	select QCOM_SCM
+	help
+	  When running on a Qualcomm platform that has the custom variant
+	  of the ARM SMMU, this needs to be built into the SMMU driver.
+
 config ARM_SMMU_V3
 	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
 	depends on ARM64
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
