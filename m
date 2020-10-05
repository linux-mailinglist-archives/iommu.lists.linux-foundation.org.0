Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7862839C4
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 17:29:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4316486697;
	Mon,  5 Oct 2020 15:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxo8LNwJRjbV; Mon,  5 Oct 2020 15:29:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 093988669F;
	Mon,  5 Oct 2020 15:29:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E21C9C0051;
	Mon,  5 Oct 2020 15:29:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C431C0051
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A006847EB
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KReI1BxZn9l for <iommu@lists.linux-foundation.org>;
 Mon,  5 Oct 2020 15:28:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4DC28834BC
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dED8vHaXb6tu8ZuPD0ZmCjPUI1h1W+XMTR/qU+F/+qA=; b=WIhf+2hPDPoXekPiE44xibj2Ky
 7et55tmHoeyyRNG0QSMj0O5uiSAe7fH8lIWeImmTUWXJdhFyoRUJXB2NwNoZbbeAloKEWiJMfHQqU
 AIMKGPslEj3EXYaAXJ2efV312g30akfbxdd94NCVvesfA+lM3kq3zvNdtxsqxF9/Ry24PGNy3DOnN
 M0+UoYi1eMNSQdhx3u8ONVLlE1M7LFwvKo8ohvojFdzPB5eUE1YvtgtK5YVUhKX3rmTRYhy9wvQc9
 lXsEnfgJEGO8zkIVdh2NviZGBnRsVPLQRABJmLuL/ywyUUQSbce+l4UxG8e4Lo1hjy8jkYOVj63gN
 W+5SSyrw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSQ5-0004MH-8v; Mon, 05 Oct 2020 15:28:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kPSQ4-0045QD-7l; Mon, 05 Oct 2020 16:28:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH 01/13] x86/apic: Use x2apic in guest kernels even with
 unusable CPUs.
Date: Mon,  5 Oct 2020 16:28:44 +0100
Message-Id: <20201005152856.974112-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <77e64f977f559412f62b467fd062d051ea288f14.camel@infradead.org>
References: <77e64f977f559412f62b467fd062d051ea288f14.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 iommu <iommu@lists.linux-foundation.org>, linux-hyperv@vger.kernel.org,
 kvm <kvm@vger.kernel.org>
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

From: David Woodhouse <dwmw@amazon.co.uk>

If the BIOS has enabled x2apic mode, then leave it enabled and don't
fall back to xapic just because some CPUs can't be targeted.

Previously, if there are CPUs with APIC IDs > 255, the kernel will
disable x2apic and fall back to xapic. And then not use the additional
CPUs anyway, since xapic can't target them either.

In fact, xapic mode can target even *fewer* CPUs, since it can't use
the one with APIC ID 255 either. Using x2apic instead gives us at least
one more CPU without needing interrupt remapping in the guest.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/apic.h        |  1 +
 arch/x86/kernel/apic/apic.c        | 18 ++++++++++++++----
 arch/x86/kernel/apic/x2apic_phys.c |  9 +++++++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 1c129abb7f09..b0fd204e0023 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -259,6 +259,7 @@ static inline u64 native_x2apic_icr_read(void)
 
 extern int x2apic_mode;
 extern int x2apic_phys;
+extern void __init x2apic_set_max_apicid(u32 apicid);
 extern void __init check_x2apic(void);
 extern void x2apic_setup(void);
 static inline int x2apic_enabled(void)
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index b3eef1d5c903..a75767052a92 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1841,14 +1841,24 @@ static __init void try_to_enable_x2apic(int remap_mode)
 		return;
 
 	if (remap_mode != IRQ_REMAP_X2APIC_MODE) {
-		/* IR is required if there is APIC ID > 255 even when running
-		 * under KVM
+		/*
+		 * If there are APIC IDs above 255, they cannot be used
+		 * without interrupt remapping. In a virtual machine, but
+		 * not on bare metal, X2APIC can be used anyway. In the
+		 * case where BIOS has enabled X2APIC, don't disable it
+		 * just because there are APIC IDs that can't be used.
+		 * They couldn't be used if the kernel falls back to XAPIC
+		 * anyway.
 		 */
 		if (max_physical_apicid > 255 ||
 		    !x86_init.hyper.x2apic_available()) {
 			pr_info("x2apic: IRQ remapping doesn't support X2APIC mode\n");
-			x2apic_disable();
-			return;
+			if (!x2apic_mode) {
+				x2apic_disable();
+				return;
+			}
+
+			x2apic_set_max_apicid(255);
 		}
 
 		/*
diff --git a/arch/x86/kernel/apic/x2apic_phys.c b/arch/x86/kernel/apic/x2apic_phys.c
index bc9693841353..b4b4e89c1118 100644
--- a/arch/x86/kernel/apic/x2apic_phys.c
+++ b/arch/x86/kernel/apic/x2apic_phys.c
@@ -8,6 +8,12 @@
 int x2apic_phys;
 
 static struct apic apic_x2apic_phys;
+static u32 x2apic_max_apicid;
+
+void __init x2apic_set_max_apicid(u32 apicid)
+{
+	x2apic_max_apicid = apicid;
+}
 
 static int __init set_x2apic_phys_mode(char *arg)
 {
@@ -98,6 +104,9 @@ static int x2apic_phys_probe(void)
 /* Common x2apic functions, also used by x2apic_cluster */
 int x2apic_apic_id_valid(u32 apicid)
 {
+	if (x2apic_max_apicid && apicid > x2apic_max_apicid)
+		return 0;
+
 	return 1;
 }
 
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
