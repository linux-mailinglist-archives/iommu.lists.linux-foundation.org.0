Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2AE252344
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 00:03:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 482E98786B;
	Tue, 25 Aug 2020 22:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBSX8INFclpb; Tue, 25 Aug 2020 22:03:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D45D8788B;
	Tue, 25 Aug 2020 22:03:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56509C0051;
	Tue, 25 Aug 2020 22:03:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CDC5C0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 22:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6056D879A3
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 22:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwaJIXpwthp5 for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 22:03:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BC40E87924
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 22:03:31 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598393009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0OqxJ3l66kPTHUwReqWXl4aiQwAYOml1CtAOOFtsv/I=;
 b=rJTu5uXpTB1P7KT9UkG/8QM9fLrXGorXoC87ldkXgjkRXx5UAas5uFTUMerUTXL9JlFfzV
 rN3mZfoDNBV8AFB4vRFBpqUVtR9nGugXHxgcJlZA9lyZ5d2iRKFgP2+zfzE6U60bVSUFwq
 JoLhqfRIwLjtW2QJXOy7XsedElokgWXmgQLvMAipf+uoAXx8CCMOl+k9j0g1QoHUmXG34r
 mtlyReJy8es+Aozjv5DjFb2Cq+iiM4U59lGIjrG1/fFCYms18my92/EJtXX6kAE+PpZd7v
 7ConNiKl15unKahtr/RvxdhuwT8O3LvR9FUpV5Q5QAqhgXFDbooECvOu9qLmBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598393009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0OqxJ3l66kPTHUwReqWXl4aiQwAYOml1CtAOOFtsv/I=;
 b=ZiNuzZqVhtmi5VokOZzEDE7yq2WAukGXdvrPoJKZHc1CKcyDYknuCTC8rLaX/mB0MFG9sG
 hpgpBFzac0BPrGDw==
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch RFC 30/38] PCI/MSI: Allow to disable arch fallbacks
In-Reply-To: <871rjuxv45.fsf@nanos.tec.linutronix.de>
References: <20200825213501.GA1931388@bjorn-Precision-5520>
 <871rjuxv45.fsf@nanos.tec.linutronix.de>
Date: Wed, 26 Aug 2020 00:03:29 +0200
Message-ID: <87y2m2wfgu.fsf@nanos.tec.linutronix.de>
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

On Tue, Aug 25 2020 at 23:40, Thomas Gleixner wrote:
> On Tue, Aug 25 2020 at 16:35, Bjorn Helgaas wrote:
>> On Tue, Aug 25, 2020 at 11:28:30PM +0200, Thomas Gleixner wrote:
>>> 
>>> Or did you just mean that those architectures should select
>>> CONFIG_I_WANT_THE CRUFT instead of opting out on the fully irq domain
>>> based ones?
>>
>> Yes, that was my real question -- can we confine the cruft in the
>> crufty arches?  If not, no big deal.
>
> Should be doable. Let me try.

Bah. There is more cruft.

The weak implementation has another way to go sideways via
msi_controller::setup_irq[s] and msi_controller::teardown_irq

drivers/pci/controller/pci-tegra.c
drivers/pci/controller/pcie-rcar-host.c
drivers/pci/controller/pcie-xilinx.c

Groan....

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
