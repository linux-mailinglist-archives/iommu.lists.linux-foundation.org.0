Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE0D2522E8
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 23:35:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6557588313;
	Tue, 25 Aug 2020 21:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7k-g3khYEsU; Tue, 25 Aug 2020 21:35:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4CB18830C;
	Tue, 25 Aug 2020 21:35:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A31DCC0051;
	Tue, 25 Aug 2020 21:35:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 833BEC0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 21:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7224C869F8
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 21:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2KYTg3bE3qP for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 21:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D674986A07
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 21:35:02 +0000 (UTC)
Received: from localhost (104.sub-72-107-126.myvzw.com [72.107.126.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 431E0206EB;
 Tue, 25 Aug 2020 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598391302;
 bh=iaxjbZsBqna2sELKvW37oDWjgc6W43k1NdwaMyPOzcQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ZDGaYc9qhTxV2pA1wPb9Q5LqI6Ehvpg5A4GMn18E+XiEAZR/80yPJKnZPFAK8TnIU
 wAM0ZPrbbpwoW2+6rUdZWmT9bIdSAFoL0FNWWLtzM8IoOFDxGQNXUB782s5cxX+YqV
 EyEgGHhTCo7adlpsp4Rg6JWQpAi01VHvK5gPVgNM=
Date: Tue, 25 Aug 2020 16:35:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch RFC 30/38] PCI/MSI: Allow to disable arch fallbacks
Message-ID: <20200825213501.GA1931388@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6yixvnl.fsf@nanos.tec.linutronix.de>
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

On Tue, Aug 25, 2020 at 11:28:30PM +0200, Thomas Gleixner wrote:
> On Tue, Aug 25 2020 at 15:07, Bjorn Helgaas wrote:
> >> + * The arch hooks to setup up msi irqs. Default functions are implemented
> >> + * as weak symbols so that they /can/ be overriden by architecture specific
> >> + * code if needed.
> >> + *
> >> + * They can be replaced by stubs with warnings via
> >> + * CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS when the architecture fully
> >> + * utilizes direct irqdomain based setup.

> > If not, it seems like it'd be nicer to have the burden on the arches
> > that need/want to use arch-specific code instead of on the arches that
> > do things generically.
> 
> Right, but they still share the common code there and some of them
> provide only parts of the weak callbacks. I'm not sure whether it's a
> good idea to copy all of this into each affected architecture.
> 
> Or did you just mean that those architectures should select
> CONFIG_I_WANT_THE CRUFT instead of opting out on the fully irq domain
> based ones?

Yes, that was my real question -- can we confine the cruft in the
crufty arches?  If not, no big deal.

Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
