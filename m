Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D7252D3F
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 14:01:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1BD8C86B33;
	Wed, 26 Aug 2020 12:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SH04sxZg2e0T; Wed, 26 Aug 2020 12:01:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D0E486A70;
	Wed, 26 Aug 2020 12:01:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 209C7C0051;
	Wed, 26 Aug 2020 12:01:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72700C0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 520CC86BB7
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9VBL71TXt23 for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 12:01:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5C8E086A70
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:04 +0000 (UTC)
Message-Id: <20200826112331.250130127@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=1OGPpjWOZmr24XSSpz6Nc6JwYhMQbICDj4hspoAwZbU=;
 b=wxfQv6OayK5u1H6FLXXIAcQEscg4HPJjeG+pstXl+pgdl31DNhEzs50ZOWpxyGkrMjOLQW
 1o9FaSrwh83greTW5vyCTb8zGAVDs36ov93GPrm04pneHRj9I5V1gKWvrEoOOH7jQ4WymB
 2dnYg73pm5Qf+NAJfV1VaexuVCwBhHU44wya2eXAw2Z+FnlfrDPKCol1dSx8jwE8+r40Me
 gFhsh/HnjcO+3pm7neY65BLXMr3nyoULj1GDuHwk6obFDadT45ulfhicTAV256PX5YzSNc
 dGaROF2c7TCDhfRvvityWK3X4gmliC/zDpfaFSui0jbwM5OFgjvjPhruWz0AMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=1OGPpjWOZmr24XSSpz6Nc6JwYhMQbICDj4hspoAwZbU=;
 b=8tJ5SZ+n+CTD4sQz2apdajCK0eVmBiC+58dr8L0pUzWdakVsmFSRzEYppLbMSxQkKBKFP2
 zKDpRtN2h+Z7x/Ag==
Date: Wed, 26 Aug 2020 13:16:34 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 06/46] x86/msi: Remove pointless vcpu_affinity callback
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

Setting the irq_set_vcpu_affinity() callback to
irq_chip_set_vcpu_affinity_parent() is a pointless exercise because the
function which utilizes it searchs the domain hierarchy to find a parent
domain which has such a callback.

Remove the useless indirection.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch. The same is probably true for lots of other irq chips.
---
 arch/x86/kernel/apic/msi.c |    1 -
 1 file changed, 1 deletion(-)

--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -278,7 +278,6 @@ static struct irq_chip pci_msi_ir_contro
 	.irq_mask		= pci_msi_mask_irq,
 	.irq_ack		= irq_chip_ack_parent,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
 	.flags			= IRQCHIP_SKIP_SET_WAKE,
 };
 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
