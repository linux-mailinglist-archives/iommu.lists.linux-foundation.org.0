Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D319E26A9CB
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 18:30:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 92D9986984;
	Tue, 15 Sep 2020 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MD+ljug7aASP; Tue, 15 Sep 2020 16:30:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19AD5869CF;
	Tue, 15 Sep 2020 16:30:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10151C08A2;
	Tue, 15 Sep 2020 16:30:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6885EC0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44BC287029
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYFgJveYu6ld for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 16:30:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6DCDF8704A
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:30:22 +0000 (UTC)
IronPort-SDR: yhtxSdOGl7q/qSRziqG1aASSu+m9R9MLacHJvxdHkmLRhoLi7v8KTpMA/77VXji0KbipwihQvO
 81EKG6Tx0zNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="220861351"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="220861351"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 09:30:22 -0700
IronPort-SDR: yCeW3XpfSkI9TTCWofBkNjiHTsN+cXT8Q1FQ0/KmG4auhq3n0yigPvilPfWUl6cpP0sTTFmdUT
 czd3HhRLmxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="345909922"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga007.jf.intel.com with ESMTP; 15 Sep 2020 09:30:21 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Borislav Petkov" <bp@alien8.de>,
 "Ingo Molnar" <mingo@redhat.com>, "H Peter Anvin" <hpa@zytor.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Jean-Philippe Brucker" <jean-philippe@linaro.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Dave Hansen" <dave.hansen@intel.com>, "Tony Luck" <tony.luck@intel.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Ashok Raj" <ashok.raj@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Sohil Mehta" <sohil.mehta@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v8 6/9] x86/msr-index: Define IA32_PASID MSR
Date: Tue, 15 Sep 2020 09:30:10 -0700
Message-Id: <1600187413-163670-7-git-send-email-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
References: <1600187413-163670-1-git-send-email-fenghua.yu@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
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

The IA32_PASID MSR (0xd93) contains the Process Address Space Identifier
(PASID), a 20-bit value. Bit 31 must be set to indicate the value
programmed in the MSR is valid. Hardware uses PASID to identify process
address space and direct responses to the right address space.

Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
v2:
- Change "identify process" to "identify process address space" in the
  commit message (Thomas)

 arch/x86/include/asm/msr-index.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 2859ee4f39a8..aaddc6a9e237 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -257,6 +257,9 @@
 #define MSR_IA32_LASTINTFROMIP		0x000001dd
 #define MSR_IA32_LASTINTTOIP		0x000001de
 
+#define MSR_IA32_PASID			0x00000d93
+#define MSR_IA32_PASID_VALID		BIT_ULL(31)
+
 /* DEBUGCTLMSR bits (others vary by model): */
 #define DEBUGCTLMSR_LBR			(1UL <<  0) /* last branch recording */
 #define DEBUGCTLMSR_BTF_SHIFT		1
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
