Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5264C89
	for <lists.iommu@lfdr.de>; Wed, 10 Jul 2019 21:09:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 723C24878;
	Wed, 10 Jul 2019 19:09:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B14EC4872
	for <iommu@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 19:01:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730054.outbound.protection.outlook.com [40.107.73.54])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EA29F883
	for <iommu@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 19:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+4rsSaPE6dO2Jfl/IKs9gTCLCmtLV08rzAk8zDEC9+Q=;
	b=RmQJjk8VNDzHpVNSbk7X5FtjfLcOn3TF2ITnVaiB4llyCTbZFwcMylx4T5l+zDJmt4Ix+fFO/li6h0+zXzhEbZXSUdrJStKHs9RNmZV4qIsrxliSR2cG4KrnhLD0wZ5rn4GWIZM94RY++/1zF4CVx5t8HGnqIe70E4SLa+kmdO4=
Received: from DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) by
	DM6PR12MB3020.namprd12.prod.outlook.com (20.178.30.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18; Wed, 10 Jul 2019 19:01:20 +0000
Received: from DM6PR12MB3163.namprd12.prod.outlook.com
	([fe80::a168:666e:f33c:d1e4]) by
	DM6PR12MB3163.namprd12.prod.outlook.com
	([fe80::a168:666e:f33c:d1e4%5]) with mapi id 15.20.2052.020;
	Wed, 10 Jul 2019 19:01:20 +0000
From: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
To: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: [PATCH] dma-direct: Force unencrypted DMA under SME for certain DMA
	masks
Thread-Topic: [PATCH] dma-direct: Force unencrypted DMA under SME for certain
	DMA masks
Thread-Index: AQHVN1HbhkVejMp04kW0O/tJG/K57g==
Date: Wed, 10 Jul 2019 19:01:19 +0000
Message-ID: <10b83d9ff31bca88e94da2ff34e30619eb396078.1562785123.git.thomas.lendacky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: SN6PR04CA0002.namprd04.prod.outlook.com
	(2603:10b6:805:3e::15) To DM6PR12MB3163.namprd12.prod.outlook.com
	(2603:10b6:5:182::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Thomas.Lendacky@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04cded32-ebcd-4f93-f845-08d70568fe34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:DM6PR12MB3020; 
x-ms-traffictypediagnostic: DM6PR12MB3020:
x-microsoft-antispam-prvs: <DM6PR12MB3020B831CA86F15D2EAFE4F6ECF00@DM6PR12MB3020.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(189003)(199004)(2501003)(5660300002)(64756008)(66446008)(66476007)(66556008)(81166006)(486006)(2201001)(66946007)(86362001)(316002)(50226002)(68736007)(118296001)(71190400001)(256004)(14444005)(71200400001)(478600001)(2906002)(8676002)(54906003)(14454004)(6116002)(6436002)(2616005)(81156014)(476003)(25786009)(8936002)(7736002)(36756003)(305945005)(53936002)(99286004)(7416002)(6486002)(6506007)(3846002)(386003)(52116002)(66066001)(110136005)(4326008)(6512007)(26005)(102836004)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3020;
	H:DM6PR12MB3163.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eFihNlLWMkm2Gql85OGZRi6AyFUWNhNsMmWtR7raA0xlNhdFCO1gHqR/ueUau44urRYbU25HbOH+rUJRTzVJVknxweix4brxrno1faKLtulTK5mn7ltRz+DkEHUrnuQrRr2pGTNWAx18T2YCXwDjaLPMS7uNrDcX6EMFW5fJsRHB9RBCW6DbYoCYuNNoNlyTuLf2/iIYM1ebez0xmrV9t4XPbNmKrLZf74nkKBwFD7xmG07r75kqz4WewOm5Pqd0WAjFXJ4txkfQdx2plPC8KmbwFm/JWYtkwiW62D3GLp7Nn+jUrGvX1HfCFFu7J0cZB2da5f7M2Jp0e5/Z5Ulc771iS7m3ZYpfdzVumfo2DoyMBtIA18qVUDVwOYNAo1jAabyji+CTlhzRbIof0tzCBlDeGLFzcZ3gJu2S5aMTIu0=
Content-ID: <4FE05DA05E9F2347BDC8439C1ADB35ED@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cded32-ebcd-4f93-f845-08d70568fe34
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 19:01:19.9194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlendack@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3020
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Lianbo Jiang <lijiang@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Tom Lendacky <thomas.lendacky@amd.com>

If a device doesn't support DMA to a physical address that includes the
encryption bit (currently bit 47, so 48-bit DMA), then the DMA must
occur to unencrypted memory. SWIOTLB is used to satisfy that requirement
if an IOMMU is not active (enabled or configured in passthrough mode).

However, commit fafadcd16595 ("swiotlb: don't dip into swiotlb pool for
coherent allocations") modified the coherent allocation support in SWIOTLB
to use the DMA direct coherent allocation support. When an IOMMU is not
active, this resulted in dma_alloc_coherent() failing for devices that
didn't support DMA addresses that included the encryption bit.

Addressing this requires changes to the force_dma_unencrypted() function
in kernel/dma/direct.c. Since the function is now non-trivial and SME/SEV
specific, update the DMA direct support to add an arch override for the
force_dma_unencrypted() function. The arch override is selected when
CONFIG_AMD_MEM_ENCRYPT is set. The arch override function resides in the
arch/x86/mm/mem_encrypt.c file and forces unencrypted DMA when either SEV
is active or SME is active and the device does not support DMA to physical
addresses that include the encryption bit.

Fixes: fafadcd16595 ("swiotlb: don't dip into swiotlb pool for coherent allocations")
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---

Based on tree git://git.infradead.org/users/hch/dma-mapping.git for-next

 arch/x86/Kconfig          |  1 +
 arch/x86/mm/mem_encrypt.c | 30 ++++++++++++++++++++++++++++++
 kernel/dma/Kconfig        |  3 +++
 kernel/dma/direct.c       | 19 ++++++++++---------
 4 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2bbbd4d1ba31..12e02a8f9de7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1508,6 +1508,7 @@ config AMD_MEM_ENCRYPT
 	depends on X86_64 && CPU_SUP_AMD
 	select DYNAMIC_PHYSICAL_MASK
 	select ARCH_USE_MEMREMAP_PROT
+	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	---help---
 	  Say yes to enable support for the encryption of system memory.
 	  This requires an AMD processor that supports Secure Memory
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 51f50a7a07ef..c7a88b837c43 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -18,6 +18,10 @@
 #include <linux/dma-direct.h>
 #include <linux/swiotlb.h>
 #include <linux/mem_encrypt.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
@@ -351,6 +355,32 @@ bool sev_active(void)
 }
 EXPORT_SYMBOL(sev_active);
 
+/* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
+bool force_dma_unencrypted(struct device *dev)
+{
+	/*
+	 * For SEV, all DMA must be to unencrypted addresses.
+	 */
+	if (sev_active())
+		return true;
+
+	/*
+	 * For SME, all DMA must be to unencrypted addresses if the
+	 * device does not support DMA to addresses that include the
+	 * encryption mask.
+	 */
+	if (sme_active()) {
+		u64 dma_enc_mask = DMA_BIT_MASK(__ffs64(sme_me_mask));
+		u64 dma_dev_mask = min_not_zero(dev->coherent_dma_mask,
+						dev->bus_dma_mask);
+
+		if (dma_dev_mask <= dma_enc_mask)
+			return true;
+	}
+
+	return false;
+}
+
 /* Architecture __weak replacement functions */
 void __init mem_encrypt_free_decrypted_mem(void)
 {
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 70f8f8d9200e..9decbba255fc 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -48,6 +48,9 @@ config ARCH_HAS_DMA_COHERENT_TO_PFN
 config ARCH_HAS_DMA_MMAP_PGPROT
 	bool
 
+config ARCH_HAS_FORCE_DMA_UNENCRYPTED
+	bool
+
 config DMA_NONCOHERENT_CACHE_SYNC
 	bool
 
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index b90e1aede743..fb37374dae75 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -23,13 +23,14 @@
 #define ARCH_ZONE_DMA_BITS 24
 #endif
 
-/*
- * For AMD SEV all DMA must be to unencrypted addresses.
- */
-static inline bool force_dma_unencrypted(void)
+#ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
+bool force_dma_unencrypted(struct device *dev);
+#else
+static inline bool force_dma_unencrypted(struct device *dev)
 {
-	return sev_active();
+	return false;
 }
+#endif
 
 static void report_addr(struct device *dev, dma_addr_t dma_addr, size_t size)
 {
@@ -46,7 +47,7 @@ static void report_addr(struct device *dev, dma_addr_t dma_addr, size_t size)
 static inline dma_addr_t phys_to_dma_direct(struct device *dev,
 		phys_addr_t phys)
 {
-	if (force_dma_unencrypted())
+	if (force_dma_unencrypted(dev))
 		return __phys_to_dma(dev, phys);
 	return phys_to_dma(dev, phys);
 }
@@ -67,7 +68,7 @@ static gfp_t __dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 	if (dev->bus_dma_mask && dev->bus_dma_mask < dma_mask)
 		dma_mask = dev->bus_dma_mask;
 
-	if (force_dma_unencrypted())
+	if (force_dma_unencrypted(dev))
 		*phys_mask = __dma_to_phys(dev, dma_mask);
 	else
 		*phys_mask = dma_to_phys(dev, dma_mask);
@@ -159,7 +160,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	}
 
 	ret = page_address(page);
-	if (force_dma_unencrypted()) {
+	if (force_dma_unencrypted(dev)) {
 		set_memory_decrypted((unsigned long)ret, 1 << get_order(size));
 		*dma_handle = __phys_to_dma(dev, page_to_phys(page));
 	} else {
@@ -192,7 +193,7 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 		return;
 	}
 
-	if (force_dma_unencrypted())
+	if (force_dma_unencrypted(dev))
 		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
 
 	if (IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
