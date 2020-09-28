Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6131427AB8D
	for <lists.iommu@lfdr.de>; Mon, 28 Sep 2020 12:11:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ABD0F86747;
	Mon, 28 Sep 2020 10:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIeZs9Q+VzdI; Mon, 28 Sep 2020 10:11:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C4411864E9;
	Mon, 28 Sep 2020 10:11:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEF99C0051;
	Mon, 28 Sep 2020 10:11:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 739A3C0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 10:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6297F85C04
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 10:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blHl1zVdOs2Z for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 10:11:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BE7C185168
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 10:11:43 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601287900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LEbaJHkdEDSvABDEX0Mpwgs63YbqlMHeZ5/FcFgS7c=;
 b=WscWB2qjowVUKNzXJ7iKsyolZUkjDBztcYFbIgHrMUrtAEvquCam4/K52jcCtRQM+yKytr
 URMI6z640lbxw7hkIOVx1TRLHMdhaWzx98lhVnLFqthWanJFHVHxlo2eOWubHBSTBu9GDF
 7G67OuYSeZNyWEttoblh+kzL4D7QpchbFTWBx+ikU8exuLt8q5pjxfqcBdHoB6zPbCD8mH
 lZQfvtFRw5BX5n7PSkSM/ugl/cb4XGqprClPnO9RlJUYEx0yP1D0OFHRQNoIV4NB6Tbt2s
 hzKesgmvohZEey59MwUSx2qdsQEH+kkd6efSVXhIbahzs/eEUDUMLSXdq82ySg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601287900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LEbaJHkdEDSvABDEX0Mpwgs63YbqlMHeZ5/FcFgS7c=;
 b=gKFUKgJag7QuixgLnPA+ShsJ5WL+xoFovrXQai1julVEgAI8XcH7X6h36NY9HKTW9eWOPq
 ZWPyJFpE9hRbkzAA==
To: Vasily Gorbik <gor@linux.ibm.com>, Qian Cai <cai@redhat.com>
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
In-Reply-To: <your-ad-here.call-01601123933-ext-6476@work.hours>
References: <20200826111628.794979401@linutronix.de>
 <20200826112333.992429909@linutronix.de>
 <cdfd63305caa57785b0925dd24c0711ea02c8527.camel@redhat.com>
 <your-ad-here.call-01601123933-ext-6476@work.hours>
Date: Mon, 28 Sep 2020 12:11:40 +0200
Message-ID: <87eemmky77.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-next@vger.kernel.org,
 Megha Dey <megha.dey@intel.com>, xen-devel@lists.xenproject.org,
 Haiyang Zhang <haiyangz@microsoft.com>, Kevin Tian <kevin.tian@intel.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Sat, Sep 26 2020 at 14:38, Vasily Gorbik wrote:
> On Fri, Sep 25, 2020 at 09:54:52AM -0400, Qian Cai wrote:
> Yes, as well as on mips and sparc which also don't FORCE_PCI.
> This seems to work for s390:
>
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index b0b7acf07eb8..41136fbe909b 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -192,3 +192,3 @@ config S390
>         select PCI_MSI                  if PCI
> -       select PCI_MSI_ARCH_FALLBACKS
> +       select PCI_MSI_ARCH_FALLBACKS   if PCI
>         select SET_FS

lemme fix that for all of them ...
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
