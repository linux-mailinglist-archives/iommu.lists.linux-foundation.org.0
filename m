Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB793268651
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 09:44:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7E11020343;
	Mon, 14 Sep 2020 07:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYJd9+So9lJY; Mon, 14 Sep 2020 07:44:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 10EE6203B4;
	Mon, 14 Sep 2020 07:44:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03598C0859;
	Mon, 14 Sep 2020 07:44:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A5DFC0859
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 07:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 487AB870A3
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 07:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgtqApUKkSMJ for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 07:44:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9505487098
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 07:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rZz7WEucbLzmcSBpKZVSsyybm+o08I+OYE053DvRjjM=; b=t4keXE5TDnxAHF6g8hogs4VgZL
 ULo2k/B8+ruC5jsQr27s/sQblW82iX+G9AIpOhhy6JQY5XjSgIU2JThFVtAqqJOprPd9Y1mcTxzFJ
 7xexc8gEJwRKQ68VQSDLyUs1lCl/V0ZwaUXP7JJpJhCHRS7vhIr1gvV2PwcjkInHgO6yQUAvm/Qi0
 L9HoU2awqpjY9vMbIUOhixXqveqkDZy0oProfsCjI+Yzty2QtJxZmUDWg4i0FDGXer1pmo6yH1+6/
 sda/7CKX4v4tUq/CEuOgohNyWCKUA6LPDJuza3QFbgZSg55jsHqgvpUvIsbRnDSKiqAu4+j++J2ey
 YPPprpGA==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHjAE-0000Rh-Gw; Mon, 14 Sep 2020 07:44:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4/6] ARM/keystone: move the DMA offset handling under ifdef
 CONFIG_ARM_LPAE
Date: Mon, 14 Sep 2020 09:33:41 +0200
Message-Id: <20200914073343.1579578-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914073343.1579578-1-hch@lst.de>
References: <20200914073343.1579578-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-sh@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>, linux-usb@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

The DMA offset notifier can only be used if PHYS_OFFSET is at least
KEYSTONE_HIGH_PHYS_START, which can't be represented by a 32-bit
phys_addr_t.  Currently the code compiles fine despite that, a pending
change to the DMA offset handling would create a compiler warning for
this case.  Add an ifdef to not compile the code except for LPAE
configs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mach-keystone/keystone.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
index 638808c4e12247..dcd031ba84c2e0 100644
--- a/arch/arm/mach-keystone/keystone.c
+++ b/arch/arm/mach-keystone/keystone.c
@@ -24,6 +24,7 @@
 
 #include "keystone.h"
 
+#ifdef CONFIG_ARM_LPAE
 static unsigned long keystone_dma_pfn_offset __read_mostly;
 
 static int keystone_platform_notifier(struct notifier_block *nb,
@@ -48,14 +49,17 @@ static int keystone_platform_notifier(struct notifier_block *nb,
 static struct notifier_block platform_nb = {
 	.notifier_call = keystone_platform_notifier,
 };
+#endif /* CONFIG_ARM_LPAE */
 
 static void __init keystone_init(void)
 {
+#ifdef CONFIG_ARM_LPAE
 	if (PHYS_OFFSET >= KEYSTONE_HIGH_PHYS_START) {
 		keystone_dma_pfn_offset = PFN_DOWN(KEYSTONE_HIGH_PHYS_START -
 						   KEYSTONE_LOW_PHYS_START);
 		bus_register_notifier(&platform_bus_type, &platform_nb);
 	}
+#endif
 	keystone_pm_runtime_init();
 }
 
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
