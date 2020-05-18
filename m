Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 798AF1D782A
	for <lists.iommu@lfdr.de>; Mon, 18 May 2020 14:10:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 36C5D863DB;
	Mon, 18 May 2020 12:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6hZtWNCMHtg; Mon, 18 May 2020 12:10:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7520886B24;
	Mon, 18 May 2020 12:09:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61130C07FF;
	Mon, 18 May 2020 12:09:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1ED93C07FF
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 12:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0E3DD885D0
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 12:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piu-5Md1N5ep for <iommu@lists.linux-foundation.org>;
 Mon, 18 May 2020 12:09:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ACC23885CD
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 12:09:06 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 082F8207ED;
 Mon, 18 May 2020 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589803746;
 bh=K8ytwBeEv/7qjVAmjbqoMgPkQXND2o+mOarQpQrSrLM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D2aNRl6MPtFPULRQ9I8cg0etlWiCzM1wg/PS0cUSN8/YuicAz67EpeRX5g/6D6DMq
 2pVJinHxlWVBIFmLpb6xuPNRBhUifZMn/wC2khRUJukYigeonJ2Ka8/MP0l/BzQPsj
 EVccCaz7+LmDpqExkbqRvRj/lR50PRZ1u5o5S2tw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 2/2] x86: Hide the archdata.iommu field behind generic
 IOMMU_API
Date: Mon, 18 May 2020 14:08:55 +0200
Message-Id: <20200518120855.27822-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518120855.27822-1-krzk@kernel.org>
References: <20200518120855.27822-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

There is a generic, kernel wide configuration symbol for enabling the
IOMMU specific bits: CONFIG_IOMMU_API.  Implementations (including
INTEL_IOMMU and AMD_IOMMU driver) select it so use it here as well.

This makes the conditional archdata.iommu field consistent with other
platforms and also fixes any compile test builds of other IOMMU drivers,
when INTEL_IOMMU or AMD_IOMMU are not selected).

For the case when INTEL_IOMMU/AMD_IOMMU and COMPILE_TEST are not
selected, this should create functionally equivalent code/choice.  With
COMPILE_TEST this field could appear if other IOMMU drivers are chosen
but neither INTEL_IOMMU nor AMD_IOMMU are not.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/x86/include/asm/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/device.h b/arch/x86/include/asm/device.h
index 7e31f7f1bb06..49bd6cf3eec9 100644
--- a/arch/x86/include/asm/device.h
+++ b/arch/x86/include/asm/device.h
@@ -3,7 +3,7 @@
 #define _ASM_X86_DEVICE_H
 
 struct dev_archdata {
-#if defined(CONFIG_INTEL_IOMMU) || defined(CONFIG_AMD_IOMMU)
+#ifdef CONFIG_IOMMU_API
 	void *iommu; /* hook for IOMMU specific extension */
 #endif
 };
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
