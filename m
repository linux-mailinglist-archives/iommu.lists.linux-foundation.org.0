Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A51BC41271C
	for <lists.iommu@lfdr.de>; Mon, 20 Sep 2021 22:02:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF0DE404C8;
	Mon, 20 Sep 2021 20:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKA0JaKExFQ2; Mon, 20 Sep 2021 20:02:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 78F26400F7;
	Mon, 20 Sep 2021 20:02:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CFADC0020;
	Mon, 20 Sep 2021 20:02:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 611D8C0029
 for <iommu@lists.linux-foundation.org>; Mon, 20 Sep 2021 20:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A251F400CC
 for <iommu@lists.linux-foundation.org>; Mon, 20 Sep 2021 20:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wcm1WXDOM31Q for <iommu@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 20:02:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE98C401D5
 for <iommu@lists.linux-foundation.org>; Mon, 20 Sep 2021 20:02:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="220033647"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="220033647"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 13:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="473779504"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
 by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2021 13:02:16 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "Peter Zijlstra" <peterz@infradead.org>,
 "Andy Lutomirski" <luto@kernel.org>, "Dave Hansen" <dave.hansen@intel.com>,
 "Tony Luck" <tony.luck@intel.com>, "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Joerg Roedel" <joro@8bytes.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "Dave Jiang" <dave.jiang@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Ashok Raj" <ashok.raj@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH 7/8] tools/objtool: Check for use of the ENQCMD instruction in
 the kernel
Date: Mon, 20 Sep 2021 19:23:48 +0000
Message-Id: <20210920192349.2602141-8-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920192349.2602141-1-fenghua.yu@intel.com>
References: <20210920192349.2602141-1-fenghua.yu@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The ENQCMD implicitly accesses the PASID_MSR to fill in the pasid field
of the descriptor being submitted to an accelerator. But there is no
precise (and stable across kernel changes) point at which the PASID_MSR
is updated from the value for one task to the next.

Kernel code that uses accelerators must always use the ENQCMDS instruction
which does not access the PASID_MSR.

Check for use of the ENQCMD instruction in the kernel and warn on its
usage.

Checking the invalid instruction is a relatively new use of objtool and
I'm open to feedback about the approach.

Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 tools/objtool/arch/x86/decode.c      | 10 +++++++++-
 tools/objtool/check.c                | 20 ++++++++++++++++++++
 tools/objtool/include/objtool/arch.h |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index bc821056aba9..e63b44ba3bd4 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -110,7 +110,7 @@ int arch_decode_instruction(const struct elf *elf, const struct section *sec,
 {
 	struct insn insn;
 	int x86_64, ret;
-	unsigned char op1, op2,
+	unsigned char op1, op2, op3,
 		      rex = 0, rex_b = 0, rex_r = 0, rex_w = 0, rex_x = 0,
 		      modrm = 0, modrm_mod = 0, modrm_rm = 0, modrm_reg = 0,
 		      sib = 0, /* sib_scale = 0, */ sib_index = 0, sib_base = 0;
@@ -137,6 +137,7 @@ int arch_decode_instruction(const struct elf *elf, const struct section *sec,
 
 	op1 = insn.opcode.bytes[0];
 	op2 = insn.opcode.bytes[1];
+	op3 = insn.opcode.bytes[2];
 
 	if (insn.rex_prefix.nbytes) {
 		rex = insn.rex_prefix.bytes[0];
@@ -489,6 +490,13 @@ int arch_decode_instruction(const struct elf *elf, const struct section *sec,
 			/* nopl/nopw */
 			*type = INSN_NOP;
 
+		} else if (op2 == 0x38 && op3 == 0xf8) {
+			if (insn.prefixes.nbytes == 1 &&
+			    insn.prefixes.bytes[0] == 0xf2) {
+				/* enqcmd */
+				*type = INSN_ENQCMD;
+			}
+
 		} else if (op2 == 0xa0 || op2 == 0xa8) {
 
 			/* push fs/gs */
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e5947fbb9e7a..91d13521d9d6 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3133,6 +3133,21 @@ static int validate_reachable_instructions(struct objtool_file *file)
 	return 0;
 }
 
+static int validate_enqcmd(struct objtool_file *file)
+{
+	struct instruction *insn;
+
+	for_each_insn(file, insn) {
+		if (insn->type == INSN_ENQCMD) {
+			WARN_FUNC("enqcmd instruction", insn->sec,
+				  insn->offset);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
 int check(struct objtool_file *file)
 {
 	int ret, warnings = 0;
@@ -3147,6 +3162,11 @@ int check(struct objtool_file *file)
 	if (list_empty(&file->insn_list))
 		goto out;
 
+	ret = validate_enqcmd(file);
+	if (ret < 0)
+		goto out;
+	warnings += ret;
+
 	if (vmlinux && !validate_dup) {
 		ret = validate_vmlinux_functions(file);
 		if (ret < 0)
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 062bb6e9b865..5147c0762b49 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -26,6 +26,7 @@ enum insn_type {
 	INSN_CLAC,
 	INSN_STD,
 	INSN_CLD,
+	INSN_ENQCMD,
 	INSN_OTHER,
 };
 
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
