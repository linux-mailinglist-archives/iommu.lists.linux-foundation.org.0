Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D417A2DE00D
	for <lists.iommu@lfdr.de>; Fri, 18 Dec 2020 09:44:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 897C587252;
	Fri, 18 Dec 2020 08:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8amEcZplq2tX; Fri, 18 Dec 2020 08:44:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2ACDC873B8;
	Fri, 18 Dec 2020 08:44:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 113A6C0893;
	Fri, 18 Dec 2020 08:44:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1AF8C0893
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 973E42E119
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWN0ilA2h01G for <iommu@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 08:44:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by silver.osuosl.org (Postfix) with ESMTPS id 276032E11E
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:44:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608281060; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=dkfY2lp9+KKChCrHUbFXM5BctXqX6L3MWxvCP3Yr/14=;
 b=BMGoMuyDILwChPmjKgMF5pRvzg9YjnWDFyBE8rcsneGWRAObB5juPqhlkWp9Jqc2JrY02RRx
 LUU8iC8d8nh1vPRDnqs2v+oLwRW7c9z6DufKIBC7SV9lamzxTqYG+0JSqpaeoA814VZxfet3
 BpZ7QMsnma3vvxyG2+1ii0FP4yw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fdc6aad031793dcb42d650f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 08:39:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4830FC43467; Fri, 18 Dec 2020 08:39:09 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EEBEEC43464;
 Fri, 18 Dec 2020 08:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EEBEEC43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] iommu/io-pgtable: Allow building as a module
Date: Fri, 18 Dec 2020 00:38:42 -0800
Message-Id: <1608280722-19841-4-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608280722-19841-1-git-send-email-isaacm@codeaurora.org>
References: <1608280722-19841-1-git-send-email-isaacm@codeaurora.org>
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, kernel-team@android.com,
 pdaly@codeaurora.org, will@kernel.org, robin.murphy@arm.com,
 pratikp@codeaurora.org
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

Now that all of the required symbols have been exported,
and the io-pgtable code can correctly refer to the
io-pgtable init functions when their source files are built
as modules, allow the io-pgtable code to be built as a module. The
expectation is that the io-pgtable core code, along with
the descriptor format (either or both ARM LPAE and ARMV7S)
can be built as modules.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 192ef8f..d7de6db 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -27,10 +27,10 @@ menu "Generic IOMMU Pagetable Support"
 
 # Selected by the actual pagetable implementations
 config IOMMU_IO_PGTABLE
-	bool
+	tristate
 
 config IOMMU_IO_PGTABLE_LPAE
-	bool "ARMv7/v8 Long Descriptor Format"
+	tristate "ARMv7/v8 Long Descriptor Format"
 	select IOMMU_IO_PGTABLE
 	depends on ARM || ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	help
@@ -49,7 +49,7 @@ config IOMMU_IO_PGTABLE_LPAE_SELFTEST
 	  If unsure, say N here.
 
 config IOMMU_IO_PGTABLE_ARMV7S
-	bool "ARMv7/v8 Short Descriptor Format"
+	tristate "ARMv7/v8 Short Descriptor Format"
 	select IOMMU_IO_PGTABLE
 	depends on ARM || ARM64 || COMPILE_TEST
 	help
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
