Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A43373077
	for <lists.iommu@lfdr.de>; Tue,  4 May 2021 21:11:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C18414EC;
	Tue,  4 May 2021 19:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYsGzsrdAQfi; Tue,  4 May 2021 19:11:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BD741506;
	Tue,  4 May 2021 19:11:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBB29C0001;
	Tue,  4 May 2021 19:11:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0D18C0001
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 19:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1FE4846E7
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 19:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUej1fmn4ZKA for <iommu@lists.linux-foundation.org>;
 Tue,  4 May 2021 19:11:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1427A846CF
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 19:11:41 +0000 (UTC)
IronPort-SDR: YXd0YASZjszPEZmRHD/1xk9gW+rE8jlGJCs6BBic6hHni7s8YiH/AfdE0qRgd8BtNdS7DUX44F
 JqrkCNnYfceQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="197675488"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="197675488"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 12:11:41 -0700
IronPort-SDR: fhkrUiuFVLDq9e4Qc69OzHKPlDkUNy8UnX6A/43uKWqfc4UO1ncrzGpZMAz8AnTgJiek3Tf9Ca
 JzXWUNiJIHgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="396245291"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga007.fm.intel.com with ESMTP; 04 May 2021 12:11:40 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [RFC PATCH v5 4/7] iommu/amd: Set the IRTE delivery mode from irq_cfg
Date: Tue,  4 May 2021 12:10:46 -0700
Message-Id: <20210504191049.22661-5-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504191049.22661-1-ricardo.neri-calderon@linux.intel.com>
References: <20210504191049.22661-1-ricardo.neri-calderon@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org,
 woodhouse@osuosl.org, linux-kernel@vger.kernel.org,
 Stephane Eranian <eranian@google.com>, Ricardo Neri <ricardo.neri@intel.com>,
 iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
 Andi Kleen <andi.kleen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@suse.de>, David Woodhouse <dwmw2@infradead.org>,
 Ingo Molnar <mingo@kernel.org>
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

There is not hardware requirement to have a different delivery mode for
each interrupt. Instead of using the delivery mode of the APIC driver, use
the delivery mode of each specific interrupt configuration.

This allows to accommodate interrupts which require a specific delivery
mode, such as the HPET hardlockup detector.

Outside of such case, there are not functional changes since the delivery
mode of an interrupt is initialized with the delivery mode of the APIC
driver.

Cc: Andi Kleen <andi.kleen@intel.com>
Cc: Borislav Petkov <bp@suse.de>
Cc: David Woodhouse <dwmw2@infradead.org> (supporter:INTEL IOMMU (VT-d))
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jacob Pan <jacob.jun.pan@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com> (supporter:INTEL IOMMU (VT-d))
Cc: Stephane Eranian <eranian@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: iommu@lists.linux-foundation.org (open list:INTEL IOMMU (VT-d))
Cc: x86@kernel.org
Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v4:
 * Introduced this patch.

Changes since v3:
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 drivers/iommu/amd/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index a69a8b573e40..e8d9fae0c766 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3122,7 +3122,7 @@ static void irq_remapping_prepare_irte(struct amd_ir_data *data,
 
 	data->irq_2_irte.devid = devid;
 	data->irq_2_irte.index = index + sub_handle;
-	iommu->irte_ops->prepare(data->entry, apic->delivery_mode,
+	iommu->irte_ops->prepare(data->entry, irq_cfg->delivery_mode,
 				 apic->dest_mode_logical, irq_cfg->vector,
 				 irq_cfg->dest_apicid, devid);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
