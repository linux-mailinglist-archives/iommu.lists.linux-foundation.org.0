Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7B297EC6
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:35:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C0718747A;
	Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jflSlj+opyZ9; Sat, 24 Oct 2020 21:35:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 324A087353;
	Sat, 24 Oct 2020 21:35:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E8D8C0893;
	Sat, 24 Oct 2020 21:35:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71275C0051
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6B48E86A62
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uO6JVVMnXZH1 for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1EA5E86A4E
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vVTKbNZKOaBS6JtGOtjcVDRlft+tb/gwBIRdX86XLzU=; b=j41fMVuaTAzCLdobI2isxE6d87
 JhTzI3S3oW4u1H1MR5IQ3ZTZ+OLetXkIYEO4WPBytQR8p9hM6GmFzmnt36AD2eo1uFLcGcMMTpQUP
 WXLKl75KHUg2G8uo05IXbGUe5gucO/nn1s/HxrUofHQ3JTtncU/nXoGssomwZvfk9OlF4JFDaCkKN
 i+W5k7WbkXxPYV43m8HO5y6BL01T12I+TA/ZwE4YyOaUXahrRblIC0GlEl77eEeAJxmIQNLnftQb2
 qOY/DZwt8pRBL7aGEFuFdun/v3UAzzpTeev56pdN0P79tw0XnCBZAApGj8tviyB0zLxaRa4GUd7VZ
 2yHAaN4A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCO-0006Gh-09; Sat, 24 Oct 2020 21:35:41 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCN-001rPs-Hd; Sat, 24 Oct 2020 22:35:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 34/35] x86/kvm: Reserve KVM_FEATURE_MSI_EXT_DEST_ID
Date: Sat, 24 Oct 2020 22:35:34 +0100
Message-Id: <20201024213535.443185-35-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201024213535.443185-1-dwmw2@infradead.org>
References: <e6601ff691afb3266e365a91e8b221179daf22c2.camel@infradead.org>
 <20201024213535.443185-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, maz@misterjones.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
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

No functional change; just reserve the feature bit for now so that VMMs
can start to implement it.

This will allow the host to indicate that MSI emulation supports 15-bit
destination IDs, allowing up to 32768 CPUs without interrupt remapping.

cf. https://patchwork.kernel.org/patch/11816693/ for qemu

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/cpuid.rst     | 4 ++++
 arch/x86/include/uapi/asm/kvm_para.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/Documentation/virt/kvm/cpuid.rst b/Documentation/virt/kvm/cpuid.rst
index 9150e9d1c39b..f70b655821d5 100644
--- a/Documentation/virt/kvm/cpuid.rst
+++ b/Documentation/virt/kvm/cpuid.rst
@@ -92,6 +92,10 @@ KVM_FEATURE_ASYNC_PF_INT          14          guest checks this feature bit
                                               async pf acknowledgment msr
                                               0x4b564d07.
 
+KVM_FEATURE_MSI_EXT_DEST_ID       15          guest checks this feature bit
+                                              before using extended destination
+                                              ID bits in MSI address bits 11-5.
+
 KVM_FEATURE_CLOCSOURCE_STABLE_BIT 24          host will warn if no guest-side
                                               per-cpu warps are expeced in
                                               kvmclock
diff --git a/arch/x86/include/uapi/asm/kvm_para.h b/arch/x86/include/uapi/asm/kvm_para.h
index 812e9b4c1114..950afebfba88 100644
--- a/arch/x86/include/uapi/asm/kvm_para.h
+++ b/arch/x86/include/uapi/asm/kvm_para.h
@@ -32,6 +32,7 @@
 #define KVM_FEATURE_POLL_CONTROL	12
 #define KVM_FEATURE_PV_SCHED_YIELD	13
 #define KVM_FEATURE_ASYNC_PF_INT	14
+#define KVM_FEATURE_MSI_EXT_DEST_ID	15
 
 #define KVM_HINTS_REALTIME      0
 
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
