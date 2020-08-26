Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613925393A
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 22:43:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B8640850E9;
	Wed, 26 Aug 2020 20:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4tdrqjS1CCO; Wed, 26 Aug 2020 20:43:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04A3E84F2B;
	Wed, 26 Aug 2020 20:43:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E403DC016F;
	Wed, 26 Aug 2020 20:43:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AFC3C0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7860788296
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 20:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtWfbmCyzrtV for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 20:43:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0A3688275
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 20:43:39 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598474617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lj+HCAMB66c34Pt5/8qmaZU+5YodJ4K21RaNchn7Bnc=;
 b=gcH0soDHT7m1DhfNC6QQbqPGhh4sNSGm+9HSqTNzBlS+x8Z2m9573FZdMFQ3rSMEy5TjOq
 uU5srRzQ57ZK7h7gre4f2FSv4hNOipvH70zBr6ezrez6KIHQWB2c4Jxicem4nd/YollyTg
 HBaSP6ZU4VhZqvC3/BQvtKZzG9KUMJ+8PmO0gFJR3LK4HH9WPJVruFTwpCEqBu4Ccpn0iU
 J5fuAhIORUJ6LjXSEilyVzyJ0JORvLSeJT7AwOqNQvowv2+x5spObQm7K4bA8aBThzVELh
 g+dVfbSpWNtafkPkhFcVYcuzNQ8Aw1lGxua3yd3hXafDPdkQUX9TxKBSOjfEoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598474617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lj+HCAMB66c34Pt5/8qmaZU+5YodJ4K21RaNchn7Bnc=;
 b=3FfX+fa7xCYcsjOKRE6odcrU12DlAns0QXGcNpm0K0uqtnqkEn+z0OyLuyyMffuAKPHcop
 nWo4UHb9iLwwiHCw==
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [patch V2 19/46] x86/msi: Use generic MSI domain ops
In-Reply-To: <878se12m5n.wl-maz@kernel.org>
References: <20200826111628.794979401@linutronix.de>
 <20200826112332.564274859@linutronix.de> <878se12m5n.wl-maz@kernel.org>
Date: Wed, 26 Aug 2020 22:43:36 +0200
Message-ID: <87tuwpt9xj.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>,
 Megha Dey <megha.dey@intel.com>, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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

On Wed, Aug 26 2020 at 21:21, Marc Zyngier wrote:
> On Wed, 26 Aug 2020 12:16:47 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> -void pci_msi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
>> -{
>> -	arg->desc = desc;
>> -	arg->hwirq = pci_msi_domain_calc_hwirq(desc);
>> -}
>> -EXPORT_SYMBOL_GPL(pci_msi_set_desc);
>
> I think that at this stage, pci_msi_domain_calc_hwirq() can be made
> static, as it was only ever exported for this call site. Nice cleanup!

Doh indeed. Let me fix that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
