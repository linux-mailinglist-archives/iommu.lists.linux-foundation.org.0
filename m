Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E9404144
	for <lists.iommu@lfdr.de>; Thu,  9 Sep 2021 00:59:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8515613EE;
	Wed,  8 Sep 2021 22:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ug3e9FAYiajr; Wed,  8 Sep 2021 22:59:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 07388613E4;
	Wed,  8 Sep 2021 22:59:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE7F7C000D;
	Wed,  8 Sep 2021 22:59:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F676C000D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Sep 2021 22:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11EC9613E1
 for <iommu@lists.linux-foundation.org>; Wed,  8 Sep 2021 22:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYY89AY_ArM7 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 22:59:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::628])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05540605BD
 for <iommu@lists.linux-foundation.org>; Wed,  8 Sep 2021 22:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTA56BfNzr+WdTzLWf0R7R5bkD3Z2NieabjINt4YklGwrzQtoa4B479oZdwzgc6eMu3rAnDGD24taLyHxbZUdoWubZs6Scmp85TtvdHZc7jeaMCH+xfCVP+7vzKGD2JdnNAgnAeMZU63nLYAj/RKi+xw768Ip2GJkBfZh7wdfiUwXYHTx3C9GbbbbGQBUAXmhtVWpzuQlXj3V8NYydZYbB/C618dON2moNn+CGy7Wk1saCcZdlU7hNdLkEFpp+VAZDxgm36qeyr88XvH7W6lUi/YdCMZv9r/0HwKaMoqYXkn/a17XFlSJaS7MpeyMJCeckA5hpLuuB2aTP/D+Z6cRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IqGtg1cAr8szUUscL6nSCzLAsTjemz8U/WSliGIExU0=;
 b=eSExbDz1dU5buWdsM4k9sPqrh822VNRsFzTkOhNaBfE4PsjrN+emkA5X7Bu4UTtc+KUTr0VdzfxqgV4VGrBztMpfG4SUeP4lQxGFGEmf7MTqvrIDYiF7IyBEzJxst7BrPfm1eiRbV8ivRtZWNBp3Nr1CxiJEAf/PPN/xhsS0L16lkIasmfy9uwmzEH+/kSMFg6dFLxiWz11ooBi6O9ublqnfghipeW93y7cilzuBP7NBGjaO+0T6mn5DcVC6iuQ6xUsTAyO8NqvuI1psr/wJUCZJ71Wz6WCJ9ZbYOJoctiJZbikd5bL6bUE5RdV1qjhUVStfKQ+oRJSgzJbhdNx9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqGtg1cAr8szUUscL6nSCzLAsTjemz8U/WSliGIExU0=;
 b=y/rwPex5PwZ7r32Z/uZquca7YNmifGZVQR+X1FqYvKzav8z5krd9TPLyhOq2Vu7BdCDir+LjVqvr54KM7QB2/J6s5fRafBY6tU/BTvJzGvMV7xmznbBIW+plUPIfLmmWmzeDxZLyzJsOMePIPkxP5jz3yXN8x7WfVW3E6xHY93g=
