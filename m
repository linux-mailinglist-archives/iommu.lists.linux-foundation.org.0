Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B8A4C89D6
	for <lists.iommu@lfdr.de>; Tue,  1 Mar 2022 11:53:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19FAF60ABD;
	Tue,  1 Mar 2022 10:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id juJ_7SG-dD5G; Tue,  1 Mar 2022 10:53:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2678F60E88;
	Tue,  1 Mar 2022 10:53:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 099D3C001A;
	Tue,  1 Mar 2022 10:53:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92C82C001A
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7195C40538
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRjEwszDJpfi for <iommu@lists.linux-foundation.org>;
 Tue,  1 Mar 2022 10:53:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A896404BD
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rn1lGNCzgBmJDwsQNrjsOcGImLW+b96q4xUCqvjdsk0=; b=TN8SI+uAq5DRfiCtROBmEeGw49
 N1XQdXveQdISlA9PJvr7k3fqXJ9w4L4fp4g84Sx/b6Q3/TPXM34VfI00X3WX9GkM9+xkrbM+bMDai
 q9KxADFlSGYuizADeUGr7l7Wyhi+6wixAUA9bogKi+S84VubiWeuiOuSLOIOO/u8edfzcJXIwkX9B
 e3uJEQDCxXwbkmyOMf0943q8r0jk1gsz1PxYQdXM0pTs2h2ZzikrlK1tJTrcsOuna2VNTBldJOC0d
 KROkdtCbvHpsPMH2KXKaD98Llv7rUxGn22RsjoJ2MNNq95XdrxGoyXdrHr9Mrkal37Bq7EXzIylMK
 Fz5RfWkA==;
Received: from [2.53.44.23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP08W-00GDBz-Fe; Tue, 01 Mar 2022 10:53:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 08/12] x86: centralize setting SWIOTLB_FORCE when guest memory
 encryption is enabled
Date: Tue,  1 Mar 2022 12:53:07 +0200
Message-Id: <20220301105311.885699-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301105311.885699-1-hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

Move enabling SWIOTLB_FORCE for guest memory encryption into common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/kernel/cpu/mshyperv.c | 8 --------
 arch/x86/kernel/pci-dma.c      | 7 +++++++
 arch/x86/mm/mem_encrypt_amd.c  | 3 ---
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 5a99f993e6392..568274917f1cd 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -336,14 +336,6 @@ static void __init ms_hyperv_init_platform(void)
 			swiotlb_unencrypted_base = ms_hyperv.shared_gpa_boundary;
 #endif
 		}
-
-#ifdef CONFIG_SWIOTLB
-		/*
-		 * Enable swiotlb force mode in Isolation VM to
-		 * use swiotlb bounce buffer for dma transaction.
-		 */
-		swiotlb_force = SWIOTLB_FORCE;
-#endif
 	}
 
 	if (hv_max_functions_eax >= HYPERV_CPUID_NESTED_FEATURES) {
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 2ac0ef9c2fb76..7ab7002758396 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -53,6 +53,13 @@ static void __init pci_swiotlb_detect(void)
 	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
 		x86_swiotlb_enable = true;
 
+	/*
+	 * Guest with guest memory encryption must always do I/O through a
+	 * bounce buffer as the hypervisor can't access arbitrary VM memory.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+		swiotlb_force = SWIOTLB_FORCE;
+
 	if (swiotlb_force == SWIOTLB_FORCE)
 		x86_swiotlb_enable = true;
 }
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 2b2d018ea3450..a72942d569cf9 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -191,9 +191,6 @@ void __init sme_early_init(void)
 	/* Update the protection map with memory encryption mask */
 	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
 		protection_map[i] = pgprot_encrypted(protection_map[i]);
-
-	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
-		swiotlb_force = SWIOTLB_FORCE;
 }
 
 void __init sev_setup_arch(void)
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
