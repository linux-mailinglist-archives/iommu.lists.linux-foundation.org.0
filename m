Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE52B39D011
	for <lists.iommu@lfdr.de>; Sun,  6 Jun 2021 18:50:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBE8F4016E;
	Sun,  6 Jun 2021 16:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NPqZc_rd_D7; Sun,  6 Jun 2021 16:50:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E45F4016B;
	Sun,  6 Jun 2021 16:50:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACAD1C0027;
	Sun,  6 Jun 2021 16:50:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC6A9C0001
 for <iommu@lists.linux-foundation.org>; Sun,  6 Jun 2021 13:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84E5840153
 for <iommu@lists.linux-foundation.org>; Sun,  6 Jun 2021 13:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1nTjiHZ-j-C for <iommu@lists.linux-foundation.org>;
 Sun,  6 Jun 2021 13:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFCD7400C7
 for <iommu@lists.linux-foundation.org>; Sun,  6 Jun 2021 13:07:34 +0000 (UTC)
Date: Sun, 06 Jun 2021 13:07:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1622984850;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIRFb1jKnTo5dWo4vdft2FiOkoJM8ahbNvFiqMbznyk=;
 b=ltstbgsahkZUdbqLiyLQq5sQTlO5N41+hC9GhiDBQkPCCs/IFALZjg0pGMH6Uwo7JYURUB
 KMsAtQS2lFbW0geZ1P+v3p7wL6Ai4mi/8YpytJX/1xu84aZGw/6yTdhDgNxjZdEQVPZN7f
 LPx5HidkeQ+/CbxiWtppSvIC2+vrxJfsIBldLFxwTB+rHox4yP8fcdhCfCogDjKswNAT8U
 pYzU/d/mE+hZO4uHvOc78sulXGJi0Hs/S58RRja0a6ol/wFA9tsukebZIT78QfEreqWNxR
 2WMGZcjU5ORwt+axgoTcX8LagP0aJTCdHGs9aPqyNM27yorJ3Y/BBLuJg2Ca9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1622984850;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIRFb1jKnTo5dWo4vdft2FiOkoJM8ahbNvFiqMbznyk=;
 b=4lzV7xjaPAgFsIcDl+zLI85Jv5+nn9pDqmPtDep36NRE1BISmpNMGlMVs65Rl/jw4PEYRJ
 jUy1tGr6Aq/CETAw==
From: "irqchip-bot for Saravana Kannan" <tip-bot2@linutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [irqchip: irq/irqchip-next] irqchip/qcom-pdc: Switch to
 IRQCHIP_PLATFORM_DRIVER and allow as a module
In-Reply-To: <20210518211922.3474368-1-john.stultz@linaro.org>
References: <20210518211922.3474368-1-john.stultz@linaro.org>
MIME-Version: 1.0
Message-ID: <162298485012.29796.14375276303480597518.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Mailman-Approved-At: Sun, 06 Jun 2021 16:50:27 +0000
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Lina Iyer <ilina@codeaurora.org>, linux-gpio@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm@vger.kernel.org, Todd Kjos <tkjos@google.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The following commit has been merged into the irq/irqchip-next branch of irqchip:

Commit-ID:     4acd8a4be614a6c191273f2247aff7374a92f318
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms/4acd8a4be614a6c191273f2247aff7374a92f318
Author:        Saravana Kannan <saravanak@google.com>
AuthorDate:    Tue, 18 May 2021 21:19:21 
Committer:     Marc Zyngier <maz@kernel.org>
CommitterDate: Sun, 06 Jun 2021 13:57:41 +01:00

irqchip/qcom-pdc: Switch to IRQCHIP_PLATFORM_DRIVER and allow as a module

This patch revives changes from Saravana Kannan to switch the
qcom-pdc driver to use IRQCHIP_PLATFORM_DRIVER helper macros,
and allows qcom-pdc driver to be loaded as a permanent module.

Earlier attempts at this ran into trouble with loading
dependencies, but with Saravana's fw_devlink=on set by default
now we should avoid those.

[jstultz: Folded in with my changes to allow the driver to be
 loadable as a permenent module]

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20210518211922.3474368-1-john.stultz@linaro.org
---
 drivers/irqchip/Kconfig    | 2 +-
 drivers/irqchip/qcom-pdc.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 62543a4..4d5924e 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -415,7 +415,7 @@ config GOLDFISH_PIC
          for Goldfish based virtual platforms.
 
 config QCOM_PDC
-	bool "QCOM PDC"
+	tristate "QCOM PDC"
 	depends on ARCH_QCOM
 	select IRQ_DOMAIN_HIERARCHY
 	help
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 5dc63c2..32d5920 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -11,9 +11,11 @@
 #include <linux/irqdomain.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
@@ -459,4 +461,8 @@ fail:
 	return ret;
 }
 
-IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
+IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
+IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
+MODULE_LICENSE("GPL v2");
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
