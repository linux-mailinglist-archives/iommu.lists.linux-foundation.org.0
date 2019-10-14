Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2AD6973
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 20:32:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 74A852D10;
	Mon, 14 Oct 2019 18:31:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 291632D15
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 18:31:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B3CE66CE
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 18:31:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 4484DBB80;
	Mon, 14 Oct 2019 18:31:53 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC 5/5] ARM: bcm2711: use dma-direct
Date: Mon, 14 Oct 2019 20:31:07 +0200
Message-Id: <20191014183108.24804-6-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014183108.24804-1-nsaenzjulienne@suse.de>
References: <20191014183108.24804-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mbrugger@suse.com, Russell King <linux@armlinux.org.uk>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	linux-kernel@vger.kernel.org
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

The Raspberry Pi 4 supports up to 4GB of memory yet most of its devices
are only able to address the fist GB. Enable dma-direct for that board
in order to benefit from swiotlb's bounce buffering mechanism.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 arch/arm/mach-bcm/Kconfig   | 1 +
 arch/arm/mach-bcm/bcm2711.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index e4e25f287ad7..fd7d725d596c 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -163,6 +163,7 @@ config ARCH_BCM2835
 	select ARM_ERRATA_411920 if ARCH_MULTI_V6
 	select ARM_GIC if ARCH_MULTI_V7
 	select ZONE_DMA if ARCH_MULTI_V7
+	select SWIOTLB if ARCH_MULTI_V7
 	select ARM_TIMER_SP804
 	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
 	select TIMER_OF
diff --git a/arch/arm/mach-bcm/bcm2711.c b/arch/arm/mach-bcm/bcm2711.c
index dbe296798647..67d98cb0533f 100644
--- a/arch/arm/mach-bcm/bcm2711.c
+++ b/arch/arm/mach-bcm/bcm2711.c
@@ -19,6 +19,7 @@ DT_MACHINE_START(BCM2711, "BCM2711")
 #ifdef CONFIG_ZONE_DMA
 	.dma_zone_size	= SZ_1G,
 #endif
+	.dma_direct = true,
 	.dt_compat = bcm2711_compat,
 	.smp = smp_ops(bcm2836_smp_ops),
 MACHINE_END
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
