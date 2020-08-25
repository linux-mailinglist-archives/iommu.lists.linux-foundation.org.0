Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF5252302
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 23:40:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 116662046F;
	Tue, 25 Aug 2020 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ew0bACTwRm2z; Tue, 25 Aug 2020 21:40:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8BC711FFFE;
	Tue, 25 Aug 2020 21:40:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79382C0051;
	Tue, 25 Aug 2020 21:40:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5105C0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 21:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8D1B986B13
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 21:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3l2Eggt4Y5AB for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 21:40:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0758786982
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 21:40:13 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598391611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xevxgk/koQBpWDveP6OSc84vgcr5kfA4Zdl3bp5EVM4=;
 b=4xeToqQJtFdDP336L/z/rJTPtiaEMQCwoWm7ZO3Dg80xwJI6LJbbyPem9IgDDH4c55kFW8
 efqvvncv7tcn3qZRe1acTT+kpdjKgMt9wBNwOWKpIu8I/uajoL15iwyI1xdSxrTpkklftN
 qSOF96Uua9BwCriI1UaH4colhyY+dU/jTNfAqa0OFWsv2NiYjXrj2a+s3Ori4UXHG1ddJa
 SA25EuwSuC9jCrd07R3Jsye+YPfQwEl1Ep3+ek2m/tcneuMb2osfUQOvMB9hVnwV5yHYK2
 m18kpfK5PCTA749jQbnkT3Om2+aFbVSlYN71Sn1ixrGPB3rBhJD9Y7h2fYYcZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598391611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xevxgk/koQBpWDveP6OSc84vgcr5kfA4Zdl3bp5EVM4=;
 b=JuIC3Wa21psedQKJydMn/nuPaxSXUZxPFQxtgBHwdGz1Ag7Nv0IARkCrU78WZB/vmrNKK/
 V7gDLpNFS4jDbzDw==
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch RFC 30/38] PCI/MSI: Allow to disable arch fallbacks
In-Reply-To: <20200825213501.GA1931388@bjorn-Precision-5520>
References: <20200825213501.GA1931388@bjorn-Precision-5520>
Date: Tue, 25 Aug 2020 23:40:10 +0200
Message-ID: <871rjuxv45.fsf@nanos.tec.linutronix.de>
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

On Tue, Aug 25 2020 at 16:35, Bjorn Helgaas wrote:
> On Tue, Aug 25, 2020 at 11:28:30PM +0200, Thomas Gleixner wrote:
>> 
>> Or did you just mean that those architectures should select
>> CONFIG_I_WANT_THE CRUFT instead of opting out on the fully irq domain
>> based ones?
>
> Yes, that was my real question -- can we confine the cruft in the
> crufty arches?  If not, no big deal.

Should be doable. Let me try.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
