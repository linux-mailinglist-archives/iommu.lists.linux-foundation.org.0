Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4D297EC7
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:35:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 133EE22E96;
	Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0iBLn+91ZSe; Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 67B6922FF0;
	Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5530EC0051;
	Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A82AFC0052
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 97B4987353
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ff5bkucd6PKq for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B23C98735D
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+jE5PmSnTtpKt/dSdy9GOQE955+9SLIZfk3ZVBF+YwI=; b=ZCQoPy4/KlJh41wyVe4pc1SGK8
 wH/vCoNHP5BeDJSlGrF9ih6QLfbgXq8Oc4jrTjXu0G+7wjaMZJ/ay8G1J0dSekIH2APY0u6H2jTfs
 H9rsbSw2fir7nVk6notFRACORC1HeKrV0dErwhD2+JMYrW5+pnE0a5pV0wB3kSA183992VONyVluK
 G/8buPxWYzLzu9iNFUUW19jFSazCJX4bVrrh8FqWAJuxkJ7Zv8XMLwslzwHM4MthnW+SA93aB9kHc
 hIIMQnk0sy6d5gyjCyjmohhaPW52+JZaOhEBKNOd2fW2fxPhKWgqRZl1CeuGIrH0FT+WQuVy5bDGH
 7ABJuSwg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCN-0006Gi-Vu; Sat, 24 Oct 2020 21:35:41 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCN-001rPx-IJ; Sat, 24 Oct 2020 22:35:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 35/35] x86/kvm: Enable 15-bit extension when
 KVM_FEATURE_MSI_EXT_DEST_ID detected
Date: Sat, 24 Oct 2020 22:35:35 +0100
Message-Id: <20201024213535.443185-36-dwmw2@infradead.org>
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

This allows the host to indicate that MSI emulation supports 15-bit
destination IDs, allowing up to 32768 CPUs without interrupt remapping.

cf. https://patchwork.kernel.org/patch/11816693/ for qemu

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kernel/kvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 1c0f2560a41c..b82de2843814 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -740,6 +740,11 @@ static void __init kvm_apic_init(void)
 #endif
 }
 
+static bool __init kvm_msi_ext_dest_id(void)
+{
+	return kvm_para_has_feature(KVM_FEATURE_MSI_EXT_DEST_ID);
+}
+
 static void __init kvm_init_platform(void)
 {
 	kvmclock_init();
@@ -769,6 +774,7 @@ const __initconst struct hypervisor_x86 x86_hyper_kvm = {
 	.type				= X86_HYPER_KVM,
 	.init.guest_late_init		= kvm_guest_init,
 	.init.x2apic_available		= kvm_para_available,
+	.init.msi_ext_dest_id		= kvm_msi_ext_dest_id,
 	.init.init_platform		= kvm_init_platform,
 #if defined(CONFIG_AMD_MEM_ENCRYPT)
 	.runtime.sev_es_hcall_prepare	= kvm_sev_es_hcall_prepare,
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
