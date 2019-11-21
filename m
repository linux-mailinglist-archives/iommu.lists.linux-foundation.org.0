Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBCF1048F9
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 04:19:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67E2E887A1;
	Thu, 21 Nov 2019 03:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRtCY7Bn8eWZ; Thu, 21 Nov 2019 03:19:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 64BF088799;
	Thu, 21 Nov 2019 03:19:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 596F0C1DDA;
	Thu, 21 Nov 2019 03:19:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC98DC18DA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 03:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D6ACB86E10
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 03:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id On9COY6A-5h2 for <iommu@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 03:19:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 78E4D86DFA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 03:19:33 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4115A20898;
 Thu, 21 Nov 2019 03:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574306373;
 bh=hP9QwzT6ZwRLhfD/DXx27e0A7cjRZxa8afZINF8p38Y=;
 h=From:To:Cc:Subject:Date:From;
 b=QF9IhtRXQC86MALc1no6f7fLDXGIygB/vggDHK1CYZKygIHLtRtCjBIHbmEZNUmyd
 a6RWMTohj30Y2vC009DexGfDyp+h9gNKWfsQvSduNQMXKc7UuI3hoHYkD3sgEvI29R
 HsAFCUkIE2oJ/kNJAiFAi+Z+yEmCBw8nQ5EsmZBA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] iommu: Fix Kconfig indentation
Date: Thu, 21 Nov 2019 04:19:30 +0100
Message-Id: <1574306370-29529-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Cc: iommu@lists.linux-foundation.org, Krzysztof Kozlowski <krzk@kernel.org>
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

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix also 7-space and tab+1 space indentation issues.
---
 drivers/iommu/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 0b9d78a0f3ac..c4486db105af 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -82,7 +82,7 @@ config IOMMU_DEBUGFS
 config IOMMU_DEFAULT_PASSTHROUGH
 	bool "IOMMU passthrough by default"
 	depends on IOMMU_API
-        help
+	help
 	  Enable passthrough by default, removing the need to pass in
 	  iommu.passthrough=on or iommu=pt through command line. If this
 	  is enabled, you can still disable with iommu.passthrough=off
@@ -91,8 +91,8 @@ config IOMMU_DEFAULT_PASSTHROUGH
 	  If unsure, say N here.
 
 config OF_IOMMU
-       def_bool y
-       depends on OF && IOMMU_API
+	def_bool y
+	depends on OF && IOMMU_API
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
