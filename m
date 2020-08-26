Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B80A2539B9
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 23:27:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 02E8A86BEA;
	Wed, 26 Aug 2020 21:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEPTSOU1JTfV; Wed, 26 Aug 2020 21:27:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E3E686BCB;
	Wed, 26 Aug 2020 21:27:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CE1EC0051;
	Wed, 26 Aug 2020 21:27:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4485AC0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 21:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3C910883B6
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 21:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9Al5Qam+8uK for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 21:27:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 93150883A3
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 21:27:44 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598477262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AP/JLSo39vhE0wtYqmiGvGnDrGFkgwOpCQr0bMHNNIo=;
 b=Ppbpj32Cn5vd1ION8eS5aNl/fj1QjIs+RkAaM6B9/j2KvPN1mwxngYrYRgiWuDvZz7tk4s
 6s3VU0oxNXckuhydtQw2GgWp9Lfh6ODP0+s0hFgvzGCyaE7b+A+lIZaUi6gcZA/8lo5a4X
 Euy7gPuCc91BHe8pXICVD2nCrFV9IERKZf+HfP/+i3Fiyte9xzGw/xupM0BY5OEQNdUEQg
 FSOqYrYHEp/isAlEeyp0rD5/Tbv3MnOJpEwiIrn+8eh5SdC6QWIfsV4iOmiZxyT6TlWac6
 8D2S8zdYEOpLjpGvQn5ZbyugrRJHkxqLX+ncTO+VdcNoBYHDOsGnw6OdV/ra8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598477262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AP/JLSo39vhE0wtYqmiGvGnDrGFkgwOpCQr0bMHNNIo=;
 b=g64NV1HP6nZPTwYFAmNkOJaevjoEaWBisT8u9MwS+B3AK95KBK4cxQI4t2bfE2amJBs0p0
 WvmjR7PZtJ//chDw==
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
In-Reply-To: <8736492jot.wl-maz@kernel.org>
References: <20200826111628.794979401@linutronix.de>
 <20200826112333.992429909@linutronix.de> <8736492jot.wl-maz@kernel.org>
Date: Wed, 26 Aug 2020 23:27:41 +0200
Message-ID: <87lfi1t7w2.fsf@nanos.tec.linutronix.de>
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

On Wed, Aug 26 2020 at 22:14, Marc Zyngier wrote:
> On Wed, 26 Aug 2020 12:17:02 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> @@ -103,6 +105,7 @@ config PCIE_XILINX_CPM
>>  	bool "Xilinx Versal CPM host bridge support"
>>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>>  	select PCI_HOST_COMMON
>> +	select PCI_MSI_ARCH_FALLBACKS
>
> This guy actually doesn't implement MSIs at all (it seems to delegate
> them to an ITS present in the system, if I read the DT binding
> correctly). However its older brother from the same silicon dealer
> seems to need it. The patchlet below should fix it.

Gah, at some point my eyes went squared and I lost track..

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
