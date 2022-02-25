Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA84C4070
	for <lists.iommu@lfdr.de>; Fri, 25 Feb 2022 09:48:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 816AA61269;
	Fri, 25 Feb 2022 08:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJjc7SpMR-Mi; Fri, 25 Feb 2022 08:48:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EEC406127A;
	Fri, 25 Feb 2022 08:48:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6D75C007D;
	Fri, 25 Feb 2022 08:48:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C629C001A
 for <iommu@lists.linux-foundation.org>; Fri, 25 Feb 2022 08:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD48340211
 for <iommu@lists.linux-foundation.org>; Fri, 25 Feb 2022 08:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bome4AsNN5G7 for <iommu@lists.linux-foundation.org>;
 Fri, 25 Feb 2022 08:48:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C336940265
 for <iommu@lists.linux-foundation.org>; Fri, 25 Feb 2022 08:48:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 364BF68AA6; Fri, 25 Feb 2022 09:47:56 +0100 (CET)
Date: Fri, 25 Feb 2022 09:47:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: cleanup swiotlb initialization
Message-ID: <20220225084755.GA29630@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
 <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com>
 <20220224155854.GA30938@lst.de>
 <206ba6a3-770a-70ad-96bc-76c6380da988@oracle.com>
 <20220224163943.GA32088@lst.de>
 <8ffd8587-7eb3-d5b6-eab0-b86df5c0ebbd@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ffd8587-7eb3-d5b6-eab0-b86df5c0ebbd@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-riscv@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

On Thu, Feb 24, 2022 at 12:07:26PM -0500, Boris Ostrovsky wrote:
>>> Just to be clear: this crashes only as dom0. Boots fine as baremetal.
>> Ah.  I can gues what this might be.  On Xen the hypervisor controls the
>> IOMMU and we should never end up initializing it in Linux, right?
>
>
> Right, we shouldn't be in that code path.

Can you try the patch below on top of the series?


diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index b849f11a756d0..f88c9a4a5ed12 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -47,22 +47,6 @@ static unsigned int x86_swiotlb_flags;
  */
 static void __init pci_swiotlb_detect_4gb(void)
 {
-#ifdef CONFIG_SWIOTLB_XEN
-	if (xen_pv_domain()) {
-		if (xen_initial_domain())
-			x86_swiotlb_enable = true;
-
-		if (x86_swiotlb_enable) {
-			dma_ops = &xen_swiotlb_dma_ops;
-#ifdef CONFIG_PCI
-			/* Make sure ACS will be enabled */
-			pci_request_acs();
-#endif
-		}
-		return;
-	}
-#endif /* CONFIG_SWIOTLB_XEN */
-
 	/* don't initialize swiotlb if iommu=off (no_iommu=1) */
 	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN)
 		x86_swiotlb_enable = true;
@@ -82,16 +66,36 @@ static inline void __init pci_swiotlb_detect_4gb(void)
 }
 #endif /* CONFIG_SWIOTLB */
 
+#ifdef CONFIG_SWIOTLB_XEN
+static void __init xen_swiotlb_init(void)
+{
+	if (!xen_initial_domain() && !x86_swiotlb_enable)
+		return;
+	x86_swiotlb_enable = true;
+	dma_ops = &xen_swiotlb_dma_ops;
+#ifdef CONFIG_PCI
+	/* Make sure ACS will be enabled */
+	pci_request_acs();
+#endif
+	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
+}
+#else
+static inline void __init xen_swiotlb_init(void)
+{
+}
+#endif /* CONFIG_SWIOTLB_XEN */
+
 void __init pci_iommu_alloc(void)
 {
+	if (xen_pv_domain()) {
+		xen_swiotlb_init();
+		return;
+	}
 	pci_swiotlb_detect_4gb();
 	gart_iommu_hole_init();
 	amd_iommu_detect();
 	detect_intel_iommu();
-#ifdef CONFIG_SWIOTLB
-	swiotlb_init_remap(x86_swiotlb_enable, x86_swiotlb_flags,
-			   xen_pv_domain() ? xen_swiotlb_fixup : NULL);
-#endif
+	swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
 }
 
 /*
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
