Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7439736D
	for <lists.iommu@lfdr.de>; Tue,  1 Jun 2021 14:39:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5119640285;
	Tue,  1 Jun 2021 12:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKym17GwBaFL; Tue,  1 Jun 2021 12:39:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5689C40403;
	Tue,  1 Jun 2021 12:39:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8A34C0024;
	Tue,  1 Jun 2021 12:39:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA8DCC0001
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 12:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD8EB60758
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 12:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nA0lLpz0esTZ for <iommu@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 12:39:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id A04F66071E
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 12:39:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92916D;
 Tue,  1 Jun 2021 05:39:44 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB6313F73D;
 Tue,  1 Jun 2021 05:39:42 -0700 (PDT)
Subject: Re: Regression 5.12.0-rc4 net: ice: significant throughput drop
To: Daniel Borkmann <daniel@iogearbox.net>, jroedel@suse.de
References: <CAHn8xckNXci+X_Eb2WMv4uVYjO2331UWB2JLtXr_58z0Av8+8A@mail.gmail.com>
 <cc58c09e-bbb5-354a-2030-bf8ebb2adc86@iogearbox.net>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7f048c57-423b-68ba-eede-7e194c1fea4e@arm.com>
Date: Tue, 1 Jun 2021 13:39:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cc58c09e-bbb5-354a-2030-bf8ebb2adc86@iogearbox.net>
Content-Language: en-GB
Cc: Jussi Maki <joamaki@gmail.com>, netdev@vger.kernel.org,
 jesse.brandeburg@intel.com, hch@lst.de, iommu@lists.linux-foundation.org,
 anthony.l.nguyen@intel.com, intel-wired-lan@lists.osuosl.org,
 bpf <bpf@vger.kernel.org>, davem@davemloft.net
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-06-01 07:57, Daniel Borkmann wrote:
> [ ping Robin / Joerg, +Cc Christoph ]

Sorry, I was off on Friday on top of the Bank Holiday yesterday.

> On 5/28/21 10:34 AM, Jussi Maki wrote:
>> Hi all,
>>
>> While measuring the impact of a kernel patch on our lab machines I 
>> stumbled upon
>> a performance regression affecting the 100Gbit ICE nic and bisected it
>> from range v5.11.1..v5.13-rc3 to the commit:
>> a250c23f15c2 iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
>>
>> Both recent bpf-next (d6a6a55518) and linux-stable (c4681547bc) are
>> affected by the issue.
>>
>> The regression shows as a significant drop in throughput as measured
>> with "super_netperf" [0],
>> with measured bandwidth of ~95Gbps before and ~35Gbps after:

I guess that must be the difference between using the flush queue
vs. strict invalidation. On closer inspection, it seems to me that
there's a subtle pre-existing bug in the AMD IOMMU driver, in that
amd_iommu_init_dma_ops() actually runs *after* amd_iommu_init_api()
has called bus_set_iommu(). Does the patch below work?

Robin.

----->8-----

Subject: [PATCH] iommu/amd: Tidy up DMA ops init

Now that DMA ops are part of the core API via iommu-dma, fold the
vestigial remains of the IOMMU_DMA_OPS init state into the IOMMU API
phase, and clean up a few other leftovers. This should also close the
race window wherein bus_set_iommu() effectively makes the DMA ops state
visible before its nominal initialisation, which since commit
a250c23f15c2 ("iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE") can now
lead to the wrong flush queue policy being picked.

Reported-by: Jussi Maki <joamaki@gmail.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
  drivers/iommu/amd/amd_iommu.h |  2 --
  drivers/iommu/amd/init.c      |  5 -----
  drivers/iommu/amd/iommu.c     | 29 ++++++++++++-----------------
  3 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index 55dd38d814d9..416815a525d6 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -11,8 +11,6 @@
  
  #include "amd_iommu_types.h"
  
-extern int amd_iommu_init_dma_ops(void);
-extern int amd_iommu_init_passthrough(void);
  extern irqreturn_t amd_iommu_int_thread(int irq, void *data);
  extern irqreturn_t amd_iommu_int_handler(int irq, void *data);
  extern void amd_iommu_apply_erratum_63(u16 devid);
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index d006724f4dc2..a418bf560a4b 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -231,7 +231,6 @@ enum iommu_init_state {
  	IOMMU_ENABLED,
  	IOMMU_PCI_INIT,
  	IOMMU_INTERRUPTS_EN,
-	IOMMU_DMA_OPS,
  	IOMMU_INITIALIZED,
  	IOMMU_NOT_FOUND,
  	IOMMU_INIT_ERROR,
@@ -2895,10 +2894,6 @@ static int __init state_next(void)
  		init_state = ret ? IOMMU_INIT_ERROR : IOMMU_INTERRUPTS_EN;
  		break;
  	case IOMMU_INTERRUPTS_EN:
-		ret = amd_iommu_init_dma_ops();
-		init_state = ret ? IOMMU_INIT_ERROR : IOMMU_DMA_OPS;
-		break;
-	case IOMMU_DMA_OPS:
  		init_state = IOMMU_INITIALIZED;
  		break;
  	case IOMMU_INITIALIZED:
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 80e8e1916dd1..20f7d141ea53 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -30,7 +30,6 @@
  #include <linux/msi.h>
  #include <linux/irqdomain.h>
  #include <linux/percpu.h>
-#include <linux/iova.h>
  #include <linux/io-pgtable.h>
  #include <asm/irq_remapping.h>
  #include <asm/io_apic.h>
@@ -1771,13 +1770,22 @@ void amd_iommu_domain_update(struct protection_domain *domain)
  	amd_iommu_domain_flush_complete(domain);
  }
  
+static void __init amd_iommu_init_dma_ops(void)
+{
+	swiotlb = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
+
+	if (amd_iommu_unmap_flush)
+		pr_info("IO/TLB flush on unmap enabled\n");
+	else
+		pr_info("Lazy IO/TLB flushing enabled\n");
+	iommu_set_dma_strict(amd_iommu_unmap_flush);
+}
+
  int __init amd_iommu_init_api(void)
  {
  	int ret, err = 0;
  
-	ret = iova_cache_get();
-	if (ret)
-		return ret;
+	amd_iommu_init_dma_ops();
  
  	err = bus_set_iommu(&pci_bus_type, &amd_iommu_ops);
  	if (err)
@@ -1794,19 +1802,6 @@ int __init amd_iommu_init_api(void)
  	return 0;
  }
  
-int __init amd_iommu_init_dma_ops(void)
-{
-	swiotlb        = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
-
-	if (amd_iommu_unmap_flush)
-		pr_info("IO/TLB flush on unmap enabled\n");
-	else
-		pr_info("Lazy IO/TLB flushing enabled\n");
-	iommu_set_dma_strict(amd_iommu_unmap_flush);
-	return 0;
-
-}
-
  /*****************************************************************************
   *
   * The following functions belong to the exported interface of AMD IOMMU
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
