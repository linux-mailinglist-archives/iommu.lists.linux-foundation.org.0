Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DF31343447
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 10:43:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA9351366;
	Thu, 13 Jun 2019 08:43:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3FC421351
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AA521174
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:43:33 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id E75AE9BFC10B89B23C95;
	Thu, 13 Jun 2019 16:43:30 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
	DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 13 Jun 2019 16:43:21 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, John Garry
	<john.garry@huawei.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon
	<will.deacon@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet
	<corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>, Sebastian Ott
	<sebott@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	"Martin Schwidefsky" <schwidefsky@de.ibm.com>, Heiko Carstens
	<heiko.carstens@de.ibm.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
	Ellerman" <mpe@ellerman.id.au>, Tony Luck <tony.luck@intel.com>, Fenghua Yu
	<fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin"
	<hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, iommu
	<iommu@lists.linux-foundation.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, x86 <x86@kernel.org>,
	linux-ia64 <linux-ia64@vger.kernel.org>
Subject: [PATCH v9 3/7] s390/pci: add support for IOMMU default DMA mode build
	options
Date: Thu, 13 Jun 2019 16:42:36 +0800
Message-ID: <20190613084240.16768-4-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20190613084240.16768-1-thunder.leizhen@huawei.com>
References: <20190613084240.16768-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

The default DMA mode is LAZY on s390, this patch make it can be set to
STRICT at build time. It can be overridden by boot option.

There is no functional change.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Acked-by: Sebastian Ott <sebott@linux.ibm.com>
---
 arch/s390/pci/pci_dma.c | 2 +-
 drivers/iommu/Kconfig   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
index 9e52d1527f71495..784ad1e0acecfb1 100644
--- a/arch/s390/pci/pci_dma.c
+++ b/arch/s390/pci/pci_dma.c
@@ -17,7 +17,7 @@
 
 static struct kmem_cache *dma_region_table_cache;
 static struct kmem_cache *dma_page_table_cache;
-static int s390_iommu_strict;
+static int s390_iommu_strict = IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
 
 static int zpci_refresh_global(struct zpci_dev *zdev)
 {
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index fe715fb295c6ed2..a8dd69d175fb3c6 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -78,6 +78,7 @@ config IOMMU_DEBUGFS
 choice
 	prompt "IOMMU default DMA mode"
 	depends on IOMMU_API
+	default IOMMU_DEFAULT_LAZY if S390_IOMMU
 	default IOMMU_DEFAULT_STRICT
 	help
 	  This option allows an IOMMU DMA mode to be chosen at build time, to
@@ -89,6 +90,7 @@ choice
 
 config IOMMU_DEFAULT_PASSTHROUGH
 	bool "passthrough"
+	depends on !S390_IOMMU
 	help
 	  In this mode, the DMA access through IOMMU without any addresses
 	  translation. That means, the wrong or illegal DMA access can not
-- 
1.8.3


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
