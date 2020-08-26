Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411B252D3C
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 14:01:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA7F8865A5;
	Wed, 26 Aug 2020 12:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKY8O3z2DE8P; Wed, 26 Aug 2020 12:01:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43F7F861F1;
	Wed, 26 Aug 2020 12:01:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B1BDC0051;
	Wed, 26 Aug 2020 12:01:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9EFCC0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C2BA720416
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s51sYwhweHkC for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 12:00:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id DADA820406
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:00:58 +0000 (UTC)
Message-Id: <20200826112330.683298931@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Oz0/1gWRPSvvsPJtwAVY3cS6pNjuxGdtqsobcr4ZCvs=;
 b=Ba+ApzA3lxf0wI52RxaFIrxrYAUyBUQG1gGFQztF1br0kk0U6AoE5wqCgnixhkjrgzOMo6
 rT2ZvDyvuHISEifoHKZcKVSGoRPA4BuCErcMtK3FQsusSIwD5cxoIwTKUluv4ET8zep/wX
 rIHR72+BqmwB1T2FYELwwtUSa5KalCb4GGFT5jGxBlx+9x72db//rw0t1XujWqIY8Vjs+P
 FVWGmQd/RE/PAIEnL0RNQjFWLeWLoGfwUlzXfBeO7dzRVssgTu8kngEQeo/lNittJ7g2V5
 NVXx9eYNRt9ZrPbdlXzYbDphBoMnpc/BMMJMcyjRQDnN40c6/GFaU/Q5glpFAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Oz0/1gWRPSvvsPJtwAVY3cS6pNjuxGdtqsobcr4ZCvs=;
 b=JYpSEt6S0O9MIXMNQT5EttPLTAVkYzwAAPVY2vxQEslrb722eNdO+r4OYiSe56zO/bTHh/
 UR0TOrKuXedUnoCQ==
Date: Wed, 26 Aug 2020 13:16:29 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 01/46] iommu/amd: Prevent NULL pointer dereference
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

From: Thomas Gleixner <tglx@linutronix.de>

Dereferencing irq_data before checking it for NULL is suboptimal.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/iommu/amd/iommu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3717,8 +3717,8 @@ static int irq_remapping_alloc(struct ir
 
 	for (i = 0; i < nr_irqs; i++) {
 		irq_data = irq_domain_get_irq_data(domain, virq + i);
-		cfg = irqd_cfg(irq_data);
-		if (!irq_data || !cfg) {
+		cfg = irq_data ? irqd_cfg(irq_data) : NULL;
+		if (!cfg) {
 			ret = -EINVAL;
 			goto out_free_data;
 		}


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