Received: from DM5PR08CA0026.namprd08.prod.outlook.com (2603:10b6:4:60::15) by
 SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Wed, 8 Sep 2021 22:59:02 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::20) by DM5PR08CA0026.outlook.office365.com
 (2603:10b6:4:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 22:59:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 22:59:01 +0000
Received: from tlendack-t1.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 8 Sep 2021
 17:58:59 -0500
To: <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <kvm@vger.kernel.org>,
 <linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-graphics-maintainer@vmware.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <kexec@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>
Subject: [PATCH v3 1/8] x86/ioremap: Selectively build arch override
 encryption functions
Date: Wed, 8 Sep 2021 17:58:32 -0500
Message-ID: <3c25da5d5516afbdd868df2f6a6f7d7f241f32d4.1631141919.git.thomas.lendacky@amd.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1631141919.git.thomas.lendacky@amd.com>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3722983-dabc-4172-82ef-08d9731c3ff2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4512:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4512AA2A47C10C282FE2D6D9ECD49@SA0PR12MB4512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BUVdzJB5u2MkMrpUqQhlFq51g9QCsOyMJsm8AcsZFHjDTOD+5gRCwagnQ1mHpcPfTJRc1+4Dq71DTnTFraa7vrnxQ1QwBEC/d5V70m3O3BHyIWgCoOTe58RPUpuXv+iHmKgVC99x9k8SRXnMsUOyXrFL7SwHiJRlvrv0M74S91rlPY2UWmaI4yCeINDkK/jc+K9Q8AEcgHu8XbppQLxw4OqsdOiWz5JlN/Hto8+w788fZm3eCLmoHqqvJ2pmx4wiygTMz5grlmY/AaeC3z7TwU0gDn8aMHJqCKJXvorW1rVDYwcnBu92Ol3fFC/tjcpFy7d40fUZU20dp2fiLRymdpKtQvAilSYk+c82Ml/DqAJBRvkFt8mWUCCtgPX0tqI0gcV6O+JDg5SG6sIalG59NmUe2gOJOnpH9fHs9gOBTPflXbrTnXChtuDYU4mOZP8yybsyMt9IMM0q7i7U/1vLOjP4EsnyzxQ+2zqSxQtXzZuYN8xQgTSjQqo83a0ev5ndq4k0JRgsdFeNN6zm1Ic86v4oJp7n6pGfBOIVh4Ms6e+iUyodeiqS3WOoNk5pu57bxFvxOn97s/kRVRN07BTBt+6dhob0FNN7gkjaJV+ha04NW4qAS7etwLwverSvgnn92J65pek37xYTBNBuQSJ+/ujJueHyKbqhuBT5bEtBTPMF/8z4cggbBml9sS08MQ6fMq4ZHzHVWkFjIfT4Zu76GCZQ4kkT7BfVdVYaVaxvPzN5QpH5/LIVflA92OfV8xuVFs/PByC67R0R/w/GqkgpT3efm+Z4/JM3ynEjWYlQorg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(8676002)(2906002)(7696005)(110136005)(8936002)(478600001)(6666004)(356005)(70206006)(16526019)(316002)(54906003)(36756003)(4326008)(426003)(7416002)(26005)(47076005)(36860700001)(186003)(336012)(83380400001)(81166007)(82310400003)(70586007)(5660300002)(86362001)(921005)(2616005)(82740400003)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 22:59:01.7802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3722983-dabc-4172-82ef-08d9731c3ff2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4512
Cc: Andi Kleen <ak@linux.intel.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Peter Zijlstra <peterz@infradead.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
From: Tom Lendacky via iommu <iommu@lists.linux-foundation.org>
Reply-To: Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

In prep for other uses of the cc_platform_has() function besides AMD's
memory encryption support, selectively build the AMD memory encryption
architecture override functions only when CONFIG_AMD_MEM_ENCRYPT=y. These
functions are:
- early_memremap_pgprot_adjust()
- arch_memremap_can_ram_remap()

Additionally, routines that are only invoked by these architecture
override functions can also be conditionally built. These functions are:
- memremap_should_map_decrypted()
- memremap_is_efi_data()
- memremap_is_setup_data()
- early_memremap_is_setup_data()

And finally, phys_mem_access_encrypted() is conditionally built as well,
but requires a static inline version of it when CONFIG_AMD_MEM_ENCRYPT is
not set.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/include/asm/io.h | 8 ++++++++
 arch/x86/mm/ioremap.c     | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index 841a5d104afa..5c6a4af0b911 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -391,6 +391,7 @@ extern void arch_io_free_memtype_wc(resource_size_t start, resource_size_t size)
 #define arch_io_reserve_memtype_wc arch_io_reserve_memtype_wc
 #endif
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
 extern bool arch_memremap_can_ram_remap(resource_size_t offset,
 					unsigned long size,
 					unsigned long flags);
@@ -398,6 +399,13 @@ extern bool arch_memremap_can_ram_remap(resource_size_t offset,
 
 extern bool phys_mem_access_encrypted(unsigned long phys_addr,
 				      unsigned long size);
+#else
+static inline bool phys_mem_access_encrypted(unsigned long phys_addr,
+					     unsigned long size)
+{
+	return true;
+}
+#endif
 
 /**
  * iosubmit_cmds512 - copy data to single MMIO location, in 512-bit units
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 60ade7dd71bd..ccff76cedd8f 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -508,6 +508,7 @@ void unxlate_dev_mem_ptr(phys_addr_t phys, void *addr)
 	memunmap((void *)((unsigned long)addr & PAGE_MASK));
 }
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
 /*
  * Examine the physical address to determine if it is an area of memory
  * that should be mapped decrypted.  If the memory is not part of the
@@ -746,7 +747,6 @@ bool phys_mem_access_encrypted(unsigned long phys_addr, unsigned long size)
 	return arch_memremap_can_ram_remap(phys_addr, size, 0);
 }
 
-#ifdef CONFIG_AMD_MEM_ENCRYPT
 /* Remap memory with encryption */
 void __init *early_memremap_encrypted(resource_size_t phys_addr,
 				      unsigned long size)
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
